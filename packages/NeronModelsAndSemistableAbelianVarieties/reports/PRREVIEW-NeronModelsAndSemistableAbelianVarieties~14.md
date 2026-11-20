# Review of NeronModelsAndSemistableAbelianVarieties (pull request #2708 at ac35abe)

**Verdict:** accepted

**Summary.** Accepted: no findings. The new section 3.9a holds up against Deligne–Mumford (Theorem 1.13 with Lemmas 1.14–1.17, Proposition 2.3, and Theorem 2.4 with its proof) and against Stacks Remark 55.18.2 and Lemma 41.7.2. Both of its Checks recompute as true, the replacement argument for the smooth case of `StablePicardFaithful` is correct, every supplier it cites resolves on main, and the dependency check is clean. There are two small corrections, neither blocking: a Conrad locator in 5.2 (repeated in the `GoodIsogeny` docstring) points at a passage that is not there, and the description states the criterion without its perfect-residue-field hypothesis. There is one question for the author and nothing for the human reviewers.

## C01 — The 5.2 locator and the `GoodIsogeny` docstring cite a good-reduction passage on pp. 9–10 of Conrad's notes that is not there

A reader who opens Conrad at pp. 9–10 to find isogeny invariance of good reduction finds the definition of semistable reduction, Theorem 4.2 and Proposition 4.3. The only mention of good reduction there is the sentence saying that the inertial criterion generalises Néron–Ogg–Shafarevich (conrad-semistable line 358). Proposition 4.1(1) on pp. 8–9 transfers semi-abelian identity fibres across an isogeny. Good reduction then follows only through the equal toric ranks of 3.2 and `toric_zero` of 3.1.

The fix would be to replace "and pp. 9–10" in 5.2 (README line 3270) and "and the good-reduction discussion, pp. 9–10" in the docstring of `GoodIsogeny` (Suggested.lean line 110) with, for example, "Conrad, Proposition 4.1(1), pp. 8–9, with 3.2 and `toric_zero` of 3.1". The README's own route through 5.1 is unaffected.

## C02 — The description states the criterion without the perfect-residue-field hypothesis that 3.9a puts on its converse

The section "What was wrong" glosses the criterion as "a curve of genus at least two over the fraction field of a discrete valuation ring has nodal, equivalently stable, reduction exactly when its Jacobian has semistable reduction". Section 3.9a (README lines 1910–1916) asserts the equivalence only for perfect `k`, and Stacks Remark 55.18.2 calls the general case only presumable. Insert "with perfect residue field" after "discrete valuation ring" in that parenthetical.

## Questions for the author

