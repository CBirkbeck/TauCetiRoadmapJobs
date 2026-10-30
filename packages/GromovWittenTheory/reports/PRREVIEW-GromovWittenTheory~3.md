# Review of GromovWittenTheory (pull request #990 at b74118f)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 131 changed lines since c0b92ea (80 insertions, 51 deletions, README.md and Suggested.lean only, nothing outside the folder). The gate passes at this head on an independent rerun; `lake env lean` on Suggested.lean exits 0 with no output. Of the twelve previous findings, eleven are repaired and one (R10, P3) is partly repaired. Three findings remain: one P2 overclaim introduced by the R08 repair, and two P3 locator findings. No pull-request file was changed.

## R01 (P2) — The completed coefficient ring is claimed never to be internally graded

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:163`: “so `Λ_ω` and `V ⊗̂ Λ_ω` are the filtered completions of these direct sums and are not themselves internally graded”; also line 597: “in which a general element has components in infinitely many degrees”.

**Claim:** The first half is right. The second half is a universal assertion that fails for every target on which `c₁(TX)` vanishes on `H₂`, a class the roadmap itself uses as examples. When all Chern numbers are zero every element is homogeneous of degree `0`, so the completed ring equals its degree-zero piece and is, trivially, the direct sum of its homogeneous pieces.

**Witness:** The README's own Check at line 173: on `T² × T²` with `c₁ = 0`, “`Λ_ω` is concentrated in degree `0`” and the infinite series `Σ q^(aF₁+bF₂)` “is homogeneous of degree `0`”. So `Λ_ω = Λ_ω^0 = ⊕_D Λ_ω^D`. The same holds for a K3 surface (line 170: every class has degree `0`). The precise statement: `Λ_ω` is internally graded exactly when `c₁` vanishes on `H₂(X; ℤ)` modulo torsion (for a closed symplectic `X`, `ω` is never zero on `H₂`); otherwise pick `B` with `ω(B) > 0` and `A` with `c₁(A) ≠ 0`, and `Σ_k q^(kA + k²B)` has infinitely many Chern levels while satisfying the support condition.

**Repair:** Replace “and are not themselves internally graded” by “and need not be internally graded: they are exactly when `c₁` vanishes on `H₂(X; ℤ)` modulo torsion”, and at line 597 replace “in which a general element has components” by “in which an element may have components”. Add the K3 or `T² × T²` case as the negative control (already computed at line 173) next to the `S²` series. The `S²` witness `Σ q^k` with degrees `0, 4, 8, …` stays as the positive instance.

## R02 (P3) — Kock's stable-map formulas are cited for all genera but are stated in genus zero

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:664`: “In the algebraic setting the forgetful comparison and the restriction law for stable maps are Kock, *Notes on psi classes*, (5.1.7.1)–(5.1.7.2), pp. 50–51”; line 712: “the push-down `π_* ψ_(n+1) = 2g − 2 + n` behind the dilaton equation is its (5.1.7.3), p. 51, for stable maps”.

**Claim:** The §8.2 API bullet at line 668 states the forgetful comparison `ψ_i = π^* ψ_i + [D_(i,n+1)]` for every map-stable forgetful map in every genus, and §8.4 states the dilaton equation in every genus. Kock's Chapter 5 is “Gromov–Witten theory in genus zero”; its (5.1.7.2)–(5.1.7.3) are written on `M̄_(0,n)(X, β)` and the text itself marks the extension to higher genus as unwritten.

**Witness:** Kock2001 line 1890 (chapter heading “5 Gromov-Witten theory in genus zero”); line 1900, immediately after (5.1.7.2), an author's note that the statement should be made for any genus; line 1902, (5.1.7.3) written with the coefficient `2g − 2 + n` against the virtual class of `M̄_(0,n)(X, β)`.

**Repair:** At lines 664 and 712 say that Kock supplies the genus-zero algebraic statements, and cite the all-genus algebraic dilaton equation as Kontsevich–Manin 1998, Lemma 1.5.3, p. 6 (already in the References), which that source attributes to the Behrend–Manin axioms; keep the all-genus forgetful comparison on the analytic carrier as this roadmap's target, which the surrounding sentence already does for the isotropy descent. No change to any formula.

