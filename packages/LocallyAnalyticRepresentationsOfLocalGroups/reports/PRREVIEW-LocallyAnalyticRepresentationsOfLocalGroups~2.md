# Review of LocallyAnalyticRepresentationsOfLocalGroups (pull request #2294 at c71cc7d)

**Verdict:** accepted

Incremental re-review of the 46 lines changed since `3a7730d`. No finding. The acceptance is conditional on the declared supplier gaps (kostant-split-reductive, generic-principal-series-finite-coefficients, principal-series-jacquet-finite-coefficients, finite-length-finite-coefficients, ordered-character-map, barrelled-banach-steinhaus, compact-type-tensor).

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: both "What PadicLocalLanglandsForGL2Qp must provide" paragraphs are gone; `README.md` line 76 states the LocallyAnalyticDistributionsPartII §1.4 and §1.5 contracts; 1.1, 1.2, 1.4, 1.5, 1.8 and the Layer 1 Dependencies cite §§1.4–1.5.
- R02 — repaired: 3.2, 3.4, 3.6 and 3.8 (lines 656, 687, 720, 744) are rewritten; longest run shared with BCGP25 lines 1020–1109 is 8 words, a hypothesis. 3.5–3.7 stay separate: 3.7 *Needs* 3.6, 3.6 *Needs* 3.5.
- R03 — not repaired: deferred (D01)
- R04 — repaired: line 656 "Two kinds of analytic group 𝔾 … Both are quasi-Stein (AdicSpacesPartIII §R3.4, *quasi-stein-space*; an affinoid through its constant exhaustion)"; 3.2 title, line 12 and the Layer 3 introduction say quasi-Stein.
- R05 — repaired: line 908 "LieHighestWeight Layers 3, 7, 9; ReductiveGroups Layers 1, 4, 7 and 8 and §9A, item 5", the union of the *Needs* lines of 4.1–4.6.
- R06 — repaired: the description reads "`Suggested.lean` declares nothing: its module docstring names each headline theorem and the carrier it lacks" and "the targeted Lake build succeeds with no warning".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Contract for LocallyAnalyticDistributionsPartII §1.4 (line 76) | A = K, q_n = \|·\|; supplier text at its open head, `README.md` lines 198–206 | coadmissible = finite-dimensional; c_0(ℕ, K) excluded; all eight listed items found there, K complete nonarchimedean, A not necessarily commutative | agrees |
| Contract for §1.5 (line 76) | H = 1; H = ℤ_p, p odd | D_r = K; D_r(ℤ_p) = series Σ d_n T^n with \|d_n\| r^n → 0; supplier lines 218–223: 1/p ≤ r < 1, stages at r ∈ p^ℚ ∩ (1/p, 1) | agrees |
| 1.1 change of ring, ST03 Lemma 3.8 | H = pℤ_p ⊆ H′ = ℤ_p | D(H′, E) free of rank p on δ_0, …, δ_(p−1), so coadmissible over D(H, E); ST03 line 474, p. 12; Lemma 3.6 line 430, p. 11 | holds |
| 3.2 comodules over O_𝔾 | 𝔾 = ℤ_p + p𝔻; 𝔾 = 𝔾_m^an | affinoid: constant exhaustion, O_𝔾 Banach, D(𝔾) Smith; 𝔾_m^an: O_𝔾 Fréchet not Banach, D(𝔾) LS; AdicSpacesPartIII Check "a single affinoid is quasi-Stein" | holds |
| 3.4 E_■[M] | M = 1; M = ℤ; M = ℤ_p | E; M_0 = 1 gives ⊕_ℤ E = E[T, T⁻¹]; (lim O_E[ℤ/p^n])[1/p] = O_E[[T]][1/p]; Hom(E_■[M], V) = V(M) in each | holds |
| 3.5 λ-smooth | λ = x^k on ℤ_p^×, k ≠ 0; λ smooth | E(λ) not smooth, E(λ) ⊗ E(−λ) trivial; smooth λ: λ-smooth = smooth | holds |
| 3.6 equivalence with M_disc | M = ℤ_p, N = p^nℤ_p; M discrete | M_0/N = ℤ/p^n for both topologies, E[ℤ/p^n] is a quotient of O_E[[T]][1/p]; discrete M: identity functor | holds |
| 3.7 generator, BCGP25 Lemma 2.2.25 | M = 1; N ⊆ M general | P_(S,1) = E_■[S], Hom = V(S); Hom_M(E_■[M] ⊗_(E_■[N]) E_■[S], V) = Hom(E_■[S], V^N) = V^N(S); BCGP25 lines 1082–1088, pp. 22–23 | holds |
| 3.8 analytic vectors | invariance under ∗_l ⊗ ∗_V; V = E trivial | g·f(g⁻¹x) = f(x) gives f(gx) = g·f(x), f(x) = x·f(e); V = E: constants, E^la = E; V^(M_r) = constant functions ⊆ V^(M_r-an) | holds |
| 4.1 over any characteristic-zero k (line 112) | 𝔤 = gl_1; sl_2 over ℚ | [𝔤, 𝔤] = 0: L(μ) of dimension 1 for all μ ∈ k, X = ℤ; sl_2: dim L(λ) = λ + 1, ℚ̄ ⊗ L_ℚ(λ) = L_ℚ̄(λ); ReductiveGroups `README.md` line 4373, any characteristic-zero K | agrees |
| Layer 4 Dependencies (line 908) | union of the *Needs* lines 811, 829, 850, 867, 881, 894 | LieHighestWeight 3, 7, 9; ReductiveGroups 1, 4, 7, 8, §9A item 5; ALS.4.5; seven Tau Ceti names: equal on both sides | agrees |

