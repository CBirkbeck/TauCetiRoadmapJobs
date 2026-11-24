# Review of ArakelovGeometryAndAbelianHeights (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 666 changed lines since `592bdb1`. I checked every added section: symmetric powers, the Gram and adelic degree formulas, Layers 1A–1B on slopes, Bost's slope inequality and the Harder–Narasimhan filtration, and Mumford's good metrics in §§5.1a–5.1d. Each statement and Check was recomputed on its examples, and every new locator in the seven open sources was read, including the seeded targets §1.5b and §5.1a; all of it holds. There is no finding. There are three small corrections (the description's account of this folder, the `Suggested.lean` docstring, and one locator in untouched text) and two format notes, none blocking. One question is left for the human reviewers: the "Corollary of" convention under which a family roadmap restates §§1A.3–1A.5.

## C01 — The description's account of this folder leaves out §§5.1a–5.1d and the six suppliers the folder gains

A reader of the description learns only that this roadmap gains "slopes of Hermitian vector bundles, heights", and that the additions "create 13 new supplier relations" without naming them. So they do not learn that the folder now owns Mumford's Poincaré growth, good forms, good metrics and their Chern forms (§§5.1a–5.1d, about 100 lines), or that it now cites six new suppliers. Text that would be right: "ArakelovGeometryAndAbelianHeights gains symmetric powers and the Gram and adelic degree formulas (§§1.2a–1.6a), Layers 1A–1B (heights of linear maps, maximal and minimal slopes, Bost's slope inequality, the Harder–Narasimhan filtration and its base change) and Mumford's good metrics (§§5.1a–5.1d). Its new suppliers are DiophantineApproximationAndTranscendence §§2.5–2.5c, SuccessiveMinima §0.1, ArithmeticGaloisRepresentations §7.7, ComplexComparisonPartII §C5.4, ComplexKahlerGeometry Layer 3 and §§4.1–4.2, and CharacteristicClasses §§4.1–4.2."

## C02 — The `Suggested.lean` docstring explains why nothing is statable for Layers 1–6 only, not for the new Layers 1A–1B or §5.1d

The docstring goes through the layers one by one but never names Bost's slope inequality, the Harder–Narasimhan filtration or Mumford's Theorem 1.4 (§5.1d). A reader therefore cannot tell whether these were considered for the acceptance test. The pinned Mathlib and Tau Ceti have no hermitian vector bundle over `O_K`, no Arakelov degree and no slope; I searched both for such structures and definitions. They also have no currents of good forms. The text stays correct with one more bullet, for example: "Layers 1A–1B's slope inequality and canonical filtration, and §5.1d's Chern forms of good metrics, need hermitian vector bundles over `O_K` with their degrees and slopes, and currents on complex manifolds, none of which the pins supply."

## C03 — Untouched text: §1.14, line 649, cites Faltings' Lemma 3 on p. 356 for the point height, which Faltings defines on p. 354

The source line of §1.14 reads "§3, Lemma 3 and its proof, p. 356". Faltings defines the height of a point as `(1/[K:ℚ])·Grad(p*O(1))` on p. 354 (Faltings1983 lines 251–257). Lemma 3 on p. 356 is the finiteness theorem for metrics with logarithmic singularities (lines 323–341), which §5.2 already cites. The fix is "§3, p. 354". This is a remark for a separate pull request.

## N01 — §1.5b, line 309, cites Roy–Thunder for the heights `H_Ξ` without a locator

DiophantineApproximationAndTranscendence §2.5a cites §1 and Proposition 4.2 of the same paper for the same heights. Those locators would do here.

## N02 — Untouched text: §5.3, line 1971, calls the extension `ω_G`, while the same section writes the extended Hodge line as `ω̄_G`

The sentence ends "for the extension `ω_G`", and three sentences later the section writes "`π_n^*L_n ≅ ω̄_G^{⊗m}`". One notation would do.

## Questions for the author

- FaltingsFinitenessAndIsogenyTheoremsPartII on `main` declares four slope gaps on this roadmap (its lines 1147–1153). The new §§1A.3–1A.5 and 1B.5 supply three of them, as the new Downstream-consumers paragraph says. They do not supply `gap:hermitian-symmetric-power-slope` (`μ̂_max(SymⁿĒ) ≤ n(μ̂_max(Ē) + 2 log r)`). At this head, HeightsRationalPointsAndObstructions states Gaudron's Théorème 7.1 bound (`symmetricPower_maxSlope_bounds`). Is that roadmap meant to supply this gap, or should this one? The contract sits in a roadmap this pull request does not change, so I cannot tell what is intended.

## Verified sound

