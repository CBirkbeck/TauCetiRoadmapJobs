# Review of FourManifolds (pull request #936 at aceef66)
**Verdict:** needs changes

## R01 (P2) — GeometricTopology Layer 1 and 4 and TangentialBordism B3 are cited for statements they do not make

**Location:** `TauCetiRoadmap/FourManifolds/README.md:14`–15 (“framed links, linking numbers, Seifert surfaces and Seifert matrices from its Layer 4”), 338–339 (“GeometricTopology Layer 1's associated bundles and gluing”), 440–441 (“Layer 4's Seifert surfaces, Seifert matrices, S-equivalence and Alexander polynomial”), 626, 1441 (“TB B3's Spin bordism over S¹ for the geometric filling”), 1445 (“Layer 4's actual Seifert matrix and cyclic-cover chain presentation”), 1453.

**Claim:** GeometricTopology supplies oriented linking numbers, S-equivalence of Seifert matrices, the presentation of the Alexander module by `tV−Vᵀ` and associated bundles; TangentialBordism supplies Spin bordism of three-manifolds over `S¹`.

**Witness:** On main, `TauCetiRoadmap/GeometricTopology/README.md:409`–518 (Layer 4) contains no occurrence of “linking”, “S-equivalen” or “cover”; its Seifert matrix appears only as an input to the Alexander polynomial (475, 583, 1051). Layer 1 (177–288) has collars, gluing, handle attachment and connected sum (lines 29–65 of the layer) and a PL-groupoid structure-group track (250–270); no associated bundle. At the TangentialBordism head, `TauCetiRoadmap/TangentialBordism/README.md:1867`–1913 proves `Ω₂^Spin ≅ F₂` by Arf and `Ω₃^Spin = 0`; the only “over S1” in the file (1620) is a determinant pullback. §1.4's independence of the Arf invariant from the Seifert surface, §1.4's off-diagonal entries, §3.6's `ℤ[ℤ]`-chain equivalence for `Δ_K = 1` and §3.6's normal filling of `M_K` therefore rest on four inputs no layer, supplier section or pinned declaration provides.

**Repair:** Own them where they are used, with locators: in §1.4 define the oriented linking number of two disjoint oriented knots as the algebraic intersection of one with a Seifert surface of the other, with its symmetry and the sum formula (Lickorish, GTM 175, Chapter 1), and state S-equivalence of Seifert matrices with the theorem that any two Seifert surfaces of a link have S-equivalent matrices (Lickorish, Chapter 8); in §3.6 state the presentation of the Alexander module `H₁(X̃)` by `tV−Vᵀ` (Lickorish, Chapter 6) and the identification `Ω₃^Spin(S¹) ≅ Ω₃^Spin ⊕ Ω₂^Spin ≅ ℤ/2`, detected by the Arf invariant of the transverse preimage of a point, from TangentialBordism 8.2–8.3 (B3.2(c), B3.3) and its 5.2 collapse; in §1.2 cite SmoothBundlesConnections B2.1 and B2.5 for associated and frame bundles. Alternatively declare each as a gap for GeometricTopology with its own slug, in the form the supplier contracts already use. Tested on the instance that refuted the original: the Hopf-link Check at §1.4 (linking number 1, Seifert matrix `[1]` of the twisted annulus) needs the linking number to be defined before it can be computed.

## R02 (P2) — The controlled K-theory gap asks GeometricTopology for negative K-groups and the Laurent fundamental theorem that GeneralAlgebraicKTheory already states

**Location:** `TauCetiRoadmap/FourManifolds/README.md:276`–289: “K_(−i)S(π)=K_(−i)(ℤ[π]) … K_(−i)(ℤ)=0, and for ℤ … K_(−i)(ℤ[ℤ])=0 for i ≥ 1, by the Laurent splitting K_n(ℤ[t,t⁻¹]) ≅ K_n(ℤ) ⊕ K_(n−1)(ℤ) of a regular ring (… Bass, *Algebraic K-theory*, the fundamental theorem and the negative K-groups, for n ≤ 0)”.

**Claim:** The negative K-groups, the fundamental theorem in degrees `n ≤ 0` and the vanishing `K_(−i)(ℤ) = K_(−i)(ℤ[ℤ]) = 0` are part of what GeometricTopology must provide.

