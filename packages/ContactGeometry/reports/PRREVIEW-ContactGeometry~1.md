# Review of ContactGeometry (pull request #2684 at b74d356)
Folder: `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/`
**Verdict:** needs changes

**Summary.** Changes are needed, for four findings. On the mathematics: one example sentence is false, because a Legendrian curve is not determined by its front without a genericity condition. The relative, noncooriented Gray theorem is a headline: it elaborates at the pins, yet `Suggested.lean` calls it unstatable and leaves it out. The Courte–Guillermou course notes are cited for results they do not contain, above all the symplectization of §4.1. And the citations of CotangentLagrangian C1 and C2.2 break when that roadmap's open revision merges. There are also seven small corrections and one format note, none blocking. One question goes to the author, and the human reviewers have one note on sources that could not be read.

## R01 (P2) — The Layer 5 example says a Legendrian curve in `(ℝ³, dz − p dq)` is determined by its front, which fails for curves with a segment in the `p`-direction

A reader who applies this to arbitrary Legendrian immersions gets a false uniqueness statement. Counterexample: the curves `t ↦ (q, p, z) = (0, t, 0)` and `t ↦ (0, 2t, 0)`, `t ∈ (0, 1)`, are both Legendrian immersions, since their velocities `∂_p` and `2∂_p` lie in `ker(dz − p dq)`. Their images differ (`p` ranges over `(0, 1)` and `(0, 2)`), but both have the one-point front `(0, 0)`. The sentence is in the Examples of Layer 5, lines 765–766: "A Legendrian curve in `(ℝ³, dz − p dq)` is determined by its front".

The smallest repair is to restrict the claim to curves whose front is an immersion away from isolated points. For those, `p` is the slope `dz/dq`, extended by continuity across cusps. Alternatively, keep only the second clause: where the front is a graph `z = f(q)`, the curve is `j¹f`.

## R02 (P2) — Relative Gray stability for contact distributions can be stated at the pins, but `Suggested.lean` says it cannot and leaves it out

This is the headline that carries the roadmap's noncoorientable case (Summary, lines 19–21; §3.3). Without it, the acceptance test checks only the cooriented form version on closed manifolds. The module docstring (`Suggested.lean`, lines 26–28) justifies the omission by saying that "the pins have no notion of a smooth family of distributions". But joint smoothness in the sense of §3.3 is the same thing as a smooth distribution on `ℝ × M` with values in `0 × ξₜ`, and Tau Ceti's `TauCeti.IsContMDiffDistribution` (`TauCeti/Geometry/Manifold/Distribution.lean:269`, local frames) expresses that. The statement below elaborates at the pins with the imports of `Suggested.lean`, giving only the `sorry` warning:

```lean
theorem exists_relative_gray
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [BoundarylessManifold I M]
    (ξ : ℝ → Π x : M, Submodule ℝ (TangentSpace I x))
    (hsmooth : IsContMDiffDistribution (𝓘(ℝ).prod I) ∞ (finrank ℝ E - 1)
      (fun p : ℝ × M ↦ (ξ p.1 p.2).map (LinearMap.inr ℝ ℝ E)))
    (hcontact : ∀ t, IsContactDistribution I ∞ (ξ t))
    {K : Set M} (hK : IsClosed K) (hagree : ∀ x ∈ K, ∀ t, ξ t x = ξ 0 x) :
    ∃ V : Set M, IsOpen V ∧ K ⊆ V ∧ ∃ φ : ℝ → M → M,
      ContMDiffOn (𝓘(ℝ).prod I) I ∞ (Function.uncurry φ) (Set.Icc 0 1 ×ˢ V) ∧
      (∀ x ∈ V, φ 0 x = x) ∧ (∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ x ∈ K, φ t x = x) ∧
      (∀ t ∈ Set.Icc (0 : ℝ) 1, IsLocalDiffeomorphOn I I ∞ (φ t) V ∧ Set.InjOn (φ t) V) ∧
      ∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ x ∈ V,
        ξ t (φ t x) = (ξ 0 x).map (mfderiv I I (φ t) x).toLinearMap := by
  sorry
```

The smallest repair is to add this theorem and remove the item from the docstring's list of statements that cannot be stated. The theorem may also be written with `ξ` defined on an open `U` and `t` in an open interval containing `[0, 1]`, as in §3.3. The distribution version of §3.4 on closed manifolds can be stated the same way with a `TauCeti.Diffeotopy`.

