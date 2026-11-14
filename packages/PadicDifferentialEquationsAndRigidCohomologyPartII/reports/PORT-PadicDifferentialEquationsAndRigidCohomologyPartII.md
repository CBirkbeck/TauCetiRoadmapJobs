# PORT-PadicDifferentialEquationsAndRigidCohomologyPartII

## Result

- Branch: `roadmap/padic-differential-equations-and-rigid-cohomology-part-ii`
- Head commit: `cb6792719fb43472ff6ba58b5636deb9608fdefe` (one commit on `e1cd6a5`), message
  `PadicDifferentialEquationsAndRigidCohomologyPartII: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomologyPartII/{README.md,Suggested.lean,metadata.toml}`;
  nothing outside the folder.
- Build (`lake build TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomologyPartII.Suggested`):
  `Build completed successfully (18239 jobs).` Warnings: 0. The file declares nothing, so there is
  no `sorry` warning either. With the package's header (no `module` line), the build of this
  file, in the temporary `#check` variant described under "Signatures", warned "imports `Mathlib`
  from package `mathlib`, which is designed for use with the module system; consider adding
  `module`". The ported file starts with `module` and a plain `import Mathlib`, as
  DiagrammaticCoherence on main does, and that warning is gone.
- Gate: `gate PadicDifferentialEquationsAndRigidCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency direction (`gate --depcheck … --movable`), run after the last edit:

  ```text
  depcheck: 240 roadmaps, 2169 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or `moved:` lines.
- Citation resolver (`roadmaps resolve` on the ported README): no cross-roadmap citation and no Lean
  name found nowhere. Its library-name check did not run on this host. I checked the library names
  myself (see "Signatures").

## Draft pull request body

This roadmap extends PadicDifferentialEquationsAndRigidCohomology past the point where that
roadmap stops. The parent builds the Robba, Amice and bounded-disc coefficient rings,
`(φ,∇)`-modules, slope filtrations, Kedlaya's full faithfulness, rigid cohomology, the trace
formula and `p`-adic Weil II. It never asks how much of an overconvergent F-isocrystal is
remembered by its maximal-slope quotient, or dually by its minimal-slope subobject, which can have
far smaller rank. This roadmap shows that irreducibility and overconvergence make that extremal
piece determine the whole object.

- **Locally**, over the Amice field, the bounded Robba field, the bounded disc and the completed
  generic field of a curve, it builds:
  - bounded generic solutions and the maximally bounded quotient;
  - Chiarellotto–Tsuzuki's pure bounded quotients (PBQ) and their canonical filtration, with
    descent;
  - Ohkubo's comparison of logarithmic growth with Frobenius slopes;
  - Tsuzuki's saturation.
- **On a smooth curve over a perfect field**, it:
  - globalises the PBQ filtration for overconvergent and for convergent F-isocrystals;
  - proves Tsuzuki's rank theorem for dagger sections inside an isoclinic convergent quotient;
  - deduces the specified-map theorem (Tsuzuki, Corollary 6.5) and its minimal-slope dual, the
    curve form of Kedlaya's minimal slope conjecture;
  - proves D'Addezio's minimal slope property `S_1(N) = S_1(Hull†(N))` for dagger hulls.
- **Over finite fields**, through Lefschetz curves, `Q̄_p`-coefficient objects and a
  coefficient-linear trace formula, it proves Tsuzuki's Theorem 7.20 on smooth varieties over `𝔽_q`.

These are the inputs of D'Addezio's parabolicity theorem and of the minimal-slope reconstruction
used by KloostermanSheavesAndBesselIsocrystals. `Suggested.lean` states nothing. Every headline
needs overconvergent F-isocrystals, `(φ,∇)`-modules with slopes or rigid cohomology, and neither
pinned library has these. The docstring lists each headline and the carriers it lacks.

## Roadmaps this one depends on that are still pull requests

- PadicDifferentialEquationsAndRigidCohomology (merge order line 121, before this roadmap at line
  239).

The other two roadmap suppliers are on main:

- AlgebraicCurves: Layer 12, sublayers 12A–12C and 12B.0b.
- RigidAnalyticGeometry: Layer 5.

The two open revisions of AlgebraicCurves (the dependency-loop cut and the SchemeAndStackFoundations
move) keep both cited ids at their heads:

- `## Layer 12`, `### 12C` and "12B.0b, whole-model geometric regularity";
- RigidAnalyticGeometry `## Layer 5: Čech comparison and acyclicity`.

So no citation depends on an open revision.

## Moved from the Lean to the README

