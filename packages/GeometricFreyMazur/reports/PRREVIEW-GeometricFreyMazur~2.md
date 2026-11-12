# Review of GeometricFreyMazur (pull request #2130 at 6017ad8)

**Verdict:** needs changes

Incremental re-review of the 67 lines that changed since 15ecde1. One P3 finding remains: the repair of R01 did not reach the generated `merge-order` block. The other five previous findings are repaired or settled (see "Previous findings"). Nothing else is wrong:
- the gate passes;
- `Suggested.lean` elaborates with `sorry` as the only warning;
- the depcheck has no UPWARD or CYCLE line;
- every changed statement and citation was checked.

## R01 (P3) — The generated merge-order block still says there is no dependency on CanonicalModelsAndGonality

**Location.** Pull-request description, generated block `merge-order`, which ends: "→ #1504 (CongruenceSpectralGap) → **this pull request** (#2130). It depends on no other author's open pull request."

**Claim.** The handwritten dependency paragraph now names "#1726 (CanonicalModelsAndGonality), a new roadmap folder, which supplies gonality and Abramovich's bound". The generated block below it contradicts that paragraph: #1726 is missing from its chain, and its last sentence denies any dependency on another author's pull request. The README depends on that roadmap at this head:
- line 11 (ownership);
- line 21 (the `gonality` definition);
- lines 93–95 (§§1.1–1.7, 8.1–8.2, 8.6–8.7, 9.1);
- lines 1131–1141 (§8.3);
- lines 1590 and 1610.

A reader who follows the block could merge this pull request before #1726.

**Witness.** `roadmaps list` shows "#1726 CanonicalModelsAndGonality (new)", by an author other than this pull request's. `ORDER.txt` has no line for CanonicalModelsAndGonality. Its Suggested.lean, at its head e7bed94, declares the `gonality` body that this roadmap repeats (lines 64–65).

**Repair.**
- Regenerate the `merge-order` block so that "#1726 (CanonicalModelsAndGonality)" comes before **this pull request**.
- Remove the sentence "It depends on no other author's open pull request."
- If the tool cannot place a roadmap that is not yet in the merge order, edit the block by hand.

Tested: the block then agrees with the description's dependency paragraph and with README lines 21 and 93.

## Previous findings

- R01 — partly repaired: the dependency paragraph now reads "another author's: #1726 (CanonicalModelsAndGonality), a new roadmap folder". The package's `design/plan.json` no longer contains `gap:gonality-norm-and-base-change` or `gap:singular-metric-li-yau` (0 hits). The generated `merge-order` block is unchanged and is raised again as R01 above.
- R02 — repaired: §8.3 *Needs:* (line 1141) now lists "CanonicalModelsAndGonality §§8.2 and 8.6–8.7; ModularCurvesPartII §6.1 (compact analytic–algebraic comparison); ComplexComparisonPartII §C1.9 (rational and meromorphic functions of a smooth proper complex curve)". The route at line 1133 uses all three.
- R03 — repaired: line 1590 reads "This is CanonicalModelsAndGonality §1.6, used here and in §8.3."
- R04 — repaired: line 21 now reads "`gonality` is the definition of CanonicalModelsAndGonality §1.1 … its API and Checks are CanonicalModelsAndGonality §§1.1, 1.4 and 1.5". The Lean body (lines 47–49) no longer has the `FiniteDimensional` conjunct.
- R05 — not repaired: line 11 still reads "Section 8.1 is now CanonicalModelsAndGonality §8.6.", and §§8.2–8.4 keep their numbers. I withdraw this finding and do not raise it again, because its premise was wrong:
  - The board package ModularCurvesPartIII (merge-order line 312, right after this roadmap) cites "GeometricFreyMazur §§8.1–8.4" in its README line 18. Its line 34 cites `TauCetiRoadmap.GeometricFreyMazur.gonality`.
  - The brief's overlap rule asks for exactly this kind of old → new sentence for a cited id.
  - The description gives this reason.
- R06 — repaired: the docstring at `Suggested.lean` lines 73–77 reads "(BT16 Theorem 2, stated there for a fixed constant field), with the threshold made independent of the constant field as in README §9.5: `M` is chosen before `k` and `K`."

## Verified sound

