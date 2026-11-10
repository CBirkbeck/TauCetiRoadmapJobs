# Review of SmoothBundlesConnections (pull request #2127 at a336dc2)

**Verdict:** needs changes

This is a full review of the roadmap folder at `a336dc27073253c114b02267f6bb1d75508c4dea`. The pins are unchanged since the previous review: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. The pull request changes only `TauCetiRoadmap/SmoothBundlesConnections/README.md` and `Suggested.lean`.

## Previous findings

| Previous | Passage at this head | Status |
|---|---|---|
| R01 (pinned principal-bundle library restated) | README 225: the Tau Ceti row now lists `TauCeti.PrincipalBundle` … `TauCeti.diffeomorphOfCohomologous`. README 359–387 consumes them. The presentation paragraph (396–405) writes `TauCeti.ManifoldTotalSpace G P_•` and `TauCeti.ManifoldTotalSpace.homeomorph`. B1.2 (483–488) and B1.3 (522–530) consume trivial bundles, pullbacks and gluing. The DifferentialGeometry row (226) moves its forms and metrics to Tau Ceti. | Repaired |
| R02 (carriers called missing; Ehresmann absent) | `Suggested.lean` 149–181 states `exists_contMDiffFiberBundle_of_isProperMap`, and 114–147 states `exists_principalBundle_orbitFiber`. The docstring at 41–65 now gives, for each headline that is not statable, the carrier it lacks: holonomy, the comparison map and `c₁`. | Repaired |
| R03 (derived `Sheaf.H` had no route) | README 1602–1619 adds the soft-sheaf vanishing, with Demailly (4.9)–(4.15) and the dimension shift through `TauCeti.Topology.isFlasque_of_injective`. The move from ComplexKahlerGeometry 2.5 is not recorded in the README (see R03 below). | Partly repaired |
| R04 (frames ignore the pinned orthonormal frame bundle; no ℂ-linear Hom) | README 996–1010 consumes `TauCeti.OrthonormalFrameBundle` and adds the isometric-frames comparison. The Check is at 1041–1044. B2.1 (734–740) adds the ℂ-linear Hom bundle, with a Check at 774–777. | Repaired |
| R05 (regular-fibre theorem pinned) | The theorem is gone from `Suggested.lean`; docstring 38–39 points to `TauCeti.exists_regularFiber_smoothEmbedding`. B1.0 (253–268) consumes the regular fibre and its atlas. | Repaired |
| R06 (`letI` in signatures) | `Suggested.lean` 93: `∃ _ : ChartedSpace …`. Gate `statement-hygiene=0`. | Repaired |
| R07 (left/right conversion in B1.4) | README 578–580: “for the right action `x·g = g⁻¹ • x` of B1.2's conversion”. G/H is at 600–603, B1.2 is in *Needs:* at 640, and the S₃ Check is at 511–514. The Hopf case of the same conversion is not settled (R02 below). | Repaired |
| R08 (converse route incomplete) | README 412–430 gives three steps (integral curves, a Baire argument, block-triangular derivative). The API bullet (439) says “smooth free right action”, and the Checks are at 461–469. The Baire argument replaces Sard and is correct (rows 3–5). | Repaired |
| R09 (broken links; HopfRinow status) | README 62 links `../../Completed/HopfRinow/README.md`. Line 746 uses the anchor `#51-pointwise-algebra-densities-bundle-tests-and-distributions-k5a`, which resolves at ComplexKahlerGeometry README 1440 on main. Row 229 reads “HopfRinow (completed) … as implemented in Tau Ceti”. | Repaired |