Adversarial table: every statement the diff adds or changes, with values computed on both sides.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2a (ii), (v): monomial norms, `Σ m!/α! = r^m` | `Sym²(ℤ²)`; `m = 0`; two trivial lines over `ℚ` | squared norms `1, ½, 1`; lift `(e₁⊗e₂+e₂⊗e₁)/2` has norm `1/√2`, `e₁⊗e₂` norm 1; `m=0`: `‖1‖²=1`; `1+2+1=4=2²` | holds |
| §1.2a (iii): `‖Sym^m φ‖ ≤ ‖φ‖^m`, injectivity | `φ = diag(1,2)`, `m = 2` | `Sym²φ = diag(1,2,4)` on orthogonal monomials, norm `4 = 2²`; injective (`m!` a unit over `K`) | holds |
| §1.5a Gram and comparison formulas | `ℤ²`, basis `e₁±e₂`; `ℤ`, `e=½`; `ℤ` vs `½ℤ` with `2|·|` | `log 2 − ½ log 4 = 0`; `−log 2 + log 2 = 0`; `+log 2 − log 2 = 0` | holds |
| §1.5a index formula | `ℤe₁+ℤ(e₁+2e₂) ⊂ ℤ²` | Gram det 4 gives `−log 2 = 0 − log #(ℤ²/F′)`, index 2 | holds |
| §1.5b (ii) `deĝ_n(Ē_V) = −log H_Ξ(V)` (seeded) | `ℚ(i)`, `Ō_K²`, `V=K(1,1)`; `ℤ(2,2)`; `Ξ_∞=diag(1,e^{−c})` | relative height `2`, `deĝ = −log 2`, `deĝ_n = −½ log 2`; saturation `√2`; `ℚe₂`: `H = e^{−c}`, degree `c` | holds |
| §1.5b (iii) dual-height identity, `Ξ^{−t}` | complex place; general `V` | `sup|ξᵗx|/|Ξx| = |Ξ^{−t}ξ|`; `deĝ_n((Ē/V)^∨) = deĝ_n(Ē_V) − deĝ_n(Ē)` with `deĝ_n(Ē) = −log|det Ξ|_𝔸` | holds |
| §1.6a `Sym^m` slope formula and determinants | `r=m=2`; `m=0`; `m=1` | `N=3`, sum `log 2`, slope `log 2/6 = (½ log 2)/3`; `0`; `μ̂_n(Ē)`; `binom(m+r−1,r)/N = m/r`, as Gaudron Lemme 7.2 (ii) | holds |
| §1.6a rescaling, base change | squared norm ×4 on trivial line; `ℚ(i)`, `(O_K, 2|·|)` | `−log 2`, dual `+log 2`; `deĝ = −2 log 2`, `μ̂_n = −log 2`, `μ̂ = −2 log 2` | holds |
| §1A.1 heights of maps and vectors | `2·id` on `Ō_ℚ`; `(1,1)`, `(2,2)` in `ℤ²`; `Ē(c) → F̄(c′)` | `log 2 − log 2 = 0`; `½ log 2`; `log(2√2) − log 2 = ½ log 2`; norms `e^{c−c′}‖φ‖_σ`, height `h + c − c′` | holds |
| §1A.2 (i)–(iii) | `diag(1,2)`, `2·id` on `ℤ²` | `h = log 2`; `0 ≤ 2 log 2`, `‖Λ²φ‖ = 2 < 4`; `2·id`: `0 ≤ 0`; line case `deĝ_n(M̄) = deĝ_n(L̄) − h` | holds |
| §1A.3 (i)–(vi) | `ℤ⊕(ℤ,e^{−c}|·|)`; `A₂`; `V = 0`, `V = E_K` in (ii) | `μ̂_max=c` at `ℚe₂`, `μ̂_min=0`, `μ̂=c/2`; `A₂` lines `≤ 0 < 0.0719`; `V=0` gives `θ ≤ μ̂_n` | holds |
| §1A.4 duality and orthogonal sums | dual `ℤ⊕(ℤ,e^{c}|·|)` | `μ̂_max(Ē^∨)=0=−μ̂_min(Ē)`, `μ̂_min(Ē^∨)=−c=−μ̂_max(Ē)`; sums agree with Gaudron 5.7 (2) | holds |
| §1A.5 (a)–(e), finite-place bound | projection `ℤe₁⊕ℤe₂→ℤ`, `‖e₁‖=e^{−c}`; `φ(E_𝔭) ⊂ 𝔭^{−a}F_𝔭` | `h=0`; (b) would give `c ≤ 0`, so injectivity is needed; (a) `0≤0`; (e) `0≥0≥0`; `‖φ‖_𝔭 ≤ N𝔭^a` | holds |
| §1A.6 filtered slope inequality | `ℤ²`, `F¹=ℚe₁`, `Ḡ₀=(ℤ,e^{−a}|·|)` | `h(φ₀) = −a`, `μ̂_max(Ḡ₀) = a`, `φ₁` gives `0+0`; bound `0` equals `deĝ_n(ℤ²)` | holds |
| §1B.1 steps | `ℤ⊕(ℤ,e^{−c}|·|)`; semistable `Ē` | `ℚ²` (`θ≤0`), `ℚe₂` (`0<θ≤c`), `0` (`θ>c`); sums closed by two supermodularity steps | holds |
| §1B.2 canonical flag | `(ℤ,e^{−c}|·|)²⊕ℤ` | `0 ⊊ ℚe₁⊕ℚe₂ ⊊ ℚ³`, slopes `c > 0`; `ℚe₁` has slope `c` but is not a member | holds |
| §1B.3 slopes, polygon, (iv) integrals | slopes `(c,0)`; `A₂` | vertices `(0,0),(1,c),(2,c)`; `∫₀^∞#{μ_j≥t}dt = c`; `Σ(a−μ_j)⁺ = ∫#{μ_j<a−τ}dτ`; `A₂` both `0.0719` | holds |
| §1B.4 (iv)–(vi) | `ℤ⊕(ℤ,e^{−c}|·|)`; `2ℤ² ⊂ ℤ²` | dual steps `E^∨`, `ℚe₁^∨`, `0` equal `(E_{>−θ})^⊥` in all three ranges; `B=0`, `μ̂_min=0`; slopes `−log 2` | holds |
| §1B.5 base change | `ℤ²` over `ℚ(i)`, line `(1,i)` | relative height 2, `deĝ_n = −½ log 2 < 0`; `‖gx‖_τ = ‖x‖_{τ∘g}` for Galois `g` | holds |
| §5.1a Poincaré growth (seeded) | punctured disc of radius `½` | area `4π∫₀^{½} dr/(r log²r) = 4π/log 2`; Mumford's setting, smooth projective `X̄`, matches | holds |
| §5.1b good forms | `η = dz/(2z log|z|)` | equals `∂ log(−log|z|)`; `|η(t)|² ≍ ω_P(t,Jt)`; `∂̄η` proportional to `ω_P` | holds |
| §5.1c good metrics, `θ = H^{−1}∂H` | `H=−log|z|` on `O`; frame `z·e` of `O(−[0])`; transpose convention | `θ = dz/(2z log|z|)`; `(det H′)^{−1} = 1/(|z|²|log|z||)` not poly-log; `H′^{−1}∂H′ = (∂H·H^{−1})ᵗ`, Mumford's entries | holds |
| §5.1d Chern forms, proof sketch | `O(p)`, `|e|² = −log|z|`, `e = 1/z`; `∂θ = −θ∧θ` | `∫c₁ = 1 = deg O(p)`; as `O`, `|1|² = −|z|²log|z|` fails (i); `d(θ∧θ) = ∂̄(θ∧θ) = d(∂̄θ)` | holds |
| Conventions: `μ̂_n` | finite `L/K` | `deĝ` multiplied by `[L:K]`, `[L:ℚ] = [L:K][K:ℚ]`, so `μ̂_n` unchanged and `μ̂` not | holds |
| `Suggested.lean` (unchanged) | elaboration at the pins | 0 declarations; `lake env lean` exit 0, no output; no one-tactic probe possible | holds |
| §1.14 locator (C03) | Faltings1983 | point height defined p. 354 (lines 251–257); Lemma 3, p. 356, is log-singular finiteness (lines 323–341) | locator wrong, untouched |