**Gate, build, direction.**
- I re-ran the full gate on 6017ad8. Every counter is 0 and the result is OK: set_option, blob, latex, prnum, sorry-data, sorry-examples, imports, statement-hygiene, dropped, readme-ids-missing, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material, among others.
- `lake env lean TauCetiRoadmap/GeometricFreyMazur/Suggested.lean` gives exactly two warnings, `declaration uses sorry`, at lines 58 and 78.
- Depcheck output: `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `overlaps.md`: no other open pull request changes this roadmap, and no cited id is dropped.

**Signatures and probes.** I elaborated a scratch file that imports the built module.
- `#check @gonality`, `@full_monodromy` and `@geometric_frey_mazur` give the types in `signatures.md`. `geometric_frey_mazur` has the shape `∀ N, ∃ M, ∀ k K …`, so M is chosen before k, as the README (line 1289) and the docstring say. There is no `variable` block, so no binder can have been dropped. The check changed nothing.
- These probes elaborate:
  - `gonality k F = sInf {n | ∃ x, Transcendental k x ∧ Module.finrank k⟮x⟯ F = n} := rfl`. This is CanonicalModelsAndGonality's body, so "repeats that one-line body unchanged" is literally true.
  - Under the headline binders (`FunctionField k K` with the scalar tower), `FiniteDimensional k⟮f⟯ K` holds for every transcendental `f`, via `TauCeti.isFunctionField_iff_functionField` and `IsFunctionField.finiteDimensional_adjoin`.
  - Under the same binders, `0 < gonality k K`, via `Nat.sInf_mem` and `Module.finrank_pos`. So the README's "N=0 and N=1 are vacuous" (lines 1259 and 1289) is correct.
  - `gonality k k = 0`, via `Nat.sInf_eq_zero` and `Algebra.IsAlgebraic.isAlgebraic`.
- Padding: the diff adds no declaration. The two theorems are unchanged deep statements, and `gonality` is the one definition they need.

**Library declarations opened at the pins.**
- Tau Ceti `2fd255d`, in `TauCeti/FieldTheory/FunctionField/Basic.lean`:
  - `TauCeti.IsFunctionField` (51; body `∃ x, Transcendental k x ∧ FiniteDimensional k⟮x⟯ F`);
  - `IsFunctionField.exists_transcendental` (59);
  - `IsFunctionField.finiteDimensional_adjoin` (64);
  - `TauCeti.isFunctionField_iff_functionField` (133). Its binders `[Algebra (RatFunc k) F] [IsScalarTower k (RatFunc k) F]` are exactly the headline binders.
- The three line numbers the README gives at line 53 (51, 64, 133) are correct.
- The Mathlib lemmas used in the probes elaborate at the pin.

**Cross-roadmap citations resolved this round (12).**
- CanonicalModelsAndGonality at e7bed94:
  - §1.1 (README 372): the body, attainment and positivity, and the k(s,t) value 0.
  - §1.4 (424): genus zero and one.
  - §1.5 (453): hyperelliptic means gonality two.
  - §1.6 (467): gon F ≤ gon F′ for finite F ⊆ F′.
  - §8.2 (1727): gonAn X = gonality ℂ M(X).
  - §8.6 (1819): gonAn ≥ (7/800)·index.
  - §8.7 (1832): takes M(X(Γ)) ≅ F_ℂ as a hypothesis.
  - Its theorems take `hF : IsFunctionField k F` and `hex : IsIntegrallyClosedIn k F` (Suggested.lean line 69). Its namespace is `TauCetiRoadmap.CanonicalModelsAndGonality` (line 53), so there is no fully qualified name clash.
- ModularCurvesPartII at 07e21ad, §6.1 (README 2122): an isomorphism `X_C^an ≅ Γ\(H∪P¹(Q))` for the level-H curve, respecting pairing components.
- ComplexComparisonPartII at a021e44, §C1.9 (README 1966): `functionFieldToMeromorphic C` (2066) is "the identity on the constants ℂ" (2075) and is bijective, giving `functionFieldMeromorphicEquiv C`. So the comparison is a ℂ-algebra isomorphism, which is what gonality invariance needs. Its hypotheses are a smooth proper integral complex curve, which a component of X_H satisfies.
- ModularCurvesPartIII (board package), lines 18 and 34.

**Ownership.** `gonality` stays owned by CanonicalModelsAndGonality. This roadmap repeats it only to state its headlines, and says so (README 21, Lean 42–46). The two bodies are `rfl`-equal, and they agree on every extension: when K/k is not a one-variable function field, every transcendental f has K/k(f) of infinite degree, so the defining set is empty or {0}. ModularCurvesPartIII's citation of `TauCetiRoadmap.GeometricFreyMazur.gonality` therefore keeps its meaning.