Nothing. The package's `Suggested.lean` declared nothing; its docstring names all 31 headline
theorems and what each lacks at the pins. I checked whether any headline is statable at the pins
and found none:

- **MS.0.3(1)**, "`K^σ` is a finite extension of `ℚ_p`", could be stated, but it is an auxiliary
  lemma, not a headline.
- **MS.6.7**, the averaging step, is Mathlib's `Representation.averageMap` on a bare representation:
  free variables, not a headline.
- **Every other headline** needs `(φ,∇)`-modules with slopes, F-isocrystals, dagger hulls or rigid
  cohomology. Mathlib has none of these at `1b1ccf4`, and Tau Ceti has none at `2fd255d`. A grep for
  Robba, isocrystal, slope filtration and Frobenius lift in the dagger library found nothing usable.

The only Lean changes:

- the `module` header;
- one docstring clause naming Tau Ceti's Monsky–Washnitzer algebra among the rings that exist only
  as rings.

## Supplier replacements and duplication removals

**Supplier changes.**

- **Added Tau Ceti `TauCeti.Dagger.washnitzerAlgebra` and `TauCeti.Dagger.washnitzerAlgebra.pderiv`**
  (`TauCeti/RingTheory/Dagger/WashnitzerAlgebra.lean`, `TauCeti/RingTheory/Dagger/Derivative.lean`).
  They are the `K⟨x, y⟩†` that the MS.3.8 Check uses on `A²`. The README had written that ring by
  hand and now cites it in:
  - the Tau Ceti contract;
  - "Already in the library";
  - the MS.3.8 Check and *Needs*;
  - the Layer MS.3 Dependencies.
- **Moved Mathlib `WittVector.Isocrystal` and `WittVector.isocrystal_classification`** out of the
  supplier list into a sentence after it. They are not consumed: the Dieudonné–Manin inputs are the
  parent's §RD.1.32.

**Duplication.** No removal was needed. I searched by object, on main and across the open roadmap
pull requests (`roadmaps grep`), for each of: PBQ / pure bounded quotient, maximally bounded quotient,
dagger hull, minimal slope property and conjecture, log-growth filtration, saturated quotient,
Lefschetz condition, `Q̄_p`-F-isocrystals, Abe–Esnault, Ohkubo and Chiarellotto. Nothing outside
this roadmap owns these objects.

The closest roadmaps:

| Roadmap | Status | Relation to this roadmap |
| --- | --- | --- |
| PadicDifferentialEquationsAndRigidCohomology | parent, open | owns the foundations and is cited by section; every one of the 75 cited RD ids resolves at its head to a heading matching the claimed content, and RD.5.7, RD.5.8c, RD.6.28, RD.6.57, RD.6.85 and RD.1.72 were read in full |
| KloostermanSheavesAndBesselIsocrystals | open, later in the merge order | consumes MS.4.6 and is now named in "Downstream consumers" |
| CrystallineCohomology(PartII) | open | its `Sat` is the décalage saturation of Dieudonné complexes, a different object |
| PadicHodgeTheory | open | no overlap |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | open | no overlap |
| AdicSpacesPartIV | main | no overlap |

Ownership against open pull requests:

- The 234 checkouts and all 464 heads were checked with the roadmap tools.
- The parent is not in the checkout list, so I read its head with `roadmaps show`.
- No notion moved down from a later roadmap.

## Fixes made as an upstream reviewer would

1. **MS.6.7, wrong reading of Tsuzuki Lemma B.1.** The README glossed Lemma B.1 as
   `Tr ∘ ad = n · [L : K] · id`, with `L` the coefficient field of that section. In the source,
   Lemma B.1(1) is `n · deg(L/K)` with `L` the base extension (`K_m` in Proposition 7.15), which I
   checked in `TSU` line 2110. The formula gives the stated `m²` only when the coefficient field is
   `K_m`. The parenthetical now names the base extension `K′` and derives `m²` for `K′ = K_m`,
   `n = m`.
2. **MS.3.5, first Check.** The non-splitting argument "a splitting would reduce to `c^q − c = 1` in
   `k((t))`" had the wrong sign and ignored non-integral `c`. It is now the direct argument: a
   complement `e_2 + c·e_1` needs `c − φ(c) = 1`, but `c` and `φ(c)` have the same constant term
   because `σ = id` on `W(𝔽_q)[1/p]`. I added a control: over `𝔽̄_p` with the Witt Frobenius,
   `a_0 − σ(a_0) = 1` is solvable and the constant extension splits.
