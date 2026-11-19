# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at b73d2bf)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 30 lines changed since 880bf70, and the one finding of the previous review is repaired. The Galois representations and the comparison at `w̃` that §11.9 needs over a CM field without an imaginary quadratic subfield are now a complete second statement of the contract on AutomorphicGaloisRepresentationsPartII AG2.7, and §11.9 cites it in place of AG2.2. The four small corrections and the format note of that review are repaired as well. One small correction remains, on a sentence of the pull request's summary; it does not block. Nothing is left for a human to decide beyond the final approval.

## C01 — The summary block of the description reads as if one generic place gave cohomological genericity

The summary block says the roadmap "proves vanishing off the middle degree at an eigensystem decomposed generic at one split place, hence cohomological genericity". §11.9(2) asks for decomposed genericity at infinitely many split places, and the Check of §11.9 (line 610) shows that one witness does not suffice: with `Σ⁺′ = Σ⁺ ∪ {w}` the polynomial `H_w` is no longer in the Hecke algebra and (1) says nothing. The second paragraph of the description has it right. A sentence that would be right in the block: "…vanishing off the middle degree at an eigensystem decomposed generic at one split place, and cohomological genericity when there are infinitely many such places."

## Deferred findings

- D01 — resolved: the `gaps` list of `packages/IgusaVarietiesAndTorsionConcentrationPartII/design/plan.json` now has unitary-torus-igusa-trace, supplier EndoscopicTransferAndUnitaryTraceComparison §§6.3, 8.21, 6.25, with the README's sentence.

## Previous findings

- R01 — repaired: the contract (line 728) now has a second statement, "there is a continuous semisimple `r_{Π,ℓ} : Gal(F̄/F) → GL_N(ℚ̄_ℓ)`, unramified outside the places above `Σ ∪ {w₀, ℓ}`", with its Frobenius polynomials and the comparison at `w̃`; lines 601–604 cite it.
- C01 — repaired: the description now has a paragraph on §11.9, names Liu–Tian–Xiao–Zhang–Zhu and lists the four gaps with both parts of the third. Its summary block has one loose clause (C01 of this report).
- C02 — repaired: the gap stays one slug with parts (a)–(c); the scope paragraph (line 665), the Needs line (604) and the layer's Dependencies (633) all attach it to "§§6.3, 6.25, 8.21", and each part names the section it extends.
- C03 — repaired: line 602 now reads "above a split place `v` of `F⁺` whose rational prime has no place in `Σ⁺` and is not `ℓ`".
- C04 — repaired: the module docstring of `Suggested.lean` has a bullet for [LTXZZ] Proposition D.1.3 and Corollary D.1.4 (README §11.9) naming `Sh(V, K)`, its étale cohomology and `𝕋^{Σ⁺}_N` as absent.
- N01 — repaired: neither name occurs in the README any more; §11.9(2) and the §7.2 contract (line 702) state the predicate in prose.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Second statement of gap:unitary-discrete-local-comparison, Frobenius polynomial | `N = 1`; `N = 2`; the opposite twist `|det|^{(N−1)/2}` | `N = 1`: `X − x_1`, twist trivial. `N = 2`: `X² − q^{1/2}(x_1+x_2)X + q·x_1x_2`, the image of `X² − T_1X + qT_2` (§8.4). Opposite twist: constant term `q⁻¹x_1x_2 ≠ q·x_1x_2` | true to §§8.4, 9.4; the explicit polynomial excludes the wrong twist |
| Same statement, comparison at `w̃` | `rec` of an unramified character twisted by `|·|^{(1−N)/2}` at a uniformizer | `χ(ϖ)·q^{−(1−N)/2} = q^{(N−1)/2}χ(ϖ)`, the root asked for at unramified places | consistent with the Frobenius clause; same normalization as AG2.5 (its README line 1859) |
| Same statement, minimality | `F` with no imaginary quadratic subfield; cuspidal blocks | AG2.2 (line 1330) needs `𝒦`; AG2.3 (line 1366) "for any CM `F`", AG2.5 (line 1859) every `v ∤ ℓ`: blocks supplied, assembly with `ϖ`-twists not | asks only for what is missing; CS17 lines 3860–3883 give the reduction to cuspidal blocks |
| §11.9(1), concentration step (places of `ρ̄_φ`) | `F⁺` real quadratic, rational prime `vv′`, `v′ ∈ Σ⁺`, `v ∉ Σ⁺`; the prime `w₀` itself | Prime lies in `Σ`: gap gives no polynomial at `v`; sentence excludes `v`. At `w₀`: first construction silent, second auxiliary prime `≠ w₀` gives it (§11.5) | true as now stated |
| §11.9(2) | one witness, `Σ⁺′ = Σ⁺ ∪ {w}`; infinitely many | `H_w ∉ 𝕋^{Σ⁺′}_N[X]`: (1) silent. Finitely many places above `ℓ` and the primes below `Σ⁺′`: a witness remains | statement unchanged, name removed; LTXZZ lines 10579–10588 |
| Gap (a), "the form of §6.3 there" | supplier heading at main | §6.3 «A Hecke character extending the CM quadratic character» (its README line 2118), stated for `𝒦/ℚ`; here `F/F⁺` | citation resolves; the extension asked is stated |

The rows of the previous review for untouched statements stand as in that review, of 880bf70.

- Source locators checked against the text: 3 (CS17 lines 3851–3859 and 3860–3883, the one locator the change adds; LTXZZ lines 10575–10588 and 10686–10689 for the new docstring bullet).
- Supplier text read at main: AutomorphicGaloisRepresentationsPartII AG2.2 «The Caraiani–Scholze discrete normalization» (line 1330), AG2.3 «Arbitrary regular conjugate-self-dual existence» (1364–1366), AG2.5 «Caraiani’s full away-prime compatibility» (1857–1859), AG2.7 «Genericity transfer and projective qualification» (3585), «Unitary discrete-parameter export» (3679); EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.25, 8.21, 13.1 (headings at 2118, 2606, 3492, 5044).
- Automatic checks at b73d2bf: every check passed. Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 89 and 104), nothing else. The change touches only the module docstring; the 4 elaborated types are those of the previous review and no binder is lost.
- Declared gaps: the four slugs of the plan agree with the README. The second statement of unitary-discrete-local-comparison is precise (data, representations, ramification set, Frobenius polynomial, comparison) and asks for nothing AG2.3 and AG2.5 state.
- Pull request text read against the head: title and description agree with it, except the clause of C01.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison; shared objects and owners as in the previous review (cohomological genericity: the parent's §7.2, with the implication from decomposed genericity owned here; local strong genericity: AG2.7; `ϖ`, the stable–twisted identity and `Sh(V, K)`: EndoscopicTransferAndUnitaryTraceComparison); the change adds none.

Source independence: changed passages only; 3 passages compared with 2 sources (CS17, LTXZZ), none shared beyond formulas and names the mathematics forces; largest share CS17, as in the previous review (75 of 106 citations there, one more now); the change adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 8–11 prove Caraiani–Scholze 2017, Theorems 1.1 and 6.3.1; §11.9 is Proposition D.1.3 of Liu–Tian–Xiao–Zhang–Zhu 2022, which they use as the genericity input for their Beilinson–Bloch–Kato results. Rests on the README's references and on CS17 and LTXZZ as read.

## Not verifiable

- The proof of the claim in [Shin-BCU] Proposition 1.4 that part (c) of gap:unitary-torus-igusa-trace refers to: not opened; the passage is unchanged and is cited through LTXZZ lines 10667–10671.

## Source issues

- none

## For the human reviewers

- none
