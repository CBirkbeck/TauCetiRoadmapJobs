# Review of ContactGeometry (pull request #2684 at dade1f8)
Folder: `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/`
**Verdict:** accepted

**Summary.** Accepted: this head has no finding. All four findings of the previous round are repaired. The Layer 5 front example is now true, and relative Gray stability for distributions is stated in `Suggested.lean`. The Courte–Guillermou locators are exact and now match what the notes contain. The CotangentLagrangian citations resolve on main and at its open revision. Three small corrections remain, none blocking: the README presents CotangentLagrangian as consuming a contact predicate that is in fact Tau Ceti's, the Jacobi-bracket headline cites no source although the cited texts support it, and the frame completion behind the contact line has an owner that §1.1 does not name. There are no format notes, and nothing is left for a human to decide.

## C01 — The README describes CotangentLagrangian as consuming a contact predicate "fixed here", so the two roadmaps appear to supply each other

The predicate is Tau Ceti's. The README itself treats it as library material: Convention 5 (lines 86–88) uses Tau Ceti's predicate, and Scope and ownership lists it as already in the library (lines 915–917). Yet the Summary says that CotangentLagrangian "uses the contact predicate fixed here" (lines 35–36), and Downstream consumers repeats the claim (lines 897–899). This roadmap in turn consumes CotangentLagrangian Layer 1 (C1) and §2.2 (C2.2), at lines 754–778 and 1079–1083. A reader therefore sees supply in both directions between the two roadmaps. CotangentLagrangian keeps that edge alive on its side: its supplier contract, at the head of its open revision, still lists "ContactGeometry CG1: the contact predicate on cooriented one-forms", and main has the same at its line 364.

At section level there is no cycle (CG1 → C2.2 → §5.6), and the dependency check reports none. The smallest repair here is two short rewrites. The Summary would say that CotangentLagrangian "uses Tau Ceti's contact predicate `TauCeti.SmoothForm.IsContactForm`, the one adopted in Convention 5". Downstream consumers would drop the claim that §2.2 consumes this roadmap. Pointing CotangentLagrangian's own supplier entry at Tau Ceti is that roadmap's change.

## C02 — The Jacobi-bracket headline of §6.1 cites no source, although two of the cited texts state the correspondence it rests on

This continues the previous round's C04, which is only partly repaired. Section 6.1 (lines 807–825) carries no locator, and neither do the docstrings of `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket` and `jacobiBracket_jacobi` (`Suggested.lean`, lines 189–215). As a result the only headline without a reference is one that `Suggested.lean` tests. Two of the cited texts state what it rests on:

- Kriegl–Michor, 43.15, p. 472 (KrieglMichor1997 lines 21623–21632): contact vector fields form a Lie algebra, contraction with `α` maps them bijectively onto `C^∞(M)`, and the inverse is a first-order differential operator. The bracket `{f, g} = α([X_f, X_g])` is the transported Lie bracket.
- Geiges, Theorem 2.22, p. 16 (GeigesHandbook lines 530–546): the same correspondence, with the equations of Convention 7.

Citing either one at §6.1 and in the three docstrings would give the headline a source. The remaining sections without a locator (§§4.2, 4.4, 6.3, 6.4) are short computations and can stay as they are.

## C03 — The construction of `TM/D` in §1.1 completes a frame of `D` to a frame of `TM` without naming the roadmap that owns that step

Section 1.1 (lines 130–140) builds the quotient bundle "from adapted local frames: a local frame of `D` … completed by `dim M − k` vector fields". Section 1.2 (lines 161–176) makes the annihilator `ξ⁰` a smooth line subbundle of `T*M`. Neither *Needs* line names an owner for these steps. On main, LieGroupoidsPoisson §G0.1 develops the generic finite-rank smooth-subbundle API: smooth local frames of a subbundle extend to local frames of the ambient bundle, and kernels of constant-rank bundle maps are subbundles. LieGroupoidsPoisson does not consume this roadmap, so citing it creates no cycle. Adding "LieGroupoidsPoisson §G0.1 (subbundle frames and kernels)" to the *Needs* of §1.1 and §1.2 and to the supplier contracts would keep that API from being planned twice. DifferentialGeometry 4.1, already cited, uses the same frame completion for its coframes.

## Earlier findings