## R01 (P2) — ℂP¹ and its affine charts are planned on a hand-built quotient, although Tau Ceti pins the same orbit space with the same charts; README and `Suggested.lean` contradict each other

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md`:
- 185–189: “with the smooth structure of B1.4's free proper quotient theorem; … No projective-space carrier, chart or complex structure is used”;
- 706–710, B1's Examples: “prove that they are diffeomorphisms of `ℂ` onto the open sets `z₁ ≠ 0` and `z₂ ≠ 0` … with transition `z ↦ 1/z`”;
- 2116: “no projective-space carrier is consumed anywhere”.

`Suggested.lean` 63–64 says the opposite: “The circle quotient of `S³` itself has a pinned carrier, `TauCeti.ComplexProjectiveSpace 1`”.

**Claim.** The README plans charts for its ℂP¹, S³ modulo the circle action, without citing the pinned carrier of that same orbit space or its charts. The planned charts are the parametrizations `z ↦ [1:z]` through `(1,z)/√(1+|z|²)`, the inverse ratios `z₂/z₁`, and the transition `z ↦ 1/z`. The Lean docstring names that pinned carrier, but the README never mentions it and states twice that no such carrier is used. The Scope's “projective carrier” (68, 72) is Mathlib's `Projectivization` of ComplexKahlerGeometry K7.1. That reason does not cover Tau Ceti's sphere quotient, which needs no identification with `Projectivization`.

**Witness.** `TauCeti.ComplexProjectiveSpace` is defined at `TauCeti/Topology/ComplexProjectiveSpace/Basic.lean:58`. In scratch, `ComplexProjectiveSpace 1 = MulAction.orbitRel.Quotient (sphere (0:ℂ) 1) (sphere (0 : EuclideanSpace ℂ (Fin 2)) 1) := rfl` elaborates. The file also has `affineParam` (`Charts.lean:120`, which normalizes `insertNth k 1 z`), `affineChart` (`:166`) and `affineChart_transition` (`:216`). `IsManifold 𝓘(ℂ, Fin 1 → ℂ) ∞` is found by `inferInstance`.

**Repair.**
- Add to the Tau Ceti row, from `Topology/ComplexProjectiveSpace/Basic.lean`, `Charts.lean` and `Geometry/Manifold/Instances/ComplexProjectiveSpace.lean`: `TauCeti.ComplexProjectiveSpace`, `TauCeti.ComplexProjectiveSpace.mk`, `TauCeti.ComplexProjectiveSpace.ratio`, `TauCeti.ComplexProjectiveSpace.affineParam`, `TauCeti.ComplexProjectiveSpace.affineChart`, `TauCeti.ComplexProjectiveSpace.affineChart_transition`, `TauCeti.ComplexProjectiveSpace.contDiffOn_affineChart_transition`, and the instances `instChartedSpace` and `instIsManifold`.
- In the Conventions, identify `S³/Circle` with `TauCeti.ComplexProjectiveSpace 1`. The identification is the identity on orbits, through `Circle ≃ sphere (0:ℂ) 1`.
- Replace the chart construction in B1's Examples with one B1.4 target. The target: the real smooth structure underlying Tau Ceti's homogeneous-ratio atlas is the structure of B1.4's quotient theorem. The atlas's transitions are holomorphic, so they are real smooth. The proof uses the uniqueness clause of Meinrenken, Theorem 1.21, p. 10. `affineChart 0 ∘ mk` is `(z₁,z₂) ↦ z₂/z₁`, a submersion on `S³ ∩ {z₁ ≠ 0}`, because it has the section `affineParam 0` lifted to `(1,z)/√(1+|z|²)`.
- B1's parametrizations then become `affineParam 0` and `affineParam 1`, with their transition taken from `affineChart_transition`.
- In 185–189 and 2116, delete “No projective-space carrier, chart or complex structure is used” and “no projective-space carrier is consumed anywhere”. Alternatively, restrict both sentences to `Projectivization`.

Tested on the instance n = 1, k = 0, l = 1: `affineChart_transition` gives `insertNth 0 1 z 0 / insertNth 0 1 z 1 = 1/z`, which is the README's transition.

## R02 (P3) — The Hopf bundle, as an instance of the converted orbit bundle, gets the inverse action unless the left action is specified

**Location.** README 578–580: “for the right action `x·g = g⁻¹ • x` of B1.2's conversion, since the headline's action is a left `MulAction G M`”. README 633: “The Hopf action of `Circle` on `S³` is free and proper”. `Suggested.lean` 25: “`G → G/H` … and the Hopf bundle are instances”.

**Claim.** The Conventions fix the Hopf right action as `(z₁,z₂)·λ = (z₁λ, z₂λ)` (README 185). Feed Mathlib's scalar action `λ • z = λz` to `exists_principalBundle_orbitFiber`: `orbitFiber.rightAction` converts it to `z·λ = λ̄z`, the inverse action. The fundamental field of `1 ∈ ℝ` for that action is `−iz`, and the Hopf form takes the value −1 on it. So the B3.1 Check `ω(X_1) = 1` fails, and the B6.2 normalization comes out as −1. For G/H the README specifies the left action (600–603); for the Hopf bundle no text and no Check does.

**Witness.** In scratch, `((op l • x : orbitFiber Circle ℂ q) : ℂ) = conj l * x` elaborates, by `Circle.coe_inv_eq_conj`. Then `Im(z̄·(−iz)) = −|z|² = −1`, whereas the B3.1 Check (1111) gives `+1`.

**Repair.**
- In B1.4, after 633, add: “The Hopf bundle is the instance for the left action `λ • z = λ⁻¹z` of `Circle` on `S³`, whose conversion is the Conventions' action `(z₁λ, z₂λ)`.”
- At `Suggested.lean` 25, add “(for the left action `λ • z = λ⁻¹ • z`)”.
- Add a B1.4 Check: “Mathlib's scalar action `λ • z = λz` converts to `z·λ = λ̄z`. Its fundamental field of `1 ∈ ℝ` at `(1,0)` is `−∂_(y₁)`, on which `Im(z̄₁dz₁+z̄₂dz₂)` is `−1`. With that action the Hopf form fails reproduction, and `⟨c₁,[ℂP¹]⟩` would be −1.”

Tested: with `λ • z = λ⁻¹z`, the conversion gives `z·λ = (λ⁻¹)⁻¹z = λz`, its fundamental field is `iz`, and `ω(iz) = 1`.

## R03 (P3) — The README does not record that ComplexKahlerGeometry 2.5 consumes B6.1's soft-sheaf vanishing, and does not state the module form that 2.5 needs

Re: previous R03, partly repaired.

**Location.** README 43–45 (Scope): “the vanishing of Mathlib's `Sheaf.H` in positive degrees for soft sheaves on paracompact Hausdorff spaces”. README 2183–2184 (Downstream consumers) lists only ComplexKahlerGeometry K5 and K7.2.

**Claim.** On main, ComplexKahlerGeometry 2.5 plans “fine-implies-acyclic on the paracompact Hausdorff manifolds here” using Ext-based cohomology. TopologicalSheafCohomology's scope also assigns fine-sheaf acyclicity to ComplexKahlerGeometry K2. B6.1 now owns the general soft theorem. Since ComplexKahlerGeometry consumes this roadmap (its README 758 and 773), B6.1 is the right owner.

Two pieces are missing for that to hold. The README names no consumer of the theorem. And B6.1 does not state the module form that 2.5's smooth type forms need: a sheaf of modules over the sheaf of rings of smooth functions is soft.

**Witness.** ComplexKahlerGeometry README 744–748 on main. Demailly, Chapter IV, Lemma (4.18) and Corollary (4.19), p. 205 (`demailly-agbook` lines 10266–10272).

**Repair.**
- In B6.1, after the softness of smooth functions, add: “Every sheaf of modules over the sheaf of rings of smooth real functions, in particular every sheaf of smooth forms of a given type, is soft, hence has no higher `Sheaf.H` (Demailly, Chapter IV, Lemma (4.18) and Corollary (4.19), p. 205).”
- In Downstream consumers, add: “ComplexKahlerGeometry 2.5 consumes B6.1's vanishing of `Sheaf.H` for soft sheaves and its module form for its sheaves of smooth type forms.”

Tested on Ω¹ on `S¹`: it is a module over the smooth functions, hence soft by (4.18), so `H¹ = 0`. This is the vanishing 2.5 plans.

## R04 (P3) — One cited Mathlib name does not exist at the pin, and one Lean section title differs from its README layer

**Location.** README 1749: “`HomologicalComplex.Homotopy.homologyMap_eq` with the homology instances”. `Suggested.lean` 183: `/-! ## Layer 6: Smooth good covers and Čech coordinates -/`, against README 1520: “## Layer 6: Circle bundles, integral classes, and flat ambiguity”.