## R03 (P3) — The Hodge-family and capped-trace targets still carry no source locator

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:311` (§3.2, the scalar Hodge family and the residue-matched identification); line 557 (§6.5, the capped trace formula); also §1.2 (line 229) and §2.1 (line 251).

**Claim:** This carries forward the unrepaired part of the previous R10. Layer 8 now has exact locators (Kock, Kontsevich–Manin 1998), and §3.4 now cites CharacteristicClasses C2 item 3 for `e(TX)[X] = χ(X)`, both verified below. §3.2 and §6.5 still cite only supplier sections; the standard parts of §3.2 (the dualizing sheaf of a nodal curve as residue-matched differentials on the normalization, `h¹(𝒪_C) = Σ g_v + b₁`) have textbook locators, and §6.5 is a new construction with none.

**Witness:** §3.2 (lines 311–336) contains no parenthetical source citation; §6.5 (lines 557–571) contains none; the References list four works, none cited there.

**Repair:** For §3.2 cite a standard text for the residue-matched description of the dualizing sheaf of a nodal curve and for `h¹(𝒪_C)` (uncertified by locator if the text is paywalled), and keep the sentence that the Hardy-family construction is this roadmap's. For §6.5 state in one clause that the capped trace formula has no source and is a target of this roadmap, as §8.5 now does for `[D_i]_(supp,vir)`.

## Previous findings

- R01 — repaired: lines 517–520 and 568 compute `⟨pt, pt, H⟩_ℓ · ⟨H, H, H⟩_0 = 1 · ∫H³ = 0` with `g^(H,H) = 1` and add the control `(pt, H, H, H)` with value `1`; line 580 matches.
- R02 — repaired: line 581 restricts emptiness to the smooth-domain locus and records the collision-bubble stratum of complex dimension `3` in the four-dimensional `M̄_(0,2)(ℂP², ℓ)`, excess and untransverse.
- R03 — repaired: line 653 writes `ψ̄₁ = a + D`, `∫a² = 0`, `∫aD = 1`, `∫D² = −1`, `∫ψ̄₁² = 1`, `∫ψ̄₁ ⌣ D = 0`.
- R04 — repaired: line 155 claims only that fibre covers represent `aF₁`, `bF₂`, adds the diagonal of `E × E` as a mixed control of area `1 + √2`, and asserts no classification.
- R05 — repaired: line 149 says `0` is adjoined by definition and realized exactly when `2g − 2 + n > 0`; line 215 gives `d_(0,2,0) = 2m − 2`, `d = 0` on `ℂP¹`, emptiness by stability.
- R06 — repaired: line 294 has `x, x²` on ℝ with classes `1, 0` and `z, z²` on ℂ with classes `1, 2`, citing ImplicitAtlases §5.2 and AnalyticStableMaps §10.2 Checks (both verified at the open heads).
- R07 — repaired: line 547 gives the degree as `Σ_x |Aut(y)|/|Aut(x)|`; lines 551–553 compute `1·2/1`, `2·1/1`, `2·4/4`, `1·2/2`.
- R08 — repaired, with a residual overclaim: lines 163–165 define closed homogeneous pieces, the ordinary graded direct sum and the filtered completion; the sentence “are not themselves internally graded” is R01 of this report.
- R09 — repaired: lines 520, 627 and 634 keep the small product `qN₁H = qN₁H`, say it does not determine `N₂`, and delete the conic and cubic counts; line 587 matches.
- R10 — partly repaired: Layer 8 has Kock and Kontsevich–Manin 1998 locators, §3.4 cites C2 item 3; §3.2, §6.5, §1.2 and §2.1 still have none (R03 of this report).
- R11 — repaired: §§8.1–8.3 have three API bullets each (lines 646–648, 666–668, 686–688); line 332 says the residue theorem makes the one-node control non-discriminating and line 334 computes the two-node control `2 → 1`; the suppliers have separate subsections (lines 123–139).
- R12 — repaired: Suggested.lean lines 28–33 no longer say “still in pull requests” and describe the missing carrier as the nodal-domain and stable-map moduli, not the smooth domain.

## Verified sound

**Gate and build.** Independent rerun of the full gate at `b74118fe63ce4d22a70e0eb8d98c017739c8eebb`: every check zero, `OK`, exit 0. Dependency check with `--movable` against the board order and main content:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.SG"`). `lake env lean` on Suggested.lean: exit 0, no output, 2.5 s. The file has `import Mathlib`, one module docstring, the namespace and no declaration, so the `#check` signature comparison and the one-tactic padding probe have zero subjects; no sorry'd data, no `set_option`, no process prose. Headlines (operations and the eight Kontsevich–Manin properties; `I_(1,1,0)(1) = χ(X)·1`; unital CohFT and quantum product; string, dilaton, divisor and the genus-zero recursion) all need the stable-map moduli, `M̄_(g,n)` with its weighted pairing, the Novikov ring and rational Chern classes, none at the pins (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`); none is statable, and the docstring says so for each. The Novikov grading is explicitly not stated as a stand-in.