- R01 — repaired: the Layer 5 example (lines 789–795) now claims determination only where the front is an immersion outside a discrete set, and gives the two curves with one-point front as the counterexample.
- R02 — repaired: `exists_relative_isotopy_map_mfderiv_eq` (`Suggested.lean`, line 99) states relative Gray for a jointly smooth family with no compactness or coorientation. `exists_diffeotopy_map_mfderiv_eq` (line 122) adds the version for distributions on closed manifolds.
- R03 — repaired: §§2.1, 2.3 and 4.1 cite no source. Every remaining Courte–Guillermou citation is exact (p. 35; pp. 34–35; Lemma 3.7; Remark 3.8; Proposition 3.5; Theorems 3.9–3.13). The equivalences of §1.2 cite Geiges, §2, p. 4.
- R04 — repaired: the README cites "CotangentLagrangian Layer 1 (C1)" and "§2.2 (C2.2)" (lines 754, 765, 776, 802, 934, 1081), and the description names the open revision.
- C01 — repaired: §B5.0 at lines 640, 657, 743, 802, 931 and 1071.
- C02 — repaired: the Lean statement has no closed-image hypothesis, and the README says "its image closed or not" (line 686).
- C03 — repaired: "asserted only when `Y` is compact, or when `Φ` is defined and injective on `(−ε, ε) × Y`" (lines 552–554).
- C04 — partly repaired: the Geiges citations now give theorem numbers, Gray 1959 is no longer cited, and §5.3 cites a source. §6.1 still has no locator (C02 above).
- C05 — repaired: authors, title and the working link (lines 1103–1109).
- C06 — not repaired: deferred (D01).
- C07 — repaired: the description now reads "The mathematics is unchanged in substance: …" and gives "§B5.0".
- N01 — repaired: each convention starts its own list item (lines 60–108).

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Roadmap side | My side | Result |
|---|---|---|---|---|
| §1.1 Levi sign, Checks | `U = ∂_x`, `V = ∂_y + x∂_z`; `span(∂_x, ∂_y)` | `L_ξ(U,V) = −∂_z mod ξ`; `α(−∂_z) = −1 = dα(U,V)` | `[U,V] = ∂_z`; `dα = −dx∧dy` gives `−1`; involutive span has zero Levi form | holds |
| §1.2 coorientations (C03) | `ℝ²×S¹`, `τ ↦ τ+π`; `(q,−p,−z)` | `α∧dα = −dx∧dy∧dτ`; `f(τ+π) = −f(τ)` | `−(cos²τ+sin²τ)dx∧dy∧dτ`; `σ*(fα) = −(f∘σ)α`; pullback `−α_std` | holds |
| §1.3 volume criterion | `ℝ³`; `ℝ⁵`, `α = dz − x dy`; arbitrary `f` | `−dx∧dy∧dz`; `α∧(dα)² = 0` | `∂_u, ∂_v ∈ ker α ∩ ker dα`; `(fα)∧(d(fα))ⁿ = fⁿ⁺¹α∧(dα)ⁿ` for every smooth `f` | holds |
| §1.4 `n!` formula | `n = 1, 2`; adapter `(y,x,z)` | `dz∧dq∧dp = −dx∧dy∧dz` | `dα_std = Σdq∧dp`; `(dα)² = 2dq₁∧dp₁∧dq₂∧dp₂`; `dz∧dy∧dx = −dx∧dy∧dz` | holds |
| §2.1 normalized rescaling | `α = dz − x dy`, `f = eˣ` | `Z = ∂_y + x∂_z` | `α(Z) = 0`, `dα(Z,w) = w_x`; the needed `df(Z) = 0` is forced by `dα(Z,Z) = 0` | holds |
| §2.2 flows | `H = z`, `H = 1`, compactly supported `H` | `φₜ = (eᵗx, y, eᵗz)`, `gₜ = eᵗ` | `X_H = (xH_z+H_y)∂_x − H_x∂_y + (H − xH_x)∂_z`; `X_H = 0` off `supp H` | holds |
| §2.3 contactomorphisms | `F = (2x,y,2z)`, `G = (−x,y,−z)` | `F*α = 2α`, `F*∂_z = ½∂_z = X_(1/2)`; `G*α = −α` | `α(F*X_H′) = (H′∘F)/g`; `X_c = cR` | holds |
| §3.1 `exists_darbouxChart_kerDistribution_eq` | `n = 0`; `ker eˣ(dz − x dy)` | swap gives `g = e⁻ˣ > 0` | `n = 0`: `D = 0` is the comap of `ker dz`; swap pulls `dz − p dq` to `dz − x dy` | holds |
| §3.2 `exists_darbouxChart_mpullback_eq` | `n = 0`; `α = eˣ(dz − x dy)` | swap is not strict; `R ↦ e⁻ᵖ(∂_q+(p+1)∂_z)` | `n = 0`: local primitive; route `d(β + Σp dq) = dβ − Σdq∧dp = 0` | holds |
| §3.3 `exists_relative_isotopy_map_mfderiv_eq` | `K = ∅`, `K = M`, noncompact closed `K` | `ξₜ = ξ₀` gives `φ = id` | `K = ∅`: `V = ∅`; on `K`, `∂ₜαₜ ∝ α₀` so the Moser field vanishes; tube lemma over `[0,1]` | holds |
| §3.4 both Gray theorems on closed `M` | `αₜ = (1+t)α₀`; `M` empty | `Φ = id`, `gₜ = 1+t`; strict version contradicts volume `×2ⁿ⁺¹` | `g₀ = 1` forced; Geiges Thm 2.20 proof gives `λₜ > 0` | holds |
| §4.1 symplectization | `ℝ²×ℝP¹`; `ℓ ↦ −ℓ` | `L*∖0 ≅ T*ℝ²∖0`, `θ = p₁dx + p₂dy` | `c(cosτ dx + sinτ dy) ↦ (c cosτ, c sinτ)` bijective; `θ(v) = p₁ẋ + p₂ẏ` | holds |
| §4.2 lifts | `F*α′ = fα`, `f > 0`; `G` | `(t,x) ↦ (t − log f, F)`; `G̃` swaps the components | `ℓ′ = eᵗα∘dF⁻¹ = e^(t−log f)α′`; `(t+c, G)` gives `−e^(t+c)α` | holds |
| §4.3 collar, Checks | `ℝ²ⁿ⁺²`, `ω = 2Σdx∧dy`; spiral `ρ(θ) = θ` | `Z = u/2`, `Φ*(−λ) = eˢα`; return time `2log(1+2π/θ)` | `λ = −Σ(x dy − y dx)`, `dλ = −ω`, `ι_Zω = −λ`; `e^(s/2)θ = θ+2π` | holds |
| §4.4 contactization volume | `W = ℝ²`, `λ = p dq` | `α∧dα = dz∧dq∧dp` | `d(dz − p dq) = dq∧dp`; `λ∧ωⁿ = 0` on `W×ℝ` by degree | holds |
| §5.2 isotropic neighbourhood, `Ψ` exact | `N` a point | `CSN = ξₓ`; any conformal symplectic map realized | `G = (A(q,p), cz + h)` with `A*λ − cλ = dh` gives `G*α = cα`, `dG₀ = (A, c)` | holds |
| §5.3 one-jets | zero section; `(0, u)` | pullbacks `0` and `du` | `s*(dz − λ) = du − σ`, zero iff `σ = du` (KM 43.17) | holds |
| §5.4 `exists_mpullback_eq_contactization_of_isLegendrian` | `y`-axis with `α`, `eˣα`; `n = 0`; non-closed image | `(q,p,z) ↦ (p,q,z)` strict; `eᵖ(dz − p dq)` not strict | `n = 0`: Reeb charts on a discrete image; `dh(R) = (α₀−α₁)(R)` gives `αₜ(X) = h` | holds |
| Layer 5 front example (R01) | `(0,t,0)`, `(0,2t,0)`; front immersive off a discrete set | `p = z′/q′`; one-point front | front immersive iff `q′ ≠ 0`, since `z′ = pq′`; both curves Legendrian | holds |
| §5.5 twisted model | `∇ = d + a`, `n = 1` | shift `p ↦ p − za` pulls `θ_d` to `θ_∇` | `dz − (p − za) = θ_∇`; `θ∧dθ = −dz∧dp∧dq ≠ 0` | holds |
| §5.6 unit conormals | `Q = ℝ²`; `S` a point, a line, `Q` | circle; two lines; empty | `dim N*S = dim Q`, transverse to `S*Q`; radial map gives `ρ*ω_can = d(rα_b)` | holds |
| §6.1 `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket`, `jacobiBracket_jacobi` (C02) | `x, y, z` on `(ℝ³, dz − x dy)` | `{x,y} = −1`, `{y,z} = y`, `{z,x} = 0`, `[X_x,X_y] = −∂_z` | `{f,g} = α([X_f,X_g])` derived; Jacobi `−1 + 0 + 1 = 0` | holds |
| §6.1 API | constants; products | `{1,g} = Rg`, `{f,c} = −cRf`, Leibniz with `−gh{f,1}` | `{f,g} = X_f g − gRf` gives `{f,gh} = g{f,h} + h{f,g} + ghRf` | holds |
| §6.2 transition law | `α′ = 2α` | `{2x,2y}_α′ = −2`; `X^α′_(x/2) = −¼∂_y` | `R′ = ½∂_z` kills the Reeb terms; `X^(hα)_(hf) = X^α_f` | holds |
| §6.3 comparison | `ω = d(rα)`, `f = 1` | `X_r = −R`, `{rf,rg} = r{f,g}` | `ι_(r(Rf)∂_r − X_f)ω = f dr + r df`; `df(X_g) = gRf − dα(X_f,X_g)` | holds |
| §6.4 sign adapter | `D*Q`, `Z = p∂_p` | `λ_D = −λ_can`, boundary form `α_b` | `ι_(p∂_p)(dq∧dp) = −p dq = λ_D`; DGFloer main lines 344–356 agree | holds |
| Layer 2 Hopf example | `S³`, `K = i/2` | `R = iw`, period `2π` | `ω(u,(i/2)v) = ⟪u,v⟫` on `∂_x`, `∂_y`; `α(iw) = |w|² = 1` | holds |