**Claim.** The cited declaration is `Homotopy.homologyMap_eq`; it is not in the `HomologicalComplex` namespace. The house form uses the README's layer titles for the section comments.

**Witness.** `#check @HomologicalComplex.Homotopy.homologyMap_eq` reports “Unknown constant”. `#check @Homotopy.homologyMap_eq` elaborates; it is declared at `Mathlib/Algebra/Homology/Homotopy.lean:941`, after `end CategoryTheory`, outside any namespace.

**Repair.** Write `Homotopy.homologyMap_eq` at README 1749. Title the section comment `/-! ## Layer 6: Circle bundles, integral classes, and flat ambiguity -/`.

## Verified sound

**Gate, dependency check, build.** My rerun of the gate printed every counter at 0 and `OK`; the worker's run adds `build=0`. The dependency check, run as the brief gives it, printed one line:

```text
depcheck: 229 roadmaps, 2124 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SmoothBundlesConnections'` is empty. `lake env lean` on `Suggested.lean` exits 0 with exactly seven `declaration uses 'sorry'` warnings, at lines 80, 122, 155, 217, 224, 267 and 281. The suppliers are DifferentialGeometry, LieGroups, AlgebraicTopology, and the completed HopfRinow and UniversalCovers, all on main. That is all a revision of a roadmap on main may consume.

