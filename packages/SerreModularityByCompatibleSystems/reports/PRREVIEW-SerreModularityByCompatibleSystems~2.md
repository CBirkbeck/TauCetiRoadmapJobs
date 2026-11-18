# Review of SerreModularityByCompatibleSystems (pull request #2514 at 272ffeb)

**Verdict:** accepted

**Summary.** Accepted, with one small correction and one format note, neither blocking. All eight remarks of the previous review are repaired. The overview now carries the hypotheses its targets carry: absolute irreducibility in the finite-flat case, oddness in level one, and the twist for regular compatible systems. None of the repairs introduced a mathematical error. The small correction is about the pull request's description: its summary still states Khare–Wintenberger's Theorem 10.1(i) without the twist. The format note concerns one unqualified "Definition 2.1" that is Khare–Wintenberger's and not Dieulefait–Pacetti's. One licence question from the previous review is still left for the human reviewers.

## C01 — The description's summary still states Theorem 10.1(i) without the twist that the README now carries

A reader of the pull request takes the summary as the theorem. It says the roadmap derives "modularity of odd, irreducible, regular rank-two compatible systems (Khare–Wintenberger, Theorem 10.1(i))". The Tate twist `ρ_{f,λ} ⊗ χ_ℓ` is odd, irreducible and regular, with Hodge–Tate weights `{1, k}`, but no newform is attached to it. That is why the README overview (line 7) and `S7/regular-compatible-systems` now say "comes, after a twist, from a newform of weight at least two", and why Khare–Wintenberger state 10.1(i) "up to twist" (KW-I, §10). Writing "modularity, up to a twist, of odd, irreducible, regular rank-two compatible systems" would make the summary agree with the README.

## N01 — "Definition 2.1" in an S2 Check is Khare–Wintenberger's, and Dieulefait–Pacetti have no Definition 2.1

The new Conventions sentence (line 23) says the text cites Dieulefait–Pacetti's numbered results by their numbers. So a reader of the Check on `q = 5` (line 148), where "Definition 2.1 asks for `t > 5`", looks in DP. DP has no Definition 2.1: its only definition in §2 is Definition 2.2, large image (DP line 536). The good-dihedral definition is Khare–Wintenberger's Definition 2.1. Writing "Khare–Wintenberger's Definition 2.1" would send the reader to the right paper.

## Previous findings