- Source locators checked against the text: all 21 README locators (11 Courte–Guillermou, 7 Geiges, 3 Kriegl–Michor), plus the Suggested.lean docstrings. The pages read were CourteGuillermouNotes pp. 33–38, GeigesHandbook pp. 4–7, 14–21 and 37–39, and KrieglMichor1997 43.15–43.19 (printed pp. 471–474). Each locator states what the README attributes to it, with the hypotheses as written.
- Library declarations opened at the pin:
  - Tau Ceti `Diffeotopy` (`Geometry/Diffeomorphism/Diffeotopy/Basic.lean:78`), `IsContMDiffDistribution` (`Geometry/Manifold/Distribution.lean:269`) and `IsContactDistribution` (`Geometry/Contact/Distribution.lean:94`);
  - Tau Ceti `contactHamiltonianVectorField` (`Geometry/Contact/Hamiltonian.lean:187`), `reebVectorField` (`Geometry/Contact/Reeb.lean:75`), `innerProductContactForm` (`Geometry/Contact/Standard.lean:294`) and `contactization` (`Geometry/Contact/Contactization.lean:79`);
  - Tau Ceti `sphereContactForm` and its Reeb lemma (`Geometry/Contact/Sphere.lean:101, 152`);
  - Mathlib `IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean:70`) and `IsImmersion` (`Geometry/Manifold/Immersion.lean:802`).
  - No quotient bundle, jet bundle or conformal symplectic normal bundle exists at either pin, which confirms the docstring's list of statements that cannot be stated.