**Declared gaps.** The diff does not touch them. The nine slugs in `plan.json` match the nine README contracts, and the two gaps replaced by CanonicalModelsAndGonality citations are gone from `plan.json`.

**Sources.**
- Of the seeded sample, only 9.8 falls in the changed passages. BT16 line 67, p. 710: Theorem 2 inherits "k, N, M_N as above", so k is fixed. Its hypotheses (smooth projective B of gonality n<N, nonisotrivial E, p>M_N) match README line 1287. The README's uniformity in k comes from §9.5, as the citation now says.
- The changed locators:
  - BT16 line 58 (Theorem 1 fixes k before M_N, at line 59);
  - line 76 (Theorem 3, "k, N, M_N as above");
  - lines 81–82 (footnote 3: "working over complex curves");
  - line 206 ("exclusively over C"; page marker 202 puts it on p. 714, inside §2.1, which starts at line 195);
  - lines 55–56 (gonality as the lowest degree of a map to P¹).
- Outside the diff I spot-checked two more sampled targets. 0.3: BT16 §2.4, lines 295–306, pp. 715–716, the Heegner/anti-Heegner definition. 10.4: BT16 line 1474, the proof of Corollary 32, p. 742 (page marker 1436). Both are supported. The other sampled targets (0.2, 1.1, 2.1, 2.2, 2.7, 3.6, 4.3, 5.7, 6.1, 6.4, 9.1, 9.4) lie in untouched text, which the previous review passed. I did not re-check them.