**Signatures.** I elaborated `#check @` for all 13 declarations in one scratch file and compared each with the README:
- both B1.4 theorems keep both models boundaryless, T2 and second countability on M and G, `LieGroup IG ∞`, `ProperSMul`, smoothness and freeness;
- Ehresmann keeps T2 and second countability on P and B, `ConnectedSpace B`, a submersion, properness and surjectivity;
- the good-cover theorems keep T2, `FiniteDimensional` and boundaryless, with either second countability or `CompactSpace`;
- acyclicity keeps `0 < n` and has no boundaryless binder, as README 1622–1623 says.

No binder is lost. `ManifoldTotalSpace.homeomorph` runs from `TotalSpace` to the copy (`Basic.lean:199`), so `.symm x` and then `.2.1` reads the point of M or P. The diffeomorphism clauses are therefore correct. In Ehresmann, `hsurj` follows from properness and connectedness when P is nonempty. This is noted only; it matches Kolář–Michor–Slovák Lemma 9.2's hypotheses.

**Padding probe.** I replaced every `sorry` with `simp`, `rfl` and `infer_instance` in three scratch copies. All 21 attempts fail. No library-match lead proves a headline.

**Headlines.** The README's end theorems are at 12–17.
- Stated: Ehresmann's theorem and the free proper quotient (both the submersion form and the principal-bundle form).
- Named as not statable, each with its missing carrier: the flat-bundle dictionary, Ambrose–Singer, reconstruction (B5), the Čech–de Rham–singular comparison (B6.1), the circle classification with the Hopf normalization, and Chern–Weil (B6.2–B6.6).
- I checked these gaps against the pin: Tau Ceti has no holonomy, parallel-transport, horizontal-lift or thin-path declaration, no bundle Chern class map, and no L² section space.
- Good covers, Čech coordinates and smooth acyclicity are also stated.

**Seeded sample.** Every target was read at its locator.
- **Sheaves and exactness.** All Demailly locators hold, at `demailly-agbook` lines 10196–10209 (p. 204) and 10227–10232 (p. 205):
  - Definition (4.9): soft means global sections map onto sections over every closed set;
  - Example (4.10): flabby implies soft on paracompact spaces;
  - Example (4.12): smooth functions are soft on a paracompact manifold;
  - Proposition (4.14): surjectivity with a soft kernel, and quotients of soft sheaves are soft;
  - Theorem (4.15): soft implies acyclic.

  The README's neighbourhood form of the definition agrees with Demailly's by Corollary (4.8) (line 10194). Nicolaescu's Example 7.5.31 and Proposition 7.5.32 (`nicolaescu` lines 14776–14780, printed p. 327) are Čech statements, which is the form the README now cites them for. Remark 8.2.2 is at lines 15623–15661, pp. 350–351.