- Cross-roadmap citations resolved on main:
  - DifferentialGeometry 1.4, 3.2, 3.3, 3.5, 4.1, the Layer 4 acceptance examples and 5.4;
  - SmoothBundlesConnections B2.1, B3.3 and B5.0;
  - GeometricTopology 1.5;
  - HeegaardFloer 4.1 (F2.1);
  - PseudodifferentialOperators P1.0 (first jets, connection splitting);
  - DGFloer's sign dictionary and Layer 6, item 4;
  - LieGroupoidsPoisson Layers 4 and 6;
  - CombinatorialHeegaardFloer Lane G, item 11;
  - SymplecticFieldTheory's CG1, CG2, CG4 and CG6 citations;
  - CotangentLagrangian C1 and C2.2 on main, and Layer 1 and §2.2 at its open revision.
- Automatic checks: all passed. Dependency check: `depcheck: 184 roadmaps, 2065 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `declaration uses 'sorry'` warnings and no error. I compared the elaborated types of all 9 declarations with their README statements: no binder is lost, and nothing changed.
- One-tactic probe on a copy of the file: no theorem closes with `first | rfl | simp | trivial | infer_instance`. `jacobiBracket` has a real body. Nothing is padding.
- Ownership: I searched main and every open head for Gray stability, the Jacobi bracket, symplectization, contact Darboux, Legendrian neighbourhoods, the conformal symplectic normal bundle and quotient bundles. Only this roadmap owns them; LieGroupoidsPoisson §G0.1 owns the subbundle API (C03).

Overlap check: read CotangentLagrangian (main and its open revision), SymplecticGeometry (main and its open revision), HamiltonianReduction (open), DGFloer (main and open), HamiltonianSystems (open) and DifferentialGeometry (main). The shared objects and their owners:
- the cosphere forms, the radial comparison and conormal vanishing: CotangentLagrangian §2.2, cited here;
- the contact-type conditions: DGFloer Layer 6, item 4, cited here;
- the Liouville collar of a contact-type hypersurface: this roadmap (§4.3), which DGFloer's open head consumes as "ContactGeometry CG4";
- distributions and the contact acceptance examples: DifferentialGeometry Layer 4, cited here;
- the contact predicate: Tau Ceti, though CotangentLagrangian still cites it as CG1 (C01).

HamiltonianReduction and HamiltonianSystems mention no contact object.

Source independence: 21 locator passages and 6 further passages (Convention 3, the routes of §3.3, §5.2 and §5.4, the Layer 5 front example, the relative Gray docstring) were compared with 3 sources. Nothing is shared beyond forced formulas and standard names (at most 4 consecutive words, such as "contact vector fields" and "bundle homotopic"). The largest share of locators is CourteGuillermouNotes, 11 of 21. Contents were compared with its Chapter 3 (§§3.1–3.3) and with Geiges's §2 (2.1–2.6): independent. Layers 1–2 correspond only in part to C–G §3.2. Layer 3 corresponds to §3.3 but puts Darboux before Gray. Layers 4 and 6 have no counterpart. Layer 3 comes before Layer 5 because §5.2 and §5.5 need §3.3.

Research link: §5.4 is Lychagin's Legendrian neighbourhood theorem, which Kriegl–Michor (1997, Theorem 43.19) use to make the contactomorphism group a regular Lie group. Geiges (2006, §§2.4–2.5) uses Gray stability, Darboux and the neighbourhood theorems for isotopy extension and global existence results. DGFloer's Corollary E consumes the §4.3 collar. This rests on KrieglMichor1997 §43, GeigesHandbook and the DGFloer README.

## Not verifiable

- none

Automatic checks set aside as false positives: the citation scan's lead on README line 107 names the namespace of `Suggested.lean`, not a declaration.

## Source issues

- **Misprint** in GeigesHandbook at Theorem 2.22, p. 16: the source says the correspondence is with smooth functions into the positive reals; it should be all smooth real-valued functions, since `α(X)` takes any sign and the proof treats arbitrary `H`; affects nothing.
- **Misprint** in GeigesHandbook at proof of Lemma 2.45, p. 39: the source says `x = dz/dy` at generic cusps; it should be `x = −dz/dy`, as in the lemma's own statement; affects nothing.
- **Misprint** in GeigesHandbook at Theorem 2.27, p. 21: the source says the covered diffeomorphism is `φ : L₁ → L₂`; it should be `φ : L₀ → L₁`; affects nothing.
- **Error** in KrieglMichor1997 at Proposition 43.18, proof, p. 473: the source says `h_t` is chosen with `dh_t(X_(α_t)) = (α₁ − α₀)(X_(α_t))`; it should be `(α₀ − α₁)(X_(α_t))`, or the chosen `X_t` has `α_t(X_t) ≠ h_t` and (4) does not vanish; affects the proof.
- **Misprint** in KrieglMichor1997 at Proposition 43.18, proof, pp. 472–473: the source says the neighbourhood lies in `T*M × ℝ` and the slice `S` in `TM`; it should be `T*L × ℝ` and a hypersurface of `V`; affects nothing.
- **Error** in CourteGuillermouNotes at Theorem 3.12, proof, p. 38: the source says the explicit `H_t` integrates over the family parameter along the flow of `R_t`; it should, for fixed `t`, integrate along the flow lines of `R_t` in their own time from the slice; affects the proof.
- **Misprint** in CourteGuillermouNotes at Theorem 3.11, proof, p. 37: the source says the standard form is `α`, then writes `ψ*β` for it and reuses `α` for the given form; it should name the standard form `β` throughout; affects nothing.

## For the human reviewers

- none
