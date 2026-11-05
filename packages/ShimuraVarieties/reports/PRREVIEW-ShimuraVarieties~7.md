# Review of ShimuraVarieties (pull request #933 at 9a5a208)

**Verdict:** needs changes

Incremental re-review of the 39 lines changed since d03dc81 (the head the previous review read): eighteen supplier link fragments repointed at the headings that exist at the suppliers' heads, the Platonov–Rapinchuk book cited by locator instead of a dead URL, and one References entry added. Nothing changed outside the folder and `Suggested.lean` is byte-identical. Both folder repairs are correct and introduce no new problem; the gate, the dependency check and the elaboration are clean. One P3 remains, carried from the previous four reports: the pull-request description still says the roadmap depends on no other author's open pull request while the README imports StratifiedSpacesAndTameTopology, which exists only in another author's pull request.

## R01 (P3) — The pull request description's merge-order block still omits StratifiedSpacesAndTameTopology

**Location.** The description (data): "It depends on no other author's open pull request." `TauCetiRoadmap/ShimuraVarieties/README.md` lines 83, 806 and 978 import StratifiedSpacesAndTameTopology Layer 4 (its line 496 at the open head, `## Layer 4: o-minimal structures, cells, dimension, triangulation`).

**Claim.** Every other author's open pull request that this roadmap cites is in the "must merge first" list of the description.