**Witness:** GeneralAlgebraicKTheory is earlier in the merge order (the brief's list) and its head states, under “Layer 10: Bass contraction and the nonconnective ring spectrum”, §10.3 “Bass's negative K-groups”, §10.5 “The Fundamental Theorem with Nil terms, in every degree”, §10.12a “Polynomial and Laurent invariance in degree zero” and §10.13 “Vanishing of the negative K-groups for a regular noetherian ring”; its conventions fix `K_{−n} = LⁿK₀`. ℤ and ℤ[t,t⁻¹] are regular noetherian, so `K_(−i)(ℤ) = 0`, `K_(−i)(ℤ[ℤ]) = 0` and `K̃₀(ℤ[ℤ]) = 0` are consequences of those sections. A gap that asks for what an earlier roadmap provides is a finding under the brief's gap rules. (AlgebraicKTheory, also earlier, assigns “Whitehead torsion, Wh(π), PL surgery and the Bass–Heller–Swan computations” to GeometricTopology at `TauCetiRoadmap/AlgebraicKTheory/README.md:19`, so the `K₁` part of the gap is correctly addressed.)

**Repair:** In gap:controlled-k-whitehead-spectrum keep the functor `S(π)` with its three homotopy groups, its naturality, the cosheaf `S(p)` and `Wh(1) = Wh(ℤ) = 0`; replace the negative-K sentence by a citation of GeneralAlgebraicKTheory §10.3, §10.5, §10.12a and §10.13 for `K_(−i)(ℤ) = K_(−i)(ℤ[ℤ]) = K̃₀(ℤ[ℤ]) = 0`, and add GeneralAlgebraicKTheory to the supplier table and to §3.4's `*Needs:*` line. While there, state `Wh(ℤ) = 0` once (it is requested in both gap:laurent-l-group-splitting and gap:controlled-k-whitehead-spectrum) and let the second gap cite the first. Tested on the instance: the Example at 1641–1642 (“Wh=0, reduced K₀=0 and K₋ᵢ=0 … the same vanishings hold for ℤ”) is then supplied by the named sections rather than by a gap.

## R03 (P3) — §1.4 and §1.6 need each other

**Location:** `TauCetiRoadmap/FourManifolds/README.md:386`–388 (“*Needs:* … §1.6's Kirby moves for the basis-change bullet”) and 513–516 (“*Needs:* … F1's preceding generator and boundary comparisons”), with 469–470 (“Realize every symmetric integral matrix by an explicit framed link”) using §1.4's handlebody and its matrix.

**Claim:** The layer is built in the order of its subsections.

**Witness:** §1.4's API bullet at 394–395 consumes the Kirby moves defined at 471–478, and §1.6's realization consumes §1.4's framed-link handlebody with its intersection matrix; the two `*Needs:*` lines form a cycle inside Layer 1 that the layer-level dependency check cannot see.

**Repair:** Move the definition of handle slides and blow-ups (471–478, with the Gompf–Stipsicz §5.1 locator) into §1.4 before its API list, and let §1.6 cite “§1.4's Kirby moves”; delete “§1.6's Kirby moves” from §1.4's `*Needs:*`. The slide Check at 504–507 (`P = [[1,0],[1,1]]` turning `diag(0,1)` into `[[1,1],[1,1]]`, determinant 0 preserved) then lives with the definition it tests.

## R04 (P3) — The pinned Sard–Smale and parameter-projection declarations are consumed under HeegaardFloer F0's name instead of their own

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2158`–2166 (“Consume HF F0's native parameter-projection kernel/cokernel/index algebra … Only then apply HF F0's sharp Banach-manifold Sard–Smale theorem … The native quadratic kernel-bound theorem alone is not the sharp budget”), 2176; `## Exact supplier contracts` at 118–142 lists no Fredholm declaration.

**Claim:** HeegaardFloer F0 supplies a parameter-projection kernel/cokernel/index algebra and a sharp Banach-manifold Sard–Smale theorem.

**Witness:** On main, `TauCetiRoadmap/HeegaardFloer/README.md:161`–169 (Lane F0) names “Fredholm operators (index, stability …, kernel/cokernel splitting) … Sard–Smale (Smale 1965); the ‘moduli space = zero set of a Fredholm section’ package (McDuff–Salamon, Appendix A)” and nothing finer; the parameter-projection algebra the sentence calls “native” exists at the pin as `TauCeti.parameterProj`, `TauCeti.index_parameterProj`, `TauCeti.isFredholm_parameterProj` and `TauCeti.parameterProj_surjective_iff` (`TauCeti/Analysis/Fredholm/Parametric.lean:130`, 407, 429, 343), and the quadratic-kernel-bound theorem is `TauCeti.isMeagre_image_criticalPoints_of_isFredholm` (`TauCeti/Analysis/Fredholm/SardSmale.lean:468`, threshold `(dim ker)² + 1` on an open set of a Banach space). The open revision of HeegaardFloer is not a supplier.

**Repair:** Add those five declarations with their files to `From Tau Ceti`, cite them by name at 2158 and 2166, and cite HeegaardFloer F0 only for what main states: Smale's theorem on Banach manifolds (`C^q`, `q > max(index, 0)`) and the Fredholm-section package.

## R05 (P3) — Style: ASCII mathematics and capitals in §6.2, process vocabulary, missing spaces

**Location:** `TauCetiRoadmap/FourManifolds/README.md:2046` (“into the FULL harmonic twisted H²”), 2390–2407 (“immersed S^2 with ONE POSITIVE double point”, “cotangent DISK bundle of S^2”, “smooth T^2 bundle”, “a dot b=+1”, “-2+2=0”), 2041 and 2076 (“Retain the regression of …”, “Retain as a regression the Q₈ …”), 80, 147, 575, 631–634 (“topological4-manifold”, “Stages2–4,6,8”, “framings1 and2”, “Layer6A”, “oriented4-manifold”).

**Claim:** House style is Unicode mathematics and timeless prose.

**Witness:** The quoted spans are ASCII where the rest of the file writes `S²`, `T²`, `a·b`, `−2+2=0`; “regression” is test-suite vocabulary for what the section calls a Check elsewhere; the missing spaces are typographic.

**Repair:** Write `S²`, `T²`, `a·b = +1`, `−2+2 = 0`, drop the capitals, replace “regression” by “Check” or “example”, and insert the spaces.

## Verified sound

:robot: Independent AI review. I read the whole README (2898 lines) and `Suggested.lean` (157 lines) at `aceef66`, checked the previous review's six findings first, then reviewed every section. I changed nothing in the pull-request worktree. The diff outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FourManifolds'`) is empty. The worker's gate passes every check (`gate.md`: 25 scanners at 0, `OK`); my own `lake env lean` of `Suggested.lean` succeeds in three seconds with exactly the six `sorry` warnings at lines 68, 77, 96, 120, 134 and 143.

The dependency command returned exactly:

```text
depcheck: 208 roadmaps, 1456 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. FourManifolds is entry 119; StringOrientation, SmoothBundlesConnections, PseudodifferentialOperators, TangentialBordism, HomotopySpheres and GeneralAlgebraicKTheory are earlier. IndexTheory is consumed from its open new-roadmap head, which is permitted.

**Previous findings.** R01 (unowned F3 contracts): repaired. `## Exact supplier contracts` now has “What GeometricTopology must provide” with ten slugs (top-manifold-cw-type, tangent-microbundle-stable-classifier, brown-schoenflies, torus-trick-immersion, relative-pl-five, low-codimension-normal-bundles, marin-stable-transversality, spherical-classifier-g-top, laurent-l-group-splitting, controlled-k-whitehead-spectrum), each with hypotheses, a locator and the section that consumes it; simply connected normal maps, `L_n(ℤ)`, σ/8 and the E₈ realization are no longer in the list (165). Each gap was checked for minimality against main and the open heads: no roadmap on main or earlier in the order states manifold ANR/CW type for topological manifolds (AlgebraicTopology 8.7 at `README.md:1811` covers smooth manifolds only, through GeometricTopology's triangulation), microbundles, Brown's Schoenflies theorem (the pin has only `TauCeti.brownBicollaring`, `TauCeti/Geometry/Manifold/LocallyFlat/Brown.lean:39`, the bicollaring theorem), the torus trick (only GeometricTopology's open revision mentions it, at its 836–839, assigning it to a Part II and the four-dimensional case to FourManifolds), the product structure theorem, Marin's transversality, `BG`/`G/TOP`, Shaneson's splitting (HermitianKTheoryOfPoincareCategories, earlier, names Ranicki–Shaneson only as “evidence about optimality, not inputs”, its line 21) or the Whitehead spectrum. The one exception is the negative-K part of the last gap, R02 above. The declared gaps are stated in the README in the prescribed form; no `design/plan.json` is readable for this pull request, so the slug cross-check with the plan could not be done. R02 (return supply to GeometricTopology, absent headlines): repaired; no sentence says GeometricTopology consumes F3 (`grep` for “consumes this”, “GT Layer2 consumes” finds nothing), the Scope paragraph at 18–22 and `## Downstream consumers` at 2832–2836 state the direction, and both end theorems are stated in `Suggested.lean` on the pinned carriers (below). R03 (E₈ and `L_n(ℤ)` duplication): repaired; 55–64 and 480–491 import HomotopySpheres 6B and 7A–7C and the pinned plumbing, §1.6 keeps only the orientation-reversal comparison and the Check at 508–511 pins the sign (−2 at the pin, +2 here). R04 (GeometricTopology citations): repaired for the CW type (now gap:top-manifold-cw-type), the collapse (TangentialBordism 5.2), handle slides and Kirby moves (§1.6 targets with Gompf–Stipsicz §5.1) and the Arf invariant (§1.4 target on `finiteQuadraticArf`); the residual misattributions are R01 above. R05 (locators): repaired; §6.1–§6.3 carry Gompf–Stipsicz §2.2, §8.2 and §3.1 page locators, Wu classes are cited to B4.3, Proposition 2.9.1 is cited at printed p. 36, the SmoothBundlesConnections anchor is gone, §3.7–§3.9, §6.3 and §8.1–§8.3 have `*Needs:*` lines, and `## References` lists every work cited inline (2842–2898). R06 (labels and shape): repaired; `grep` for `item1`, `1b.2`, `§3.3.2`, `G0`, `E1`, `comparison3`, `theorem theorem` finds nothing, Layer 2 has §2.1–§2.4, generic TOP immersed surfaces have three Checks (1214–1225) and the transversality block has API, Checks and `*Needs:*` (1289–1321). No repair report marked any finding not actionable.

**Signatures.** A scratch copy with `#check @` for all twelve declarations elaborates; each elaborated type equals the README statement: `annulusTheorem_four : TauCeti.AnnulusConjecture 3`; `freedmanSliceTheorem : TauCeti.FreedmanSliceTheorem`; the seed polynomial, its evaluation map and the derivative theorem for every nonzero cone vector; the three Vandermonde quadrics, the linear and projective sign change, the Jacobian theorem with both hypotheses, the projective zero set and the no-fixed-point theorem; the exotic-space existential with `IsManifold … ∞`, `Nonempty (M ≃ₜ ℝ⁴)` and `IsEmpty (Diffeomorph …)`. No section binder is lost (no `variable` block exists). One-tactic probes fail on all six sorried theorems: `simp` with `AnnulusConjecture` and `CoboundAnnulus` unfolded leaves the full quantified goal, `infer_instance` reports no instance, `simp` with `FreedmanSliceTheorem` unfolded leaves `∀ K, K.HasPerfectCommutatorSubgroup → IsTopologicallySlice K`, `simp` makes no progress on the quartic derivative, and the Enriques Jacobian and fixed-point goals survive unfolding. So none is padding. Two positive controls compiled: `¬ IsEmpty (Diffeomorph … ℝ⁴ ℝ⁴ ∞)` by `Diffeomorph.refl`, and `enriquesInvolutionLinear.trans enriquesInvolutionLinear = LinearEquiv.refl` by `ext` and `simp`. Neither `TauCeti.AnnulusConjecture n` for any `n` nor `TauCeti.FreedmanSliceTheorem` is proved at the pin (`grep` of `Annulus.lean` and `Freedman.lean` for a proving theorem finds none; the latter's docstring says “recorded as a proposition and not proved”).

**Headlines.** The README's headline theorems are the four-dimensional annulus theorem, Freedman's slice theorem, Freedman's classification, Donaldson's theorem, Rokhlin's theorem, `E(2) ≅ K3`, the exotic ℝ⁴ and the nonrecognition theorem. The two statable at the pins are stated; the module docstring (20–52) names each of the others with the carrier it lacks. `grep -ri` of the pinned Tau Ceti for `rokhlin`, `donaldson`, `kirbysiebenmann`, `intersectionform` finds no manifold-level carrier, so none of the listed theorems is statable. The smoothness and freeness statements of Layer 7 are genuine theorems about the explicit models, not computed values.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Conventions: signed signature | `H`; `−CP²` | native `signature = (sigPos, sigNull, sigNeg)` (`Signature.lean:81`); (1,0,1) gives 1−1=0; (0,0,1) gives −1 | pass; ℤ subtraction needed |
| Conventions: torsion quotient | S⁴; Enriques | rank 0, empty determinant 1; rank 10, order-two class pairs to 0, w₂≠0 | pass |
| §1.1 CP² ring | line; reversed | h²[CP²]=1, h³=0; h²[−CP²]=−1 | pass |
| §1.1 product | S²×S² | a²=b²=0, a·b=1, det `[[0,1],[1,0]]`=−1 | pass |
| §1.2 twisted bundle | S,F; H=S+F | S²=−1,F²=0,S·F=1; H²=−1+2=1, H·S=0, E²=−1: diag(1,−1) | pass |
| §1.3 sums | CP²#−CP²; CP²#CP²; M#S⁴ | σ=0, χ=3+3−2=4; σ=2; Δχ=2−2=0 | pass |
| §1.4 matrices | unknots 0, +1; Hopf | [0], [1]; `[[0,1],[1,0]]`, det −1 | pass |
| §1.4 Arf congruence | unknot; trefoil; 4₁; 6₁ | Δ(−1)=1; −3≡5, Arf 1; 1+3+1=5, Arf 1; 2+5+2=9≡1, Arf 0 | pass |
| §1.4 proper links | Hopf; (2,4)-torus | annulus Seifert matrix [1]: q(core)=1 on the radical, lk 1 odd, not proper; [2]: q=0, lk 2 even, Arf 0 | pass |
| §1.4 q on bands | symplectic torus basis | q(x)=V(x,x) mod 2 = full twists mod 2; q(a+b)=q(a)+q(b)+1 | pass |
| §1.5 boundary | [0]; [2]; [1] | ker, coker: ℤ,ℤ; 0,ℤ/2; 0,0 | pass |
| §1.6 realization | framings 1,2, linking 1 | `[[1,1],[1,2]]`, det 2−1=1 | pass |
| §1.6 slide | diag(0,1), P=`[[1,0],[1,1]]` | PᵀQP=`[[1,1],[1,1]]`, det 0=0; sliding the other way: (x₂+x₁)²=1, pairing 0, diag(0,1) | pass |
| §1.6 E₈ pin | `e8Plumbing` | weight −2, chain 0…6, edge (2,7) (`E8.lean:63`); `intersectionMatrix = diagonal weight + adjMatrix` (`IntersectionForm.lean:108`) = negative Cartan; det 1, σ=−8; positive copy σ=8 | pass |
| §2.1 punctured | S⁴; CP²; S²×S² | r=0 cone of S³→pt; r=1 Hopf attaching; r=2 top cell by `[ι₁,ι₂]` | pass |
| §2.2 π₃ rank | r=0,1,2 | 0,1,3 = r+r(r−1)/2 | pass |
| §2.2 coordinates | Q=`[[1,1],[1,2]]` | C=Q⁻¹=`[[2,−1],[−1,1]]`, QC=I; 2η₁+η₂−[ι₁,ι₂] | pass |
| §2.3 colours | none; +1 unknot; Hopf | π₃=0; Hopf coordinate 1 (0 for framing 0); off-diagonal 1 | pass |
| §2.4 isotropic splitting | H; diag(1,−1); diag(1,−2) | (1,0)²=0; (1,1)²=0; x²=2y² has no nonzero integral solution | pass |
| §2.4 odd normalization | w²=2m+1 | (w+kv)²=w²+2k reaches 1; (w−v)²=1−2=−1, (w−v)·w=0: diag(−1,1) | pass |
| §2.4 classification | GS 1.2.25 | `gompfstipsicz` line 728, p. 14: homotopy equivalent iff forms isomorphic; proof sketch at 730–734 is the mapping-cone argument | pass |
| §3.2 λ(f,f) | one ± double point, e=0 | µ=±1, sym=±2, λ=±2; `powellrayteichner` line 290: λ(f,f)=µ+µ̄+e·1 | pass |
| §3.2 involution | π=ℤ | t+t⁻¹ invariant under t↦t⁻¹ | pass |
| §3.2 good group | Def 3.2 | height-1.5 capped grope, labels to 1 (`powellrayteichner` line 481); closure p. 3 (lines 112–116) | pass |
| §3.2 growth | C₂; S₃; ℤ | balls ≤2, ≤6; 2n+1; `krushkalquinn` line 60: height ≥2, subexponential π | pass |
| §3.2 disk theorem | Theorem A | λ(gᵢ,gⱼ)=0=µ̃(gᵢ), locally flat embedding, framed geometric duals, same boundary framing (`powellrayteichner` lines 87–96) | pass |
| §3.2 C₂ Check | (RP³×I)#(S²×S²) | λ(f,g)=1, λ(g,g)=0, µ(g)=0 | pass |
| §3.2 FQ 2.9.1 | locator | `freedmanquinn` line 1496, PDF page 50 = printed 36; poly-(finite or cyclic), height ≥3 | pass |
| §3.3 Checks | 1/4 against 1/2, 1/8, strict 1/4 | pass, fail, fail; S¹→point: winding 1, no extension | pass |
| §3.4 Theorems 7.5–7.6 | locators | lines 3854 (p. 113), 3906 (p. 114) | pass |
| §3.4 coefficients | groups 1, ℤ | Wh, K̃₀, K₋ᵢ all 0; L₅(ℤ)=0, L₅(ℤ[ℤ])=ℤ | pass; owner of K₋ᵢ is R02 |
| §3.5 FQ 8.2 | locator | line 4064, p. 119: “Hauptvermutung or annulus conjecture”, dim K ≤ 1 isotopy rel boundary | pass |
| §3.5 ball theorem | Brown Thms 4, 5 | `brown1960` lines 84, 101, p. 76: complementary closures of a bicollared sphere are cells | pass |
| §3.5 opened cobordism | W=(V×[0,1))∪(B×{1}) | H_c⁴(W)=ℤ; FTW Cor 4.9 needs simply connected at infinity (`farrelltaylorwagoner` lines 752–756, p. 21) | pass |
| §3.5 9.6, 9.12 | locators | 4983 (p. 144); 5879–5887 (p. 168): excluded cases are the four the gap lists | pass |
| §3.6 G/TOP | π₁…π₅ | 0, ℤ/2, 0, ℤ, 0; fourth stage K(ℤ/2,2)×K(ℤ,4); PL coefficient ×2 | pass |
| §3.6 KS difference | *CP²→CP² (a=h̄,b=0); E₈→S⁴ (0,1) | a²=1 gives 1; ρ₂b=1 gives 1; identity (0,0) gives 0 | pass |
| §3.6 pinch | CP²; S²×S² | ⟨w₂,α⟩=1 gives coefficient 0; 0 gives PD(α) | pass |
| §3.6 surgery sequence | FQ 11.5 | line 7469, p. 213: exact provided π₁ good for n=4 | pass |
| §3.6 slice theorem | FQ 11.11 | lines 7884–7922, p. 224: ℤ-slice iff perfect kernel; 2-handle on the meridian gives a contractible manifold with boundary N; Crowell at 7925–7930, p. 225 | pass |
| §3.6 slice pin | `FreedmanSliceTheorem` | ∀ K : SmoothCircleEmbedding (𝓡 3) (sphere 0 1 in ℝ⁴), HasPerfectCommutatorSubgroup K → IsTopologicallySlice K (`Freedman.lean:64`); perfectness at every basepoint (`KnotGroup.lean:102`); slice disc locally flat in the closed unit ball (`Slice/Basic.lean:277`) | pass |
| §3.6 annulus pin | `AnnulusConjecture 3` | f,g : sphere in ℝ⁴, `IsLocallyFlat (EuclideanSpace ℝ (Fin 3)) ℝ`, range g ⊆ filledHull (range f) \ range f, `CoboundAnnulus f g` = embedding of S³×I with ends f, g (`Annulus.lean:91`, 105) | pass |
| §3.6 annulus route | FQ §7.8 | lines 4041–4043, p. 118: five-dimensional special case of 7.5 suffices | pass |
| §3.6 knot filling | unknot; trefoil | Arf 0, filling exists; Arf 1, obstructed; Ω₃^Spin(S¹)=ℤ/2 is not in TangentialBordism | R01 |
| §3.6 L₄(ℤ[ℤ]) action | insert once, twice | Δσ=8, 16 | pass |
| §3.7 realization | 0, H, E₈, 2E₈, [1] | KS 0,0,1,0; odd admits both; FQ 10.10 at line 6416, p. 184: existence needs k≡σ/8 only for even λ | pass |
| §3.7 odd branch | knot a characteristic component | linking matrix unchanged; Arf(C) changes by Arf(K)=1; even forms have empty characteristic sublink | pass |
| §3.8 normal invariant | b=0 | ⟨a²,[M]⟩=0; Wu: a²=w₂·a so ⟨w₂,PD a⟩=0 | pass |
| §3.9 E₈ caps | E₈; 2E₈ | σ=8, KS=1; σ=16, KS=0; Σ#Σ boundary | pass |
| §4.1 Spinᶜ | CP²; S²×S²; Enriques | det c₁=3h→5h; 0→2a; t with 2t=0, w₂≠0, β(w₂)=0 | pass |
| §4.2 formula | CP² line; E₈; 2E₈ | (1−1)/8+0=0; 8/8=1; 16/8≡0; `bastletal` line 429: ks=Arf+(λ(c,c)−σ)/8; `freedmankirby` line 116 | pass |
| §4.2 even implies Spin | H₁ without 2-torsion | Ext(H₁,ℤ/2)=0 so H²(ℤ/2)→Hom(H₂,ℤ/2) injective | pass |
| §4.3 Pontryagin square | CP²; S²×S² | P(h̄)=1; P(a+b)=0+0+j(1)=2; j(1)²=0≠2 | pass |
| §4.3 Dold–Whitney | rank 3; rank 4 | ρ₄p₁=P(w₂); ρ₄(p₁+2e)=P(w₂); action −4a; −2(a+b), b−a | pass |
| §4.3 half-spin | S⁴ | p₁=−2(−u+u)=0; e=u−(−u)=2u | pass |
| §4.3 RP²×RP² | H⁴, H³ | Künneth: H⁴=ℤ/2⊗ℤ/2=ℤ/2 by ab, Tor terms 0; H³=Tor(ℤ/2,ℤ/2)=ℤ/2 with ρ₂ injective so e=0; c₂(E⊗L)=c₂+c₁(L)², (a+b)²=0; p₁=−4ab=0 | pass |
| §4.3 stable triviality | BSpin on ≤7-complex | λ=−2c₂=0, `spinLambdaMap_isEightConnected` (StringOrientation S1.2, line 268) | pass |
| §5 energy identity | SU(2), −tr | tr(F∧F)=(|F⁻|²−|F⁺|²)vol; 8π²k=‖F⁻‖²−‖F⁺‖²; E=8π²k+2‖F⁺‖²; c₂=tr(F∧F)/8π² when tr F=0 | pass |
| §5 first variation | A+ta | F=F_A+t d_Aa+t²a∧a; dE=2⟨F_A,d_Aa⟩; stationary iff d_A*F_A=0; ASD: d_A*F=−d_AF=0 | pass |
| §5 second variation | ASD A | 2‖F⁺_{A+ta}‖²=2t²‖d_A⁺a‖²+O(t³); kernel on the Coulomb slice is H_A¹ | pass |
| §5 conformal scaling | g↦λ²g, dim n | |F|² scales λ⁻⁴, vol λⁿ; E scales λ^(n−4) | pass; n=4 special |
| §5 S²×S² trivial flat | product metric | *ω₁=ω₂, b₂⁺=1; H⁰=3, H¹=0, H²₊=3; index −6=8·0−3(1−0+1) | pass |
| §5.1 index | S⁴; S²×S² | −3=0−3−0; −6=0−3−3; full H²=6 would give −9 | pass |
| §5.1 Q₈ | Σ₂×Σ₂, a=i, b=j | [i,j]=−1, product of two commutators 1; irreducible; adjoint = three sign characters, each H*(Σ₂;χ)=(0,2,0); Künneth (0,6,24,6,0); b₁=8, b₂⁺=9; 6−0−12=−6=−3·2 | pass |
| §5.1 Kuranishi | x=0 | κ(0)=0, Dκ(0)=0; `feehanleness` line 666, p. 16 | pass |
| §5.2 budget | N=5, s=3 | q=6, ℓ≥10; pinned threshold (dim ker)²+1 (`SardSmale.lean:468`) | pass; naming R04 |
| §5.3 gluing | FL Thm 3 | base any closed oriented 4-manifold, H²=H⁰=0, conformally flat ball (`feehanleness` lines 275–284, p. 7) | pass |
| §5.3 reducible | c²=−1 | k=1; index 5=−1+2·3; H⁰=1, H²=0, kernel ℂ³, link ℂ³/S¹(weight 2)=cone on CP² | pass |
| §5.3 Donaldson | Q=−I_r | r pairs ±e_i, σ+r=0 | pass |
| §6 real blowup | fibres | over 0: RP¹; over (1,0): point; Möbius transition −1 | pass |
| §6.1 blowup | CP²; nine times | χ=4, σ=0; χ=12, σ=−8; (3H−ΣE)²=9−9=0 | pass; locator uncertified |
| §6.1 discriminant | x²+y²; x²; 0 | no common projective zero; vanishes at [0:1]; zero equation excluded | pass |
| §6.2 node | e=−2, one positive double point | −2+2=0; negative −4; monodromy a↦a, b↦b+a | pass; GS §8.2 uncertified |
| §6.3 matrices | A,B,S | SA=`[[0,−1],[1,1]]`, SAS⁻¹=`[[1,0],[−1,1]]`=B; AB=`[[0,1],[−1,1]]`; (AB)²=`[[−1,1],[−1,0]]`; (AB)³=−I; (AB)⁶=I; ABA=S⁻¹ | pass |
| §6.3 abelianization | ℤ/4 *_{ℤ/2} ℤ/6 | ⟨s,u | 4s, 6u, 2s−3u⟩ ≅ ℤ/12 (s↦3, u↦2); A generates; 12 nodal fibres for E(1), 24 for E(2) | pass |
| §7.1 indices | K3; reversed | −(−16)/8=2, −(−16)/16=1; −2, −1 | pass |
| §7.1 ρ(T³) | E(1) complement | σ=−8≡8 mod 16; `kirbymelvin` lines 463–467, p. 99 (footnote 3) | pass |
| §7.2 E(n) | n=1,2,3 | (12,−8,10), (24,−16,22), (36,−24,34); even n: rank 8n+2(2n−1)=12n−2; odd: I_(2n−1,10n−1); w₂=nF mod 2 | pass |
| §7.2 seed | z₀=0; all nonzero | forces all zero; product gives 81=1 | pass |
| §7.2 seed Checks | e₀; e₂; (1,1,1,1) | dz₂; dz₁; value 4, derivative 4Σdzᵢ | pass |
| §7.2 section | L₁ | (H−L₀)·L₁=1−0=1 | pass |
| §7.3 Jacobian | ≤2 nonzero coordinates | (tₐ−t_b)z_b²=0 forces 0; ≥3 nonzero gives Vandermonde rank 3 | pass |
| §7.3 Check vector | (i,√3,i√3,1,0,0) | squares (−1,3,−3,1,0,0); −1+3−3+1=0, −1+6−9+4=0, −1+12−27+16=0; minor 8·(i·√3·i√3)·2=−48 | pass |
| §7.3 fixed planes | t=(1,2,3), (4,5,6) | Vandermonde 2, 2; squares all 0 | pass |
| §8.1 nonrecognition | Tancer | Theorems 1–2 at `tancer` lines 73–76, Proposition 5 at 131–135, p. 3 | pass |
| §8.1 presentation | GS 1.2.33 | `gompfstipsicz` line 838, p. 17 | pass |
| §8.2 bound | Q=Q′=[1]; rank 0 | v²≤1, solutions ±1; empty matrix; λ_min⁻¹≤tr(Q⁻¹) | pass; `bastletal` line 598, p. 12 |
| §8.2 KS | ±1 unknot | (1−1)/8+0=0; (−1+1)/8+0=0 | pass |
| §8.3 headline | standard ℝ⁴ | `Diffeomorph.refl` refutes IsEmpty; empty type not homeomorphic | pass |
| §8.3 contradiction | K3 minus 3H | 2(−E₈): rank 16, σ=−16, even; −I₁₆ odd | pass |
| gap:relative-pl-five | Γ_i | Γ₁…Γ₆=0, Γ₇=ℤ/28: existence ≤7, uniqueness ≤6 | pass |
| gap:laurent | Shaneson | L₄(ℤ[ℤ])=ℤ⊕L₃(ℤ)=ℤ; L₅=0⊕ℤ; K₁(ℤ[t,t⁻¹])=ℤ/2⊕ℤ by ±tⁿ (`bassHellerSwan` line 101, p. 63) | pass |
| gap:cw-type | Milnor | Theorem 1 line 20, Corollary 1 line 37 (`milnor1959`) | pass |
| gap:spherical | Ranicki | `ranicki1992` line 1125 is §1 at printed p. 25 | pass |

That is 94 rows. No instance refuted a stated theorem; the findings are supplier precision, a gap that duplicates an earlier roadmap, an intra-layer cycle and style.

**Pinned declarations opened** (Tau Ceti `a91d3aaf`, Mathlib at the manifest pin): `TauCeti.AnnulusConjecture`, `CoboundAnnulus` (`TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean:105`, 91), `TauCeti.filledHull` (`TauCeti/Topology/FilledHull.lean:83`), `TauCeti.brownBicollaring` (`…/LocallyFlat/Brown.lean:39`), `TauCeti.FreedmanSliceTheorem` (`TauCeti/KnotTheory/Slice/Freedman.lean:64`), `IsTopologicallySlice` and `IsTopologicalSliceDisc` (`Slice/Basic.lean:277`, 266), `SmoothCircleEmbedding.HasPerfectCommutatorSubgroup` (`KnotTheory/KnotGroup.lean:102`), `TauCeti.PlumbingGraph`, `intersectionMatrix`, `intersectionForm` (`TauCeti/LowDimTopology/Plumbing/IntersectionForm.lean:89`, 108, 171), `e8Plumbing`, `e8Plumbing_isNegativeDefinite` and `characteristicVectors` (`Plumbing/E8.lean:63`, 199, 214), `TauCeti.IntegralLattice.ofIntegralForm` and `carrierEquiv` (`TauCeti/LinearAlgebra/IntegralLattice/Rationalization.lean:118`, 153), `signature`, `sigPos`, `sigNeg` (`…/IntegralLattice/Signature.lean:81`, 72, 78), `TopCat.singularCup` (`TauCeti/AlgebraicTopology/Cohomology/Cup.lean:203`), `TauCeti.parameterProj` and `isMeagre_image_criticalPoints_of_isFredholm` (as in R04); Mathlib `Projectivization.map`, `submodule`, `ChartedSpace`, `IsManifold`, `Diffeomorph` as elaborated in the probe.

**Cross-roadmap citations resolved** (main unless stated): GeometricTopology Layers 1, 2, 4, 5 and the comparison item 3 (`README.md:177`, 289, 409, 519, 947; the gaps in Layer 4 and Layer 1 are R01); AlgebraicTopology 8.5 names (1703–1753), 8.11a (1949), Stages 2–4, 6, 8; HeegaardFloer F0 (161–169; R04); IntegralLattices Layers 0, 1, 6 (507, 590, 1641); ComplexKahlerGeometry K5, K7 (568, 1405); TopologicalKTheory T1, T6 (163, 962); GeneralizedCohomology G4, G5 (936, 1373); SpinGeometry G4–G6 (395, 504, 569); CharacteristicClasses C1–C3 (211, 550, 720); AffineMorseLefschetz A0, A4, A5, A6 (67, 208, 494, 535); GroebnerGeometry G1 (63); SeibergWittenTheory SW1 consumes F4 (5, 15); TangentialBordism head: 1.1 (B3.2(a)) `finiteQuadraticArf` and the Lagrangian criterion (171–198), 2.7 (B1.7) Fermat quartic, E(1), incidence blowup charts, node `uv=t` (536–575), 4.1 (B4.1) integral higher diagonals, Pontryagin square assigned to FourManifolds (743–760), 4.3 (B4.3) Wu classes (848), 5.2 (B5.2) finite embedded comparison (1031), 7.2 (B3.4) KO comparison (1776), 8.1–8.3 (B3.2(b), (c), B3.3) (1842–1913); the README's “B1.7”, “B3.2(a)”, “B5.2” labels are the parenthesised labels of those headings; HomotopySpheres head: 3C items 1–2 (477–483), 4B (648), 6B (1083–1096: signed E₈ plumbing for every k ≥ 1, negative E₈ matrix, determinant 1, signature −8), 6C (1115), 7A–7C (1141–1218: normal maps, L_n(ℤ) by parity split, P_n=0 for odd n ≥ 5, σ/8 in dimension 4k), Stage 9 (1246); SmoothBundlesConnections head: B1.5 Ehresmann (498), B2.1, B2.5, B3–B5 (559, 802, 869–1298), and its own statement at 64–70 that it stops before the Yang–Mills energy and leaves the calculus to a Part II that does not exist, which makes Layer 5's ownership of the four-dimensional calculus correct; PseudodifferentialOperators head P5–P7 (854, 1258, 1372); IndexTheory head I4 (432), I7 (723, 866–876); StringOrientation head S1 with the three intended names (224, 226, 268) and its consumer line for FourManifolds (1060); GeneralAlgebraicKTheory head Layer 10 (R02).

**Ownership against open work.** `roadmaps grep` over the open heads and main: `AnnulusConjecture` and `FreedmanSliceTheorem` are declared only here and in GeometricTopology's open revision (#903, a revision of an existing roadmap, hence not a supplier), whose README at its 836–839 and 1856–1861 assigns the four-dimensional annulus case and the proof of the slice theorem to FourManifolds; on main GeometricTopology's `Suggested.lean` has only commented pseudo-code and its README states both theorems as targets (329–353, 595–600) with Quinn and Freedman named as the four-dimensional input. This roadmap is the owner of both proofs; the arrangement is the one the previous review asked for and is recorded here. Uhlenbeck compactness, BPST and the ASD moduli space: InstantonFloerTheory (#1083) consumes them from F5 (its lines 19, 49, 73); SeibergWittenTheory on main names F5 as the SU(2) owner. Bing shrinking, Casson towers, Edwards–Kirby approximation: no other roadmap. The Yang–Mills first variation also appears in LocalVariationalFieldTheory (#916, 862–866) as a local Euler–Lagrange and Noether-identity computation on a fixed bundle; that roadmap is not earlier in the order and its object is the local Lagrangian, not the closed-manifold energy with its Hessian and conformal invariance, so no second owner is recorded. No second `Suggested.lean` declares any of the twelve fully qualified names. The board's packages index lists no package for a competing four-manifold roadmap.

**Sources read at their locators:** `freedmanquinn` (2013 reformat; printed page = PDF page − 14) 2.9.1, 5.2.1, §5.7, 7.5, 7.6, §7.8, 8.2, 9.6, §9.12, 10.10, 11.5, §11.4, 11.11, §11.9; `powellrayteichner` (arXiv 2006.05209v3) Theorem A, p. 3, (1.1), Definition 3.2; `krushkalquinn` (math/0001063v3) p. 408; `feehanleness` (1910.14580v1) Theorem 3, §3.1; `bastletal` (2411.08775v2) Theorem 5.3, Lemma 6.5; `freedmankirby`; `tancer` (2310.07421v2) Theorems 1–2, Proposition 5; `gompfstipsicz` (AMS preview, 42 pages) Theorems 1.2.25 and 1.2.33; `kirbymelvin` (Turkish J. Math. 23) footnote 3, p. 99; `milnor1959` Theorem 1, Corollary 1; `brown1960` Theorems 4–5; `bassHellerSwan` Theorem 2; `farrelltaylorwagoner` Corollary 4.9; `ranicki1992` §1; `gabaietal` (2311.11196v2) as in the previous review.

## Not verifiable

- **Gompf–Stipsicz §5.1 (pp. 139–153), §2.2 (pp. 41–47), §8.2 (pp. 292–303), §3.1 (pp. 67–77):** the only legal text is the AMS preview, which ends at printed p. 36; the Kirby moves, blowup laws, node model and cubic pencil (seeded 1.6, 6.2) are checked by instance only and are cited by locator.
- **Kirby–Siebenmann, *Foundational Essays* (Essays I, III, IV, V) and *Normal bundles for codimension 2*; Marin; Kister; Shaneson; Madsen–Milgram; Hirsch–Mazur; Cerf; Bass 1968; Quinn 1979, 1982, 1988; Browder; Lees; Lashof; Lickorish; Robertello; Rabin; Serre; Hanner:** the cached Kirby–Siebenmann scan is image-only without a text layer and the others are not in the cache; the gap statements and §1.4's Arf locators are checked against the standard statements only.
- **Freedman 1982 (Corollary 1.2, §10), Donaldson 1983, Gompf 1983 (Theorem 1.2):** Project Euclid landing pages only; cited by locator.
- The global shrinking, controlled-product, obstruction-gluing and continuation arguments are not proved by the instance table; the table checks their stated values and hypotheses.
- No `design/plan.json` is readable for this pull request, so the ten gap slugs could not be cross-checked against a plan.

## Source issues

- **Misprint** in tancer at Proposition 5(iii), printed p. 3: the source calls H₂ of the boundary a free product of copies of ℤ; it should say free abelian group of rank 2k; affects a stated result.
- **Misprint** in bastletal at the proof of Lemma 6.5, printed p. 12: the source refers to the result as Proposition 6.5; it should say Lemma 6.5; affects nothing.
- **Gap** in freedmanquinn at Theorem 8.17, printed p. 134: the source attributes the i = 5 vanishing to a reference whose replacement criterion is not justified; it should cite the stable pseudo-isotopy route of Gabai–Gay–Hartman–Krushkal–Powell, Theorem 1.3; affects the proof; corrected in print at arXiv 2311.11196, Theorem 1.3.
