# Review of LocalAnabelianGeometry (pull request #1811 at 43dd052)

**Verdict:** accepted

**Summary.** Accepted: this folder is ready for a human's final approval. This was an incremental re-review of the 92 lines changed since `039fbee`; both findings of the previous review are repaired (0.5 now cites ColemanIntegration L0.13 for the product law of the logarithm and keeps only the kernel, image and `ℤ_p`-module structure; the proof of `ℚ_p`-linearity in 0.6 no longer asserts the false equivalence), all six small corrections and the format note are applied, and no repair introduced a new problem. There are no small corrections and no format notes; three facts are left for the human reviewers, as before.

## Previous findings

- R01 — repaired: 0.5 reads "this is ColemanIntegration L0.13 … This roadmap keeps only what L0.13 does not give"; the `*Needs:*` line, the scope bullet, a supplier contract and the Lean docstring ("an adapter") agree.
- R02 — repaired: 0.6 now states only the implication, "For `x ∈ ℤ_p` the unit `1 + p x` of `ℤ_p` has an `n`-th root in `ℚ_p` for every `n` prime to `p`", and derives the valuation of `f(1 + p x)` from it.
- C01 — repaired: Layer 1 Examples and the last Check of 3.1 both point at example 1 of Layer 3, which exists.
- C02 — repaired: 8.4 reads "an isomorphism `θ : AlgebraicClosure K = ⋃_m K^m → AlgebraicClosure K' = ⋃_m K'^m`".
- C03 — repaired: `injective_artinMap` is in the implemented list "(Layer 8, under `CharZero K`)"; the Conventions bullet says "hence `CharZero K`".
- C04 — repaired: the Check of 7.2 says "for the uniformizer `p`" and computes `Art(p) ↦ v⁻¹` for `ϖ = p v`; the Check of 7.3 notes the unramified twist.
- C05 — repaired: "`K^m` is not complete, having countably infinite dimension over `ℚ_p`".
- C06 — repaired: the description now names ColemanIntegration L0.13, lists `injective_artinMap` as implemented and says `Suggested.lean` covers 0.5–0.6.
- N01 — repaired: `map_wildInertiaSubgroup` has a docstring citing Hyeon 2025, Lem. 4.1.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.5 logarithm, product law cited | L0.13 at `K = ℚ_2`, `u = −1`; `ℚ_3(μ_3)`; hypotheses of L0.10 on a finite extension of `ℚ_p` | `2 log(−1) = log 1 = 0`; `log ζ_3 = 0`, L0.13 gives vanishing only, converse kept here; complete, ultrametric, char 0 all hold | citation supports the sentence; ownership single |
| 0.5 `log_mul_of_mem_unitFiltration_one` (docstring only) | pinned deep case needs `e < (p−1)i`; `i = 1`, `ℚ_2` | `1 < 1` false, so the pin does not give depth 1; target not already proved | still a real target |
| 0.6 `ℚ_p`-linearity, new proof | `x = −1/p`; `x ∈ ℤ_p`; `p = 2`; `k`-th scaling | `x ∉ ℤ_p`, no claim made; `X^n − 1` separable mod `p` for `p ∤ n`, root 1; odd `n` for `p = 2`; valuation divisible by all `p ∤ n` is 0; `f(p^k ℤ_p) ⊆ p^{k−1}𝒪` | every step true |
| 5.1 last Check | `K^m`, `m ≥ 1`; `ℂ_p ⊇ ℚ̄_p` | `[K^m : ℚ_p]` countably infinite (finitely many extensions per degree), Baire gives non-complete; reason no longer passes through a subfield | Check true |
| 7.2 Check | `ϖ = p`; `ϖ = p v` | `Art(p) ↦ 1`, character `χ_cyc⁻¹`; `Art(p) = Art(ϖ)Art(v⁻¹) ↦ v⁻¹`, ratio trivial on `Art(ℤ_p^×)`, so unramified | Check true |
| 7.3 Check | unramified twist `η` of `χ_cyc⁻¹` | `ℂ_p(η)` is trivial as a semilinear representation, so `d^i` unchanged: `d^{−1} = 1`, `d^0 = d^1 = 0` | Check true |
| 8.4 gluing | `K ≠ K'` | source `⋃_m K^m`, target `⋃_m K'^m`; agrees with the next sentence | wording right |
| `map_wildInertiaSubgroup` docstring | Hyeon Lem. 4.1; `ℚ_2`, `m ≥ 1` | lemma gives inertia and wild inertia of `G_K^{m+1}`, `m ≥ 1` (hyeon2025 line 467); `P ≠ I` since tame inertia survives | docstring matches 3.1–3.2 |