- **Native fixed-cover complex.** `stacks` lines 383–399 (Tag 01ED, pp. 9–10) define cochains on ordered tuples with repetitions, explicitly not alternating, with differential (9.0.1). `meinrenken` lines 1420–1430 (Example 3.16, p. 36) give constant coordinates on a good cover.
- **Augmentation.** `stacks` lines 407–414 (Lemma 9.2, Tag 01EG, p. 10): the degree-zero map is bijective for every cover iff F is a sheaf. Lines 678–680 (Lemma 11.6, Tag 01ET, p. 15) state the acyclic-intersections hypothesis. Both support the README's caution.
- **Raw refinement maps.** `stacks` lines 1066–1077 (Tag 09UY, p. 24) give the insertion formula. The README's `T_s−T_r=δh+hδ` is right and the source's sign is a misprint (row 22, Source issues).
- **Coefficient maps.** `nicolaescu` lines 14747–14763 (Theorem 7.5.28, printed p. 326) give a natural long exact sequence on paracompact spaces, built from Čech cochains.

The README flags no locator as unverified. I also checked other locators:
- Kolář–Michor–Slovák Lemma 10.3 is at `kms` lines 4037–4054 (p. 87), and Lemma 9.2 at lines 3583–3585.
- Meinrenken Theorem 1.21 is at lines 293–295 (p. 10).
- Nicolaescu Theorems 7.5.34 and 7.5.38 are at lines 14809–14853 (pp. 328–329).

**Adversarial table.** All values were computed this round.

| # | Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Presentation theorem, transitions (B1.1) | equivariant ψ_U, ψ_V over U∩V | `ψ_V∘ψ_U⁻¹(x,g)=(x,h(x)g)`, `h(x)=pr₂ψ_V(ψ_U⁻¹(x,1))`; equivariance gives left multiplication, as in `coordChange_eq_mul` | Smooth principal atlas | none |
| 2 | Presentation, degenerate cases | G=1; M=∅; P=M×G | G=1: π is a bijective local diffeomorphism, hence a diffeomorphism; M=∅ forces P=∅; `⟨x,(x,h)⟩↦(x,h)`, `(x,h)·g=(x,hg)` on both sides | True | none |
| 3 | Converse step 1 (injective orbit derivative) | rotation on ℝ×S¹; trivial S¹-action on ℝ | free: `d(o_p)_1(1)=∂_θ≠0`; trivial: `d(o_p)_1=0` and `exp(tA)·p=p` for all t, so freeness is exactly what fails | Freeness used there | none |
| 4 | Converse step 2 (Baire) | discrete ℝ on ℝ² | fibre ℝ is a union of continuum many points, not countably many compact images; dim G=0<1 | Second countability used | none |
| 5 | Converse step 3 (block triangular) | P=M×G, s(x)=(x,1) | `Φ(x,g)=(x,g)`, `dΦ=id`, `dπ∘dΦ=pr₁` | Invertible | none |
| 6 | Converse without submersion (Check) | `x↦x³`, G=1 | free; orbits are points; π bijective; `dπ(0)=0`; `∛` not smooth at 0 | Not principal | none |
| 7 | Conversion Check (B1.2) | S₃, g=(12), h=(23) | gh=(1 2 3), hg=(1 3 2); without inverse `(1 3 2)•p` vs `(1 2 3)•p`; with inverse `(1 3 2)•p` on both sides | Correct | none |
| 8 | `orbitFiber.rightAction` | elaborated by `rfl` | `op g • x = g⁻¹ • x` | Matches README 589 | none |
| 9 | Hopf via the conversion | Mathlib action `λz`; action `λ⁻¹z` | first: `z·λ=λ̄z`, field `−iz`, `ω=−1`; second: `z·λ=λz`, field `iz`, `ω=1` | Direction not pinned | R02 |
| 10 | `exists_freeProperQuotient_isSubmersion` | G=1; ℤ on ℝ; Circle on S³; M=∅ with dim G=1 | dim M−0; 1−0=1; 3−1=2; 0−1=0 by natural subtraction, empty quotient | Consistent | none |
| 11 | `exists_principalBundle_orbitFiber` | ℤ on ℝ | fibre over [0] is ℤ; `0·1=−1`; `φ⟨q,x⟩=x` gives total space ℝ; transitions locally constant | Consistent | none |
| 12 | Ehresmann (`Suggested.lean` 155) | point base, compact P; `ℝ²∖0→ℝ`; base ℝ⊔ℝ | point: fibre P, φ the identity; non-proper: fibre over 0 has 2 components, over 1 has 1; disconnected base: fibres of 1 vs 2 points | Hypotheses needed | none |
| 13 | Incomplete transport (B1.5 Check) | `∂_x+y²∂_y` | `y=y₀/(1−xy₀)`, blows up at `x=1/y₀` | Correct | none |
| 14 | Good covers (217/224) | ℝⁿ with `ρ(t)x`; two-arc S¹; annulus | `ρ(0)x=0`, `ρ(1)x=x`, `ρ(t)0=0`; overlap has 2 components, no contraction; π₁=ℤ | Consistent | none |
| 15 | Čech coordinates iff (267) | (a,b) with empty overlap; (a,a) | `ℝ→0` not injective and intersection empty: both sides false; `U_a` connected nonempty: `ℝ≅ℝ`, both sides true | iff holds both ways | none |
| 16 | Acyclicity (281) | S¹, n=1 and n=0 | `H¹(C∞)=0`; constant ℝ has `H¹=ℝ`; `H⁰(C∞)∋1≠0`, so `0<n` is used | True | none |
| 17 | Soft ⇒ `Sheaf.H=0` (B6.1) | constant ℝ on S¹ with S={±1}; skyscraper | locally constant 0/1 near ±1 extends to no constant, so not soft, consistent with `H¹=ℝ`; skyscraper is flasque, hence soft (4.10), and `H¹=0` | Consistent | none |
| 18 | Dimension-shift route | `0→F→I→Q→0` | `H¹(F)=coker(Γ(I)→Γ(Q))=0` by (4.14) with S=X; `Hⁿ⁺¹(F)≅Hⁿ(Q)`, Q soft by (4.14) | Route closes | none |
| 19 | Sheaves and exactness (sample) | `t↦e^{2πit}`; `z↦z` on S¹ | kernel ℤ on connected opens, 0 on ∅; local logarithm exists, winding 1 rules out a global one | Stalk-exact only | none |
| 20 | Native differential (sample) | c=(2,5); (a,a); 2,5,7 on a triple | `δc(0,1)=3`; `δc(a,a)=0`; `5−7+2=0` | Matches (9.0.1) | none |
| 21 | Augmentation (sample) | 3-arc good cover of S¹, constant ℝ | alternating `C⁰=ℝ³`, `C¹=ℝ³`, `C²=0`, rank δ⁰=2, so `Ȟ¹=ℝ`; global-sections complex has `H¹=0` | Not a quasi-isomorphism | none |
| 22 | Refinement homotopy (sample) | U=(X,X), V=(X), r:0↦0, s:0↦1, α=(2,5) | `hδα=(δα)_(0,1)=3=T_s−T_r`; Stacks' `γ−γ′=T_r−T_s=−3` | README right, source misprint | none |
| 23 | Coefficient maps (sample) | S², q=1 | `H¹((ℝ/ℤ)_const)=0`; `H¹(C∞(ℝ/ℤ))≅H²(S²;ℤ)=ℤ`; the map is `0→ℤ` | Not an isomorphism, as stated | none |
| 24 | `δ_sm(z↦z)=−e` (B6.1 Check) | 3 arcs | crossing differences 0,0,−1 sum to −1; `df=dθ/2π` integrates to 1 and `[δf]=−[df]` | Correct | none |
| 25 | ℂ-linear Hom (B2.1) | trivial complex line over a point | real Hom `M₂(ℝ)`, dim 4; ℂ-linear `[[a,−b],[b,a]]`, dim 2; invertibles `ℂ∖0` (connected) vs `GL₂(ℝ)` (2 components) | Correct | none |
| 26 | Orthonormal frames (B2.5 Check) | `h(u,u)=4u²` | `4a²=1`, so `a=±1/2`, closed in `ℝ∖0`, discrete in both topologies; the standard metric gives ±1 | Correct | none |
| 27 | Hopf cocycle (B1.3 Check) | `s₀`, `s₁` on `z≠0` | `s₀·λ=(λ,zλ)/√(1+|z|²)=s₁` iff `λ=z̄/|z|`; the opposite convention gives `z/|z|` | Correct | none |
| 28 | Hopf normalization (B6.2) | chart z, `F=2du∧dv/(1+r²)²` | `∫=2π∫₀^∞2r(1+r²)⁻²dr=2π`, Chern number +1 | Correct | none |
| 29 | Rank-one Chern–Weil (B6.3) | `c·dvol` on S²; `c dx∧dy` on T² | `4πc∈2πℤ` iff `c∈½ℤ`; `4π²c∈2πℤ` iff `2πc∈ℤ`; c=1/(2π) gives 1, c=1/(4π) gives ½ | Correct | none |
| 30 | Flat dictionary (headline) | `a dx+b dy` on T² | holonomies `exp(−2πia)`, `exp(−2πib)`; `Hom(ℤ²,Circle)=T²` corresponds to (a,b) mod ℤ² | Consistent | none |
| 31 | Ambrose–Singer (headline) | Hopf; a flat connection | Hopf: `F≠0`, `Lie(H⁰)=ℝ`, `H⁰=Circle`; flat: curvature span 0 equals `Lie(H⁰)=0` | Consistent | none |
| 32 | Reconstruction (headline) | constant A | `P=exp(−tA(v))`, `−∂_tP|₀=A(v)`; `d/dt P⁻¹σ=w+Aσ₀`, as for `∇=d+A` | Consistent | none |
| 33 | Čech–singular evaluation (headline) | 3-arc S¹, cocycle 1 on one overlap | crossings 0→1, 1→2, 2→0 give `1+0+0=1`; there-and-back gives `1−1=0` | Consistent | none |
| 34 | Tau Ceti ℂP¹ vs README charts | n=1, k=0, l=1 | `affineChart_transition` gives `1/z`, the README's transition; `affineParam 0 z` is the orbit of `(1,z)/√(1+|z|²)`, the README's parametrization | Same construction | R01 |
| 35 | B6.1 vs ComplexKahlerGeometry 2.5 | Ω¹ on S¹ | module over smooth functions, soft by (4.18), `H¹=0` by B6.1; 2.5 plans the same vanishing | Consumer not recorded | R03 |
| 36 | `homologyMap_eq` name | `#check` | `HomologicalComplex.Homotopy.homologyMap_eq`: unknown; `Homotopy.homologyMap_eq`: elaborates | Wrong name | R04 |

