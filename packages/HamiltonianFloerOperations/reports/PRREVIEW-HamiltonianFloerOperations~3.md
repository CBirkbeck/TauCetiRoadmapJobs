# Review of HamiltonianFloerOperations (pull request #2590 at 662b427)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the dense-period example of §6.1 and §8.6, `S² × S²` with areas `1` and `√2`, does not show what its Check says, because a rigid count fixes the Chern number and at a fixed Chern number the areas on that target are discrete; a three-factor product repairs it. Everything else I recomputed holds, and every readable source locator is at its theorem and page. There are two small corrections (missing locators, the symplectic form on `ℂPⁿ`) and one format note, none blocking. For the humans: the Piunikhin–Salamon–Schwarz chapter has no legal open copy.

## R01 (P2) — On `S² × S²` with areas `1` and `√2`, finiteness of the product support below a valuation level does follow from discreteness, so the Check of §6.1 draws a false conclusion and §8.6 tests no compactness

The Check of §6.1 (lines 668–671) lists the classes `(−⌊b√2⌋, b)` and concludes: "Finiteness below a valuation level therefore cannot come from discreteness of the periods; it comes from §3.4." An implementer who takes §8.6 ("A finite-energy dense-period support example", lines 961–965) as the test of the compactness of §3.4 would discharge it by arithmetic, and the case the construction really has to survive is never exhibited.

The listed classes have pairwise different Chern numbers `2(b − ⌊b√2⌋)`, so no two of them can carry a count for the same reference triple: a count `n(x₁, x₂; x₀; A)` is zero-dimensional, which by §1.3 fixes `2c₁(A) = μ₀ − μ₁ − μ₂ + n` (the Layer 4 Examples, lines 576–578, say so). On this target `c₁(a, b) = 2a + 2b`, so the admissible classes are `(c − b, b)` for one fixed `c`, of area `c + b(√2 − 1)`. These areas form a discrete set of spacing `√2 − 1 ≈ 0.414`. With the lower bound `ω(A) ≥ −A_H₁ − A_H₂ + A_H₀ − C` of §3.2, the window `[−M, L)` holds at most `(L + M)/(√2 − 1) + 1` classes: finiteness is elementary here, and needs neither §3.4 nor Layers 4–5. The same holds whenever `ker c₁ ⊂ S_sph` has rank at most one.

The smallest repair is a target on which `ω` is dense on `ker c₁`. On `S² × S² × S²` with areas `1`, `√2`, `√3`: `Γ = ℤ³`, `c₁(a, b, c) = 2(a + b + c)`, and on the level `a + b + c = k` the area is `k + b(√2 − 1) + c(√3 − 1)`, dense in `ℝ` because `(√3 − 1)/(√2 − 1) = √6 + √3 − √2 − 1` is irrational; so one Chern level has infinitely many classes of area in `[0, 1)`, and there the finiteness does come from §3.4. Use this target in the Check of §6.1 and in §8.6, or keep `S² × S²` and say that at fixed Chern number its areas are discrete, so that it is the three-factor product that tests compactness. The pull request's description ("the dense-period classes on S² × S² with areas 1 and √2") then follows the change.

## C01 — Some theorem targets still have no locator, including the index formula of §2.4, which FOOO states

A reader who wants to check these against the literature has nothing to open: the Fredholm index of §2.4 (lines 368–370), the continuation, commutativity and associativity homotopies of §6.3, the unit of §6.4, and the cup-product identification of §8.1. For §2.4 the dimension formula is FOOO, Proposition 11.6 (4), p. 62 (FOOO2017 lines 2953–2956): with no marked points and the output cap glued from the input caps it reads `µ₃ − µ₁ − µ₂ − n` in that source's cohomological grading, which is `μ₁ + μ₂ − μ₀ − n` here at `A = 0`. Adding "(FOOO, Proposition 11.6 (4), p. 62, in that source's grading)" after the index would do; for §6.3, §6.4 and §8.1, a locator to whichever text proves them on the branch in question.

## C02 — The `ℂPⁿ` computation names neither the symplectic form nor the comparison that lets its route use the integrable structure