3. **`FixedPoints.subfield` contract.** "the fixed subfield of `ℕ` acting through the powers of `σ`"
   is not well typed, because the declaration needs a `Monoid` action. It now reads
   `Multiplicative ℕ`.
4. **Process wording.** "the statements that roadmap does not yet make" and the 30 mentions of
   "supplier request X" are rewritten in main's form `gap:X` (as in FlagVarieties, IndexTheory and
   BelyiMaps). The nine "What PadicDifferentialEquationsAndRigidCohomology must provide (gap:…)"
   contracts themselves are kept verbatim, as the accepted review requires.
5. **Summary.** Added the sentence saying where the parent roadmap stops, which the brief requires of
   a Part II.
6. **Downstream consumers.** Now names KloostermanSheavesAndBesselIsocrystals, which cites §MS.4.6.

## Signatures

`Suggested.lean` has no declarations, so there was no `#check @name` inventory of its own. Instead I
built a temporary version of the file importing the five Tau Ceti modules, with `#check @…` for
all 21 library declarations the README cites, then restored the final file and rebuilt it.

All 21 elaborated at the pins with the hypotheses the README states. For example:

- `Representation.averageMap` takes `[Fintype G] [Invertible (Fintype.card G : k)]`;
- `LinearMap.trace_one` takes `[Module.Free R M] [Module.Finite R M]`;
- `TauCeti.Dagger.weakCompletion` takes `[Algebra.FiniteType O S]`;
- `PowerSeries.HasGaussNorm.subring` takes `[IsUltrametricDist R]` and `Fact (0 < R₀)`;
- `FixedPoints.subfield` takes `[Monoid M] [MulSemiringAction M F]`, which led to fix 3.

No signature text changed except that wording fix.

## Unresolved

- **The nine supplier contracts are not stated by the parent at its head.** These are
  `gap:extended-log-robba-growth`, `gap:dejong-disc-robba-submodules`,
  `gap:unit-root-correspondence-perfect-base`, `gap:legendre-kummer-extension`,
  `gap:irreducible-iota-purity`, `gap:lefschetz-curves-irreducibility`,
  `gap:docile-curve-restriction`, `gap:coefficient-linear-weil-ii` and
  `gap:dejong-generic-affine-line-comparison`. Searches of the parent for `R̃_log`, log-growth,
  Abe–Esnault, coefficient-linear and Tsuzuki 1998 return nothing. The accepted review is
  conditional on them. I kept them as declared contracts in main's `What X must provide (gap:…)`
  form; they are requests to the parent, not targets here.
- **No suspicious instructions** were found in any text I read.

## Adversarial mathematics pass

