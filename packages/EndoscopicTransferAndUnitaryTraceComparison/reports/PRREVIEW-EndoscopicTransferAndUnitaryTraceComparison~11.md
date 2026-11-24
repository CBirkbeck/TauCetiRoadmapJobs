# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 26 changed lines since `aecb53a`. The review checked the new §10.26a, the rewritten Weil paragraph and *Needs:* line of §10.27, and the Layer 10 dependencies against Deligne–Henniart (Proposition 1.1, Theorem 4.6, Lemma 4.7) and against the cited suppliers. The statement, the valuation and uniqueness of `c_χ`, and all three Checks are correct. There is one finding (P2): §10.26a is about the local constant of a Weil representation of any dimension, but the only local-constants supplier it names, ArithmeticGaloisRepresentations §2.7, owns only the rank-one constant and disclaims the rest; ClassicalArithmeticCompletion §7.12b on `main` is the owner to cite. There are five small corrections (two of them on untouched text) and no format notes; one licence fact is left for the human reviewers.

## R01 (P2) — §10.26a states a theorem about the local constant of a Weil representation of any dimension, but the only local-constants supplier its *Needs:* line names owns only the rank-one constant

An implementer of §10.26a who follows its *Needs:* line (line 4051) is sent to a section that defines only Tate's constant `ε(χ,ψ)` of a quasi-character. That section does not provide `ε(V⊗χ,ψ)` for `dim V ≥ 2`, which is what the statement is about. Theorem 4.6, the route's input, is itself a statement about the degree-zero virtual representation `(V−(dim V)·1)⊗χ`. §10.27 now takes its Weil side from here, so it inherits the gap.

On `main`, ArithmeticGaloisRepresentations §2.7 (README lines 1682–1693) defines the local constant of a continuous quasi-character by a Gauss sum. Its closing paragraph (lines 1895–1897) and its scope section (lines 5063–5067 and 5193–5197) say that the Deligne–Langlands constants of higher-dimensional Weil representations, and their Weil–Deligne extension, belong to a downstream ArtinRepresentations §2.4, which is not on `main`. ClassicalArithmeticCompletion §7.12b on `main` (line 13873, "Weil local constants") constructs the unique `ε_F(V,ψ,dx)` for finite-dimensional smooth complex representations of `W_F`, `F/ℚ_p`. It uses geometric reciprocity, as §10.1 does, and it proves the unramified-twist law and induction in degree zero. ClassicalArithmeticCompletion does not cite this roadmap, so the new edge creates no cycle.

The repair is to add `TauCetiRoadmap.ClassicalArithmeticCompletion` §7.12b (Weil local constants) to the *Needs:* line of §10.26a, keeping §2.7 for `ε(χ,ψ)`. The same entry would go into the Layer 10 dependencies (line 4188, which this change already edits) and onto a line of the supplier contracts (beside line 5503). Since it is a new supplier of this roadmap, the description would say so.

## C01 — The description says nothing about what it changes in this roadmap, and two of its claims then misdescribe §10.26a

First, its list of wrong statements on `main` leaves out one that this change corrects. On `main`, §10.27 fixed `c_χ` by its relation "on sufficiently deep units". Every `c` of valuation at most `a(χ)+n(ψ)` satisfies that relation on `1+𝔭^{a(χ)}`, as the third Check of §10.26a shows. A bullet would be right: "EndoscopicTransferAndUnitaryTraceComparison §10.27: `c_χ` was fixed on deep units, where the relation does not determine it; the new §10.26a fixes it on `v(x) ≥ ⌈a(χ)/2⌉` and states the Weil-side formula, which §10.27 now cites."

Second, the claim that each added section is "stated in the generality of its source" does not hold for §10.26a. Deligne and Henniart work over every non-archimedean local field (DeligneHenniart1981 lines 108–109, §0.3, p. 91). §10.26a works over finite extensions of `ℚ_p`, which is the setting of Layer 10 and of its local-constant suppliers. Either list §10.26a among the description's stated exceptions ("for finite extensions of `ℚ_p`"), or state §10.26a over a non-archimedean local field.

## C02 — #3036 rewrites the same *Needs:* line of §10.27 (line 4075), and neither text says which pull request merges first

#3036 replaces the layer-level AutomorphicLFunctionsAndLocalFactors citations on that line with section-level ones; this pull request appends `§10.26a` to the same line. Whichever merges second would rebase on the other and keep both: #3036's section citations and `§10.26a`.

## C03 — The route of §10.26a (line 4043) puts the Gauss sums of Deligne–Henniart in the wrong sections

In the paper, §2 is the variant of Brauer's theorem (2.3, used in 4.8) and §3 compares norms with traces (3.5–3.12; Corollary 3.7 is used in the proof of 4.7). The Gauss sums are in §1 (Proposition 1.1 and Corollary 1.3, also used in 4.7). The sentence would read "uses the variant of Brauer's theorem of §2, the norm–trace comparison of §3 and the rank-one Gauss sums of §1".