§8.4 (lines 931–942) evaluates the line count with the standard complex structure, so it computes the invariant of a form which that structure tames, and only through the independence of the tame structure, GromovWittenTheory §2.3 (its README on main, lines 314–318). "On `ℂPⁿ`" (Summary, line 27; §8.4, line 921) names no form. The repair would be "`ℂPⁿ` with its Fubini–Study form" in those two places, and GromovWittenTheory §2.3 added to the *Needs:* line of §8.4 (line 947) and to the GromovWittenTheory contract.

## N01 — "which works out `ℂP¹` and `ℂP²` only in its Checks" (line 924): GromovWittenTheory also works them out in its Layer 7 Examples (its README on main, lines 673–674); "only in its Checks and Examples" would be exact.

## Earlier findings

The previous review read this same head and had no findings. Its two small corrections and its format note are unchanged in the text and are repeated above as C01, C02 and N01. R01 is new: the previous review confirmed the listed classes and their areas but not the inference drawn from them.

## Questions for the author

- Is Theorem 5.1 of the Piunikhin–Salamon–Schwarz chapter the ring isomorphism itself, or the gluing statement from which Lu, Remark 1.2 (Lu2004 lines 201–207) derives it? §7.4 calls it "the ring statement". I could not open the chapter.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| Conventions 2–4, sign system | `dA(ξ) = ∫ω(ξ, ẋ − X_H)`, `g = ω(·, J·)` | `grad A = −J(ẋ − X_H)`, so `u_s = grad A`; action rises with `s`; `E = A(x₊) − A(x₋)` | holds |
| Convention 9, class of a pair of pants | `∂u = x₁ + x₂ − x₀` | `∂(D₀ + u) = x₁ + x₂ = ∂(D₁ + D₂)`: `A` closed; glued cap `D₁ + D₂ − u = D₀ − A` | holds |
| §1.1 `S² × S²` Check (sample) | areas 1, 2; `B = (−2, 1)` | `ω(B) = 0`; `2c₁(B) = −4`; joint kernel `a + 2b = 0 = a + b` gives 0 | holds |
| §1.1 recapping and orientation Check | recap `D₁` by `B` | correct `A`: `+2c₁(B) − 2c₁(B) = 0`; opposite: `+4c₁(B)`; library `productClass = D₀ −ᵥ glue D₁ D₂` | holds |
| §1.2 branch models (sample) | monotone, `c₁ ≠ 0`; `c₁ = 0`; `ℂP¹` | `Γ ≅ c₁(S_sph) ⊂ ℤ`; `c₁ = 0` forces `ω = 0`; `Σe^(−kL)`: valuations `kω(L) → +∞` | holds |
| §1.3 regrading Check | `C^k = CF_(c ± k)` | plus: product degree `c − n`, differential `−1`; minus: `n − c`, `+1`; only `c = n`, minus | holds |
| §1.4 comparison Check | `ℂP¹`, `q^L` | `deg q^L = 4`; `e^(−L)` raw `−4`, cochain `+4 = 2 + 2`; `e^(+L)` cochain `−4` | holds |
| §2.1 domain (sample) | Möbius maps fixing 0, 1, ∞; pin model | only the identity; `χ = 2 − 3 = −1`; library end signs `+1, +1, −1` at 0, 1, ∞ | holds |
| §2.2 tangent conditions | `J² = −1`, `ω(J·, J·) = ω` differentiated | `JY + YJ = 0`; `ω(Y·, J·) + ω(J·, Y·) = 0` | holds |
| §2.3 curvature Check | `(ℝ², dq∧dp)`, `K = q ds + p dt` | `X_q = −∂_p`, `X_p = ∂_q`, `{q, p} = 1`, `R_K = −1`; constant-map density `1` | holds |
| §2.4 index Check | Morse, maximum, `p`, `p`, `A = 0`; flow trees | `n + (i − n) − (i − n) − n = 0`; tree dimension `i₁ + i₂ − i₀ − 2n = μ₁ + μ₂ − μ₀ − n` | holds; C01 |
| §3.1 energy identity | density expanded | `e = u*ω + d(K(u)) − R_K(u)`; `∫u*ω = ω(A) − ωD₀ + ωD₁ + ωD₂` | holds; FOOO (3.9), L11.10 read |
| §3.2 support (sample) | `C = 0`; actions 3, 2, 1 | `ω(A) ≥ −4`; `ν < 0` gives `E ≤ 4`; glued output action `A₀ − ω(A) ≤ A₁ + A₂` = FOOO P11.9 | holds |
| §3.3 curvature (sample) | pants collars; constant `ρ` | `∫∫β′|H_q| ≤ B_q` per end; `R_ρK = ρR_K + (ρ − ρ²){K_s, K_t}`, max `1/4` | holds |
| §3.4 compactness (sample) | FOOO P11.6 (1), (3) | Hausdorff compactification; boundary of three breaking types (11.11)–(11.13) | holds |
| §4.2 exclusion (sample) | `c₁`-zero, simple spheres | evaluation image dimension `2n − 4`: codimension 4 against families of dimension ≤ 1 | consistent; no locator |
| §4.5 `T²` Check | `α, β` of degree 1 | `m₂(α, β) = −m₂(β, α)`; point class of degree 2: `(−1)^(2b) = 1` | holds |
| §5.1 moduli spaces (sample) | construction, no numerical claim | Needs resolve: AnalyticStableMaps §3.7 on main | consistent; no locator |
| §5.4 rational package | Pardon D10.4.1, fn 35; Lu T1.1 | `ℚ[[π]]` Floer homology; cover by image of `ω ⊕ c₁`; Lu's `Γ = H_S²/(ker c₁ ∩ ker ω)` | holds |
| §6.1 dense-period Check (sample) | `S² × S²`, areas 1, `√2`; level `a + b = c` | all classes: areas dense; one Chern level: `c + b(√2 − 1)`, spacing 0.414, finite in any window | conclusion false: R01 |
| §6.2 Leibniz (sample) | `a, b` of degree 1 | all-plus signs: `d²(a ⊗ b) ∋ 2x ⊗ y`; Koszul: `x ⊗ y − x ⊗ y = 0`; FOOO L11.8 | holds |
| §6.3 homotopies (sample) | Tau Ceti theorems named | all four names declared at the pin under `TauCeti/RingTheory/NovikovModule/` | consistent; no locator (C01) |
| §6.4 unit Check | one maximum | `μ = 2n − n = n`, cochain 0; `μ = n − ind` gives cochain `2n` | holds |
| §7.1 `T²` left dual | GromovWittenTheory §7.2 | `e^β = α`: `α ⋆ 1 = α`; right dual `e^β = −α`: `−α` | holds |
| §7.4 identity | §7.3 and `F₀G₀ − 1 = dH₀ + H₀d` | `F₀(G₀T − Q_M) − (F₀G₀ − 1)T = T − F₀Q_M`, homotopy `F₀K − H₀T` | holds; FOOO T11.11, Lu R1.2 read |
| §8.1 aspherical (sample) | `Γ = 0` | `Λ = ℚ`, only `A = 0` contributes; reduces to §4.5 and §7.4 | consistent; no locator (C01) |
| §8.2 recapping (sample) | `D₀ → D₀ + B`; `D₁ → D₁ + B` | `A → A + B`: coefficient `× e^(−B)`; `A → A − B`: `× e^B`; product fixed | holds |
| §8.4 quantum relation (sample) | `n = 1, 2, 3` | `a + b + c = n + d(n + 1)`; `d = 1`: `j = 2n + 1 − k ≤ n` iff `k = n + 1`; `d = 2`: `3n + 2 > 3n` | holds; FP §10 read |
| §8.4 line count | `ℂPⁿ`, `H`, `p`, `q` | `dim_ℂ = n + (n + 1) = 2n + 1 = codim(H × p × q)`; one line, three distinct marks | holds; C02 |
| §8.6 dense periods (sample) | as §6.1 | true as stated, but by arithmetic on one Chern level | R01 |
| Headline 1: product algebra | `ℂP¹`, class `L` | raw degree `−n`; unit raw `n`, cochain 0; product cochain degree 0 | holds |
| Headline 2: multiplicative PSS | `ℂP¹` | `x ⋆ x = q^L`, degree 4; Floer side `e^(−L) · 1`, cochain degree 4 | holds |
| Headline 3: computations | aspherical; `ℂPⁿ` | `Γ = 0`; `x^(n+1)` and `e^(−L)` both of degree `2n + 2` | holds; C02 |