Notation: `L_s` a constant rank-one object of slope `s`; `J` the logarithmic module (`∇e_2 = e_1 ⊗ dt/t`,
`φ(e_1) = q⁻¹e_1`, `φ(e_2) = e_2`, `φ(t) = t^q`); `f_1 : e_1 ↦ 0, e_2 ↦ 1`, `f_2 : e_1 ↦ 1, e_2 ↦ log t`.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1 (`q`-Frobenius) | `K = ℚ_p`, `σ = id`, `q = p` and `q = p²`; `K = ℚ_p(√p)`, `σ = id` | `a^p ≡ a` and `a^(p²) ≡ a` mod `p` on `ℤ_p`; residue field of `ℚ_p(√p)` is `𝔽_p`, so `a^p ≡ a` mod `π` | consistent | none |
| Conv. 4 (slopes) | eigenvalue `p` over `ℚ_p` (`q = p`); `p²` over `ℚ_p(√p)` (`q = p²`); `σ ↦ σ²` | `1/1 = 1`; `v_π(p²)/v_π(p²) = 4/4 = 1`; eigenvalues `1, p⁴` for `σ²`, `q = p⁴`: `(0, 4)/4 = (0, 1)` | consistent; parent RD.1.25/RD.1.35 measure `w(π) = 1`, matching the stated rescaling | none |
| Conv. 4 (duality) | `M = L_0 ⊕ L_1` | `S_min(M) = L_0`, `Top(M) = L_1`; `M^∨` has slopes `0, −1`, `Top(M^∨) = L_0^∨ = S_min(M)^∨` | consistent | none |
| Conv. 4 (Tate twist) | `O(1)`, `O(−1)` | Frobenius `q⁻¹`: slope `−1`; `q`: slope `1`; parent RD.3.25 line "Frobenius multiplied by `q^{-n}`" | consistent | none |
| Conv. 6 (solution Frobenius) | rank one, Frobenius `a`; unit object over `E` | `F(f)(a·e) = φ(1) = 1` ⇒ `F(f)(e) = a⁻¹`; `φ(E)` omits `t`, linearisation `φ^*E → E` bijective | consistent | none |
| MS.0.1 | `A¹ ⊂ P¹`, `G_m`, elliptic `Y ∖ {O}`; cuspidal cubic; `x_∞ = 1/x`; `x′ = x + p` | complements of size 1, 2, 1; `s ↦ (s:1:s³)` satisfies `y²z = s³ = x³`, complement `(0:0:1)` where all partials `−3x², 2yz, y²` vanish; `∂_x = −y²∂_y`, `∂_x(y⁻¹) = 1`; `dx′/dx = 1` | consistent | none |
| MS.0.2 | unit, zero, `J`, rank one `a` | dims `1, 0, 2 = rank`; `J`: `g_1' = 0`, `g_2' = g_1/(t+u)` gives `log(1+u/t)`, coefficient at `n = p^r` of norm `p^r`; `Σp^(−n)u^n` converges only for `r < 1/p` | consistent | none |
| MS.0.3 | `W(𝔽̄_p)[1/p]` Witt `σ`; `ℚ_p(√p)`, `σ = id`; `ℚ_p`, `σ = id`, `q = p²` | `K^σ = ℚ_p`, `K′ = K`; `K^σ = K`, slope of `√p` is `1/2`, twist `b = √p`; residue `𝔽_p ≠ 𝔽_(p²)`, so `K′ = ℚ_(p²)` with `σ′ = id` (the Witt Frobenius of `ℚ_(p²)` is not a `p²`-Frobenius: `a^p ≠ a^(p²)` in `𝔽_(p²)`) | consistent; (1) needs `ℚ_p ⊆ K^σ` (σ continuous, fixes `ℚ`), `e ≤ e(K/ℚ_p)`, `f ≤ s` | wording: the `FixedPoints.subfield` contract now names the monoid `Multiplicative ℕ` |
| MS.0.4 | `M† = E†`, `P = E`; `P = E²`; `M† = E†(−1) ⊕ E†(0)`, `P = E(0)`; `M† = 0`; ordinary rank two with `P = Top` | ranks `1 ≤ 1` equal; `1 < 2` (not spanning); projection kills `E†(−1)`, not injective, `λmax = 1 ≠ 0`; zero would get slopes `0` and `1`; `rank Top = 1 = rank P` while `f` has a rank-one kernel on `M` | consistent | none |
| MS.0.5 | unit, zero, `J` | `1ᵇ = 0`, `0ᵇ = 0`; `Jᵇ = E e_1` (annihilator of the bounded `f_1`), `B(J)` rank `1 = dim Sol_0` | consistent; submodules of bounded modules are bounded (restriction of solutions is onto), so the intersection argument holds | none |
| MS.0.6 | `J`; `E(−1) ⊕ E(0)` | `J`: `a = −1`, `b = 0`, `b − a = 1`, unbounded, nonsplit; split sum: `a = 1`, `b = 0`, `b < a` | consistent (first case is the HN direction: smaller slopes as sub) | none |
| MS.0.7 | `diag(1, q)`; `J`; rank one | `X = I`, `X = 2I` solve `Aφ(X) = XA`; unitriangular forces `φ(u) = qu`, `|φ(u)| = |u| > |q||u|` ⇒ `u = 0`; `J` nonsplit unbounded; `k(C)^perf ∩ k(C)_α = k(C)` because `y^p = f ∈ k(C)` forces `df/dx = 0`, `f ∈ k(C)^p` | consistent | none |
| MS.0.8 | `J` over any `B′`; `B′ = B`; bounded `M` | `B(B′ ⊗ J)` rank `1 = 1`; identity; `B′ ⊗ M` both sides | consistent | none |
| MS.0.9 | `0`, `L_0`, `L_1 ⊕ L_0`, `J` | `B` ranks `0, 1, 2, 1`, slope sets `∅, {0}, {1, 0}, {0}`: PBQ false, true, false, true | consistent | none |
| MS.0.10 | `L_1 ⊕ L_0`; `J`; empty family; `E(0)²` | quotient `L_0` has `λmax = 0 < 1`; quotients of `J` are `J`, unit, both `λmax = 0`; empty sum `0` (rank 0, not PBQ); one line and two lines both slope 0 | consistent | none |
| MS.0.11 | `U = 0`, `M` unit; `U` unit; `M = L_1 ⊕ L_0` | true ⇒ false fails forward; trivial; `B(M ⊗ U) = B(M) ⊗ U` keeps two slopes | consistent | none |
| MS.1.1 | `0`; `L_s`; `L_1 ⊕ L_0`; `J ⊕ L_1` | lengths `0, 1, 2`; grades' `λmax` `1 > 0` while nested `P_2` has `λmax = 1`; `J ⊕ L_1`: `P_1 = L_1`, `G_2 = J` | consistent | none |
| MS.1.2 | `L_1 ⊕ L_0`; `J`; `J ⊕ L_1` | `L_1 ⊕ L_0 = Top(G_1) ⊕ Top(G_2)`, rank 2; `B(J) = Top(J)`, rank 1; `B(J ⊕ L_1) = unit ⊕ L_1 = Top(L_1) ⊕ Top(J)`, rank 2 | consistent | none |
| MS.1.3 | `L_1 ⊕ L_0` over `E_η ⊂ E_α`; `J` | same grades and `B` ranks `2`, `1` | consistent | none |
| MS.1.4 | `E†(−1) ⊕ E†(0)`; irreducible rank one | descended `P_1 = E†(−1)`, rank 1, slope 1; one step | consistent | none |
| MS.1.5 | rank one over `K[[t]]₀`; CT11 Ex. 5.2(3)/5.11 (slopes `0, 1/2, 1`) | one step; first PBQ step spans `e_1, e_3` (rank 2, `λmax = 1`), quotient rank 1 slope `1/2` | consistent | none |
| MS.1.6 | constant; `log(1+u)`; `λ < 0`; unit over `E†` vs `E`; `J` over `E†`; constant disc module | growth 0; `|1/p^r| = p^r` so growth 1 not 0; class `0` by convention; `Sol_log` is `K·1` (dim 1 over `K`) vs `E^τ·1` (infinite over `K`); `Sol_log,0 = K f_1`, `Sol_log,1 = K f_1 ⊕ K f_2`; eigenvalue `a⁻¹` on both | consistent; `Fil_0 R = R^bd` because negative-index coefficients of a Robba element tend to 0 | none |
| MS.1.7 | `J`: `f_1`, `f_2` with `d = 1, 2` | `F(f_2)(e_1) = q`, `F(f_2)(e_2) = φ(log t) = q log t`: `c = q`, `μ = 1 ≤ 1 − 0`; `d = 2`: `c = q²`, `μ = 2v(q)/(2v(q)) = 1`; `f_1`: `μ = 0 ≤ 0` | consistent | none |
| MS.1.8 | `J` at `λ = −1, 0, 1` | `dim Sol_log,λ = 0, 1, 2`; `dim S_(≤λ)(Sol_log) = 0, 1, 2` (`λmax = 0`) | consistent | none |
| MS.1.9 | rank one `a`; isoclinic; `diag(1, q)` | solution eigenvalue `a⁻¹`, `L_0` Frobenius `a`; `L_0 = M_0`; `Sol_0` slopes `0, −1` (not PBQ, excluded) | consistent | none |
| MS.2.1 | `0`, unit, `L_1 ⊕ L_0` on a curve | generic `B` ranks `0, 1, 2`; PBQ false, true, false | consistent | none |
| MS.2.2 | `Σ p^n x^(p^n)` on `G_m`; `A¹`; rank-one free; `y² = x³ − x` over `𝔽_5` | at `0`: `p^(−n) r^(p^n) → 0` for `r < 1` (in `E†_0`); at `∞`: `p^(−n) r^(−p^n) → ∞` (not in `E†_∞`); `1/x` has order `−1` at the origin; `(0, 0)` has `y = 0`, order 2, `2 | 5 − 1` | consistent | none |
| MS.2.3 | slope-one constant line; `L_η = M_η`, `0`; rank-one sub of rank two | twist by `q⁻¹`: `q·q⁻¹ = 1`, slope 0; glued ranks `2`, `0`; kernel of `m ↦ m ∧ e_1` is `span(e_1)`, rank 1 | consistent | none |
| MS.2.4 | two copies; slopes 1 and 0; empty family; constant quotient of the log object | PBQ, not PBQ, `0` not PBQ, unit PBQ slope 0 | consistent | none |
| MS.2.5 | `L_1 ⊕ L_0`; irreducible | grades `1 > 0`, length 2; length 1 | consistent | none |
| MS.2.6 | Artin–Schreier `y^p − y`, `p = 2, 3`; identity | derivative `−1` (étale), degree `p`; `f^*O = O`, `f_*O` rank `p` slope 0 (PBQ); `f^*f_*M → M` onto (counit) | consistent | none |
| MS.2.7 | `L_1 ⊕ L_0`; irreducible; ordinary Legendre locus | `B_C = M`; `B_C = Top`; `Top(L|_U)` rank 1 slope 1, no overconvergent structure (irreducibility of `L†|_U`) | consistent | none |
| MS.2.8 | `p = 5, 13` (`≡ 1 mod 4`), `p = 3, 7` | `5 = 1² + 2²`: `π_p = 1 + 2i`, `π_p² = −3 + 4i`, `p²/π_p² = −3 − 4i`, both of modulus `5 = p`, distinct; slopes `0` (unit) and `2`; `p ≡ 3 mod 4`: `π² = −p`, slope 1 | consistent | none |
| MS.2.9 | unit; `O(−1) ⊕ O(0)`; zero; unit-root line `H` on the ordinary locus | lengths `1, 2, 0, 1`; `H` has generic and pointwise rank 1, `B(H_η) = H_η`; nested terms both `λmax = 1` | consistent | none |
| MS.3.1 | rank one; zero; `E†(−1) ⊕ E†(0)`; irreducible | injective; injective from `0`; kernel `E†(0)` (rank 1); kernel is a `(φ,∇)`-submodule, so `0` | consistent | none |
| MS.3.2 | `E† → E`; `E† → E²`; `(a, b) ↦ a + αb` | quasi-saturated; `E`-span rank `1 < 2`; injective on `(E†)²`, `E`-linearisation `E² → E` has kernel rank 1 | consistent | none |
| MS.3.3 | projection `E†(−1) ⊕ E†(0) → E(0)`; inclusion `E† → E`; `N† = 0` | not injective, `1 ≠ 0`; rank `1 = 1`; second assertion: `0 ≥ 0` | consistent; the `≥` is weaker than MS.0.4's equality, not in conflict | none |
| MS.3.4 | isoclinic; `0`; `E†(−1) ⊕ E†(0)`; Legendre | `Sat = M†`; `Sat(0) = 0`; `Sat = E†(−1)` rank 1; `Sat` rank 2 with top rank 1 | consistent | none |
| MS.3.5 | unipotent `[[1,1],[0,1]]` over `k = 𝔽_q`; `E†(−1) ⊕ E†(0)`; isoclinic irreducible | complement `e_2 + c e_1` needs `c − φ(c) = 1`; constant terms `a_0 − σ(a_0) = 0 ≠ 1` (`σ = id`); over `𝔽̄_p` with Witt `σ`, `x^p − x + 1` has roots and the extension splits | conclusion right, printed reduction (`c^q − c = 1` in `k((t))`) had the wrong sign and skipped the non-integral case | Check rewritten with the constant-term argument and the `𝔽̄_p` control |
| MS.3.6 | identity on `E†(−1) ⊕ E†(0)`; graded scalars `2, 3` | recovered `diag(1,1)`; `diag(2,3)`; nested `Top(P_2)` has slope 1 against a slope-0 summand | consistent | none |
| MS.3.7 | `h = 0`; isoclinic identity; `J` vs unit | no iso; `g = id`; tops rank `1 = 1`, ranks `2 ≠ 1` (`J` not saturated) | consistent | none |
| MS.3.8 | constant `O(−1) ⊕ O(0)` on `A²` over `K⟨x,y⟩†`; projection to `O(0)`; Legendre | image `A†e_1`, Frobenius `q`, kernel `A†e_2`; image `A†e_2`, Frobenius 1; image rank 2 inside rank-1 `Γ(U, P)`; `x` vanishes at the origin, non-unit; `A† ⊗_(φ,A†) Â ≅ Â` for `φ(x) = x^q` (basis `1, …, x^(q−1)` on both) | consistent | `K⟨x,y⟩†` now cited as Tau Ceti `TauCeti.Dagger.washnitzerAlgebra (Fin 2) K` |
| MS.3.9 | fold map `X ⨿ X → X`; log object, Legendre–Kummer, `O(−1) ⊕ O(0)` | each piece saturated, `f_*N = O(−1) ⊕ O(0)` has kernel `O(0)`; (PBQ, sat) = (T, F), (F, T), (F, F) | consistent (connectedness of `Y` is in the statement) | none |
| MS.3.10 | rank one; `0`; slopes 1, 0 | `Sat_X = M`; `0`; rank 1 | consistent | none |
| MS.4.1 | Legendre on `U`; constant `O(−1) ⊕ O(0)` → `O(0)` on `G_m` | `rank Top(N) = 1 = rank P` (hypothesis not met); `λmax = 1 ≠ 0` and dagger sections of `O(−1)` killed | consistent | none |
| MS.4.2 | `N = P` isoclinic; Legendre; projection; `J`; `P = 0` | `1 = 1`; `λmax = 1 = slope P`, `rank Top = 1 = rank P` (rank `N = 2`); kernel rank 1, `1 ≠ 0`; kernel slope `−1` line; `0` has no slope | consistent | none |
| MS.4.3 | rank one; `O(−1) ⊕ O(0)`; `J` on `G_m` | (PBQ, sat, top irr.) = (T,T,T), (F,F,T), (T,F,T); irreducible T, F, F | consistent | none |
| MS.4.4 | identity on `O(−1) ⊕ O(0)` | identity | consistent | none |
| MS.4.5 | `J` (`a = −1 < b = 0`); split `O(1) ⊕ O`; Legendre–Kummer (`a = 1 > b = 0`, rank 3) | `J` PBQ, not saturated (`L† ⊂ ker`, `Hom(L, Top) = 0` as slopes `≤ a < b`); split not PBQ; rank-3 nonsplit saturated, not PBQ; rank 2 with `a > b`: split ⇒ `Top = L`, kernel `N ≠ 0`, not saturated | consistent | none |
| MS.4.6 | `h = c·id`, `c = 2`; `J` vs unit; proper `C` | lift `2·id`; tops iso, ranks `2 ≠ 1`; irreducible slope-filtered on proper `C` is isoclinic | consistent | none |
| MS.4.7 | `O(−1) ⊕ O(0)` with quotient `O(0)` | kernel slope `1 > 0`: pointwise hypothesis fails | consistent | none |
| MS.4.8 | `a : S_min(M) → S_min(N)` | `a^∨ : Top(N^∨) → Top(M^∨)`; MS.4.6 gives `N†^∨ → M†^∨`; dual `M† → N†` (direction of `a`); `O(1)^∨ = O(−1)`, slopes `−1 ↦ 1` | consistent | none |
| MS.5.1 | `0`; `L_0 ⊕ L_1`, `N = L_1`; ordinary rank two, unit-root `N` | hull `0`; hull `L_1` rank 1 (not `M`, rank 2); hull rank 2 (no overconvergent rank-one sub of an irreducible object) | consistent | none |
| MS.5.2 | `N = 0`; `L_0 ⊕ L_1` | `0 = 0`; `S_min(N) = L_1 = S_min(Hull)`, `S_min(M) = L_0`; `N ∩ S_(≤s)(M)` is pointwise isoclinic (polygon above the segment with equal endpoints and slopes `≤ s`) | consistent | none |
| MS.5.3 | `n = 1`; unit, `N = 0`, `n = 2`; `L_0 ⊕ L_1` with `F²` eigenvalues `1, q²` | `M′ = M`; `S_min(M′)` rank 2, `S_min(N′)` rank 0; `F` on induced `L_1`: `T² − q²`, eigenvalues `±q`, slope 1; slopes `(0,0,1,1)`, first step rank 2 | consistent | none |
| MS.5.4 | `N = 0`; `N = M`; `N = E(0)` in `E†(−1) ⊕ E†(0)` | `Q† = 0`; `Q† = (M†)^∨`; `Q† = E†(0)^∨`, hull rank 1 | consistent | none |
| MS.5.5 | `E†(0) ⊕ E†(−1)`, `N = M` | `N′ = E(0)`, `H′ = E(0)`, `H/H′ = E(−1)` of slope `1 > 0`, `S_min(H) = E(0)` | consistent | none |
| MS.5.6 | Artin–Schreier, `p = 2, 3`; `C = A¹` | étale (derivative `−1`), wild at `∞`; identity | consistent | none |
| MS.5.7 | ordinary rank two; proper `C`; route via MS.4.2 | `rank S_min(Hull) = 1 = rank N`; kernel `K` of `Γ(M†^∨) → Γ(N^∨)` gives the dagger-extendable `(M^∨/K)^∨ ⊇ N`, so `K = 0` by minimality; MS.4.2 gives `rank Top(M^∨) = rank N`, so `N = S_min(M)` | consistent | none |
| MS.5.8 | `P²_(𝔽_(p²))` over `𝔽_p`, a line; Dwork pullback to `A²`, line `x = 0` | `H⁰ = K_2` on both, dims `2 = 2`; `H⁰(A², E) = 0` vs `H⁰(C, unit) = K`: `0 ≠ 1`, `E` not docile | consistent | none |
| MS.6.1 | `X = A¹_(𝔽_p)`, origin, `C = A¹_(𝔽_(p²))` | fibre `Spec 𝔽_(p²)`: 0 `𝔽_p`-points; identity curve: 1 | consistent | none |
| MS.6.2–6.4 | identity; split `M ⊕ L`; unit-root `N = M`; `N = M` of slope 1 | surjection `id`; `Q† = M†|_C`; `id`; conclusion "unit-root" fails for slope 1 (hypothesis needed) | consistent | none |
| MS.6.5 | `L = K`; `M ⊗_K L`; `θ` on `Spec 𝔽_3`, `L_2 = ℚ_3(√5)`; coefficient unit, `α` of degree 2 | rank `r/[L:K]` vs `r`; `End = ℚ_3` vs `L_2`; ordinary fibre `L²`, `Tr F² = 2`; projected fibre `L`, trace 1 | consistent | none |
| MS.6.6 | `Spec 𝔽_q`, `L(λ)`, `n = 1, 2`; non-normal cubic | `|X(k_n)| = 1`; `λ^n = λ^n`; ordinary fibre gives `nλ^n` (`2λ² ≠ λ²`); `L ⊗_K L ≅ L × L′` with `[L′:L] = 2` | consistent | none |
| MS.6.7 | `m = 1, 2`; `L²` idempotents; Tsuzuki Lemma B.1 | `Av = id`; `Av(f) = (f + Tf)/2`; traces `1` and `2`, totals `2` vs `4`; Lemma B.1(1) reads `Tr ∘ ad = n·deg(L/K)` with `L` the base extension: `m·m = m²` for `(K_m, σ^m)/(K, σ)` | README wrote `n·[L:K]` with `L` the coefficient field: equals `m²` only when `L = K_m` | parenthetical rewritten with `K′` the base extension |
| MS.6.8 | `X` a curve, `i = id`; unit, connected `Y`; fold map | endomorphism case of MS.4.6; `Q̄_p → Q̄_p` identity; diagonal `a ↦ (a, a)` misses `(1, 0)` | consistent | none |
| MS.6.9 | `Spec 𝔽_3`, Frobenius 2; `L = ℚ_3(√5)`, `a = (1+√5)/2` | weight `2 log_3 2 ≈ 1.262`; `T² − T − 1` at `0, 1, 2` gives `2, 2, 1` mod 3 (irreducible); `5 ≡ 2` not a square mod 3; `|a| = 1.618…`, `|1 − a| = 0.618…`, weights `±0.876…`; `N(a) = −1` | consistent | none |
| MS.6.10 | `N = M`; constant `a ≠ b` on a point; `ι(a) = 2i`, `ι(c) = 4` | pole from identity; `(1 − at)⁻¹ ≠ (1 − bt)⁻¹`; `q^w = 4`, `ι(c/a) = −2i`, `(1 − 2it)(1 + 2it) = 1 + 4t²`; terms `H^j_c`, `j < 2d`, have `|ι| ≤ q^(j/2) < q^d` | consistent | wording: Check now names `gap:coefficient-linear-weil-ii` |
| MS.6.11 | `N = M`, `h = id`; `m = 1`; direction of `τ` | identity; `g′ ∘ τ` defined over `X`; `Top(g′)⁻¹ ∘ h : Top(N) → Top(N)`, `π^*g′ ∘ τ` induces `h` | consistent | none |
| MS.6.12 | `M = N`, `h = c·id`, `c = 1`, `c′ = 2`, `c′ = 0` | two isomorphisms, one inducing `h`; `0` not an isomorphism | consistent | none |
| MS.6.13 | rank one; curves | nonzero `h` is an isomorphism (full faithfulness); implied by MS.4.6(i) | consistent | none |
| MS.6.14 | `Top(g′)(e_N) = 2e_M`, `h(e_N) = 3e_M` | `h ∘ Top(g′)⁻¹ = 3/2` on `Top(M)`, inverse `2/3`; `(3/2)·2 = 3` recovers `h` | consistent | none |
| `gap:coefficient-linear-weil-ii` | parent RD.6.28 (strong vs weak mixedness), RD.6.57, RD.6.85 | the contract uses the pointwise inequality `|ι(·)| ≤ q^(wd/2)`, i.e. the parent's weak mixedness, for the `L`-linear Frobenius; MS.6.10 uses it at `w = 0` | consistent with its use | none (supplier contract kept as accepted) |


Pull request: #2300 (roadmap/padic-differential-equations-and-rigid-cohomology-part-ii at cb67927)