## C04 — Untouched text: §10.1 (line 3482, *Needs:* line 3504) takes "the imported Deligne local constant" of a Weil–Deligne object from ArithmeticGaloisRepresentations §2.7, which disclaims it

This is the citation of R01 in an older place. The Weil part is owned by ClassicalArithmeticCompletion §7.12b. For the monodromy factor of the Weil–Deligne extension, §2.7 points to ArtinRepresentations §2.4 (ArithmeticGaloisRepresentations lines 5065–5066), which is not on `main`. A separate pull request would cite §7.12b and name a source for the monodromy factor.

## C05 — Untouched text: §7.10a (line 2861) calls `TauCeti.EtaleDuality.CohCorr.rgammac` supplied API, but the name occurs nowhere in the pinned Tau Ceti

A search of the pinned Tau Ceti sources finds neither `CohCorr` nor `rgammac`. A separate pull request would name the declaration that exists, or state the operator as a target.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / source or computation) | Result | Change |
|---|---|---|---|---|
| 10.26a: `v(c_χ)=a(χ)+n(ψ)` | `ℚ_3`, `n(ψ)=0`, `a=2`; general `a≥2` | Triviality on `𝔭^a` forces `v(c)≤a+n`; nontriviality on `𝔭^{a−1}` forces `≥`. DH Prop 1.1: `v(a)=−(n+1+α)`, `α=a−1` | holds | none |
| 10.26a: `c_χ` unique mod `1+𝔭^{⌊a/2⌋}` | `a=2,3,4` | `c/c′∈1+𝔭^{a−⌈a/2⌉}`; at `a=3` this is `1+𝔭`. DH `U(α/2)=1+𝔭^{⌈(a−1)/2⌉}`, with `U(t)` meaning `v(x−1)≥t` (forced by DH 0.7) | holds | none |
| 10.26a formula, `V` unramified | `V=\|·\|^s` | Roadmap: `\|c_χ\|^s=q^{−(a+n)s}`. Tate twist law `ε(χ\|·\|^s)=q^{−s(a+n)}ε(χ)` (ArithmeticGaloisRepresentations §2.7). So it is `c`, not `c⁻¹` | holds | none |
| 10.26a formula, `V=β` ramified | `a(χ)≥2a(β)` | The Gauss sum localises at `x₀=c_χ⁻¹`, and `β` is constant there, giving `β(c_χ)ε(χ)`. The threshold `a−1>2(a(β)−1)` is equivalent to `a≥2a(β)` | holds | none |
| Threshold against DH 4.6 | DH's `W=V−(dim V)·1`, DH's `V=χ` | Roadmap: break of `χ` > 2·max break. DH: `β(W)<α(χ)/2` with `χ` wild; `det W=det V` | same hypothesis | none |
| Route: `E(y)` against `1+y` | `p=2`; `p` odd with `v(y)=m≥⌈a/2⌉` | `p=2`: `E(y)=1+y`. `p` odd: `E(y)/(1+y)∈1+𝔭^{2m}⊂1+𝔭^a`. `v(y)>(a−1)/2` iff `v(y)≥⌈a/2⌉` (at `a=3`: `≥2`) | holds | none |
| `det V(c_χ)` independent of the choice of `c_χ` | `a=2` with `V` tame; general | The break of `det V` is an integer below `(a−1)/2`, so `a(det V)≤⌊a/2⌋`. DH makes the same remark (line 886) | holds | none |
| `(V⊗χ)^{I_F}=0` | `V=0`; `V` tame with `a=2` | `V` is trivial on `G^{a−1}`; `χ` is nontrivial on `G^{a−1}`, which corresponds to `U^{a−1}` | holds | none |
| Reciprocity convention | geometric and arithmetic | DH and §10.1 both use the geometric one. The arithmetic choice turns `ε` into `ε(V^∨)` and leaves the formula unchanged | holds either way | none |
| Check 1 | `V` tame | All breaks are 0, so the condition is `a(χ)≥2` | true | none |
| Check 2 | `χ` tame (`a=1`), `V=χ⁻¹` | `(V⊗χ)^I=ℂ≠0`; the hypothesis `0>0` fails, which shows the inequality must be strict | true | none |
| Check 3 | `ℚ_3`, `n(ψ)=0`, `a=2` | On `9ℤ_3`, `c=1` and `c=9` both give `1=1`, while `\|1\|=1` and `\|9\|_3=1/9`. On `3ℤ_3`, `ψ(x)≡1` but `χ(1+x)` has order 3 | true | none |
| §10.27, changed paragraph | `V⊗V′` of dimension `ab` | `ε(χ)^{ab}·det(V⊗V′)(c_χ)` equals `∏ε(χα_iβ_j)`, because `∏α_iβ_j(c)=ω_π^bω_{π′}^a(c)` | consistent | none |
| Consumer: BaseChange…UnitaryGroups §10.27 at head | `V=ξ\|·\|^s` and `V=\|·\|^s`, `a(χ)=2`, `ξ` tame | The quotient is `ξ(c_χ)`, and the threshold `a≥2` is met | consistent | none |
| Sample target §10.27 | Scholze Thm 14.1, Lemma 14.2 | README pp. 35–36. ScholzeLLC line 1725 (p. 35), line 1741 (p. 36); highly ramified twist at line 1750 | holds | none |
| Supplier of `ε(V,ψ)` for `dim V≥2` | *Needs:* of 10.26a | §2.7 has rank one only and disclaims higher rank (lines 1895–1897). ClassicalArithmeticCompletion §7.12b constructs `ε_F(V,ψ,dx)` | supplier miscited | R01 |
| Generality of 10.26a | DH §0.3 | DH: every non-archimedean local field. §10.26a: `F/ℚ_p` (the Layer 10 setting; its suppliers are p-adic) | narrower than the source | C01 |
| Description of the proof (route) | DH §§1–3 | §2 is the Brauer variant (2.3); §3 is norms and traces (3.5–3.12); the Gauss sums are §1 (1.1–1.3) | locator slip | C03 |