- Which step of the converse route in 3.9a uses that `k` is perfect? As written, every input is stated for an arbitrary discrete valuation ring or base:
  - StableReduction Layers 7–8;
  - 3.3 (Conrad's Corollary 4.5 is for any local extension of discrete valuation rings, conrad-semistable lines 413–437);
  - 3.9;
  - `isom_stable_curves` and `Mbar.isStack` of SchemeAndStackFoundations §4.15;
  - `StablePicardFaithful`, applied at the geometric points of `S''`.

  If no step uses it, the converse holds for every residue field, which is the case Stacks Remark 55.18.2 calls presumable. The hypothesis could then be dropped, or kept with a sentence saying the route does not need it. I did not check that every supplier really holds at that generality, so this stays a question.

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result |
|---|---|---|---|---|
| 3.9a forward (first Check) | `y² = (x² − p)(x − 1)(x − 2)(x − 3)` over `ℤ_p`, `p ≥ 5` | Node at `(0,0)`, tangent cone `y² + 6x²`; local equation `≡ −6p mod m²`, so the model is regular | Normalisation `w² = (x−1)(x−2)(x−3)`, roots distinct mod `p`; `t = 1`, `a = 1`, `g = 2` | True |
| 3.9a converse needs `g ≥ 2` (second Check) | Torsor `C` under a good `E/ℚ_p`, class `≠ 0` in `H¹(ℚ_p,E) ≅ E(ℚ_p)^∨` | `Jac C = E` semistable, `t = 0`, `a = 1` | Nodal model ⇒ tree with `Σg_v = 1` ⇒ smooth model ⇒ `𝔽_p`-point (Lang) ⇒ `C(ℚ_p) ≠ ∅`, contradiction | Non-example correct |
| 3.9a converse, hypotheses | `g = 0`; perfect versus imperfect `k` | `g = 0`: `J = 0` is semistable but `C` has no stable model, so `g ≥ 2` is needed | Route inputs (StableReduction 7–8, 3.3, 3.9, §4.15, DM 1.13) are all stated generally; perfectness is never used | Sound; question above |
| `StablePicardFaithful`, smooth case | `τ ≠ 1` trivial on `J`, `τP ≠ P`, every `Q ≠ P` | `Q + τP ~ τQ + P`; equal only if `Q = P` or `τP = P` | Unique `g¹_2` for `g ≥ 2`, only one divisor containing `τP`; infinitely many `Q` give a contradiction. Genus 1: translations are the negative control | True |
| `StablePicardFaithful` against DM 1.13 | Two `ℙ¹`s meeting in three nodes; swap fixing the nodes | Reverses all three edges: acts by `−1` on `H₁ ≅ ℤ²` | Acts by inversion on the torus `Pic⁰ = 𝔾_m²`, not trivially, consistent with injectivity | True |
| 3.9a descent | `T ⊂ Isom` over `S'' = Spec(R̃ ⊗_R R̃)` | Finite unramified (DM 1.11) and radicial ⇒ closed immersion (Stacks 04XV (3)) | Contains the generic fibre, schematically dense since `R̃` is flat over `R`, so `T = S''` | Matches DM pp. 91–92 |
| 3.9a locators | DM (Numdam text); Stacks 0CEK | Thm 1.13 and Lemmas 1.14–1.17 pp. 85–87; `k` algebraically closed p. 87; Prop 2.3 pp. 88–89; Thm 2.4 pp. 89–92 | 0CEK: DM equivalence for perfect residue field, general case "presumably" | All match |
| 1.2 marked Néron models | `𝔾_{m,R}`; `j = 𝟙 S` | `R^× → K^×` misses `π`, so the property fails | `j = 𝟙`: every object qualifies (degenerate Check) | Checks true; BLR not readable |
| 1.7 / `LocalExistence` | `A = 0`; split torus | `Spec R`: both Hom sets are singletons, so restriction is bijective | `𝔾_m` is excluded because `A` is abelian; all binders present after `#check` | True |
| 1.11 differential lattice | `A = 0`; Yuan–Zhang §1.1 | `ω_M = 0`, trivial Hodge line | Y–Z define `ω(A) = det Ω` on the Néron identity component (arXiv v3 p. 2) | Supported |
| 2.2 component group | Nonsplit `I₅` over `𝔽_q` | Frobenius orbits `{0}`, `{1,4}`, `{2,3}`: three components | Degree 5, one `k`-point; Stacks 038D, 038E, 0363, 0385, 056U statements match | True |
| 2.3 Chevalley | Perfect and imperfect `k`; additive reduction | Conrad Thm 2.6 p. 3; Prop 2.16 p. 6 (splitting needs `k` perfect); Thm 3.1 p. 7 | README restricts to perfect `k`; additive gives `u = 1` | True |
| 2.7 smooth locus | Liu–Tong Thm 4.1 hypothesis "S excellent or X_K smooth" | README uses smooth `E` over any DVR: the second alternative | Prop 2.4(1) pp. 3–4, Cor 3.2 p. 8, Rem 4.5 p. 14 match | Supported |
| 3.2 isogeny | `E_q → E_{q^n}`; `[p]` on a split Tate curve | Orders of `Φ`: `ord q` and `n·ord q` | Kernel `μ_p` of degree `p`, `t = 1` both sides; Conrad Prop 4.1 pp. 8–9 | True |
| 3.5 filtration | `g = t + a`; Tate curve | Corrected corank `2g − (t + 2a) = t` | Printed `2g − (2t + a) = a`; Tate curve gives ranks `1 ⊂ 1 ⊂ 2` | Conrad Lemma 5.4 p. 18; misprint confirmed |
| 3.11 monodromy criterion | `[[1,ℓ],[0,1]]` and its `ℓ`-th power | Both fixed lattices are `ℤ_ℓ e₁` | Fixed points mod `ℓ²`: `ℓ³` against `ℓ⁴` | Conrad p. 21 gap is real; Thm 5.8 p. 20 holds for any DVR |
| 3.14 uniformisation | Split Tate curve, `q = π⁵` | `Y = q^ℤ` of rank 1, pairing `5` | `(1, q^{1/n}) ↦ 1 mod n`; Raynaud §2.4.1 p. 298, §4.2 p. 302, Thm 4.2.2 p. 304, §4.3 p. 308 | True |
| 4.11 odd-factor torsors | `f` irreducible of degree `2g + 2`; `f` with a rational root | No odd-degree `K`-factor, so `W_m[2](K) = ∅` | A linear factor makes it nonempty; BGW Prop 22(3)–(4) p. 11 | True |
| 5.2 / `GoodIsogeny` | `[p]` on a good `E/ℤ_p`; `E_q → E_{q³}`; `[0]` | (good, good), degree `p²`, inseparable on the fibre | (bad, bad); `[0]` is not `IsIsogeny`. Conrad pp. 9–10 has no good-reduction statement | True; C01 |
| 5.3a conductor | 11a1; `y² = x³ − x` over `ℚ₂`; a scaled good equation | `N = 11`; `f = 5` (conductor 32) | `v(Δ) = 12` yet `f = 0`; Serre n° 2.4 b), c) p. 10; Brumer–Kramer (6.1) p. 243 | True |
| 6.0a good-place laws | `y² = x³ − x` at `v = 5`, on `E[3]` | `#E(𝔽₅) = 8`, `a₅ = −2`, `P₅ = X² + 2X + 5` | The two signs differ by `4X ≡ X` mod 3; Ribet–Stein Thm 5.12 p. 73, Thm 5.16 pp. 74–75 | True |
| 6.10 compatible system | Split and nonsplit at `q = 2`, `d = 1, 2`; `y² + y = x³` over `𝔽₂` | Traces `3`, `−3`, `5`; determinant `2` | `#E(𝔽₂) = 3`, `a = 0`, `t² + 2`; Fontaine §§2.4.1–2.4.2 p. 342 | True |
| 6.14 full level | Places of `K'` trivial on perfect `k` | Residue fields finite over `k`, hence perfect: the 3.9a converse applies | `#GSp_{2g}(ℤ/N) ≤ #GL_{2g}(ℤ/N) < N^{4g²}` | True |
| `DedekindExistence` | `S = Spec ℤ`, `A = 0` | `Spec ℤ` is quasi-compact and has the property | `hDim = 1` excludes fields; integrally closed stalks mean normal | True |
| `EquationGoodComparison` | `y² + y = x³` over `ℤ₂`; `y² = x³ + p` over `ℤ_p`, `p ≥ 5` | `Δ = −27` is a unit: all three conditions true | `v(Δ) = 2`, minimal additive: cuspidal fibre, no abelian model, all false | True |
| Grothendieck's criterion (headline) | Tate curve; `y² = x³ + p` over `ℚ_p` | Inertia unipotent and nontrivial; semistable | Inertia image of order 6, not unipotent; additive | True; not statable, named in the docstring |
| `Φ_A ≅ coker u♯` (headline) | Tate curve with `ord q = n`; three nodes between two `ℙ¹`s | `coker [n] = ℤ/n = Φ` | Gram `[[2,−1],[−1,2]]`, determinant 3, so `ℤ/3` | True; not statable, named in the docstring |