## R03 (P2) — The Courte–Guillermou course notes, cited as "Grenoble contact-geometry course notes, §§3.2–3.3", do not contain several of the statements attributed to them

An implementer who follows this locator for the symplectization (§4.1) or for the rescaling law (§2.1) finds nothing, so those targets are left with no source. Sections 3.2–3.3 of the notes (pp. 34–38) cover the following:

- the definitions of contact forms and structures, and the bracket form `κ_ξ` (p. 35);
- the Reeb field (p. 35);
- contact vector fields (Lemma 3.7, p. 36);
- Theorems 3.9–3.13: relative and closed Gray stability, Darboux for structures and for forms, and Weinstein's theorem for Legendrians.

Four citations go beyond that:

- the word "symplectization" does not occur anywhere in the 70 pages, yet §4.1 cites the notes (line 499);
- the notes have no rescaling law for `R_(fα)` (§2.1, lines 284–285);
- they have no transport law `F^* X_(H') = X_((H' ∘ F)/g)`, and their "contactomorphism" already preserves the coorientation (§2.3, line 327);
- coorientability appears only in a parenthesis on p. 35, not as the chain of equivalences of §1.2 (line 165).

The smallest repair has two parts. First, replace the blanket locator by exact ones where the notes do support the statement:

- the `κ_ξ` paragraph and the volume criterion, pp. 34–35 (§1.1, §1.3);
- Lemma 3.7 and the contact-isotopy computation, pp. 35–36 (§2.2);
- Theorem 3.9, p. 36 (§3.3; the notes assume `K` compact, but their flow-domain argument works for closed `K`);
- Theorems 3.11 and 3.12, p. 37 (§3.1, §3.2).

Second, for §4.1, §2.1, the transport law and the equivalences of §1.2, either cite a text that states them or say that they are proved here.

## R04 (P2) — The citations of CotangentLagrangian C1 and C2.2 break when the open revision of CotangentLagrangian merges, and nothing maps the old labels to the new ones

Section 5.6, §6.4 and the supplier contract all consume C1 and C2.2. Once pull request #2687 merges, neither label exists and a reader cannot find the supplier. At the head of #2687, the CotangentLagrangian README renumbers its milestones as Layers 1–4, and the cosphere material moves to "2.2 Exact Lagrangians and basic examples" (line 425 there). That README contains no occurrence of "C1" or "C2.2" and no table from old to new labels. This README cites the old labels at lines 730, 741, 746, 752, 773, 845, 867, 903 and 1048–1052.

There are two smallest repairs. Either the CotangentLagrangian revision adds one sentence mapping its old labels (C1 is Layer 1, C2.2 is §2.2), as line 47 here does for CGk, and nothing here changes. Or this README cites "CotangentLagrangian Layer 1 (C1) and §2.2 (C2.2)", and the description names #2687 as a pull request to merge first.

## C01 — Bundle transport is cited to SmoothBundlesConnections §B5.1, but that section reconstructs connections from transport; transport itself is §B5.0

The citations are at lines 619, 636, 719, 773, 900 and 1040. On main, §B5.0, "Horizontal lifts and the group equation" (line 1405), constructs transport along curves with smooth dependence on parameters, and compares associated transport with covariant differentiation. Section B5.1 (line 1448) builds the inverse dictionary, from transport to a connection. Cite §B5.0 for the transport used in §5.2 and §5.5.

## C02 — The strict Legendrian neighbourhood theorem does not need its closed-image hypothesis

The hypothesis appears in §5.4 ("with closed image", lines 665–666) and as `hclosed` (`Suggested.lean`, line 130). Kriegl–Michor, Proposition 43.18 (pp. 472–473), assumes only an embedded Legendre submanifold. The tubular theorem the route uses, `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`, needs no closed image either, and an embedded submanifold is closed in some open neighbourhood of itself, where the argument runs. Dropping the hypothesis makes the target as general as its source. If it is kept for convenience, the text should say so.

## C03 — In §4.3, a flow of `Z` defined on `(−ε, ε) × Y` does not give a collar of uniform width