The rows for untouched statements stand as in the previous review, of `3a7730d`.

- Source locators checked against the text: 9 (BCGP25 lines 1019–1111 for §2.2.16 to Remark 2.2.28, pp. 21–23; ST03 lines 430 and 474, pp. 11–12); all at the page cited. Seeded sample: 1.1 and 3.7 fall in changed passages and are checked above; in 1.3 and 1.8 only the *Needs* lines changed.
- Library declarations opened at the pin: `TauCeti/Algebra/Lie/HighestWeight/Existence.lean` line 234, `CompleteReducibility.lean` line 259, `Reductive/CompleteReducibility.lean` line 107, `CentralCharacter/Isomorphism.lean` lines 106 and 159, `Verma.lean` lines 195 and 525.
- Cross-roadmap citations resolved: LocallyAnalyticDistributionsPartII §§1.4, 1.5 at its open head (lines 196, 216); ReductiveGroups §9A, item 5 (lines 4359, 4373), AdicSpacesPartIII §R3.4 (line 10055) and LieHighestWeight Layers 3, 7, 9 on main.
- Gate: every check passed. `gate --depcheck`: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so no `#check` comparison and no one-tactic probe apply. Headlines: none statable, each named in the docstring, as in the previous review.
- Declared gaps: seven slugs, the same in the plan and in the README; neither `frechet-stein-general` nor `radius-algebras` remains in either.
- Overlap check: read PadicHodgeParametersInLocallyAnalyticRepresentations, LocallyAnalyticDistributionsPartII, ModpRepresentationsOfGL2OverLocalFields, CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, SmoothRepresentationsOfLocalGroups; Fréchet–Stein coadmissible theory and the radius algebras D_r: owner LocallyAnalyticDistributionsPartII §§1.4–1.5, cited here; category O of split reductive Lie algebras: owner here; nothing else shared.
- Source independence: changed passages only: 7 passages compared with 2 sources (BCGP25, ST03), none shared; largest share DING25, about 55 of about 235 locators; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- SCHN11 (§13, p. 90; Proposition 6.4, pp. 42–43, cited in 0.1): uncertified, text not read.
- HUM08 (Theorems 3.3, 4.6, 5.1, §§9.3–9.4, cited in 4.3–4.5): uncertified, text not read.
- NFA02 (§6, cited in the barrelled gap): uncertified, text not read.

## Source issues

- none

## For the human reviewers

- Licence: EMJ2 (Emerton, Jacquet modules II) is cited as an unpublished preprint from the author's page (`README.md` line 1743); 7.2–7.5 and 8.6 rest on it.
- Licence: BCGP25 is an arXiv preprint (`README.md` line 1756) and the main source of Layer 3; OR19 (line 1746) is an arXiv preprint cited for 6.5 (4).
- Not tested: SCHN11, NFA02 and HUM08 are uncertified books; wording was not compared with them.