- Previous review (of the pull request that added this roadmap): R01 and R02 were repaired there, and nothing at this head reopens them. The Suggested.lean docstring is unchanged, and Downstream consumers still lists FaltingsFinitenessAndIsogenyTheorems.
- Source locators checked against the text: 44, in 11 sources (deligne-mumford 6, Stacks 9, conrad-semistable 11, liu-tong 4, bgw 2, raynaud-1motifs 6, serre-facteurs 1, brumer-kramer 1, ribet-stein 2, fontaine-viii 1, yuan-zhang 1).
- Library declarations opened at the pins: Mathlib `WeierstrassCurve.HasGoodReduction` (Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:324) and Tau Ceti `WeierstrassCurve.smooth_projModelOver` (TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Smooth.lean:211). All three imported Tau Ceti modules are present.
- Cross-roadmap citations resolved:
  - StableReduction Layers 1, 3, 4, 7 and 8 on main;
  - SchemeAndStackFoundations §4.15, `isom_stable_curves` and `Mbar.isStack`, on main;
  - FreeGroupsAndLimitGroups §2.2a names, and GraphConnectivityAndFlows §8.1 `signedCirculations`;
  - 20 cited supplier roadmaps confirmed on main.
- Automatic checks: all passed; none set aside.
- Elaboration: `lake env lean` on Suggested.lean gives exactly four `sorry` warnings. A `#check @name` probe of all five declarations matches the README's generality and shows no lost binders.
- The change touches only README.md (131 lines added, 35 removed). Nothing changes outside the folder, no heading is removed, and Suggested.lean is unchanged.
- One-tactic probe, by reading the statements and the pins: the four theorems need Néron-model or abelian-scheme theory, and `HasGoodModel` is the only definition. Nothing is padding.