Lines 539–541 say that "a collar of uniform width `(−ε, ε) × Y` is asserted only when `Y` is compact or the flow of `Z` is defined on it". Take the data of the §4.3 Check on `W = ℝ² ∖ 0`: `Z(u) = u/2`, whose flow is complete. Take a smooth spiral `r = ρ(θ)`, `θ ∈ ℝ`, with `ρ′ > 0`, `ρ → 0` as `θ → −∞` and `ρ(θ) = θ` for `θ ≥ 3`. It is a closed embedded curve transverse to `Z`. For `θ ≥ 3`, the points at angles `θ` and `θ + 2π` lie on one ray and are joined by flow time `2 log(1 + 2π/θ)`, which tends to 0. So `Φ` is injective on no `(−ε, ε) × Y`. Would "only when `Y` is compact, or when `Φ` is injective on `(−ε, ε) × Y`" say what is meant?

## C04 — Several targets have no locator: the Geiges and Gray citations give no theorem or page, and §§4.2–4.4, 5.3, 5.5, 5.6 and 6.1–6.3 cite no source

Sections 3.1–3.4, 5.1 and 5.2 cite Geiges's book by title alone, and §§3.3–3.4 cite Gray 1959 the same way, so a reader cannot check a hypothesis against the source. Add theorem numbers. For §5.3, the one-jet paragraph of the Courte–Guillermou notes (p. 35) states the graph criterion. Geiges's open survey (arXiv math/0307242: Theorem 2.20 for Gray, 2.24 for Darboux, 2.27 for isotropic neighbourhoods) is a readable locator alongside the book.

## C05 — The reference "Grenoble contact-geometry course notes" names neither authors nor title, and its link no longer resolves

The reference is at line 1080. The text is S. Courte and S. Guillermou, *Introduction to symplectic and contact geometry*, course notes. The host in the link (`www-fourier.ujf-grenoble.fr`) fails certificate verification, and the same file is served at `https://www-fourier.univ-grenoble-alpes.fr/~courtes/cours.pdf`. Name the authors and the title, and update the link.

## C06 — The family index still links to the four CGk anchors that this change removes

`TauCetiRoadmap/SymplecticGeometry/README.md` belongs to this pull request's scope. Its lines 70–76 link to `#cg1--…`, `#cg4--…`, `#cg5--…` and `#cg6--…`, none of which exists after this change. Point them to the Layer 1, 4, 5 and 6 headings. CotangentLagrangian's links need no change here, because its open revision removes them.

## C07 — Two sentences of the description contradict the head

The description says "The mathematics planned is unchanged." Yet it later lists the targets now taken from Tau Ceti, which "the README no longer plans", and the head adds targets: §3.4 for families of forms, and the volume formulas of §1.4 and §4.4. Its list of relabelled citations also gives "§B5.1" for transport (see C01). An accurate version would be: "The mathematics is unchanged in substance: what Tau Ceti now proves moves to the supplier contracts, and the form version of global Gray stability and a few volume computations become targets."

## N01 — The eight conventions run together into one paragraph

In lines 60–102, items 2–8 ("2. **Forms and fields.**" and so on) continue inside the text of item 1, so Markdown renders a single list item. A line break before each number would restore the list.

## Questions for the author

