# Review of SmoothRepresentationsOfLocalGroupsPartII (pull request #1815 at 9228cb0)

**Verdict:** accepted

No finding. Incremental re-review of the 125 lines changed since `9739abb` (README only; `Suggested.lean` and `metadata.toml` unchanged), and of the pull request's title and description against this head.

## Previous findings

- R01 — repaired: README.md:512 “the restriction μ|_H is σ-finite, since it is finite on compact sets, and BanachSpaceTheory B5, `exists_lpInftyDualEquiv`, identifies L^∞(H, μ) with the dual of L¹(H, μ)”; “duality contract” no longer occurs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.5 route, σ-finiteness of μ on H (README.md:512) | H σ-compact open, H = ⋃ Kₙ compact; H = ℤ with counting measure | μ(Kₙ) < ∞ for each n, so H is a countable union of finite-measure sets; ℤ: μ({n}) = 1, μ(ℤ) = ∞ | σ-finite; supplier needs `[SigmaFinite μ]` only | — |
| 5.13 (6.11)–(6.13), seeded | ε = ¼ in rank 1; ε = ¼ in rank 2 with β^∨ = α₁^∨ + α₂^∨; ν = ½ω₁ for PGL₂ | ±α^∨: 2ε ∈ ½ℤ gives ε ∈ {0, ¼}; rank 2: ¼ + ¼ = ½ ∉ ¼ + ½ℤ, so empty; PGL₂: ν₁ = ½ ∈ {0, ½} | Agrees with CH26 lines 892–925, p. 19 | — |
| 5.18 reworded test | PGL₂ at ν = ½ω₁ and ν = 0; G₂ (no listed fundamental representation) | ν = ½ω₁: adjoint pairing ½ ∈ ½ℤ, standard pairing ¼ ∉ ½ℤ, so not geometric and ν ≠ 0; ν = 0: all pairings 0; G₂: `U₀^(g,½)` = {0}, adjoint alone | Both directions hold; same statement as at `9739abb` | — |
| 6.3 reworded test and its representations | G^∨ = SL(2n), n = 2; G^∨ = Spin(8); ²E₆ | V ⊕ V^τ: 4 + 4 restricts to 2 × defining Sp(4) (dim 4); half-spins 8 + 8 restrict to 2 × spin of Spin(7) (dim 8); F₄: adjoint only | Agrees with CH26 lines 1268–1286; PSU(2n+1) still excluded | — |
| Section introductions of 5.1, 5.3, 5.7, 5.13, 5.17, 6.1, 7.1, 7.6 (“consume” claims) | Every *Needs:* line of SRU.5–SRU.7 (README.md:1082–1711) | 5.1: 9 consumers named, 9 found; 5.3: 9/9; 5.7: 9/9; 5.13: 5/5; 5.17: 5/5; 6.1: 2/2; 7.1: 3/3; 7.6: 4/4; none omitted outside the group | Each named consumer cites a slug of the group | — |
| Contract names (README.md:117, 897) | Contract headings at README.md:83, 119 | “tempered-local-topology contract” at 83, 897, 909, 1051; “polynomial-identity contract” at 117, 119 | One name per contract | — |
| 7.13, seeded (cited by the introductions of 5.7, 5.17, 7.1) | BM93 Theorem 8.1 | BM93 line 973 on printed p. 634 (line 967): X unitary iff the centraliser-side module is unitary | Locator and statement agree | — |
| Pull-request description | Lean declarations, suppliers, `metadata.toml` at head | 7 definitions + 8 theorems = 15; `topic = "math.RT"`; Springer §§6.2–6.5, Excursion §§0.0, 3.3, 4.1–4.3, BanachSpaceTheory B5 all in README; `ContRepresentation` at Mathlib/RepresentationTheory/Continuous/Basic.lean:55 | No sentence contradicted; nothing a reader must know is unstated | — |

Rows for untouched statements stand as in the previous review, of `9739abb`.

- Source locators checked against the text: 7 (CH26 lines 892, 908, 925 on p. 19; 1172 on p. 24; 1192 on p. 25; 1268 on p. 26; 1288 on p. 27) and BM93 line 973, p. 634. The other seeded targets lie outside the changed passages.
- Library declarations opened at the pin: Mathlib/RepresentationTheory/Continuous/Basic.lean:55 (`ContRepresentation`); TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean:35 (`Matrix.PosSemidef.KolmogorovSpace`).
- Cross-roadmap citations resolved: BanachSpaceTheory on main, Suggested.lean:184 `exists_lpInftyDualEquiv (μ) [SigmaFinite μ]`. The section numbers 5.1–5.21, 6.1–6.4, 7.1–7.13 and all slugs are the same as at `9739abb`; the 31 targets now set as run-in bold paragraphs keep their statement, hypotheses, locator, Checks and *Needs:* line.
- Gate: every scanner and the targeted build pass. `lake env lean` on `Suggested.lean`: eight `sorry` warnings, nothing else. No Lean statement changed, so no new one-tactic probe; no path changed outside the folder.
- Dependency check: `depcheck: 241 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Remark (untouched text): README.md:1322 is the fragment “Numbering of Conventions.”
- Remark (another roadmap, later in the order): GlobalShtukasAndFunctionFieldLanglandsPartII README.md:787, 793, 810, 832, 897 cites §§5.23–5.27 of this roadmap, which numbers SRU.5 up to 5.21; the repair belongs to that roadmap.

Overlap check: the closest-roadmap lists are those of the previous review (SmoothRepresentationsOfLocalGroups, GlobalShtukasAndFunctionFieldLanglandsPartII, ExceptionalThetaCorrespondencesForG2, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, AutomorphicLFunctionsAndLocalFactorsPartII, ReductiveGroupsPartII, CompactGroups, read there); this round read GlobalShtukasAndFunctionFieldLanglandsPartII's citations of SRU.5–SRU.7 again; the change moves no ownership; nothing shared.

Source independence: changed passages only; 4 passages compared with 1 source (CH26 lines 887–925, 1192–1196, 1268–1272, 1279–1285 against README.md:1263, 1331, 1453 and the eight section introductions), none shared beyond formulas and the list of groups; largest share BHV, unchanged; no layer added, removed or reordered, so contents were not compared again.

## Not verifiable

- BM89, KL87, HM07, CS18 and Rodier73: settled uncertified citations; primary texts not in the legal cache.
- BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79 and Ber74: settled waived citations; no new request made.

## Source issues

- none

## For the human reviewers

- Luo26 is a July 2026 arXiv preprint; README.md:1360 (SRU.5.20) uses its nonsplit generic/sign comparison beyond its stated characteristic-zero setting. The roadmap owns an all-characteristic proof, including the SU₃ finite-root calculation.