Dependency check output:

```text
depcheck: 179 roadmaps, 2041 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read FaltingsFinitenessAndIsogenyTheorems (open), AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations, FiniteFlatGroupsAndIntegralPadicHodgeTheory and RelativeJacobiansAndIntegralCurveModels for the objects of the change. Also read StableReduction (on main, and its open revision's list of excluded targets) and StableReductionPartII (open). The curve–Jacobian criterion and `StablePicardFaithful` are owned here only: StableReduction excludes the criterion from its targets. StableReductionPartII's declared gap asks JacobianChallengePartII for strong Torelli, and the smooth case of `StablePicardFaithful` also gives the faithfulness half of it. Nothing else is shared.

Source independence: 19 passages compared with 10 sources. Nothing is shared beyond forced terms; the longest run is five words, "finite and unramified over S''", against deligne-mumford line 670. The largest share is conrad-semistable, about 38 of about 342 locators. Contents compared with conrad-semistable §§2–7: independent. Its §§4–7 are interleaved across 3.1–3.12, the order 3.8–3.9 before 3.10 before 3.11 is forced by the Needs lines of 3.10 and 3.11, and Layers 1, 4, 5 and 6 have no counterpart.

Research link: 3.9a is Theorem 2.4 of Deligne–Mumford (1969), which they use to prove that `M_g` is irreducible. The lattice of 1.11 feeds the Faltings height of Yuan–Zhang (2018, §1.1), and 6.10–6.13 feed Boxer–Calegari–Gee–Pilloni (2021, 2025) on abelian surfaces. This rests on the README and on deligne-mumford and yuan-zhang, which I read.

## Not verifiable

- Bosch–Lütkebohmert–Raynaud, *Néron Models* (1.2, 1.7, and the BLR clauses of 1.9 and 2.7): paywalled Springer book with no legal copy; not opened.
- SGA 7 I, Exposé IX (2.1, 2.2, 3.5, 3.9): the manifest records `sga7-ix` as uncertified; not requested again.
- Faltings–Chai, *Degeneration of Abelian Varieties* (3.5, 3.13–3.14): paywalled book; not opened.
- Katz–Messing, Theorem 1 (6.10): the sources service could not tie the host of the scan to an author, so it was not read.
- Boxer–Calegari–Gee–Pilloni 2021, journal pp. 194–195, and Noot 2013 (6.10): not fetched; I recomputed the Checks of 6.10 instead.
- The four `sorry` theorems of Suggested.lean were elaborated, not proved.

## Source issues

- **Misprint** in conrad-semistable at the paragraph after Lemma 5.4, p. 18: the source says the finite part has corank `2g − (2t + a) = t`; it should be `2g − (t + 2a) = t`; affects nothing.
- **Gap** in conrad-semistable at the proof of Theorem 5.8, p. 21: the source says that the equal rational fixed spaces of Lemma 5.9 give equal `ℓⁿ`-torsion over `K` and `K'`; it should pass to the divisible subgroup of the saturated fixed lattice, because the finite-level fixed points can differ; affects the proof.
- **Misprint** in conrad-semistable at Theorem 4.2, p. 9: the source says the integral closure of `R` in `K`; it should be in `K'`; affects nothing.
- **Misprint** in conrad-semistable at Proposition 4.1(2), p. 8: the source prints the conclusion "f is an isogeny" twice; it should print it once; affects nothing.

## For the human reviewers

- none