**Pinned declarations opened at this head.** `SmoothAlmostComplexStructure` (`TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean:67`) with constructors `neg` (158), `const` (195), `constSmooth` (230) and `product` (263): the Lean docstring's and the Tau Ceti contract's descriptions at README:69 are accurate. The other pinned objects (`SmoothTwoForm.IsSymplectic`, `Tames`, energy density and positivity, `IsPseudoholomorphic`, `singularCohomologyFunctor`, cup, `AddMonoidAlgebra`, `HahnSeries`, `LaurentSeries`, `DirectSum.IsInternal`, `Basis`, `Module.finrank`, `Finset`, `TopCat`, `BilinForm`, matrix inverses) are unchanged since the previous report, which opened them at the same pins.

**Sources read for the sampled targets and the changed passages.** All four works were fetched through the sources service from legal copies (arXiv for the three papers, the author's page for Kock); no manifest was edited.

| Target | Source passage read | Result |
|---|---|---|
| 0.3 finiteness | No primary source; suppliers GeometricTopology item 1 (main line 270), AlgebraicTopology Stage 6/8, DifferentialGeometry 8.3–8.5 (main lines 836–852) | Route inputs resolve; unchanged since r2. |
| 1.2 combined diagrams | Pardon2016 lines 4355–4366 (Def. 9.3.1, Lemma 9.3.2, p. 100); AnalyticStableMaps open head §13.3 (line 1071), §13.4 (1083, 1105) | Tautological pushforward supported; chart-level strengthening is a construction (R03). |
| 2.3 endpoint equality | Pardon2016 lines 4366–4368 (Lemma 9.3.2); ImplicitAtlases open head line 609 (`x`, `x²` classes `0`, `1`); AnalyticStableMaps open head lines 960–962 (`z^r` class `r`) | The repaired Check matches both suppliers exactly. |
| 3.4 Euler normalization | KM1994 lines 408–421 (2.4.5, p. 10), lines 210–215 ((2.9)–(2.10), p. 6); CharacteristicClasses main lines 657–664 (C2 item 3: `e(TM)[M] = χ(M)`), 826–834 (C3 item 2) | New C2 item 3 locator correct; source error at (2.9) carried below. |
| 4.2 covariance | KM1994 lines 134–136 (2.2.1, p. 4) | Superspace sign convention agrees. |
| 4.3 grading | KM1994 lines 137–142 ((2.2), p. 4) | Degree shift `2(K·β) + (2g−2)m` agrees. |
| 5.2 fundamental class | KM1994 lines 176–185 ((2.6)–(2.7), p. 5) | Non-basic pullback and the three-point exception agree. |
| 5.4 mapping to a point | KM1994 lines 197–219 ((2.8), p. 5; (2.9)–(2.10), p. 6), 408–421 (2.4.5) | Genus-zero formula and the Hodge–Euler form agree; the (2.9) coefficient is corrected in §3.4. |
| 6.1 Casimir and sign | KM1994 lines 226–240 (2.2.6, p. 6) | Basis, `g^(ab)` and diagonal class agree. |
| 6.3 genus reduction | KM1994 lines 242–246 ((2.12), p. 6) | Last-two-marks gluing and the ordered Casimir agree. |
| 6.5 spine and capped trace | Pardon2016 lines 1698–1702 (p. 40), 4087–4090 (p. 95); ComplexCurveModuli main lines 200–213 (D7 items 1–3) | Pardon names the fibre-product formula as unproved; the capped trace is a construction without a locator (R03). The repaired Check values are recomputed below. |
| 8.2 map cotangent line | Kock2001 lines 1883–1902 ((5.1.7.1) p. 50, (5.1.7.2)–(5.1.7.3) p. 51) | Locators exact; genus-zero scope is R02. |
| 8.4 string, dilaton, divisor | KM1998 lines 238–244 (Lemma 1.5.2, (12), p. 5), 279–281 (Lemma 1.5.3, p. 6); Kock2001 lines 368–380 (1.4.2, p. 14), 501–509 (1.6.2, p. 16), 1902 ((5.1.7.3)) | All locators exact; the dilaton exception `⟨τ₁⟩₁` is excluded here by the hypothesis that the forgetful map of stable maps exists. |
| 8.5 descendant–ancestor | Kock2001 lines 1914–1917 (Lemma 5.1.9, p. 51: `ε^*ψ₁ = ψ₁ − E₁`); KM1998 lines 81–96 (Theorem 1.2, (4), p. 2), 107–118 (sketch, p. 3) | Locators exact; the README correctly calls the KM proof a sketch. |
| 8.6 genus-zero recursion | Kock2001 lines 1904–1908 (Prop. 5.1.8, p. 51), 2009–2024 (Lemma 5.2.1, p. 53); KM1998 lines 99–106 (Cor. 1.3, (4a), p. 3) | Locators exact. |

Also verified: Kock Lemma 1.2.6 (lines 245–257, p. 10), the identity `ψ_i · D_(i,0) = 0` and Lemma 1.3.1 (lines 308–319, p. 12), Lemma 1.5.1 (line 416, p. 15), 1.5.2 (line 467, p. 15); KM1998 §1.1 (1)–(2) (lines 55–70, p. 2), equation (11) (line 219, p. 5); Kock's title page (line 6) carries the version date the References give. KM1994 Theorem-Definition 4.5 (line 816, p. 19) and Definition 6.1 with 6.1.1–6.1.3 (lines 1455–1473, p. 31) unchanged from r2.

**Suppliers resolved at this head.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (main `9c6e95d`, 440 open heads). Read at main: CharacteristicClasses C2 items 1 and 3 (lines 550–664), C3 item 2 (826–834), C1.2b (419); AlgebraicTopology Stage 5 item 1, Stage 6 items 1–2, Stage 7 item 1, Stage 8 item 7 (as in r2); GeometricTopology smoothing-and-triangulation item 1 (270); DifferentialGeometry 8.3–8.5 (836–852); ComplexKahlerGeometry K5b (1168); HeegaardFloer Lane F1 items 1–3 and F2 item 1 (171–192); PDE Lane A items 1 and 6 (223–252); Orbifolds O4 (296), O5 items 1, 4, 5 (674, 693, 720); MorseNovikov N1 (75–99); ComplexCurveModuli D3 item 5 (98), D4 (105), D5 (119), D6 item 4 (179), D7 items 1–3 (200–212, including the smoothing line `T_*⊗T_**`), D8 (215–223, with the generic ineffective order 2 on `M̄_(1,1)` and `M̄_(2,0)`); HamiltonianFloerOperations H1 (26–32, `e^B` of degree `+2c₁(B)`) and H7 (91) as consumers. Read at the open heads: AnalyticStableMaps §0.1 (105), §1.1–§1.2 (206, 223), §10.2 Checks (960–962), §11.1–§11.2 (979, 991), §12.1 Check (496: emptiness stated for an injective line, that is on the smooth-domain locus, as §6.6 now records), §13.1–§13.4 (1047–1105, which assign the operations and descendants to this roadmap); ImplicitAtlases §5.2 Checks (609), §5.6 (656), §7.3–§7.4. The eleven supplier subsections (README lines 72–139) each name an existing section. No cycle and no upward edge: every supplier precedes this roadmap or is on main.

**Ownership.** `roadmaps grep` over main and the 440 open heads for ψ-classes, cotangent lines, gravitational descendants, descendant–ancestor comparison, quantum product and topological recursion finds no owner other than this roadmap: the hits outside it are the relative dualizing sheaf of AlgebraicCurves, the Adams Riemann–Roch cotangent line of SchemeKTheoryOperations, the Breuil–Kisin cotangent line of ClassicalAdicEtaleCohomologyPartII, the canonical line of SeibergWittenTheory and the consumer HamiltonianFloerOperations. ComplexCurveModuli defines no cotangent line class (its only cotangent mention is the smoothing ideal, line 72). The r2 ownership search for the remaining objects stands. Open pull requests without supplied files were not inspected beyond the tool's index.

**Adversarial computations on the changed statements.** Coefficients are ℚ; signed dimensions are kept signed.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| 0.1 effective set with `0` adjoined | `(0,2,0)`; `(0,3,0)` on `ℂP¹`; `X = ∅` | Membership `true` by definition; constant stable map exists for `(0,3)`: `2g−2+n = 1 > 0`; for `(0,2)`: `0`, none; `X = ∅`: carrier empty | Correct; KM1998 line 71 confirms `M̄_(0,2)(V,0) = ∅`. |
| 0.1 torus Check | Diagonal `Δ ⊂ E×E`; fibre covers | `∫_Δ α₁∧β₂ = ∫_E α∧β = 1`; `∫_(E×y) α₁∧β₂ = 0`; area `1·1 + 1·√2`; degree-`a` cover of `E₁×{y}` is genus one of area `a` | Correct. |
| 0.2 homogeneous pieces closed | `S²`, limit of `Σ_(k≤K) q^k` | Each partial sum is inhomogeneous; a limit of elements supported in one Chern level stays there (coefficients stabilise) | Correct. |
| 0.2 `Λ^D · Λ^E ⊆ Λ^(D+E)` | `S²`: `q^a q^b` | `4a + 4b = 4(a+b)` | Correct. |
| 0.2 convergence of components | `S²`, `f = Σ q^k`; `V = ℚ ⊕ ℚ[2]` | For `C = 3` the components meeting `{ω<3}` are `D = 0,4,8` (three); with `V` in two degrees, at most two components per class | Correct. |
| 0.2 Chern numbers of a homogeneous element | `V = ℚ` degree 0, `S²`, `D = 8` | `c₁ ∈ {(8−0)/2} = {4}`, i.e. `A = 2[S²]`, `c₁(2[S²]) = 4` | Correct. |
| 0.2 “not internally graded” | K3 and `T²×T²` (`c₁ = 0`); `S²` | `Λ_ω = Λ_ω^0 = ⊕_D Λ_ω^D` (internally graded); `S²`: `Σ q^k` not a finite sum | R01: universal claim false; `S²` instance right. |
| 0.2 Check `a q^(D/4)` | `D = 8`; `D = 6` | Single monomial `a q²`; piece `0` | Correct. |
| 1.1 Check dimension | `(0,2,0)`, `m = 1, 2` | `2((1)(m−3) + 0 + 2) = 2m − 2`: `0`, `2`; carrier empty by stability | Correct. |
| 2.3 Check multiplicities | `x, x²` on ℝ; `z, z²` on ℂ | Signed real degrees `1`, `1−1 = 0`; complex local degrees `1`, `2` | Correct; matches IA line 609 and ASM line 962. |
| 3.2 one-node rational curve | Poles at `0, ∞` on `ℂP¹` | Space `ℂ·dz/z`, residues `+1, −1`, dimension `1` with or without matching | Correct (non-discriminating, as now stated). |
| 3.2 two spheres, two nodes | Lines `c₁dz/z`, `c₂dw/w` | Unmatched `2`; matching at one node `c₂ = −c₁`; second node gives the same; `0 + b₁ = 0 + 1 = 1` | Correct. |
| 3.4 Euler bridge | `ℂP¹`, pt, `T²` | `∫c₁ = 2 = χ`, `1 = 1`, `0 = 0`; C2 item 3 states `e(TM)[M] = χ(M)` | Correct locator. |
| 6.2 Check `(pt,pt,H,H)` | `S = {1,2}|{3,4}`, `(ℓ,0)` | Left: degree `12−10 = 2` class restricted to a point: `0`. Right: `g^(H,H) = 1`, `⟨pt,pt,H⟩_ℓ ⟨H,H,H⟩_0 = 1·0 = 0`; wrong entry `g^(H,1) = 0` would give `1·1` | Correct. |
| 6.2 Check `(pt,H,H,H)` | `(ℓ,0)` and `(0,ℓ)` | Left: degree `0`, `c = Φ(st^*[pt] ⌣ ev^*γ)`, integrand degree `2+10 = 12 = d`. Right: `(ℓ,0)`: `⟨pt,H,pt⟩_ℓ ⟨1,H,H⟩_0 = 1·1`; `(0,ℓ)`: `I_(0,3,0)(pt,H,Δ_a)` has degree `≥ 6−4 = 2 > 0` on a point, `0` | `c = 1`; correct. |
| 6.2 conic Check | `A = 2ℓ`, `(pt,pt,H,H)` | `r = 12 − 4 − 12 = −4`; `d = 2(−1+6+4) = 18 > 12` | Correct; no conic count. |
| 6.4 transfer formula | `ξ: M̄_(1,2)→M̄_(2,0)` at `(E,p,q)` | `(E,q,p) ≅ (E,p,q)` via `z ↦ p+q−z`; `Aut(E,p,q) = 1`, target `{1, swap}`; chart-level iso; `1·2/1 = 2` | Correct. |
| 6.4 transfer, genus 4 | `ξ: M̄_(3,2)→M̄_(4,0)` generic | Two preimages, trivial stabilizers, `2·1/1 = 2` | Correct. |
| 6.4 separating, symmetric | `(E₁,p),(E₂,q)` non-isomorphic; isomorphic | `2·4/4 = 2`; one preimage with target `ℤ/2×ℤ/2 ⋊ swap` of order 8: `1·8/4 = 2` | Consistent either way. |
| 6.4 separating, marked | `M̄_(0,3)×M̄_(1,1)→M̄_(1,2)` | One preimage, both stabilizers order `2`, `1·2/2 = 1` | Correct. |
| 6.4 `ξ_*1 = 2τ_D` on `M̄_(1,1)` | Boundary point, ineffective `ℤ/2` | `∫^wt ξ_*1 = ∫^wt_(pt) 1 = 1`; `∫^wt τ_D = 1/2`; so `ξ_*1 = 2τ_D` | Correct and consistent with §2.1. |
| 6.5 capped-trace Check | `(pt,pt,H,H)`; `(pt,H,H,H)` | Degrees `12+2 = 14 ≠ 12`: `0`; `10+2 = 12`: the line through `pt` and `H₃∩H₄`, mark `2` at its meeting with `H₂`: `1` | Correct; equals the §6.2 value. |
| 6.6 node-matching Check | `pt,pt|H,H`; `pt,H|H,H` | `Δ_a = H`: `1·∫H³ = 0`; `Δ_a = pt`, `Δ^a = 1`: `1·∫H² = 1` | Correct. |
| 6.6 collision stratum | `M̄_(0,2)(ℂP²,ℓ)` | `dim_ℂ = 4`; expected fibre `4−2 = 2`; bubble stratum (line, point) `2+1 = 3` | Excess, correct. |
| 7.1 degree bullet | `ℂP¹`, `(0,3)`, `pt,pt,pt` | `s + 2(g−1)m = 6 − 2 = 4 = r_ℓ + 2c₁(ℓ) = 0 + 4`; `r_A ∈ [0,0]` forces `c₁(A) = 2` | Correct. |
| 7.2 `ℂP²` small product | `H⋆H`, `H⋆H²`, `H²⋆H²`, `2ℓ` | No `e_j` of degree `6`: `H²`; `e_j = H²`, `e^j = 1`, `⟨H,H²,H²⟩_ℓ = 1`: `q`; `e_j = H`, `e^j = H`, `⟨H²,H²,H⟩_ℓ = 1`: `qH`, degrees `8 = 6+2`; `d_(0,3,2ℓ) = 16 > 12` | Correct; associativity reads `qH = qH`. |
| 7.2 example | `x³` | `x⋆x⋆x = H²⋆H = q` | Correct. |
| 8.1 forgetful bullet | `M̄_(0,5)→M̄_(0,4)` | `∫(a+D)² = 0 + 2·1 − 1 = 1 = 2!/2!`; `∫ψ̄₁D = 1 − 1 = 0` | Correct; Kock 1.3.1–1.3.2. |
| 8.1 integral formula | `n = 5`, `(2,0,0,0,0)` and `(1,1,0,0,0)` | `2!/2! = 1`; `2!/(1!1!) = 2` | Correct; Kock 1.5.1, KM1998 (11). |
| 8.1 anchors Check | `M̄_(0,4)` | With anchors `{1,4}`: `1`; without: `{1,2},{1,3},{1,4}`: `3` | Correct. |
| 8.2 bullets | `X = pt`; `ℂP¹×ℂP¹` | `ψ₁ = ψ̄₁`; `∫ψ₁ ⌣ ev₂^*pt = −2 + 1 = −1` | Correct. |
| 8.3 bullets | `k = 0`; test class `ψ̄^k` of degree `2Σk_i` | Equals `⟨I(γ)⟩`; defining identity applies when `2Σk_i = d − s`, else both sides `0` by degree | Correct. |
| 8.4 dilaton hypothesis | `⟨τ₁(1)⟩_(1,0)` on `X`; `ℂP¹`, `n = 1` | Forgetful map to `M̄_(1,0)(X,0)` does not exist, case excluded (Kock's `1/24` exception); `(−2+1)·1 = −1` | Correct. |
| 8.5 Kock 5.1.9 | `ℂP¹`, `(0,3,ℓ)`, `⟨τ₁(pt)τ₀(pt)τ₀(1)⟩` | `ψ̄₁ = 0`, correction `[D₁]` gives `1`; string: `⟨pt,pt⟩_(0,2,ℓ) = 1` | Correct. |
| 8.6 KM1998 (4a) | `ℂP²`, `⟨τ₁(pt) pt 1⟩_(0,ℓ)` | `(ℓ,0)`: `⟨pt,pt⟩_ℓ ⟨1,pt,1⟩_0 = 1·1 = 1`; string gives `1` | Correct. |

**Carried forward from the previous report (statements the diff leaves untouched; values as in r2):** Conventions (virtual dimension `2=2`, `0=0`, `4=4`; operation degree `2=2`; energy density `2`, normalized `1`; left duals `−β, α`); 0.1 positivity (areas `1, −1, 0`); 0.2 support (`Σq^k` sublevel below `3` has `3` terms; `a+b√2<3` finite; `aF₁−aF₂` excluded), tensor (`0⊗Λ=0`, infinite-dimensional failure), pairing (`det [[0,1],[−1,0]] = 1`); 0.3 (`ℂP²` bound `3`: `4` classes, `4` decompositions; torsion `2` lifts); 1.1 stable range (`2g−2+n = 1,1,0,0`), unstable maps (orders `1` vs infinite); 1.2 (dimensions `0`, `10`; isotropy `C₂→C₂`, `C₄→C₄`); 2.1 (`1/2` vs `1`; `π_*1 = 0`, `π_*h = 1`; `ξ_*1 = 2[pt]^∨`); 2.2 (`s = d = 10 → 1`; `12 ≠ 10 → 0`; `r = −4 → 0`); 2.3 path (`1 − 1 = 0`); 3.1 (`1/2, 1/2`; character `−1`); 3.2 ranks (`1, 0, 2`), involution (`−1`); 3.3 (`Ob` ranks `0, 1`; `1 ≤ Kr < 1` forces `r = 0`); 3.4 (`2, 1, 0`; `−1/24`; `c₂(V) − λc₁(V) + λ²`, `λ² = 0`; degree `8 > 6`); 4.1 (`−ℓ`, torsion `0`; `2ℓ` area `2`); 4.2 (`1, −1`; `+1`); 4.3 (`s−2m`; `s`); 5.1 (`1,1,2`; `(1,1)→0`; `π_*1 = 0`, `π_*ev^*H = 1`); 5.2 (`8 ≠ 10 → 0`; `∫pt = 1`); 5.3 (`1 = 1·1`; `A = 0 → 0`); 5.4 (`1`, `0`, `1`); 6.1 (`1+1−1−1 = 0`; antidiagonal; `−1`); 6.3 (`2 = 2`, `0 = 0`); 7.1 (`q` of degree `4 = 6−2`; unit only at `A = 0`); 7.2 `ℂP¹` (`x⋆x = q`, `4 = 2+2`; `T²` duals `−β, α`); 8.1 `M̄_(1,1)` (`1/24` vs `1/12`); 8.2 (`c₁(L^12)/12 = c₁(L^6)/6`); 8.3 (`1, 1, 1/24`; `1, 1`; `−1`); 8.4 (`1 = 1`, `2 = 1+1`; `0 = 0+0`); 8.6 (`0 = 0`; `1 = 1·1`; `2 = 1+1+0`). All 57 rows of r2 were recomputed where their statements were touched (the rows above) and are otherwise unchanged in the README.

## Not verifiable

- The construction targets §1.2 (chart-level strengthening), §2.1 (weighted adjoint), §3.2 (scalar Hodge family), §6.5 (capped trace) and the analytic-carrier versions of §§8.2, 8.5, 8.6 have no primary source stating them; the suppliers were read at the named sections and provide the inputs recorded above, and the algebraic analogues now cited (Kock, Kontsevich–Manin 1998) were verified at their locators. Sampled instances (the tables above) are consistency tests, not proofs. R03 records the missing locators.
- Ownership against open pull requests without supplied files was not checked beyond the indexed `roadmaps grep`.
- The folder has no `sources.toml`; this review edits no manifest. No cited text was paywalled or inaccessible; `needs-references.toml` was not needed.

## Source issues

- **Error** in KM1994 at §2.2.5, equation (2.9), printed p. 6 (lines 210–215): the source says the genus-one constant-map unit coefficient is the alternating sum of the Hodge numbers `h^(i,0)`; it should be the topological Euler characteristic, which is already `2` rather than `1` for `ℂP¹`; affects a stated result.
- **Misprint** in KM1994 at §2.4.5, printed p. 10 (line 411): the source says the obstruction sheaf lives on the genus-zero moduli of arbitrary class; it should be the genus-`g` degree-zero moduli under discussion; affects nothing.
- **Misprint** in KM1998 at §1.1, printed p. 2 (line 64): the source writes the stable range as `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`; affects nothing.
- **Gap** in Kock2001 at (5.1.7.2)–(5.1.7.3), printed p. 51 (lines 1899–1902): the source states the forgetful comparison and the push-down `2g − 2 + n` inside its genus-zero chapter, against the virtual class of the genus-zero space, and its own note leaves the general-genus statement unwritten; it should either restrict to `g = 0` or state and prove the all-genus version; affects a stated result (the all-genus citation in README §8.2 and §8.4).