**Library declarations opened at the pins.**

I `#check`ed 147 names from the README in one scratch file; only the R04 name fails. These were also opened:

Mathlib:
- `Homotopy.homologyMap_eq` (`Algebra/Homology/Homotopy.lean:941`);
- `ContMDiff.iff_comp_isImmersion` (`Geometry/Manifold/Immersion.lean:995`; it needs continuity, which an embedding supplies);
- `isMIntegralCurve_eq_of_contMDiff` (`Geometry/Manifold/IntegralCurve/ExistUnique.lean:240`);
- `BaireSpace.of_t2Space_locallyCompactSpace` (`Topology/Baire/LocallyCompactRegular.lean:24`).

Tau Ceti:
- fibre bundles, `Geometry/Manifold/FiberBundle/Basic.lean`: `TauCeti.ContMDiffFiberBundle` (`:122`), `.trivial` (`:177`), `TauCeti.ManifoldTotalSpace` (`:189`), `.homeomorph` (`:199`);
- principal bundles, `Topology/FiberBundle/Principal.lean`: `Bundle.Trivialization.IsEquivariant` (`:92`), `coordChange_eq_mul` (`:136`), `TauCeti.PrincipalBundle` (`:156`), `division` (`:191`), `PrincipalBundle.trivial` (`:239`);
- smooth principal bundles, `Geometry/Manifold/FiberBundle/Principal.lean`: `contMDiffFiberBundle_iff` (`:96`), `mfderiv_totalSpaceMk_smul_injective` (`:344`), `ker_mfderiv_proj_eq_range_mfderiv_totalSpaceMk_smul_one` (`:371`), `finrank_ker_mfderiv_proj` (`:385`);
- `diffeomorphOfEquivariant` (`Principal/Equivariant.lean:93`) and `contMDiff_pullback_iff` (`Pullback.lean:121`);
- cocycle gluing: the convention in `Topology/FiberBundle/GroupCocycle.lean`, lines 15–41 (`g i j = c j i`, `s j = s i • g i j`, cohomologous `h i⁻¹ * g i j * h j`, matching README 528–530), `homeomorphOfCohomologous` (`:198`), `principalBundle_fiberBundleCoreOfGroupCocycle` (`:294`), and in `Geometry/Manifold/FiberBundle/GroupCocycle.lean` `contMDiffFiberBundle_fiberBundleCoreOfGroupCocycle` (`:78`) and `diffeomorphOfCohomologous` (`:152`);
- `TauCeti.fundamentalVectorField` (`Geometry/Lie/FundamentalVectorField.lean:83`) and `isMIntegralCurve_mulInvariantExp_smul_smul` (`:316`);
- `TauCeti.Topology.isFlasque_of_injective` (`Topology/Sheaves/Flasque/Basic.lean:82`) and `subsingleton_H_succ_of_isFlasque` (`:142`);
- `TauCeti.OrthonormalFrameBundle` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`), with the `unitary` right action at `:135`;
- `TauCeti.exists_regularFiber_smoothEmbedding` (its signature matches README 255–260);
- the `TauCeti.ComplexProjectiveSpace` files of R01;
- `TauCeti.LensSpace.fundamentalGroupMulEquiv` (`AlgebraicTopology/UniversalCover/LensSpace/FundamentalGroup.lean:73`).

**Cross-roadmap citations resolved.**
- Every relative link resolves on main: AlgebraicTopology, AlgebraicVectorBundles, ComplexKahlerGeometry and its K5a anchor, DGFloer, DifferentialGeometry, LieGroupoidsPoisson, LieGroups, RiemannianGeometry, HamiltonianReduction, IntegrableSystems, `Completed/HopfRinow` and `Completed/UniversalCovers`.
- DifferentialGeometry on main has 3.5 (line 1324), 4.1–4.3 (1445–1540), 8.3 (2544), 8.4 (2588) with `chainIntegral`, `SmoothSimplex.integral_mextDeriv` and `deRhamHom` as cited targets, 8.5 (2617), 12.1 (2801) and 12.4 (2896). Its 5.5 resolves to 5.5a by its own line 38. So the worker's one unresolved lead, `SmoothSimplex.integral_mextDeriv`, is a valid citation of a DifferentialGeometry target.
- RiemannianGeometry R3.3c is at its line 1878.
- ComplexKahlerGeometry 2.5 is at 741–775 and K5a at 1440.

**Ownership.** I ran `roadmaps grep` over main and the 438 open heads for soft-sheaf vanishing, Ehresmann's theorem and smooth good covers. The other hits (ComplexComparisonPartII, FourManifolds, StringOrientation, AbelianSchemesAndArithmeticModuliPartII, EllAdicHomotopyTypesAndWeights) consume this roadmap's B1.5 or B6.0; none owns them. ComplexComparisonPartII's c-soft resolutions are a different object (proper-support pushforward). The open DeRhamCohomologyAndDuality head does not mention good covers or Čech cohomology.

The soft-sheaf vanishing moves down from ComplexKahlerGeometry 2.5 to B6.1, because ComplexKahlerGeometry consumes this roadmap; R03 asks the README to record this. The overlap report lists no conflicting head, no dropped id and no id defined only by a revision. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap's.

## Not verifiable

- **Kobayashi–Nomizu I** (Ch. I §5; Ch. II §§1–9; Appendix 4). No legal copy is in the manifest or the sources cache, and an earlier round found only a JSTOR review page. These locators are not in the seeded sample. The principal-bundle data they are cited for match Meinrenken (lines 296–300) and Kolář–Michor–Slovák (lines 4017–4054).
- **Lee**, *Introduction to Smooth Manifolds* and *Introduction to Riemannian Manifolds*. Earlier rounds recorded both as paywalled. They are not in the sample, and no finding depends on them.

## Source issues

- **Misprint** in stacks at Tag 09UY, §15, printed p. 24: the source says the first refinement map minus the second equals dh + hd for the displayed insertion homotopy; it should be the second minus the first, as `(2,5)` gives `hd = 3 = γ′ − γ`; affects the proof.
- **Gap** in kms at Lemma 10.3, proof, printed p. 87: the source says the map `(x,a) ↦ s_α(x)·a` obviously has invertible tangent map; it should prove that orbit maps of the free action are immersions and that `dim G` equals the fibre dimension, which needs G second countable; affects the proof.
- **Misprint** in nicolaescu at Theorem 7.5.28, sketch of proof, printed p. 326: the source ends the fixed-cover long exact sequence with `H^{q+1}(U, X)`; it should be `H^{q+1}(U, S_{−1})`; affects nothing.