**Witness.** `roadmaps list` at this review: `#1519 StratifiedSpacesAndTameTopology (new) @mycaule 012087a`; `TauCetiRoadmap/StratifiedSpacesAndTameTopology` does not exist on main (6a10c49) and the merge order does not list it. The description's list of other authors' pull requests (#248, #253, #446, …, #1145) does not name #1519, and the sentence quoted above denies any such dependency. Every other supplier the README cites resolves on main or in the author's own pull requests (the 63-fragment resolution below).

**Repair.** In the description, add #1519 (StratifiedSpacesAndTameTopology, mycaule) to the list of other authors' pull requests that must merge first, before #933, and drop "It depends on no other author's open pull request". No file in the folder changes. Re-raised: the description note of the repair report at 4b3416f ("outside the repair job's edits"). That reason says who applies the repair, not that the claim is true: the description is what the merge-order tooling reads, and at this head it still states a dependency set that the README contradicts.

## Previous findings

- R01 — not repaired: the description still reads "It depends on no other author's open pull request" (its line 15) and lists no #1519; README line 83 still imports StratifiedSpacesAndTameTopology Layer 4, which exists only in pull request #1519 by another author.
- R02 — repaired: all sixteen occurrences now read `#c-11-analytic-local-models-and-scheme-analytification`, line 1530 reads `#r1617-congruences-detecting-finite-index-subgroups-of-s-units`, line 63 reads `#r1750-the-global-weil-group-and-character-comparison`; no `#c11-`, `#r16-1-` or `#r17-5-` fragment remains (grep counts 16, 1, 1 and 0, 0, 0). The citation text is unchanged.
- R03 — repaired: line 1834 now cites "V. P. Platonov and A. S. Rapinchuk, *Algebraic Groups and Number Theory*, Academic Press (1994), Theorem 6.22, p.336" without a URL, and line 2804 adds the matching References entry (Pure and Applied Mathematics 139). The manifest records the book as `uncertified` with the dead former URL noted; no `theopenscholar…/agnt-english.pdf` link remains in the folder (the 1979 Doklady paper at line 2803 is a different file, fetched into the cache on 2026-11-05 and `certified`).

## Verified sound

**Gate, dependency check, outside-folder diff.** The worker's gate at 9a5a208: every scanner 0, `depcheck=0`, `build=0`, OK. I re-ran the gate with the brief's command (exit 0, every scanner 0, OK) and the dependency check:

```
depcheck: 241 roadmaps, 2323 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists ShimuraVarieties at line 94 and the two suppliers whose fragments changed earlier: ComplexComparisonPartII at 39, GL2AutomorphicRepresentationsAndTransfer at 88. StratifiedSpacesAndTameTopology is another author's new folder not yet in the order (placed after its suppliers; not a defect). `git diff --stat origin/main...HEAD` outside the folder: empty. The worktree is clean; I changed nothing in it.

**The changed passages.** The diff touches only link fragments and one citation, in: the supplier contracts (lines 63, 79), the `This uses` lines of §§1.2, 2.3, 2.5, 3.1, 3.2, 3.3, 3.5, 3.8, 8.4, 8.12 and 8.20, the Dependencies of Layers 1, 2, 3 and 8, the §5.9a target (line 1530), the §7.0e target (line 1834) and the References (line 2804). No statement, hypothesis, Check or `*Needs:*` item changed. I resolved every supplier link of the README, not only the eighteen: 63 distinct (roadmap, fragment) pairs over 16 suppliers, each fragment compared with the GitHub anchor of every heading of the supplier as it is now (`roadmaps show`: ClassFieldTheory, ModularCurves, ReductiveGroups, ReductiveGroupsPartII and SchemeAndStackFoundations on main; the others at their open heads #849, #792, #853, #856, #871, #848, #931, #850, #913, #852, #1519): 63 of 63 match. The three repaired headings: ComplexComparisonPartII line 724 `### C-1.1 Analytic local models and scheme analytification` (ASCII hyphen, hence `c-11-…`) and line 915 `## Layer C0: …`; GL2AutomorphicRepresentationsAndTransfer line 632 `### R16.1.7 Congruences detecting finite-index subgroups of S-units` and line 2217 `### R17.5.0 The global Weil group and character comparison`. The citation texts "§C−1.1" and "§R16.1.7", "§R17.5.0" name those sections.

**The repaired citation (§7.0e).** The target's statement is unchanged; its sources re-opened: milne-1983a lines 363–374 (Lemma 3.8: `H¹(k,Z) → ∏_{v finite} H¹(k_v,Z)` injective for simply connected `G` with no factor of type `A_n`, `n ≥ 4`, by a Galois `L/k` with group `S₃` or cyclic of order ≤ 3 and a Sylow reduction to the cyclic case) and lines 609–614 (the two classes trivial at the finite primes, equal at the infinite ones, `G^ad` satisfies the Hasse principle for `H¹`, citing Kneser VII §6). The README states exactly these two assertions and separates them ("this is not an assertion about `H¹(k,G)`"). Platonov–Rapinchuk Theorem 6.22 is cited by locator only (below). The sentence has no URL, no process word, and the References entry matches it.

**The repaired fragment in §5.9a.** The target cites §R16.1.7 `chevalley_power_congruence` with `E = U` finitely generated, empty excluded-place set and `n` the exponent of `U/U′`; the supplier's section at its head (line 632) states the congruence `E ∩ congruenceSubgroup(m) ⊂ Eⁿ` for a finitely generated `E ⊂ M^×` and `n > 0` with the finite-index consequence, as the previous report recorded, and the fragment now reaches it.

**Lean.** `Suggested.lean` (98 lines, unchanged since d03dc81): `import Mathlib` only, one module docstring naming each non-statable headline and what it lacks, `namespace TauCetiRoadmap.ShimuraVarieties`, no `set_option`, no `lemma`, no sorry'd data (`CMType`, `typeTrace`, `reflexField` have real bodies). I elaborated a scratch copy with `#check @` for all five declarations (`lake env lean`, 28 s, exit 0): the only warnings are the two `sorry`s (lines 70 and 83); the five elaborated types equal `signatures.md`, and no section binder is lost (both theorems carry `[Fintype ι] [Nonempty ι]`, `[∀ i, Field (F i)] [∀ i, NumberField (F i)] [∀ i, NumberField.IsCMField (F i)]`, the second also `[NumberField k]`, in their own signatures). One-tactic probe: a copy with each `sorry` replaced by `simp_all` fails on both (`simp_all made no progress` at lines 74 and 94); neither is padding. The gate's `readme-ids-missing=0` confirms the four backticked names of the roadmap's own in the README are the declared ones.

**Headline theorems.** Unchanged since the previous report: none of the README's headlines (analytic tower and components, Baily–Borel and Borel algebraicity, canonical models and their uniqueness, the main theorem of complex multiplication and the Siegel model, Hodge and abelian-type existence, Kazhdan uniformization and marked conjugation, the arithmetic towers and modular comparisons) is statable at the pins, and the docstring says which carrier each lacks; the two statable §5.1 theorems are stated.

**Sources: the seeded sample.** Of the fifteen sampled targets, only §8.11 is cited by a changed passage (the `This uses` line of §8.12, line 2520); none lies in a changed passage. §8.11 re-opened: milne-svi 2728–2730 (`(GL₂,H±)` at `K(N)`: `T = G_m`, `Y = ℝ^×/ℝ_{>0} ≅ {±1}`, `π₀ ≅ (ℤ/N)^× ≅ Gal(ℚ[ζ_N]/ℚ)`), 5177 ((64): `σ[y,a] = [r(s)_∞ y, r(s)_f a]`), 5398–5401 (special points with complex multiplication by a field give (62) from the main theorem), milne-mf 5159–5161 (Lemma 8.7: `z ↦ (ℂ/(z,1), (z/N, 1/N))` induces `Γ(N)∖ℍ ≅ E_N(ℂ)` with `e_N = ζ`); the README's `det K(N) = ker(ℤ̂^× → (ℤ/N)^×)`, model `μ_N^prim`, strict datum giving `(ℤ/N)^×/{±1}` and `N ≥ 3` all hold as written. The other fourteen sampled targets (0.5, 3.5c, 3.7, 4.1, 4.7, 4.9b, 5.1, 5.2, 5.13, 7.0f, 7.0j, 7.8, 7.10, 8.5) are untouched by the diff and were verified at their locators in the earlier full reports at the same text.

**Adversarial table.** Rows for the untouched statements are carried from the previous report (PRREVIEW-ShimuraVarieties_r6, its table); the rows for the statements the diff touches are recomputed here.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §7.0e first assertion (changed line): `H¹(k,Z(G)) → ∏_{v finite} H¹(k_v,Z(G))` | `G = SL₂`, `k = ℚ`, `Z = μ₂` | `H¹(ℚ,μ₂) = ℚ^×/ℚ^{×2}`; `x ∈ ℚ^×` a square in every `ℚ_p` has even `v_p(x)` for all `p`, so `x = ±y²`; `−1` is not a square in `ℚ_3` (3 ≡ 3 mod 4), so `x = y²`: injective | holds | — |
| §7.0e hypothesis boundary | `G = SL₅` (type `A₄`), `Z = μ₅`, `k ⊇ ζ₅` | `H¹(k,μ₅) = k^×/k^{×5}` with the Grunwald–Wang-type failure possible only through the lemma's excluded types; the Check exports nothing here, as the README says | holds (negative control) | — |
| §7.0e adjoint comparison retains real places (third Check) | `G^ad = PGL₂` over `F = ℚ(√2)` (two real places) and over `ℚ` | `H¹(F,PGL₂) ↔` quaternion algebras over `F`; the algebra ramified exactly at the two real places (even cardinality, so it exists) and the split algebra agree at every finite place and differ at both real places: the Check's instance. Over `ℚ` it cannot happen (one real place, even ramification parity), so the Check needs a field with ≥ 2 real places, which it does not exclude | holds | — |
| §5.9a (changed line): `closure(U)/U ≅ (ℤ̂/ℤ)^r`, uniquely divisible | `r = 1`; `E = ℚ(i)` | `nx ∈ ℤ`, `x ∈ ℤ̂` forces `x ∈ ℤ̂ ∩ ℚ = ℤ` (injective); `ℤ → ℤ̂/nℤ̂ = ℤ/n` onto (surjective); `ℚ(i)`: `U = 1`, `r = 0`, quotient trivial | holds | — |
| §5.9a: supplier instance `n = exponent(U/U′)` | `U = ℤ`, `U′ = 6ℤ` | `n = 6`, `U⁶ = 6ℤ ⊂ U′`; `U′ = 4ℤ`: `n = 4`; the congruence kernel inside `Uⁿ` lies inside `U′` | holds | — |
| §8.11 (cited by changed line): `det K(N) = ker(ℤ̂^× → (ℤ/N)^×)`; `μ_N^prim` at `N = 3` | `N = 3` | `det K(3) ⊆ 1 + 3ℤ̂`, `diag(u,1)` with `u ∈ 1 + 3ℤ̂` shows equality; `(ℤ/3)^×` has 2 elements, `Spec ℚ[z]/(z²+z+1)` has 2 geometric points swapped by complex conjugation (`χ_cyc(c) = −1`); strict datum: `(ℤ/3)^×/{±1}` one point, real subfield `ℚ` | holds | — |
| §8.3 Checks (`Y_full(3)` degree 24, `K(21) → K(3)` with `C₆`) | as in the previous report | `|GL₂(𝔽₃)| = 48`, effective order 24, 8 points over `j = 0` of index 3; `φ(21)/2 = 6`, `−1 ∉ ker((ℤ/21)^× → (ℤ/3)^×)` | holds (previous report) | — |
| §8.6 `Sh_K(G_m,{±1})` at `N = 3`, `N = 1`; independence of `s` in (64) | as in the previous report | `(ℤ/N)^×`: 2 points, 1 point; `s′ = s·e·u` acts trivially | holds (previous report) | — |
| §8.13 row action and pairing exponent | `[[1,1],[0,1]]`, `[[0,1],[−1,0]]`, `diag(v,1)` | `(P, P+Q)`, `(−Q, P)` with `det = 1`, exponent `v` | holds (previous report) | — |
| §7.0c normalizer index; §7.0h shrinking tower; §7.10 length-zero case; §6.7 `GL₂` at `N = 3`; §3.5a `R_an,exp` Checks | as in the previous report | `|PSL₂(ℤ/N)|` finite, `ℂ` excluded; `∩Γ_i = 1` with `∩K_i ≠ 1`; `H¹(L/F,T) = (F^×/NL^×)^r`; one versus `φ(3) = 2` components; `ℤ` not definable | holds (previous report) | — |
| Headline `reflexField_isCMField`, `CMType` partition | `E = ℚ(i)`, `Φ = {i ↦ i}`; `Φ = ∅`; `E = ℚ` | `star φ ∈ Φ ↔ φ ∉ Φ`: passes, fails at `id`, no CM type on `ℚ`; reflex field `ℚ(i)` is CM | holds (unchanged Lean) | — |
| Headline `reflexField_representation`, both directions | `E = ℚ(i)`, `k = ℚ` vs `k = ℚ(i)` | `tr(i) = i ∉ ℚ`: no `ρ` and `ℚ(i) ≰ ℚ`; over `ℚ(i)`: `ρ(a) = φ(a)·id` on `k¹`, unique up to `k`-linear isomorphism | holds (unchanged Lean) | — |
| §7.0i.1 construction and Checks 1–5 | as in the previous two reports | MT group of CM and non-CM curves, connectedness, homotheties, reductivity, `4⁻¹`, `dim A = 0` | holds (previous reports) | — |

**Ownership and duplication.** Unchanged since the previous report (no object was added or moved by the diff): zero-dimensional Shimura varieties, `R_an,exp`, the finite normalizer index, the centre-cohomology injectivity and adjoint Hasse comparison, and the unit-topology deductions of §5.9a have no earlier owner on main or at the open heads the brief lists; the Chevalley congruence theorem stays with GL2AutomorphicRepresentationsAndTransfer and the cyclic Hasse norm theorem with ClassFieldTheory Layer 13. Ownership against open pull requests the brief lists without files was not checked beyond the `roadmaps` index.

**Shape and policy.** The changed lines keep the README's prose form (citations as roadmap name and section, locators in parentheses at the claim); no process word, pull-request number, LaTeX delimiter, machine path or URL into a non-legal place entered the folder; the gate's text scanners are all 0. `metadata.toml` carries only the topic.

## Not verifiable

- Platonov–Rapinchuk, *Algebraic Groups and Number Theory*, Theorem 6.22, p. 336 (§7.0e): Academic Press 1994, no open copy; the manifest records it `uncertified` and the README cites it by locator, as the repair of R03 intended. The Milne 1983a passage it supports (p. 258, Hasse principle for `H¹` of the adjoint group) was read.
- L. Clozel 1986 (§7.0h), van den Dries–Miller 1994 and van den Dries 1998 (§3.5a), Serre 1964 §3.5 (§5.9a): settled `uncertified` or cited by locator; unchanged since the previous report, which read the secondary statements in milne-1984t, bkt and milne-2007c.
- The sampled targets the diff leaves untouched were not re-opened this round; the earlier full reports cover them at the same text.
- Ownership against open pull requests the brief lists without files was not checked beyond the `roadmaps` index.

## Source issues

- none