- Section 5.2 states the isotropic neighbourhood theorem for closed, possibly noncompact `N`, with a possibly nontrivial contact line, and realizes `Ψ` exactly; it cites Geiges's book for this. Geiges's survey (arXiv math/0307242, Theorem 2.27, p. 21) states the theorem for compact isotropic submanifolds of cooriented structures, with `Tψ|CSN` only bundle homotopic to `Φ`. Does the book state the stronger form, and in which theorem? Or is the strengthening this roadmap's own, carried by the correcting flow of its route? I could not read the book: the Cambridge edition is paywalled.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / my side) | Result |
|---|---|---|---|
| §1.1 Levi sign, Check | `U = ∂_x`, `V = ∂_y + x∂_z` | `[U,V] = ∂_z`; `α(−∂_z) = −1`; `dα(U,V) = −(dx∧dy)(U,V) = −1` | holds |
| §1.2 coorientations, Check on `ℝ²×S¹` | `α = cos τ dx + sin τ dy`; `τ ↦ τ+π` | `α∧dα = −(cos²τ+sin²τ) dx∧dy∧dτ`; involution gives `−α`; `(q,−p,−z)` pulls `α_std` to `−α_std` | holds |
| §1.3 volume criterion, Checks | `n = 1`; `ℝ⁵`, `α = dz − x dy` | `(dz − x dy)∧(−dx∧dy) = −dx∧dy∧dz`; `(dα)² = 0`, `∂_u, ∂_v ∈ ker α ∩ ker dα` | holds |
| §1.4 `n!` formula | `n = 1, 2` | `dα_std = Σ dq∧dp`; `n=2`: `(dq₁∧dp₁+dq₂∧dp₂)² = 2 dq₁∧dp₁∧dq₂∧dp₂`; `n=1` adapter gives `−dx∧dy∧dz` | holds |
| §2.1 normalized rescaling | `α = dz − x dy`, `f = eˣ` | `R_fα = e⁻ˣ(∂_y+(x+1)∂_z)`, `Z = ∂_y + x∂_z`, `α(Z) = 0`, `dα(Z,w) = w_x`; `df(Z) = 0` forced | holds |
| §2.2 flows | `H = z`, `H = 1`, opposite sign | `X_z = x∂_x + z∂_z`, flow `(eᵗx, y, eᵗz)`, `φ*α = eᵗα`; `X_1 = ∂_z`; `−H` gives `e⁻ᵗ` | holds |
| §2.3 contactomorphisms | `F = (2x,y,2z)`, `G = (−x,y,−z)` | `F*α = 2α`, `F*∂_z = ½∂_z = X_(1/2)`; `G*α = −α`; `F` is the time-`log 2` map of `X_z` | holds |
| §3.1 Darboux, structures (`exists_darbouxChart_kerDistribution_eq`) | `n = 0`; `ker eˣ(dz − x dy)` | `n=0`: `D = 0 = comap` of `ker dz`; swap pulls `α_std` to `e⁻ˣ·eˣα`, `g = e⁻ˣ > 0` | holds |
| §3.2 Darboux, forms (`exists_darbouxChart_mpullback_eq`) | `n = 0`; `α = eˣ(dz − x dy)` | `n=0`: `α = h dt = dz`; `R_α ↦ e⁻ᵖ(∂_q+(p+1)∂_z) ≠ ∂_z`; route: `d(β + Σp dq) = 0` | holds |
| §3.3 relative Gray | `ξₜ = ξ₀`; noncompact closed `K` | Moser field 0, `φ = id`; on `K`, `∂ₜαₜ = c α₀` gives `Y = 0`; tube lemma per point gives `V` | holds; absent from Lean (R02) |
| §3.4 Gray, closed (`exists_diffeotopy_mpullback_eq_pos_smul`) | `αₜ = (1+t)α₀`; `M` empty | `Y = 0`, `Φ = id`, `g = 1+t`; strict version contradicts volume `×2ⁿ⁺¹`; `g` unique as `α₀ ≠ 0` | holds |
| §4.1 symplectization (R03) | `ℝ²×ℝP¹`; coorientable `ξ` | `L*∖0 ≅ T*ℝ²∖0`, `θ = p₁dx + p₂dy`, connected; `ℓ ↦ −ℓ` gives `−θ` | holds; no source |
| §4.2 lifts | `F*α' = fα`, `f > 0`; `G` | `F̃(eᵗα) = e^(t−log f) α'`; pulls `eᵗα'` to `eᵗα`; `(t+c, G)` gives `−e^(t+c)α` | holds |
| §4.3 collar (C03) | `ℝ²ⁿ⁺²`, `ω = 2Σdx∧dy`; spiral | `λ = y dx − x dy`, `dλ = −ω`, `Z = u/2`, `Φ*(−λ) = eˢα`; spiral return time `→ 0` | holds; C03 |
| §4.4 contactization | `W = ℝ²`, `λ = p dq` | `α∧dα = dz∧dq∧dp`, `ω = −dλ = dq∧dp`; `λ∧ωⁿ = 0` on `W×ℝ` | holds |
| §5.1 conformal symplectic normal bundle | point; Legendrian curve in `ℝ³` | rank `2(n − k)`: `ξₓ` for a point, `0` for `k = n = 1` | holds |
| §5.3 one-jets | zero section; `(0, u)` | `dz − λ` pulls back to `0`, and to `du ≠ 0` | holds |
| §5.4 strict Legendrian (`exists_mpullback_eq_contactization_of_isLegendrian`) | `y`-axis with `α`, `eˣα`; `n = 0` | `(q,p,z) ↦ (p,q,z)` gives `dz − p dq`, resp. `eᵖ(dz − p dq)`; Kriegl–Michor 43.18 needs no closedness | holds; C02 |
| §5.5 twisted model | `∇ = d + a` | shift `p ↦ p − z a` pulls `dz − p` to `dz + z a − p = θ_∇`; `+z a` gives model of `d − a` | holds |
| §5.6 unit conormals | `Q = ℝ²`, `S` a point, a line, `Q` | fibre circle (dim 1); two lines; empty | holds |
| Layer 5 example (R01) | `(0,t,0)`, `(0,2t,0)` | both Legendrian, same front `{(0,0)}`, different images | false as stated |
| §6.1 Jacobi bracket (`jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket`, `jacobiBracket_jacobi`) | `x, y, z` on `(ℝ³, dz − x dy)` | `{f,g} = f R g − X_g f = α([X_f,X_g])`; `{x,y} = −1`, `{y,z} = y`, `{z,x} = 0`; `[X_x,X_y] = −∂_z`; Jacobi `−1+0+1` | holds |
| §6.1 API | general `f, g, h`, constant `c` | `{f,1} = −Rf`; Leibniz identity balances; `{1,g} = Rg`; `X_c = cR`, `{f,c} = −cRf` | holds |
| §6.2 transition | `α' = 2α` | `{2x,2y}_(α') = −2 = 2{x,y}_α`; `X^(α')_(x/2) = −¼∂_y` | holds |
| §6.3 comparison | `ω = d(rα)` | `ι_(−R)ω = dr`; `X_(rf) = r(Rf)∂_r − X_f`; `{rf,rg} = r(fRg − X_g f)`; `−ω` flips sign | holds |
| §6.4 sign adapter | `D*Q`; sphere | `λ_D = −λ`: `ω = dλ_D`, `ι_Zω = λ_D`; DGFloer main lines 353–354 agree | holds |

