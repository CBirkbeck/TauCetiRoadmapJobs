# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #3027 at cd123f8)

**Verdict:** accepted

**Summary.** Accepted, with three small corrections and no format notes, none blocking. The earlier finding is repaired. §10.26a now takes `ε(V⊗χ,ψ)` in every dimension from ClassicalArithmeticCompletion §7.12b and the rank-one `ε(χ,ψ)` from ArithmeticGaloisRepresentations §2.7. It reads `χ` through the geometric `Art_geo` of §10.1. The two constants agree in dimension one: both are `χ(c)q^ν vol(O)Σχ⁻¹(y)ψ(y/c)` under the same geometric reciprocity, so the formula holds at `V=1` and in the ramified and unramified one-dimensional cases computed below. The three small corrections are points of the earlier report that are still open: the unstated merge order with #3036, and two untouched citations (§10.1 and §7.10a). One licence question is left for the human reviewers.

## C01 — #3036 also rewrites the *Needs:* line of §10.27 (line 4075), and neither pull request says which merges first

Whichever pull request merges second meets a conflict on that line and could lose either #3036's section-level citations or this pull request's `§10.26a`. At #3036's head the line (line 4057 on `main`) replaces "AL.1 — Tate zeta distributions and Hecke `L`-functions" with "§§AL.1.3.1–AL.1.3.5 (local Tate `ε`-factors, Gauss sums and explicit local constants)". This head appends `§10.26a` to the same line. #3036 does not touch §10.26a or the Layer 10 dependency line, so this round's repair adds no new conflict. One sentence in the description would settle it: name the pull request that merges first, and say that the other rebases and keeps both changes.

## C02 — Untouched text: §10.1 (line 3482, *Needs:* line 3504) still takes "the imported Deligne local constant" of a Weil–Deligne object from ArithmeticGaloisRepresentations §2.7, which has only the rank-one constant

Since this round, §10.26a and the supplier contracts (line 5504) say that the higher-dimensional constant is ClassicalArithmeticCompletion §7.12b's and only the rank-one one is §2.7's. That makes §10.1 the one place left that sends the higher-rank constant to §2.7. §10.26a now cites §10.1 for `Art_geo`. On `main`, §2.7 says that the constants of non-abelian Weil representations belong to a downstream ArtinRepresentations §2.4 (ArithmeticGaloisRepresentations README lines 1895–1897). A separate change would add ClassicalArithmeticCompletion §7.12b to the *Needs:* line of §10.1 for the Weil part. It would also either define the monodromy factor `det(−r(Φ) | V^I/(ker N)^I)` in §10.1 or name a supplier for it.

## C03 — Untouched text: §7.10a (line 2861) calls `TauCeti.EtaleDuality.CohCorr.rgammac` supplied API, but neither `CohCorr` nor `rgammac` occurs in the pinned Tau Ceti

A search of the pinned Tau Ceti sources finds neither name. A separate change would name the declaration that exists, or state the operator as a target.

## Previous findings

- R01 — repaired: "*Needs:* §10.1 (`Art_geo`); `TauCetiRoadmap.ClassicalArithmeticCompletion` §7.12b (Weil local constants), for `ε(V⊗χ,ψ)` in every dimension; … §2.7 (Local constants), for the rank-one `ε(χ,ψ)`" (line 4051). The same citation is in the Layer 10 dependencies (line 4188) and in the supplier contracts (line 5504). The description names the new supplier.
- C01 — repaired: the description now has a bullet for §10.27 ("`c_χ` was fixed on deep units, which do not determine it; it cites the new §10.26a…"), and it lists §10.26a "over finite extensions of ℚ_p" among the stated exceptions to source generality.
- C02 — not repaired: the description still names no order with #3036, which still rewrites §10.27's *Needs:* line; raised again as C01.
- C03 — repaired: "uses the variant of Brauer's theorem of §2 (2.3), the comparison of norms and traces of §3 (Corollary 3.7) and the rank-one Gauss-sum computation of §1 (Proposition 1.1 and Corollary 1.3)" (line 4043).
- C04 — not repaired: §10.1's *Needs:* line (3504) still cites only §2.7 for the Deligne local constant; raised again as C02.
- C05 — not repaired: §7.10a (line 2861) still names `TauCeti.EtaleDuality.CohCorr.rgammac`; raised again as C03.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / source or computation) | Result | Change |
|---|---|---|---|---|
| 10.26a at `V=1` (two suppliers) | dimension one | §7.12b via `Art_F` equals §7.12a, `χ(c)q^ν vol(O)Σχ⁻¹(y)ψ(y/c)`; §2.7 gives the same formula. Formula: `ε(χ)=ε(χ)^1·1` | holds | none |
| 10.26a, `V=β` ramified, `a(β)≤a(χ)/2` | §7.12a's sum, `y=y₀(1+z)`, `v(z)≥⌈a/2⌉` | Coset sum vanishes unless `y₀≡c/c_χ`; `ε(χβ)/ε(χ)=β(c)β⁻¹(c/c_χ)=β(c_χ)`. So `c_χ`, not `c_χ⁻¹` | holds | none |
| 10.26a, `V=ω^s` unramified | `ω(Φ)=q⁻¹`, `Art_geo(ϖ)=Φ` | `ω∘Art_geo=\|·\|`, so `det V(c_χ)=q^{−s(a+ν)}`. §7.12b twist law on `χ`: `q^{−s(a(χ)+ν)}` | holds | none |
| Reciprocity pinned by the new clause | §10.1, §7.12b, §2.7, DH | §10.1 (line 3482): `ϖ↦Φ`. §7.12b: inverse of the arithmetic Artin map, `ϖ↦` geometric Frobenius. §2.7: `artinMap⁻¹`. DH line 23: Deligne's normalization | all geometric | none |
| 10.26a, measure dependence | `dx↦r dx` | §7.12b: `ε(V⊗χ)` scales by `r^{dim V}`; `ε(χ)^{dim V}` scales by `r^{dim V}`; `det V(c_χ)` is unchanged | consistent for any common `dx` | none |
| Supplier line 5504 against §7.12b on `main` | each clause | Lines 13873–13900: unique nonzero constant, multiplicative, agrees with §7.12a in dimension one, degree-zero induction, twist factor `q^{−t(a+n·dim V)}`, geometric `Art_F` | every clause stated there | none |
| Route sentence (line 4043) | DH §§1–4 | 2.3 at line 528 (§2); Cor. 3.7 at line 670, used in 4.7 (line 902); Cor. 1.3(ii) (line 223), used in 4.7 (line 897); 4.8 (line 903) goes through 2.3 as 4.5 does (line 861) | holds | none |
| Consumer: BaseChange…UnitaryGroups §10.27 at head | `V=ξ\|·\|^s` and `\|·\|^s`, `a(χ)=2`, `ξ` tame | Quotient `ξ(c_χ)`; threshold `a≥2` met; with `ξ` read through `Art_geo`, `det V(c)=ξ(c)` | consistent | none |
| New edge to ClassicalArithmeticCompletion | cycle and order | Its README mentions this roadmap 0 times; both are on `main`; dependency check reports 0 problems | no cycle | none |
| Merge order with #3036 | §10.27 *Needs:* line | #3036 rewrites line 4057 of `main`; this head appends `§10.26a` to it; no order is stated | conflict unstated | C01 |
| §10.1 local constant | *Needs:* line 3504 | Cites §2.7 only; §2.7 sends non-abelian constants to ArtinRepresentations §2.4 (lines 1895–1897) | citation too narrow | C02 |