- Source locators checked against the text: 13 of 14. FOOO2017 lines 1203–1257, 2935–2956, 3025–3032, 3037–3044, 3080–3081; FultonPandharipande1996 lines 605–615, 1438–1442, 2703–2713; Lu2004 lines 198–207; Pardon2016 lines 4436–4438, 4626–4631. PSS Theorem 5.1 could not be read.
- Library declarations opened at the pin: Cap/Basic.lean:185, 203–221, 263; CoefficientComparison.lean:59, 144, 176; NovikovRing.lean:91; PeriodGroup.lean:176, 263, 280; Laurent.lean:123; Grading.lean:45; PairOfPants/Basic.lean:69; ThricePuncturedSphere/EndCoordinate.lean:59. All 130 backticked library names of the README resolve at the pins.
- Cross-roadmap citations resolved on main: DGFloer 7.C.1, 2a, 2b, 3, 3a, 3c, 4, 5b, 6; HeegaardFloer §1.3–1.5, 1.9, 1.9a, 2.2, 3.1, 3.4, 3.5, 4.2–4.6d; AnalyticStableMaps §3.7; MorseNovikov §1.1, 1.2, 1.5; GromovWittenTheory §0.1, 0.2, 2.3, 3.1, 4.3, 5.2, 6.1, 7.1, 7.2; ImplicitAtlases §1.1, 1.2, 4.2, 4.3, 5.2, 5.3, 5.6, 6.1, 6.4, 7.1, 7.3, 7.4; AlgebraicTopology §6.2–6.4; ComplexKahlerGeometry §5.10, §7.2; CharacteristicClasses §2.4.
- Dependency check: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`; no UPWARD or CYCLE line; every supplier is on main.
- Automatic checks: all pass at this head; none set aside.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HamiltonianFloerOperations/Suggested.lean` exits 0 with no output. The file declares nothing, so there are no signatures to compare and nothing to probe for padding; one `import Mathlib`, no `set_option`, no sorry'd data.
- Headline theorems: the product algebra with continuation isomorphisms; multiplicative PSS over `ℚ`; the aspherical and `ℂPⁿ` computations. None is statable at the pins (no Floer complex, quantum cohomology or spherical classes of a manifold); the module docstring names each and what it lacks.
- Pull-request text against the head: 23 Checks in 19 sections, twelve conventions, the "(Hk)" ids cited by GromovWittenTheory (H1) and HeegaardFloer (H7) on main still resolve; no sentence is contradicted. No change outside the folder.

