# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at e7b134f)

**Verdict:** needs changes

This is an incremental re-review of the 92 lines changed since 5a1f55a. R02, R03 and R04 of the previous report are repaired. Three findings remain:

- **R01 (P2)** is carried forward. PurityForFlatCohomology is unchanged at d3f15fd, so local duality and local Lefschetz still have two owners. The repair is in that pull request; this folder needs no further edit.
- **R02 and R03 (P3)** are new. Both concern ILO14 locators the repair re-anchored: §4.1 cites a hypercovering lemma instead of the theorem it states, and §6.1's page range starts one page late.

## R01 (P2) — Local Lefschetz and local duality still have two owners

**Location.**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "This roadmap owns Gabber's affine Lefschetz theorem (§§5.6–5.7) with its case of principal punctured opens … (§7.1), … (§6.11), local duality … (§6.12) and the local Lefschetz theorem (§7.3)."
- `README.md:1656` names PurityForFlatCohomology §1.6 as a consumer of §7.3.

**Claim.** This roadmap is the sole owner of §§7.1, 6.11, 6.12 and 7.3.

**Witness.** PurityForFlatCohomology (#1840) is still at d3f15fd. In `TauCetiRoadmap/PurityForFlatCohomology/README.md`:
- §1.4 (`:1107`) states this roadmap's §§7.1, 6.11 and 6.12.
- §1.5 (`:1160`) states §7.3.
- `:206–207` and `:3471–3472` say this roadmap is "to import" them.
- The *Needs* line at `:1201` cites its own §1.5.

**What changed this round.** The description now says that PurityForFlatCohomology §§1.4–1.5 "are to be replaced there by citations of these sections". That is the right plan, but nothing in the sibling head has changed. No repair report marks the finding "not actionable in this package".

The exception for a sibling that cannot move first does not apply: neither roadmap is on main. PurityForFlatCohomology is a new roadmap that can cite this one once the merge order moves it, as the test below shows.

**Repair** (in PurityForFlatCohomology; no edit in this folder):
1. Delete its §§1.4–1.5 and the import bullets at `:206–207` and `:3471–3472`.
2. Cite EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12 and 7.3 in their place.
3. At `:1195`, replace "(§1.5:" with "(EtaleDualityAndPerverseSheavesPartII §7.3:".
4. At `:1201`, replace "§§0.2, 1.1, 1.5;" with "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3;".

**Test** (re-run on today's merge order). I applied edits 3–4 to a scratch copy of the d3f15fd README and ran the dependency check (`--name PurityForFlatCohomology --pr 1840 --movable`). It printed:
- `moved: PurityForFlatCohomology moved in the merge order from #220 to #390, right after its last supplier EtaleDualityAndPerverseSheavesPartII`
- `depcheck: 233 roadmaps, 2264 edges, 0 problem(s)`

## R02 (P3) — The re-anchored §4.1 locator cites Théorème 2.2.2, not the theorem §4.1 states

**Location.** `README.md:826`: "(ILO14, Exposé XIII, §2 (2.1–2.2, Théorème 2.2.2), pp. 195–197 (printed); ILO14 lines 9288, 9331; …)". §4.1 is in this round's sample, and its line locator was edited in this round.

**Claim.** The cited place contains the statement "every R^q f_*F is constructible", for X noetherian quasi-excellent, f of finite type, n invertible and F constructible.

**Witness.**
- ILO14 line 9260 is Théorème 1.1.1, p. 195. It has exactly these hypotheses, and its clause (i) is §4.1's conclusion.
- Line 9289 says that §2 proves 1.1.1(i).
- Théorème 2.2.2 (line 9331) only asserts that an alteration hypercovering exists with regular connected terms and snc complements in degrees ≤ q + 1.

**Repair.** Replace "§2 (2.1–2.2, Théorème 2.2.2), pp. 195–197 (printed); ILO14 lines 9288, 9331" with "Théorème 1.1.1(i), p. 195 (printed), proved in §2 (2.1–2.2, via Théorème 2.2.2), pp. 195–197 (printed); ILO14 lines 9260, 9288, 9331".

**Test.** Line 9260 lies on the page whose footer, at line 9291, prints 195. Théorème 2.2.2 lies under the running head "196" (line 9293).

## R03 (P3) — The §6.1 page range starts one page after §1.2

**Location.** `README.md:1112`: "(ILO14, Exposé XVII, §§1.2–1.4, especially Définitions 1.2.3.1, 1.3.1, 1.4.1 and Remarque 1.4.2, pp. 260–263 (printed); ILO14 lines 12346, 12427)". The line numbers were edited in this round.

**Witness.**
- ILO14 line 12328 is the running head "259". That printed page holds lines 12328–12377, including the start of §1.2 at line 12346.
- Printed p. 260 begins at line 12379.

So the new anchor at line 12346 falls outside "pp. 260–263".

**Repair.** Replace "pp. 260–263 (printed)" with "pp. 259–263 (printed)".

**Test.** With the repair, every cited item falls inside the range:
- §1.2 at line 12346: p. 259.
- Définition 1.2.3.1 at line 12427: p. 261 (running head at line 12426).
- Définitions 1.3.1 and 1.4.1 at lines 12531 and 12534: p. 262.
- Remarque 1.4.2 at line 12562: p. 263 (running head at line 12561).

## Previous findings

- R01 — not repaired: `README.md:23` already names PurityForFlatCohomology only as a consumer, and the description now announces the replacement. But PurityForFlatCohomology at d3f15fd still states §1.4 (`:1107`) and §1.5 (`:1160`) and cites its own §1.5 at `:1201`. Carried as R01.
- R02 — repaired: `Suggested.lean:361` `etaleCohomology_tilt` states §8.5 in every degree, natural in torsion G. Its tilt is `Perfection (A ⧸ Ideal.span {ϖ}) p` and its perfectoid hypothesis is `TauCeti.Perfectoid.IsIntegralPerfectoid` on `AdicCompletion`. The README (`:57`, `:66`, `:76–78`, `:162`, `:1612`) and the docstring are updated.
- R03 — repaired: `README.md:584` now reads "ILO14, Exposé IX, Théorème 1.2, p. 131 (printed); ILO14 line 5901". Line 5901 opens Théorème 1.2, under the running head "132" of the following page (line 5932), so it is on p. 131.
- R04 — repaired: the description's dependency paragraph now lists "#1796 (AdicCoefficientsAndComparisonsPartII)" and "#1755 (ArcTopologyAndDescent)". It names PerfectoidQuotientsPartII as a supplier that is not yet in a pull request and is earlier in the merge order (line 219 versus line 390).

## Verified sound

### Gate, dependency check, build and diff (run on this head)

- **Gate.** `tauceti-roadmap gate … --base origin/main` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's `gate.md` adds `build=0`.
- **Dependency check** (`--movable`, `--pr 1743`), output in full: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean` on `Suggested.lean` exited 0 in 23 s. The only warnings are nine "declaration uses `sorry`", at lines 84, 107, 200, 244, 281, 301, 316, 339 and 361.
- **Diff.** The folder diff is README.md (30 lines) and Suggested.lean (62 lines). `scratch/changes.md` lists no file changed outside the folder, and the gate reports `outside-folder=0`.

### The new headline `etaleCohomology_tilt`, checked against CS24 Theorem 2.2.7 (CS24 lines 827–835, p. 21)

Each hypothesis matches the source:

| Source | Lean |
| --- | --- |
| ϖ^p ∣ p | `hϖ` |
| ϖ-henselian | `HenselianRing A (Ideal.span {ϖ})`; its field `jac` (Mathlib `RingTheory/Henselian.lean:82`) puts ϖ in the Jacobson radical |
| bounded ϖ^∞-torsion | `hbdd` |
| ϖ-adic completion perfectoid | `IsIntegralPerfectoid p (AdicCompletion (Ideal.span {ϖ}) A)` |
| A^♭ = lim_(a↦a^p) A/ϖA | `Perfection (A ⧸ Ideal.span {ϖ}) p` |
| Spec A[1/ϖ] ⊆ U | `hU` |
| Spec A^♭[1/ϖ^♭] ⊆ U^♭ | `hV`, via the image of Spec(A/ϖ) |
| complements agree via (2.1.2.2) | `hUV` |
| G torsion | `IsAddTorsion G` |

**The matching.** `Perfection.coeff _ p 0` is x ↦ x^♯ mod ϖ. It is surjective because Frobenius on A/ϖ = Â/ϖÂ is surjective (`frobeniusModPow_surjective`, Tau Ceti `RingTheory/Perfectoid/Integral.lean:121`). Its kernel is ϖ^♭A^♭ by CS24 (2.1.2.2) (line 416). So `range_comap_of_surjective` (Mathlib `RingTheory/Spectrum/Prime/RingHom.lean:236`, root namespace) makes its image V(ϖ^♭). With that, `hV` and `hUV` are exactly the source's matched pairs.

**The `CharP` hypothesis** excludes only A = 0. For A ≠ 0, `jac` makes ϖ a nonunit, so A/ϖ ≠ 0 with p ∈ ϖA. For A = 0, `CharP 0 p` would need p ∣ 1.

**Binders.** `#check @etaleCohomology_tilt` shows all twelve hypotheses, from `hϖ` through `hUV` and `q`. It is identical to `scratch/signatures.md:167`. The other eleven declarations are untouched by the diff.

**Padding probe.** I replaced the proof with `first | rfl | simp | infer_instance | trivial | decide | exact ⟨fun G _ => AddEquiv.refl _, fun _ _ _ _ _ _ => rfl⟩`. The theorem stays open. It is not padding.

**What is not stated.** The README says the pins have no pullback of étale cohomology, so functoriality in A and U is left out. That holds:
- Mathlib's `Sites/SheafCohomology/` has only `Sheaf.H.map` along morphisms of sheaves (`Basic.lean:112`).
- Tau Ceti's `AlgebraicGeometry/Cohomology/Pullback.lean` pulls back cohomology of sheaves of modules on the Zariski site only.

The docstring's treatment of the rest is consistent with the README summary (`README.md:3`), which names only local Lefschetz and étale-cohomology tilting as the concluding applications:
- §8.6 is named as not statable, since there is no étale support functor at the pins.
- §8.3 is called a proof step.

**Library near-matches.** Loogle has no hits for `IsIntegralPerfectoid`. The LeanSearch hits are formal-étaleness lemmas, unrelated.

**Ownership.** `roadmaps grep` for "Theorem 2.2.7", "tilting of étale cohomology" and the theorem name finds no second owner on main or at the 450 open heads. ArcTopologyAndDescent §12.6 (#1755 head, `README.md:1614`) is tilting of complete arc covers, a supplier step that §8.5 already cites.

### Tau Ceti and Mathlib declarations opened at the pins

- **Tau Ceti 2fd255d.** In `TauCeti/RingTheory/Perfectoid/Integral.lean`:
  - the class `IsIntegralPerfectoid` (`:76`) has three fields: an adic element (`:78`), Frobenius surjective on `ModP` (`:80`), and the θ-kernel clause for every nonunit proof (`:82`);
  - `frobeniusModPow_surjective` (`:121`) needs no completeness;
  - `of_perfectRing` (`:131`) needs `CharP` and `PerfectRing`;
  - `of_subsingleton` (`:144`).

  `README.md:76` describes all of these correctly.
- **Mathlib 1b1ccf4.**
  - `Perfection` (`RingTheory/Perfection.lean:40`) and `Perfection.coeff` (`:206`).
  - `IsAddTorsion` (`GroupTheory/Torsion.lean`, the additive form of `IsMulTorsion` at `:56`).
  - `Sheaf.H` (`Sites/SheafCohomology/Basic.lean:57`).
  - `Ideal.Quotient.mk` (`RingTheory/Ideal/Quotient/Defs.lean:83`).
- **`#check` of the new names.** I `#check`ed all 13 newly cited names in one scratch file. All elaborate. The README writes `range_comap_of_surjective` without a prefix, which is its full name.
- **PerfectoidSpaces §P1.24** on main (2bbd3cb, `README.md:5049`) defines the same three clauses, as `README.md:76` and `:154` say.

### Seeded sample, where it falls in the changed passages

| Target | Locator read | Theorem, page and hypotheses | Verdict |
| --- | --- | --- | --- |
| 2.1 | ILO14 lines 5886–5904, 5931–5932 | IX Théorème 1.2 at line 5901, p. 131. Hypotheses as in r21. | Matches (R03 repaired) |
| 4.1 | ILO14 lines 9255–9264, 9288–9335 | Statement is XIII 1.1.1(i), p. 195, with identical hypotheses. §2 proves it; 2.2.2 is the hypercovering step. | Statement supported; locator is R02 |
| 6.1 | ILO14 lines 12319–12352, 12420–12433, 12519–12573 | XVII §1.2 (line 12346): excellent ℤ[1/n]-schemes. Déf 1.2.3.1, p. 261. Déf 1.3.1, p. 262, with the factor 1/[s̃:s] after normalization. Déf 1.4.1, p. 262. Rem 1.4.2, p. 263, for codimension 0 and composition. | Statement supported; page is R03 |
| 8.4 (cited by §8.5) | CS24 lines 774–797, 863–871 | Lemma 2.2.4, pp. 19–20; product case of 2.2.7, p. 22. Complete rank-≤1 valuation rings with algebraically closed fraction fields. | Matches |
| 8.6 (named in the new docstring) | CS24 lines 834–836 | (2.2.7.1), p. 21; closed Z ⊆ Spec(A/ϖA), torsion G. | Matches |

The other sampled targets the diff leaves untouched:
- §§0.3, 1.2, 1.3, 1.4 and 3.6 were verified at their locators in PRREVIEW~21.
- §§0.1, 0.2, 6.5, 6.10 and 6.12 were not re-read in this incremental round.

### Other re-anchored locators

- **§0.6** (`README.md:306`), ILO14 lines 1614, 1622 and 1631. These are II Théorèmes 4.3.1 and 4.3.2 and Proposition 4.3.3, all on printed p. 33 (PDF page 39, running head "33" at line 1610). Correct.
- **§3.1** (`README.md:676`), ILO14 lines 7930 and 8064. These are XI §1 and Définition 1.7. They are on pp. 171 and 174: Exposé XI opens on PDF page 177, and PDF page 180 has the running head "174". Correct. The source's covering family (c), with U′ = U and W′ deduced by base change along V′ → V, matches the README's (c).

### Adversarial table

New rows, for the statements the diff adds or changes:

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `etaleCohomology_tilt` | A = 𝔽_p, ϖ = 0, G = ℤ/ℓ (ℓ = p included) | ϖ^p = 0 ∣ 0; henselian along 0; N = 1; completion along (0) is 𝔽_p, perfect; `CharP` holds. `hU` is vacuous, since 0 lies in every prime. Perfection 𝔽_p ≅ 𝔽_p, so the pairs are (∅, ∅) and (Spec 𝔽_p, Spec 𝔽_p). H⁰ = H¹ = ℤ/ℓ and H^{≥2} = 0 on both sides; Hom(Ẑ, ℤ/ℓ) = ℤ/ℓ. | Holds, nonvacuous |
| `etaleCohomology_tilt` | A = 𝒪_C (char 0, algebraically closed), ϖ = p^(1/p) | ϖ^p = p; complete, hence henselian; torsion-free (N = 0); Â = A is perfectoid; A/ϖ ≠ 0 has characteristic p. Spec(A/ϖ) is one point, and coordinate 0 sends it to the closed point of Spec 𝒪_(C^♭). Pairs: (Spec 𝒪_C, Spec 𝒪_(C^♭)) and (Spec C, Spec C^♭). G in degree 0 and 0 above, on both sides. | Holds |
| `etaleCohomology_tilt`, `hUV` | 𝒪_C with U = Spec C and V = Spec 𝒪_(C^♭) | z ↦ the closed point is ∉ U but ∈ V. | `hUV` fails, as the new Check says |
| `etaleCohomology_tilt`, naturality | G = G′ = ℤ/ℓ², f = ·ℓ, 𝔽_p case | H⁰: x ↦ ℓx on both sides, and e = id commutes. | Holds |
| `CharP` exclusion | A = 0; A ≠ 0 with ϖ ∈ Ring.jacobson | A = 0: (1 : 0) = 0 would need p ∣ 1, false, and both spectra are empty. A ≠ 0: 1 + (−ϖ⁻¹)ϖ = 0 would be a unit, so ϖ is a nonunit and A/ϖ ≠ 0. | README claim holds |
| Coordinate-zero map (`README.md:1612`) | 𝒪_C, ϖ = p^(1/p) | Kernel of 𝒪_(C^♭) → 𝒪_C/p^(1/p) is the ideal of valuation ≥ 1/p, which is (ϖ^♭). The map is surjective because p-th roots exist mod ϖ. | Holds |
| `IsIntegralPerfectoid` description (`README.md:76`) | zero ring; 𝔽_p; ℤ_p | Zero ring: `:151`, the kernel clause is vacuous. 𝔽_p: `of_perfectRing` with π = 0. ℤ_p: no π with π^p ∣ p is a nonunit, so it fails the adic clause (§P1.24 Check). | Matches the pin |
| New §8.5 Check (𝒪_C) | as in the second row | Two matched pairs; (Spec C, Spec 𝒪_(C^♭)) rejected. | Correct |
| §0.6 locator | ILO14 lines 1610–1636, 1666 | 4.3.1 at line 1614, 4.3.2 at 1622, 4.3.3 at 1631, p. 33. The resp. clause of 4.3.3 says "excellent", but line 1666 derives it from the proof for quasi-excellent X, so the README's form is supported. | Correct |
| §3.1 locator | ILO14 lines 7924–7945, 8060–8064 | §1 at line 7930, p. 171; Déf 1.7 at line 8064, p. 174. | Correct |
| §4.1 locator (R02) | ILO14 lines 9260, 9289, 9331 | The statement is at line 9260; Théorème 2.2.2 is the hypercover. | Wrong theorem cited |
| §6.1 locator (R03) | ILO14 lines 12328, 12346, 12379 | §1.2 is on p. 259; the stated range starts at 260. | Off by one page |

Rows carried forward from PRREVIEW~21 for the untouched statements (the values are in that report):
- 2.1 de Jong alteration: ℙ¹_L over K forces geometric irreducibility.
- 2.3: discriminant 2 is a nonsquare mod 3.
- 2.4: dim E × E = 2.
- 3.2: Λ ⊕ Λ(−1)[−1] on both sides.
- 3.3: (t, t − 1) = (1).
- 3.5: the equaliser is the diagonal.
- 3.6: H² = Λ(−1) ≠ 0 for the constant blow-up.
- 5.1: dimension of the closure 2 ≠ 1.
- 5.2: Nagata's example.
- 5.3: no square root of 1 + t over k(t).
- 5.6: ℓ[u] = 0 and the cup sign.
- 5.7 / `affineLefschetz_strictlyLocal`: H³(U) = ℤ/ℓ(−2) with 3 > 2.
- 5.8 / `cohomologicalDimension_le_of_strictlyLocal`: H⁰ ≠ 0 at d = 0, excluded by `hd`.
- 5.9 / `cohomologicalDimension_fractionRing_eq`: ℓ = 2 is excluded by `hreal`.
- 6.4: H²_x(Λ(1)) = Λ.
- 6.11: μ₆[2] = μ₂[2] ⊕ μ₃[2].
- 6.12: H²_x(Λ) = Λ(−1).
- 7.1: H^{>1}(η) = 0.
- 7.3: 0 → ℤ/ℓ(−1), not onto.
- 8.2: the limit is a singleton.
- 8.3: 4 idempotents versus 2 for ℤ_(7)[t]/(t² − 2).
- `cohenGabber_equalCharacteristic`: separable degree 3 at p = 2.
- `cohenGabber_equivariant`: Nat.card 2 is not a unit in characteristic 2.
- `cohenGabber_mixedCharacteristic`: p x^(p−1) vanishes on the p-fibre.
- `partialAlgebraization_equalCharacteristic`: 0 + 1 = 1.
- `partialAlgebraization_mixedCharacteristic`: 2 v₃(b₀) = 1 is impossible.

### Cross-roadmap citations, overlaps and gaps

- **`scratch/citations.md`** has the same seven leads as PRREVIEW~21, and the diff adds no cross-roadmap citation:
  - PerfectoidQuotientsPartII is a board package at merge-order line 219, before this roadmap's line 390.
  - The six names are EtaleCohomologyFoundations targets, resolved in PRREVIEW~21.
- **`scratch/overlaps.md`.** No other pull request changes this roadmap, and no cited id is dropped or defined only by a revision.
- **Declared gaps.** The five gap slugs are untouched by the diff.

### Remarks on untouched text (no change requested)

- `README.md:58` still uses the shorthand `Sheaf.H` alongside `CategoryTheory.Sheaf.H` (noted in PRREVIEW~21).

## Not verifiable

- **Ill03, Epp73, Ser65.** They are settled as uncertified and are cited by locator.
- **Published Exposé XVII of ILO.** It is not in the cache. The §6.1 statement and pages were checked in arXiv v1 only (ILO14), which is also what the README cites.

## Source issues

- none