The rows for the statements this round does not touch stand as in the previous review, of `477bb48`.

- Source locators checked against the text: DeligneHenniart1981 contents (lines 13–17); §1, Proposition 1.1 and Corollary 1.3 (lines 179–228, pp. 93–94); §2, 2.3 (lines 487, 528); §3, Corollary 3.7 (lines 538, 669–670); 4.5–4.8 (lines 855–908, pp. 109–111). All five locators of the new route sentence hold.
- Supplier text read: on `main` (726beff), ClassicalArithmeticCompletion §§7.12a–7.12b (lines 13829–13900) and ArithmeticGaloisRepresentations §2.7 (lines 1682–1720, 1893–1897). At open heads: #2772 keeps §7.12b word for word; #3036 keeps ArithmeticGaloisRepresentations §2.7 and Layer 3 under their ids.
- Cross-roadmap citations resolved: 4 new (ClassicalArithmeticCompletion §7.12b in the *Needs:* line, the Layer 10 dependencies and the contracts; §10.1 `Art_geo`), plus the 9 citations of §10.26a in BaseChangeAndGaloisRepresentationsForUnitaryGroups at this head.
- Roadmap as record: against the merge base `74a09b7`, no layer or item is removed or retitled; the only added heading is §10.26a. No other roadmap cites an id that this change drops.
- Changes outside the folder: every folder that this head changes against `main` is one of the pull request's own. The further files changed since `477bb48` come from a merge of `main` (commit `71debf1e`).
- Overlap check: read AutomorphicSpectralTheory, IgusaVarietiesAndTorsionConcentration (and Part II), AutomorphicGaloisRepresentationsPartII, GlobalShtukasAndFunctionFieldLanglands and ModularityAndLanglandsExtensions. This round adds no owned object. The higher-rank Weil constant is owned on `main` by ClassicalArithmeticCompletion §7.12b, which this roadmap cites; the open ArtinRepresentations §2.4 also constructs it, and the roadmap rightly cites the owner on `main`.
- Automatic checks: the worker's run passed every check. Dependency check: `depcheck: 132 roadmaps, 1491 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` exits 0 with no output. The file is unchanged since `477bb48` and declares nothing, so there was nothing to `#check`. None of the 15 seeded targets lies in the changed text.

Source independence: changed passages only; 3 passages compared (the `Art_geo` clause and the route sentence of §10.26a, the new contract line) with 1 source (DeligneHenniart1981, which is in French) and with ClassicalArithmeticCompletion §7.12b's wording on `main`; no wording is shared beyond the names of results. The largest share of the README's linked locators is still Shin, *Galois representations arising from some compact Shimura varieties*, with 29 of 455. Contents were not compared, because no layer was added, removed or reordered.

Research link: §10.26a is the Deligne–Henniart twist formula (Deligne–Henniart 1981). Henniart's highly ramified argument uses it in Scholze's proof that the trace-defined local Langlands correspondence matches pair `ε`-factors (Scholze, Theorem 14.1 and Lemma 14.2). BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.27 consumes it. This rests on README §10.27 and ScholzeLLC lines 1725–1752.

## Not verifiable

- Jacquet–Shalika 1985, cited in an untouched paragraph of §10.27 (line 4065): the linked copy's host was not shown to be an author's page, so Proposition 4.1, §4.2 and Proposition 5.1 were not read.

Automatic checks set aside as false positives: the check for files outside the roadmap folder, when I ran it on this folder alone, listed the 119 files of the pull request's other roadmap folders. Each of them belongs to the pull request, and the worker's run, which knows them, passed.

## Source issues

- none

## For the human reviewers

- Licence: the README links Jacquet–Shalika, *A lemma on highly ramified ε-factors* (§10.27, line 4065; References), to a Columbia mathematics web space under `~hj`. The sources service could not confirm it as an author's page, so it was not read.