**Adversarial table.** There are 11 new rows for the changed statements, with values computed this round, followed by the rows carried forward from review 1 (15ecde1) for untouched statements.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `gonality` (README 21; Lean 47) | k(t); K=k; k(s,t); ℝ⊂ℂ(t); headline binders; the owner's body | f=t gives finrank 1, and every finite degree is ≥1, so the value is 1. For K=k the set is empty, so 0 (Lean-proved). For k(s,t), f=s gives finrank 0 (infinite), so 0, and the old body (empty set) also gives 0. For ℂ(t) over ℝ, f=t gives 2, and 1 is impossible because i∉ℝ(f), so 2. Under the headline binders the value is >0 (Lean-proved). The owner's body is `rfl`-equal. | holds; "outside function fields the value is 0" holds in both directions | none (R04 repaired) |
| Exact constants (README 21) | ℂ⊂ℂ(t); ℝ⊂ℂ(t) | An element algebraic over ℂ is a root of a split ℂ-polynomial, so it lies in ℂ and `IsIntegrallyClosedIn` holds. For ℝ, i is integral over ℝ but not in ℝ, so it fails; this case is excluded by `IsAlgClosed k`. | holds | none |
| Tau Ceti contract (README 53) | the three declarations | lines 51, 64 and 133 at the pin; the binder sets match the headlines; the probe applies them | holds | none |
| CanonicalModelsAndGonality contract (README 93) | §1.1 body; `hF`, `hex` binders | same body; `hF` comes from `isFunctionField_iff_functionField`; `hex` comes from algebraic closedness (previous row) | holds | none |
| §8.3 statement and route (1131–1141) | N=2 with p=227 and p=229; Borel H̄; full H̄ with H proper; the C1.9 map | 800·2=1600 against 7·227=1589, excluded, and 7·229=1603, allowed. A proper H̄ has D≥229, so 7·229/800=2.004>1≥gon(U). A Borel has index 230, giving 2.0125. A proper H with full H̄ has index ≤2<p. C1.9 is the identity on ℂ, so it is a ℂ-algebra isomorphism, and gonality is invariant (§1.1 API). | holds; each step has a Needs item | none (R02 repaired) |
| §9.5 citation (1243) | BT16 lines 58–59 and 206 | k is fixed at line 58, before M_N at line 59; line 206 is on p. 714, inside §2.1 | holds | none |
| `full_monodromy` / §9.6 (1257; Lean 58) | N=0,1; N=2 with p=229; footnote 3 | vacuous, since gonality ≥1 (Lean-proved); 7·229>1600; line 81 says "complex curves", matching the new "over complex curves" | holds | none |
| §9.7 citation (1273) | M_N against k | M_N ≥ max(M_N^geom,5), with M_N^geom uniform in k by §9.5; BT16 line 58 fixes k | holds | none |
| `geometric_frey_mazur` / §9.8 (1287; Lean 78) | elaborated quantifier order; W=W′ with e=id; N≤1 | `∀ N, ∃ M, ∀ k K`; equivariance holds trivially and `TauCeti.Isogeny.id` is a witness; vacuous for N≤1 | holds; the docstring now matches | none (R06 repaired) |
| Pencil worked example (1590) | genus-2 double cover B→D, D elliptic; degree-3 P¹→P¹; reversed direction | 2≤2; 1≤1; the reverse gon(B)≤gon(D) fails for hyperelliptic B of genus 3 over P¹ (2>1) | holds, in the direction of CanonicalModelsAndGonality §1.6 | none (R03 repaired) |
| Monodromy worked example (1610) and source line (1624) | as in §8.3; BT16 line 76 | the same values as §8.3; Theorem 3 inherits a fixed k | holds | none |
| §0.2 fibre (review 1) | p=7 | \|PSL₂(F₇)\|=168 | holds | none |
| §0.4 SBC (review 1) | p=7 | 3 partners of 24 cusps | holds | none |
| §1.2 (review 1) | p=7, 101, 5 | y₇=1.725082; S²=U^p=(SU)³=−I | holds | none |
| §1.3 (review 1) | p=7…10007 | traces 2p²+2; ratio to 0.683918 | holds | none |
| §1.4 (review 1) | p=7 | 7.6994 against 7.7836 | holds | none |
| §1.5 (review 1) | p=7 | 14·π/7=2π | holds | none |
| §1.8 (review 1) | p=101, y=1/2 | 0.969374; 4.163618 | holds | none |
| §2.3 (review 1) | M→MU^k | σ_p fixes iy_p | holds | none |
| §2.5 (review 1) | p=101 | distances 9.132087 | holds (count) | none |
| §2.6 (review 1) | p=101 | 8.844443; 1.657454 | holds | none |
| §3.6 (review 1) | F₇; p=5 | 6 maps, then 1; uv≥4 | holds | none |
| §4.4 (review 1) | p=7 | k=0,1,6 below 1 | holds | none |
| §5.2 (review 1) | d=4 | 8≤14<64 | holds | none |
| §5.3 (review 1) | p=101 | 0.02327≈2.35/p | holds | none |
| §5.4 (review 1) | δ's | −1/50000, −17/10000 | holds | none |
| §5.6 (review 1) | p=7 | g=3, s=24 | holds | none |
| §5.8 (review 1) | T₁×T₁ | 3p/(p−6)=21 at p=7 | holds | none |
| §§7.2–7.3 (review 1) | n=2, p=7 | 84; lcm 7 | holds | none |
| §7.5 (review 1) | N=1, 3 | vacuous; gonality 1, 2 | holds | none |
| §8.2 (review 1) | p=2,3,5 | indices 2, 3, 5 | holds | none |
| §8.4 (review 1) | F₅, C₄ | anticommutation mod 5 | holds | none |
| §9.1 (review 1) | Legendre t=2,3 | j=1728, 21952/9 | holds | none |
| §9.4 (review 1) | Ψ=[−1] | χ=1 | holds | none |
| §10.1 (review 1) | N=2, g=1 | gon 2 needs M₃ | holds | none |
| §10.3 (review 1) | 1/3(1,1), 1/7(1,6) | [−3]; six (−2)-curves | holds | none |
| §10.5 (review 1) | C²=−2 | −1, +2 | holds | none |
| dᶜ convention (review 1) | f=z² | 2δ | holds | none |
| point-ball example (review 1) | a=1/2 | 1.2308, 1.1429, 1.0323 | decreasing | none |

Remarks on untouched text: none.

## Not verifiable

- BTE p. 3, the displayed tube-volume ratio in the proof of Proposition 4.1, and BLR90 §1.2 Proposition 8 and §1.4 Proposition 2. These are carried from review 1 in unchanged text: an OCR-only scan, and an uncertified source cited by locator.
- Whether the announcements of `gap:gonality-norm-and-base-change` and `gap:singular-metric-li-yau` were withdrawn on the AlgebraicCurves and RiemannianGeometry board jobs. I could read only `plan.json`, where both slugs are gone.

## Source issues

This round found no new source issue. The twelve entries of review 1 stand and are not repeated.

- none