- Source locators checked against the text: 8 citations of the Courte–Guillermou notes (§§1.1–1.3, 2.1–2.3, 3.3, 4.1; text pp. 33–38, Theorems 3.9–3.13, Lemma 3.7); Kriegl–Michor §43.15–43.18 (pp. 471–474) for §5.4; Geiges's survey Theorems 2.20, 2.24 and 2.27 for the theorems cited to his book.
- Library declarations opened: all 122 Tau Ceti and Mathlib-namespace names in the README resolve at the pin. 101 resolve by `#check`. The rest live in modules without build artifacts and were checked by reading the source: `Contact/{Moser,Pullback,Sphere,Symplectization,Transition}.lean`, `Symplectic/Darboux/Basic.lean:116` and `Symplectic/Liouville/Symplectization.lean:142`. Definitions read: `Contact/Hamiltonian.lean:101,187`, `Contact/Sphere.lean:101,152`, `Contact/Contactization.lean:79`, `Contact/Standard.lean:294`, `Diffeomorphism/Diffeotopy/Basic.lean:78,91`, `Manifold/Distribution.lean:269`.
- Cross-roadmap citations resolved on main:
  - DifferentialGeometry: Layers 0–1, items 3.2, 3.3 and 3.5, Layer 4 acceptance examples (lines 1632–1642), item 5.4;
  - SmoothBundlesConnections B2.1, B3.3 and B5.1 (C01);
  - GeometricTopology 1.5;
  - CotangentLagrangian C1 and C2.2;
  - HeegaardFloer 4.1 (F2.1, with the Moser lemma);
  - PseudodifferentialOperators P1.0;
  - DGFloer: the sign dictionary (lines 344–358) and Layer 6, item 4;
  - LieGroupoidsPoisson Layers 4 and 6;
  - CombinatorialHeegaardFloer Lane G, item 11;
  - the consumer citations of SymplecticFieldTheory (CG1, CG2, CG4, CG6), which stay valid through line 47.