- Source locators checked against the text: DeligneHenniart1981 intro formulas (1)–(3) (lines 31–54, pp. 89–90), §§0.1, 0.3, 0.6, 0.7 (lines 90–174), Proposition 1.1 (lines 180–188, p. 93), Corollary 1.3 (line 221), Corollary 3.7 (line 670), Theorem 4.6 (lines 872–877, p. 110), Lemma 4.7 and its proof (lines 882–902, pp. 110–111), §4.8 (lines 903–908). ScholzeLLC Theorem 14.1 and Lemma 14.2 (lines 1725–1752, pp. 35–36). The four locators the change adds and the two Scholze locators of §10.27 all hold at the stated pages.
- Library declarations opened at the pins: `TauCeti.WeilGroup` (TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181). Searches found no local-constant (`ε`-factor) declaration in the pinned Mathlib or Tau Ceti, and no `CohCorr` or `rgammac` in Tau Ceti. `Suggested.lean` has no declarations, so there was nothing to `#check`.
- Cross-roadmap citations resolved: 9. On `main`: ArithmeticGaloisRepresentations §2.7 (line 1682), Layer 3 and §3.1 (lines 1945 and 2071), §2.5 (no `ε`); ClassFieldTheory Layers 7 and 9 (lines 805 and 1177); ClassicalArithmeticCompletion §7.12b (line 13873), which an open revision keeps at the same id. At the head: BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.27 and its five citations of §10.26a. At #3036's head: §10.27's *Needs:* line.
- Roadmap as record: no layer or item was removed or renumbered. §10.26a is a new id; §10.27 keeps its id and subject, and its Weil assertion now points to §10.26a. No other roadmap cites an id that this change drops.
- Overlap check: read AutomorphicSpectralTheory, IgusaVarietiesAndTorsionConcentration (and Part II), AutomorphicGaloisRepresentationsPartII, GlobalShtukasAndFunctionFieldLanglands, ModularityAndLanglandsExtensions and ArtinRepresentations. Nothing is shared: none states the Deligne–Henniart twist formula. Its earlier statement in BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.27 on `main` is now a rank-one corollary that cites §10.26a, which leaves one owner.
- Automatic checks: every check passed, and none was set aside. Dependency check: `depcheck: 124 roadmaps, 1402 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` exits 0 with no output. The file is unchanged by this pull request and states nothing; §10.26a is not a headline and is not statable at the pins, which have no local constants.
- Sample: of the 15 seeded targets only §10.27 lies in changed text. The other 14 are in untouched passages that the change does not affect, so they were not re-checked.

Source independence: changed passages only; 6 passages compared with 2 sources (DeligneHenniart1981, ScholzeLLC), none shared beyond the forced dozen-word definition of `n(ψ)` (DeligneHenniart1981 lines 110–111); largest share of the README's linked locators Shin, *Galois representations arising from some compact Shimura varieties*, 29 of 455; contents not compared (the diff adds a section, not a layer).

Research link: §10.26a is the Deligne–Henniart twist formula (Deligne–Henniart 1981). Henniart's highly ramified argument uses it in Scholze's proof that the trace-defined local Langlands correspondence matches pair `ε`-factors (Scholze, Theorem 14.1 and Lemma 14.2). BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.27 consumes it. This rests on README §10.27 and ScholzeLLC lines 1725–1752.

## Not verifiable

- Jacquet–Shalika 1985, cited in an untouched paragraph of §10.27 (line 4065): the linked copy's host was not shown to be an author's page, so Proposition 4.1, §4.2 and Proposition 5.1 were not read.

## Source issues

- none

## For the human reviewers

- Licence: the README links Jacquet–Shalika, *A lemma on highly ramified ε-factors* (§10.27, line 4065; References, line 5632) to a Columbia mathematics web space under `~hj`. The sources service could not confirm it as an author's page, so it was not read.