The rows for the untouched statements stand as in the previous review, of `039fbee`.

- Source locators checked against the text: 2 in the changed passages (hyeon2025 lines 467–470, Lem. 4.1; line 785, Lem. 6.1); the seeded sample falls in changed text only at 0.6, 5.1, 7.2 and 8.4, whose locators are unchanged.
- Library declarations opened at the pin: `TauCeti.ClassFieldTheory.injective_artinMap` (`TauCeti/NumberTheory/ClassFieldTheory/LocalExistence/ArtinMap.lean` 113, `[CharZero K]`); `log_mul_of_mem_unitFiltration` (`TauCeti/NumberTheory/LocalField/DeepUnits/Basic.lean` 82); `hasSum_log_of_mem_unitFiltration_one` (`TauCeti/NumberTheory/LocalField/Logarithm.lean` 98).
- Cross-roadmap citations resolved: ColemanIntegration L0.13 and L0.10 on main (`TauCetiRoadmap/ColemanIntegration/README.md` lines 361, 211; no logarithm product law in its `Suggested.lean`; the open revision of ColemanIntegration keeps L0.13 under its id); PadicPeriodRings §1.2 Checks (line 100, the countable-dimension argument).
- Dependency check: `depcheck: 172 roadmaps, 2003 edges, 0 problem(s)`. ColemanIntegration is on main and earlier in the merge order.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: exit 0, ten `declaration uses sorry` warnings, nothing else. The diff changes two docstrings and no statement, so the elaborated types and the one-tactic probe stand as in the previous review.
- No change outside the folder against the base; no `set_option`, no `sorry`'d data.
- Pull request text read against the head: no sentence contradicted.

Overlap check: read FilteredLocalGaloisGroups, LocalAnabelianGeometryPartII, FieldOfNorms, ClassFieldTheory, PadicPeriodRings, LocalFieldsRamification; the product law of the logarithm on principal units is owned by ColemanIntegration L0.13 and cited here; LocalAnabelianGeometryPartII (Abrashkin's theorems, pro-`p` and positive characteristic) names this roadmap as owner of Mochizuki's and Hyeon's theorems and shares no target; nothing else shared.

Source independence: changed passages only; 4 passages compared with 2 sources (the new proof in 0.6, the 0.5 paragraph, the 7.2 Check, the new docstring), none shared; largest share hyeon2025, 17 of 30 locators; no layer added, removed or reordered, so the comparison of contents stands: independent.

Research link: Layer 8 is Mochizuki 1997, Thm. 4.2, and Hyeon 2025, Thms. 1.4–1.5, the local counterparts of Saïdi–Tamagawa's `m`-step solvable theorems for number fields (hyeon2025 lines 112–130); Abrashkin's equal-characteristic analogue is named in the README's scope. Rests on the README and hyeon2025 §1.

## Not verifiable

- Serre, *Local Fields* VII §8, XI §3, XV §2; Serre, *Abelian ℓ-adic representations* III App. §5; Tate 1967 §3.3; Neukirch II §5; Yamagata 1976; Jarden–Ritter 1979: listed in the References as background, with no target resting on them alone; not in the manifest and not opened.
- BBK §2, the source ColemanIntegration L0.13 cites for the product law: not opened; the citation here is of the roadmap target, which was read.

## Source issues

- none

## For the human reviewers

- Scope: Layers 1–8 follow the order of hyeon2025 §§3–6, two layers per section (17 of 30 locators); the dependency lines force that order. Whether this arrangement is acceptable for a roadmap of one article's theorem is yours to judge.
- Licence: the manifest entry `mochizuki1997` records the author's page as its origin but has no authors, title or year fields.
- Not tested: the 7.3 criterion is stated at `i = −1` where both sources print `i = 1`; the README's computation on `ℚ_p` was checked, Serre's appendix (the primary source) was not opened.