- Automatic checks: all passed. Dependency check output: `depcheck: 197 roadmaps, 2166 edges, 0 problem(s)` (no upward or cyclic edge).
- Elaboration: `lake env lean` on `Suggested.lean` gives six `declaration uses 'sorry'` warnings and no error. The elaborated types of all 7 declarations, checked with `#check`, match the README statements, with no binder lost. The relative Gray statement of R02 elaborates as a probe.
- One-tactic probe, by reading: none of the six theorems closes in one tactic (they assert charts, diffeotopies, or Lie-bracket identities that need the contact calculus). `jacobiBracket` is a definition with a real body; nothing is padding.
- Ownership: searched every roadmap on main and at open heads for Gray stability, Legendrian neighbourhoods, contact Darboux, the Jacobi bracket and the symplectization of a contact structure; only this roadmap owns them.

Overlap check: read CotangentLagrangian (on main and at its open revision), DGFloer, HamiltonianSystems, LieGroupoidsPoisson, FukayaTheory, DifferentialGeometry and the SymplecticGeometry family index. Shared objects and their owners: the cosphere contact forms, radial comparison and conormal vanishing belong to CotangentLagrangian C2.2 and are cited here; contact-type conditions belong to DGFloer, Layer 6, item 4, and are cited here; generic Poisson structures belong to LieGroupoidsPoisson and are excluded here; distributions and the contact acceptance examples belong to DifferentialGeometry, Layer 4, and are cited here. Nothing else is shared.

Source independence: 12 passages compared with 3 sources (the Courte–Guillermou notes, Kriegl–Michor, and Geiges's survey for the theorems cited to his book); none shared beyond forced formulas (at most 5 consecutive tokens, for example "i^*α = 0 gives i^*dα = 0"). Largest share: the Courte–Guillermou notes, 8 of 18 locators. Contents compared with their Chapter 3: independent (Layers 1–2 against §3.2 in part, Layer 3 against §3.3, Layers 4–6 with no counterpart; Layer 3 precedes Layer 5 because §5.2 needs §3.3).

Research link: §5.4 is Lychagin's Legendrian neighbourhood theorem, which Kriegl–Michor (1997, Theorem 43.19) use to make the group of contact diffeomorphisms a regular Lie group; Layers 2, 4 and 6 supply the Reeb dynamics, symplectization and Liouville boundary forms consumed by the SymplecticFieldTheory and DGFloer roadmaps. This rests on Kriegl–Michor §43 and the README.

## Not verifiable

- Geiges, *An Introduction to Contact Topology* (2008), cited in §§3.1–3.4, 5.1 and 5.2: the Cambridge edition is paywalled. The DOI landing page is the only copy found; his open survey, arXiv math/0307242, was read instead.
- Gray, *Some global properties of contact structures*, Annals of Mathematics 69 (1959), cited in §§3.3–3.4: JSTOR, paywalled; no open copy found.

Automatic checks set aside as false positives: the citation scan's lead on README line 101 names the namespace of `Suggested.lean`, not a declaration.

## Source issues

- **Misprint** in Courte–Guillermou course notes at Theorem 3.11, proof, p. 37: the source says the proof first calls the standard form `α`, later calls it `β`, and reuses `α` for the given contact form; it should name the standard form `β` throughout; affects nothing.
- **Error** in Courte–Guillermou course notes at Theorem 3.12, proof, p. 38: the source says the explicit solution of (3.4) integrates over the family parameter from 0 to t along "the flow of R_t"; it should, for each fixed t, integrate along the flow lines of R_t in their own flow time from the slice z = 0; affects the proof.
- **Error** in KrieglMichor1997 at Proposition 43.18, proof, p. 473: the source says h_t is chosen with dh_t(X_(α_t)) = (α₁ − α₀)(X_(α_t)); it should be (α₀ − α₁)(X_(α_t)), or the chosen X_t has α_t(X_t) ≠ h_t and (4) does not vanish; affects the proof.
- **Misprint** in KrieglMichor1997 at Proposition 43.18, proof, pp. 472–473: the source says the neighbourhood lies in T*M × ℝ, the slice S in TM, and α_t is contact because the forms agree on T(0_L); it should say T*L × ℝ, a submanifold of V, and agreement on TV|0_L; affects nothing.
- **Misprint** in Geiges, Contact geometry (arXiv math/0307242) at Theorem 2.27, p. 21: the source says the covered diffeomorphism is φ : L₁ → L₂; it should be φ : L₀ → L₁; affects nothing.

## For the human reviewers

- Not tested: Geiges 2008 (6 of 18 locators) and Gray 1959 (2 locators) are paywalled. The wording and the statements attributed to them were compared only with Geiges's open survey, arXiv math/0307242.