Overlap check: read DGFloer, GromovWittenTheory, FukayaTheory, SymplecticFieldTheory, AnalyticStableMaps; capped complexes, continuation and module PSS are DGFloer's; the closed quantum product and its left-dual convention GromovWittenTheory's; stable-map compactness AnalyticStableMaps'; the Lagrangian `m₂` FukayaTheory's; contact buildings SymplecticFieldTheory's; the pair-of-pants product, multiplicative PSS and the `ℂPⁿ` line count are owned here and by no other roadmap on main or at an open head (searched by object).

Source independence: 18 passages compared with 4 sources (the 13 readable locators, plus Convention 5 against Lu2004 lines 71–80, §2.3 against FOOO2017 lines 2916–2922, §7.2 against FOOO2017 lines 3063–3076, §1.1 against FOOO2017 lines 2927–2934, the Lean docstring against Lu2004 lines 10–13), none shared; largest share FOOO2017, 6 of 14 locators; contents compared with FOOO2017: independent (only its §11 treats the pants product; the layer order is forced by each layer's Dependencies line). PSS1996 could not be read.

Research link: Layers 6–7 are the pair-of-pants product and ring isomorphism of Piunikhin–Salamon–Schwarz (1996), which Fukaya–Oh–Ohta–Ono (2011/2017, Theorem 11.11) use for spectral invariants with bulk; Lu (2004) and Pardon (2016) give the setting on every closed target. Rests on the README's sources and the texts read.

## Not verifiable

- PSS1996, Theorem 5.1 (§7.4): no legal open copy; cited by its locator as Lu identifies it.
- The seeded targets §1.1, §1.2, §2.1, §3.3, §4.2, §5.1, §6.1, §6.3, §8.1, §8.2 and §8.6 carry no source locator; their mathematics was recomputed in the table instead.

## Source issues

- **Misprint** in FOOO2017 at Proposition 11.6 (3), display (11.13), p. 62: the second input of the first factor carries the cap of the first input; it should carry its own cap, w₂; affects nothing.

## For the human reviewers

- Licence: the Piunikhin–Salamon–Schwarz chapter (README References, lines 1251–1254), cited for Theorem 5.1 in §7.4, has no legal open copy that I could find; it is cited by locator alone.