- Source locators: all 105 named locators in the added text were read at their place. By source: Gaudron2008 42, Bost2001 19, Bost1996 15, ChenMoriwaki2020 9, Chen2010 7, Mumford1977 7, GaudronRemond2013 6. Bost1996 printed pages are pdf page + 113; Prop. 4.3 on p. 131 was confirmed on the page image.
- Library declarations opened at the pins: Tau Ceti `LinearAlgebra/SymmetricPower/Basic.lean` lines 109, 135, 142, 191, 233, 243, 252; `Basis.lean` lines 162, 187, 192; `Algebra/Category/ModuleCat/SymmetricPower/BaseChange.lean` line 44; `NumberTheory/Height/Arakelov/Basic.lean` line 127 (`arakelovLogHeight` is relative, so §1.5b's Check uses `deĝ`, not `deĝ_n`, correctly); `Height/Arakelov/Subspace/Basic.lean` lines 86 and 292. Mathlib `LinearAlgebra/TensorPower/Symmetric.lean` line 53 and `Data/Nat/Choose/Basic.lean` line 415.
- Cross-roadmap citations resolved: DiophantineApproximationAndTranscendence §§2.5–2.5c (head lines 1070, 1410, 1428, 1444; the `det Sym^r`, dual-height and Cauchy–Binet items are present); SuccessiveMinima §0.1 (`main`, its `Suggested.lean` line 187); ArithmeticGaloisRepresentations §7.7 (`main`, Galois descent of subspaces); ComplexComparisonPartII §C5.4 (`CurrentCalculus`, locally integrable forms); ComplexKahlerGeometry §§3.5, 4.1–4.2; CharacteristicClasses §§4.1–4.2. The FaltingsFinitenessAndIsogenyTheoremsPartII gaps were matched to §§1A.3–1A.5 and 1B.5.
- The roadmap as a record: the merge base's six layers keep their ids and titles; each of the 8 deleted lines is replaced in place; the new ids 1.2a, 1.5a, 1.5b, 1.6a, 1A, 1B and 5.1a–5.1d were unused at the base.
- Automatic checks: the worker's gate passed everything. My own gate run shows every counter at 0 except the count of files outside the folder, which are the pull request's own other folders. The dependency check reports `depcheck: 132 roadmaps, 1473 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every file the pull request changes outside this folder lies in a folder the brief names as its own.
- Ownership against open work: I searched every open head for "hermitian vector bundle", "maximal slope", "Harder–Narasimhan filtration of", "good metric" and "Poincaré growth". Outside this pull request the only hit is HilbertModules (#2625), which is about C*-modules, a different object.
- Previous review: it left no open finding. Its two remarks on untouched text are still there, now C03 and N02, and I re-verified both.

Overlap check: read RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions, AutomorphicBundles and RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods at this head; FaltingsFinitenessAndIsogenyTheoremsPartII on `main`; and HeightsRationalPointsAndObstructionsPartII, NeronModelsAndSemistableAbelianVarieties, EllipticCurvePeriodsAndModularParametrizations, GrossZagierAndArithmeticHeightsPartII and SubspaceTheorem by search for the changed objects. Slopes, the Harder–Narasimhan filtration, Bost's slope inequality and Mumford's good metrics are owned here. HeightsRationalPointsAndObstructions, AutomorphicBundles, SingularHermitianMetricsAndL2Methods and FaltingsFinitenessAndIsogenyTheoremsPartII cite these sections. SlopesOfHermitianVectorBundles restates §§1A.3–1A.5 under "Corollary of" labels; that is a matter for its own review. Nothing else is shared.

Source independence: changed passages only. 12 passages were compared with 6 sources (Gaudron2008, Bost2001, Bost1996, Chen2010, ChenMoriwaki2020, Mumford1977). Nothing is shared beyond formulas and lists of hypotheses; the longest common run is 4 words (Bost2001 line 1567, "an injective K-linear map"). The largest share is Gaudron2008, 42 of the 105 named locators in the added text. I compared the contents of Layers 1A–1B with Gaudron2008 §§5–6: independent. The slope inequalities of 1A come before the filtration of 1B, the reverse of Gaudron's order (§5.2 before §6), and the order is forced because §1B.2 uses §1A.5 (b), (c).

Research link: Layers 1A–1B are Bost's slope method (Bost 1996; Bost 2001), the tool of Bost's and Gaudron–Rémond's (2014) period and isogeny theorems, which FaltingsFinitenessAndIsogenyTheoremsPartII consumes. §§5.1a–5.1d are Mumford's good metrics (1977), the input for the modular height of Layer 5. This rests on the README's Downstream consumers paragraph and Bost1996 §4.3.

## Not verifiable

- Roy–Thunder (J. reine angew. Math. 476, De Gruyter, paywalled): cited in §1.5b without a locator (N01); not opened.
- Stuhler (Arch. Math. 1976) and Grayson (Comment. Math. Helv. 1984): cited as the origin of the construction in §§1B.1–1B.2, without a locator; not opened.

Automatic checks set aside as false positives: my own gate run, made without the pull request's list of folders, flagged as outside the folder the 111 files that belong to the other roadmap folders this pull request owns.

## Source issues

- **Misprint** in Bost2001 at the proof of Proposition 4.6, p. 201: the source says inequality (4.6) follows from (4.15)–(4.17); it should be (4.14), the inequality of Proposition 4.6; affects nothing.

## For the human reviewers

- At this head, RiemannHypothesisForDirichletLFunctions/SlopesOfHermitianVectorBundles §§2.1–2.3 (its lines 341–397) state §§1A.3–1A.5 of this roadmap again, at the same generality and with the same Checks. They are labelled "Corollary of: ArakelovGeometryAndAbelianHeights", under the convention the description proposes.