- R01 — repaired: line 7 now reads "an odd, absolutely irreducible residual representation that is finite at `p`", "comes, after a twist, from a newform of weight at least two" and "In level one the odd, absolutely irreducible representations".
- C01 (previous review) — repaired: "Kisin's Corollary (2.2.17)" (line 55) and "[KiFM], Corollary (2.2.17), p. 685" (lines 61 and 304).
- C02 (previous review) — repaired: "`Suggested.lean` states its level-one conclusion, in some weight at least two, as `khare_level_one`; the weight `k(ρ̄)` needs Serre's local weight recipe, absent at the pins" (line 351). The module docstring says the same.
- C03 (previous review) — repaired: the description now says that SerreWeightAndLevelOptimisation (#2518) and SmallRamificationAndAbelianVarietyBaseCases (#2517) "point these references to this roadmap instead (Layers S2, S4 and S6)".
- C04 (previous review) — repaired: "`N′ ≥ 5` for positive `N`, which is the level hypothesis of `S7/weight-one-reduction-is-onto-for-almost-all-primes`" (line 35); that target assumes `N ≥ 5`.
- C05 (previous review) — repaired: "Over `ℤ[ζ]` the matrix `D₀ = diag(ζ, ζ²)` reduces to the identity only modulo the prime above `3`… modulo the inert prime `2` the image of `ζ` is a primitive cube root of unity in `𝔽₄`" (line 240).
- N01 (previous review) — repaired: titles and ids now name the mathematics ("Killing the odd part of the level", `S2/killing-the-odd-level`). The source's step numbers stay in the milestones, which the Conventions sentence on line 23 explains.
- N02 (previous review) — repaired: citations now read "AlgebraicModularFormsAndSerreWeights Layer 4", "Layer 7", "Layers 6–7" and "§6.4". These agree with that roadmap's numbering note (its README line 17, on main).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Overview, finite-flat case (line 7) | `1 ⊕ χ̄_p`, `p ≥ 5`; `ρ̄_{E,5}` for `E` = 37a1 | `1 ⊕ χ̄_p` is now excluded by absolute irreducibility. 37a1: good reduction at 5, det `χ̄₅`, `v₃₇(Δ)=1` so `N(ρ̄)=37`, newform 37a of weight 2 | holds; "odd" is redundant, since `det ρ̄(c)=χ̄_p(c)=−1` | none |
| Overview, regular systems (line 7) | `ρ_{f,λ} ⊗ χ_ℓ`; Hodge–Tate `{0,0}` | the twist has weights `{1,k}`, and untwisting gives `f` of weight `k ≥ 2`; `{0,0}` is irregular and excluded; KW-I §10 states 10.1(i) "up to twist" | holds; agrees with S7 target | C01 (description) |
| Overview, level one (line 7) | `S₃` representation from `ℚ(√229)` mod 229; `Δ` mod 11 | the first is even (`det ρ(c)=1`), now excluded by "odd"; `Δ`: `τ(11)=534612≡1`, weight 12, level 1 | holds | none |
| Overview, finiteness (line 7) | `p = 2`; `1 ⊕ χ̄_p`, `p` odd | `p=2`: only `1⊕1`. The `GL₂(𝔽̄_p)`-conjugates of `1⊕χ̄_p` are infinitely many (centraliser is the torus), so "up to isomorphism" is needed | holds; matches the Lean `B`-conjugacy | none |
| `khare_level_one` and line 351 | `p = 2, 3`; `Δ` mod 11; `#check @` | vacuous at 2 and 3; `k = 12`, `Newform 1 12`; elaborated conclusion `∃ k f, 2 ≤ k ∧ ArisesFrom ρ f` | sentence matches statement; `simp`, `aesop` leave goal | none |
| `N′` convention (line 35) | `N = 0, 1, 4, 5, 11` | `0, 5, 20, 5, 11`; `N ∣ N′` always; `N′ ≥ 5` iff `N > 0`; descent applies the reduction target at `N′` | holds | none |
| S3 example (line 240) | primes of `ℤ[ζ]` | `N(ζ−1)=3`, `X²+X+1` at `1` is `3`; `ℤ[ζ]/2 = 𝔽₄`, `ζ ↦ ω ≠ 1` as `3 ≡ 1 (mod 2)` | true; separates standard lattice from trivial | none |
| Conventions, six steps (line 23) | DP §2 | Paso 1 p. 10 (DP line 438) to Paso 6 p. 14 (DP line 656); lemmas 2.1 (line 507) and 2.3 (line 564); milestones of S1–S4 name all eight | holds; Definition 2.2 is not a lemma | N01 (pointer) |
| `S2/large-residual-images` title and milestone | DP Lemma 2.1 | conclusion: `ρ̄_p` non-solvable for `p ∈ S₁ ∪ {2,3}` (DP line 512); "large image" is Definition 2.2 | holds | none |
| `S3/weight-two-after-type-change` milestone | DP Remark 6 | the weight-four très ramifiée case gives `k(ρ̄′₂)=2` after Lemma 2.3 (DP lines 593–603) | holds | none |
| AlgebraicModularFormsAndSerreWeights citations | its numbering note | R15.2/3/4 → Layers 2/3/4; R15.6 → Layer 7; R15.5A.3 → §6.4; "Layers 6–7" are its Galois attachments and residual modularity | holds; drops Layer 5, which the twist argument does not use | none |
| `S1/lifting-theorems-over-the-rationals`, Kisin label | KiFM | Corollary (2.2.17), p. 685, as the previous review read it; statement text unchanged | holds | none |

Rows for statements the change does not touch stand as in the previous review, of 40c8abe.

- Source locators checked against the text: DP §2, pp. 10–14 (Pasos 1–6, Lemma 2.1, Definition 2.2, Lemma 2.3, Remark 6; DP lines 429–664), and DP's list of numbered definitions (1.8, 1.10, 1.12, 2.2). KW-I: Definition 2.1 and Theorem 10.1, read in the HAL copy of the preprint.
- Library declarations opened at the pin: Mathlib `Algebra.IsUnramifiedAt` (RingTheory/Unramified/Locus.lean:47) is formal unramifiedness of a localisation, not the Galois-theoretic `IsUnramifiedAt` declared here, so no duplication. The Lean statements are unchanged. `#check @` of the four theorems matches the README.
- Cross-roadmap citations resolved: AlgebraicModularFormsAndSerreWeights on main (Layers 2, 3, 4, 6, 7 and §6.4, through its numbering note). All 32 target ids the README cites are defined in it. No roadmap on main or at an open head cites any of the renamed ids (searched for every old id: no match). The ids that other roadmaps cite (`S5/qualitative-serre-theorem`, `S6/strong-form-of-serre-conjecture`, `S6/strong-form-by-minimal-lifts`, `S7/regular-compatible-systems`, `S7/odd-artin-weight-one-modularity`) all exist at this head.
- Dependency check: `depcheck: 204 roadmaps, 2223 edges, 0 problem(s)`; there is no UPWARD or CYCLE line, and the pull request changes nothing outside the folder.
- The worker's automatic checks all passed, and passed again when re-run at this head.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else. On a copy, `simp` and `aesop` do not close `khare_level_one`.

Overlap check: read ClassicalSerreModularity and GL2ModularityLifting at their open heads, and SerreWeightAndLevelOptimisation, SmallRamificationAndAbelianVarietyBaseCases and AlgebraicModularFormsAndSerreWeights on main. Ownership is unchanged from the previous review:
- the arithmetic interfaces: ClassicalSerreModularity, repeated here in this roadmap's namespace and credited;
- the characteristic-five terminal cases: SmallRamificationAndAbelianVarietyBaseCases §5.12, cited;
- the lifting theorems under named hypotheses: GL2ModularityLifting;
- Serre's conjecture, its consequences, the scalar dyadic completion and the former R33.2 and R33.4: this roadmap. ClassicalSerreModularity's head agrees (its README line 703).

Source independence: changed passages only. 7 passages were compared with 2 sources (DP, KW-I), and none is reproduced. The longest shared run is the six-word heading "killing the odd part of the level" (DP line 543), which names the step. The overview's "from a newform of weight" (5 words) is shared with KW-I §10 and forced by the statement. No layer was added, removed or reordered, so the contents comparison of the previous review stands. The largest share is DP's, 29 of the 63 bracketed source citations at this head; contents compared with DP: independent.

Research link: Layers S1–S5 are Dieulefait–Pacetti's 2022 simplified proof of Serre's conjecture (Khare–Wintenberger 2009). S6 is the strong form (Khare–Wintenberger Thm 1.2; Khare 2006). S7 gives Khare–Wintenberger Thm 10.1(i) and Cor. 10.2(ii), the Artin conjecture for odd two-dimensional representations, which is used for modularity of GL₂-type abelian varieties. This rests on the README and on DP and KW-I.

## Not verifiable

- [Kh97]: no open copy was found (the previous review found its DOI landing page refused access). The repair removed the only locator into it that the previous review could not check. The README now cites it only through KW-I's own references to it.
- The KW-I copy read this round is the HAL preprint, whose §10 is paginated differently from the authors' preprint the README links. The README's page numbers for KW-I were not compared again.

## Source issues

- none

## For the human reviewers

- ClassicalSerreModularity Conventions §2.2 says its trace/determinant attachment interface follows the Imperial College London FLT project. This roadmap's `Suggested.lean` repeats that interface unchanged as `ArisesFrom`. I did not compare it with that repository.
