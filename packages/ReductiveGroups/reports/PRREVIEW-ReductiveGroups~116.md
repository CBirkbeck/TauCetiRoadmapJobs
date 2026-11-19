# Review of ReductiveGroups (pull request #2530 at 339f91a)

**Verdict:** needs changes

**Summary.** The verdict is needs changes, for two findings in the new §§9B.5–9B.6. The first is mathematical: §9B.6's structure target says `O(q)/SO(q) ≅ ℤ/2ℤ` for every even rank, which is false in rank 0, where the same section sets `SO(q) = O(q)` to be the trivial group. The second concerns the plan. §9B.5 now takes its `GSp₂ₘ` carrier from ArithmeticGaloisRepresentations §7.3, but that section's own *Needs* line cites ReductiveGroups Layers 0, 2 and 9, so the two roadmaps on main now supply each other. All three findings of the previous round, and its corrections and notes, are repaired. There are three small corrections and two format notes, and nothing is left for a human to decide.

## R01 (P2) — §9B.6 states `O(q)/SO(q) ≅ ℤ/2ℤ` for every even rank, but in rank 0 the section's own definition makes the quotient trivial

An implementer asked to prove the structure target would have to prove a false statement in rank 0. The *Structure* paragraph (line 4953) asks to prove, for nondegenerate `(V, q)` of rank `l`, that "for `l` even, `O(q)/SO(q) ≅ ℤ/2ℤ`". Six lines earlier (line 4947) the Dickson paragraph defines "`SO(q) = O(q)`, the trivial group, for `l = 0`". So for `l = 0` the quotient is the trivial group, not `ℤ/2ℤ`. The Dickson invariant itself is introduced only for `l = 2n ≥ 2`, and Conrad's Remark C.2.12 (conrad-rgs line 13084, p. 318) is a statement about even rank `n ≥ 2`, since Appendix C works in rank at least 1 throughout.

Smallest change: write "for even `l ≥ 2`, `O(q)/SO(q) ≅ ℤ/2ℤ`".

## R02 (P2) — §9B.5 makes ReductiveGroups and ArithmeticGaloisRepresentations supply each other

The project allows supply in one direction only, so this revision cannot keep both citations. ArithmeticGaloisRepresentations already consumes this roadmap. Its supplier contract (`TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, lines 597–599) takes ReductiveGroups Layers 0, 2, 3, 6 and 9, and the *Needs* line of its §7.3 (line 4633) ends "`TauCetiRoadmap.ReductiveGroups` layers 0, 2, 9". This revision adds the reverse edge in five places:
- the supplier contract *From TauCetiRoadmap.ArithmeticGaloisRepresentations* (lines 1205–1211);
- the `GSp₂ₘ` carrier sentence of §9B.5 (lines 4872–4874);
- the *Needs* lines of §9B.5 (line 4903) and §9B.8 (lines 5133–5134);
- the Layer 9 dependencies (line 5389).

So, at the granularity both *Needs* lines declare, AGR §7.3 waits on Layer 9 while §9B.5, which is part of Layer 9, waits on AGR §7.3. The README on main cites ArithmeticGaloisRepresentations nowhere. None of this roadmap's other roadmap suppliers cites ReductiveGroups back: SchemeAndStackFoundations, ModularCurves, LefschetzPencilsAndVanishingCycles and DeformationAndDerivedPatchingAlgebra do not.

Smallest change: move the object down into this roadmap, the earlier owner.
- §9B.5 would construct `GSp₂ₘ` itself. It is the closed subgroup scheme of `GL₂ₘ × 𝔾_m` of pairs `(h, r)` with `hᵀ J h = r J` for `J = −Matrix.J`, cut out by its Hopf ideal as `TauCeti.ConstantForm` does. §9B.6 already does the same for `GO(q)`.
- AGR §7.3 would then be dropped from the two *Needs* lines, the Layer 9 dependencies and the supplier contracts.
- The scope paragraph (line 22) would say that ArithmeticGaloisRepresentations §7.3's *SimilitudeGroup.GSp* is this group and a consumer of §9B.5. It already says this of AutomorphicLFunctionsAndLocalFactorsPartII §0.0.

ArithmeticGaloisRepresentations then cites §9B.5 when it is next revised.

## C01 — "Spin(q) is the derived group of GSpin(q)" also reads as a claim for `l ≤ 2`, where it fails

The *Structure* bullet of §9B.7 (line 5063) reads: "`Spin(q)` is the derived group of `GSpin(q)`, semisimple and simply connected for `l ≥ 3`". It can be read with "for `l ≥ 3`" qualifying only the last two properties. Read that way, the derived-group clause is false for `l ≤ 2`:
- for `l ≤ 1`, `GSpin = 𝔾_m` has trivial derived group, while `Spin = μ₂`;
- for `l = 2`, `GSpin₂ = 𝔾_m × 𝔾_m` has trivial derived group, while `Spin₂ ≅ 𝔾_m`.

Conrad makes the same point for rank two (conrad-rgs line 13896, p. 338). Writing "For `l ≥ 3`, `Spin(q)` is the derived group of `GSpin(q)` and is semisimple and simply connected" removes the ambiguity.

## C02 — The smoothness route's fppf-local triviality step names no supplier

The route for `SO(q)` (lines 4964–4965) reduces to the split form because "every nondegenerate `(V, q)` of rank `l ≥ 1` is fppf-locally isomorphic to `(Rˡ, q_l)`". It cites only Conrad, Lemma C.2.1 (conrad-rgs line 12685, p. 309), and no target, supplier section or pinned declaration provides the step. LefschetzPencilsAndVanishingCycles §2.1, already a supplier here, has the étale-local normal form theorem: `Σ x_i x_{i+m}`, plus `λx²` with `λ` a unit in odd rank. Adjoining `√λ`, an fppf cover, then gives `q_l`. Adding "and its étale-local normal form" to the §2.1 entry in the *Needs* line (line 4996) and in the supplier contract (lines 1213–1220) would cover the step.

## C03 — The spinor-norm clause of §9B.7 is stated for every field, but its supplier excludes characteristic two

Line 5059 says that for a field `F`, "`Spin(q)(F) → SO(q)(F)` has image the kernel of the spinor norm (Completed/OrthogonalSpinGroups)". That roadmap excludes characteristic two (`Completed/OrthogonalSpinGroups/README.md`, lines 83–84), so a reader working over a field of characteristic two has no spinor norm to apply.

Two repairs would work:
- restrict the clause to `F` of characteristic not two;
- or define the spinor norm of `g ∈ SO(q)(F)` as `ν(h)` modulo `F^{×2}` for any lift `h ∈ GSpin(q)(F)`. The bullet's own Hilbert 90 clause provides the lift. With this definition, the statement holds in every characteristic and follows from `(𝔾_m × Spin(q))/μ₂ ≅ GSpin(q)`.

## N01 — `VanishingCycles.lisseMonodromyEquiv` (Layer 9D, line 5489) is in code font but is declared nowhere at the pins

It is a name proposed by EtaleCohomologyFoundations, so it could be italicized or labelled as that roadmap's proposal, as is now done for *SimilitudeGroup.GSp*.

## N02 — "the similitude Dickson invariant" on `GO(q)` (line 4948) is used without a definition

One clause would make `GSO(q)` something an implementer can write down. A similitude with multiplier `c` induces an automorphism of `C₀(q)` by `vw ↦ c⁻¹ g(v) g(w)`, and hence an automorphism of `Z(q)`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Previous R01: §9B.7 field points (line 5041, "Over a field `K` of characteristic not two and for `l ≥ 1`") | `q = ax²` over `ℚ`; rank 0 | `GPin(K) = K^× ∪ K^×e` = Lipschitz group; rank 0 now excluded (`K^×` against `{1}`) | repaired | none |
| Previous R02: §9B.7 structure and centre (lines 5061–5064, 5095–5101) | `l = 4` in characteristic 2; `l = 5`; `l ≤ 1` | roots force `a₁ = a₂ = ζ`, `ζ² = 1`, so `𝔾_m × μ₂`, connected and nonreduced; `ε_n` forces `a_i = 1`; `Spin = μ₂` | repaired | C01 for `l = 2` |
| Previous R03: overlap with other roadmaps (lines 26–31, 6673–6680) | LefschetzPencils §§2.1–2.2; QuadraticFormsOverABase; OrthogonalTamagawaAndLatticeMass; ClassicalGroupsPartII | Lefschetz cited at lines 1213–1220 and 4996–4998; the others named as consumers; the rank-0 Spin difference stated | repaired on this side | none |
| §1.1 invariants (jantzen-1985 §2.10(1)–(2), line 1216, p. 41) | `μ_p` over `𝔽_p`, weight-one line | `𝔽̄_p`-points act trivially, but `t ≠ 1` in `𝔽_p[t]/(t^p − 1)` gives invariants 0; the universal point detects this | holds | none |
| §1.1 Hochschild complex | `ℤ[t^±1]`, weight one; trivial group | `d⁰(1) = 1⊗(t−1)`; `d¹` gives `t⊗t − t⊗1 − t⊗t + 1⊗1 + t⊗1 − 1⊗1 = 0`; trivial group gives `0, id, 0` | holds | none |
| §1.1 enough injectives (jantzen-1985 §3.9, line 1688, p. 60) | trivial group, `M = ℤ` | cofree `ℤ` is acyclic; `2ℤ → ℤ`, `2 ↦ 1` does not extend, so `ℤ` is not injective | holds | none |
| §1.1 induction Checks | `C₂ ⊂ S₃`; unit map `ℤ → ℤ[t^±1]` | rank `3 = |S₃/C₂|`; inverse of the coset `C₂(123)` is `(132)C₂`; weight one gives 0, trivial gives `ℤ` | holds | none |
| §8.1 split data (conrad-rgs Def. 5.1.1, line 5651, p. 136) | `GL(R ⊕ L)` with `L` not free; `SL₂` over `𝔽₂` | weights `±(e₁ − e₂)` constant; root spaces `L`, `L∨` not free; centre `μ₂` of length 2 | holds | none |
| §8.2 pinnings (conrad-rgs Def. 6.1.1 and Rem. 6.1.2, lines 7725–7751, pp. 186–187) | `SL₂` over `ℤ`; `Spec(k × k)`; `x_α(2t)` over `𝔽₂` | `Φ⁺ = Δ = {α}`; `B⁺` and `B⁻` on the two components give signs `(+, −)`; twice a generator is 0 | holds | none |
| Half-discriminant | `x²`; `z² + xy` on `R³` | Gram `(2)`, `disc′ = 1`; `det [[0,1,0],[1,0,0],[0,0,2]] = −2`, `disc′ = −1` | holds | none |
| §9B.5 `Sp` presentation | `m = 0, 1` | `Pf(XJXᵀ) = det X · Pf(J)`, `Pf(J) = ±1`, so `det X = 1`; `m = 0` gives `ℤ`; `XJXᵀ = det(X)J` | holds | none |
| §9B.5 GSp torus in the carrier `[[0, I], [−I, 0]]` | `diag(2,1,1/2,1)`, `diag(2,2,1,1)`, `diag(2,1,2,1)` | condition `d₁d₃ = d₂d₄ = ν`; values `ν = 1`, `ν = 2`, and `4 ≠ 1` | holds (previous C02 repaired) | none |
| §9B.5 `(𝔾_m × Sp)/μ₂ ≅ GSp` | `ℚ`-points; kernel | `ν = 2` is not a square, so outside `𝔾_m(ℚ)Sp₄(ℚ)`; kernel `{(ζ, ζ)} = μ₂` | holds (previous C01 repaired) | none |
| §9B.5 GSp carrier supply | AGR README 597–599 and 4633; this README 1205, 4903, 5133, 5389 | AGR §7.3 needs Layers 0, 2, 9; §9B.5 needs AGR §7.3; main's README had no AGR citation | mutual supply | R02 |
| §9B.6 `x_{ε₁}(a)` in `SO(q₃)` | `q₃ = x₁x₃ + x₂²` | `(x₁ + 2ax₂ − a²x₃)x₃ + (x₂ − ax₃)² = x₁x₃ + x₂²` | holds | none |
| §9B.6 comparison with `SO_3^J` | `δ = diag(2,1,1)` | `q₃(δx) = 2x₁x₃ + x₂² = 2q_J`; `δ⁻¹xδ` has rows `(1,a,−a²/2)`, `(0,1,−a)`, `(0,0,1)`, preserving `q_J` | holds | none |
| §9B.6 Checks over `𝔽₂` | `x²` (`l = 1`); `xy` (`l = 2`) | `b_q = 0`, so `GL₁` against `μ₂`; `O(xy)(𝔽₂) = {1, s}`, `det s = 1`, `D_q(s) = 1` | holds | none |
| §9B.6 `O(q)/SO(q) ≅ ℤ/2ℤ` for even `l` | `l = 0`; `l = 2` | `l = 0`: `O = SO = 1`, quotient trivial; `l = 2`: `O₂ = 𝔾_m ⋊ ℤ/2`, quotient `ℤ/2` | false at `l = 0` | R01 |
| §9B.6 smoothness route (conrad-rgs proof of C.1.5, lines 12559–12663, pp. 306–308) | dimensions for even and odd `l` | `l² − l(l−1)/2 = l(l+1)/2` = dimension of forms; `l² − 1 − l(l−1)/2` = dimension of the `disc′` level set | holds; normal form has no named supplier | C02 |
| §9B.7 rank-4 Check over `𝔽₂` | `q₄ = x₁x₄ + x₂x₃`, all of `GL₄(𝔽₂)` | `|O| = 72`, `|SO| = 36`, 6 vectors with `q = 1`, reflections generate 36, even products 18; `GSpin₄(𝔽₂)` has 36 | holds | none |
| §9B.7 coroots and `Υ` | `l = 2n + 1`; `l = 2n` | `s⁻¹u_n(s²)`: `ν = 1`, pairing with `ε_n` is 2; `Υ` pairs 0 with simple coroots and 2 with `ε₀∨`; matches asgari-shahidi lines 203–216 | holds | none |
| §9B.7 Spin is the derived group | `l = 0, 1, 2` | `GSpin = 𝔾_m`, `𝔾_m²`, derived group 1; `Spin = μ₂`, `𝔾_m` | holds only for `l ≥ 3` | C01 |
| §9B.7 spinor norm on points | `F` of characteristic 2 | supplier excludes characteristic 2 (its lines 83–84); a GSpin lift `h` exists, and `ν(h)` modulo squares works in every characteristic | supplier scope | C03 |
| §9B.7 `Spin₀ = Spin₁ = μ₂` | cai-friedberg-kaplan §1 (lines 254–293); conrad-rgs line 14198, p. 345 | CFK: `GSpin₀ = GL₁`, `Spin = ker Υ` with `⟨Υ, e₀∨⟩ = 2`, giving `μ₂`; Conrad sets `Spin := μ₂` for `n = 1` | holds | none |
| §9B.8 low rank | `GSpin₃`; `GSpin₆` | `dim C₀(q₃) = 4 = dim GSpin₃`, `ν = det`; `λ ↦ (λI₄, λ²)`, `det = λ⁴ = (λ²)²` | holds | none |
| §9B.8 dual data | `GSpin_{2n}`; `n = 1` | coroots `ε_i∨ − ε_j∨`, `ε_i∨ + ε_j∨ − ε₀∨` = GSO roots for torus `diag(t, c t⁻¹)`; `GL₂` self-dual; matches hundley-sayag Def. 4.3 | holds | none |
| `isIso_coinvariantsQuotient_of_isNormal` | `N = G`; `N = 1`; `μ_p ⊂ μ_{p²}` | coinvariants `k`; `O(G)`; `k[t^p]/(t^{p²} − 1) ≅ O(μ_p)`, free of rank `p` below `O(μ_{p²})` | holds | none |
| `orbit_locallyClosed` | `𝔾_m` acting on `𝔸¹` at 1 and at 0 | orbit `D(t)` open; `{0}` closed | holds | none |
| `linearlyReductive_iff_reductive_identityComponent` | `ℤ/2`; `𝔾_a` in characteristic 0 | T ↔ T (`G°` trivial); F ↔ F | holds | none |
| `linearlyReductive_iff_torus` | `𝔾_m`; `SL₂` in characteristic `p` | T ↔ T; F ↔ F (`⟨x^p, y^p⟩ ⊂ Sym^p k²` has no complement) | holds | none |
| `exists_levi_complement` | `𝔾_a ⋊ 𝔾_m`; `𝔾_a` | Levi `𝔾_m`; trivial Levi | holds | none |
| `exists_conjugate_eq_of_isMaximalTorus` | diagonal torus of `SL₂` and a conjugate; `μ_p` | conjugating element `I + E₁₂`; maximal torus trivial | holds | none |
| `exists_titsSystem_of_isBorel` | `GL₂(𝔽₂)` | `|B| = 2`, `|BwB| = 4`, total `6 = |GL₂(𝔽₂)|` | holds | none |
| `exists_levi_complement_of_isParabolic` | `P = B ⊂ GL₂`; `P = G` | Levi `T`; Levi `G` | holds | none |
| `lang_surjective` | `𝔾_m` over `𝔽₃`; `𝔾_a` over `𝔽₂` | `g ↦ g²` onto `𝔽̄₃^×`; `a² − a = c` solvable in `𝔽̄₂` | holds | none |
| `plane_braid` | `n = 0, 1, 2` | `Fin (n − 1)` empty and groups trivial for `n ≤ 1`; for `n = 2`, `π₁ = ℤ = B₂` and the half-twist maps to `σ₀` | holds | none |
| `nonempty_mulEquiv_artinGroup` | `A₁` on `ℂ`; empty `ι` | `ℂ^×/±1 ≅ ℂ^×` via `z²`, `π₁ = ℤ = Artin(A₁)`; empty: `N` contractible, both trivial | holds | none |

- Source locators checked against the text, 41 in all:
  - jantzen-1985 §§2.8, 2.10, 3.9, 4.2, 4.14–4.16 (printed pp. 36, 41, 60, 69, 77–79a);
  - conrad-rgs Defs. 5.1.1 and 6.1.1, Rem. 6.1.2, Props. C.1.4, C.2.2, C.2.8, C.3.1, C.3.5, C.4.6, C.4.10, Thms. C.1.5 (with its proof), C.2.11, Rem. C.2.12, Lemmas C.2.1 and C.4.1, Cor. C.3.2, (C.4.1), pp. 338 and 345, Exs. C.6.2, C.6.3, C.6.5, C.6.6;
  - asgari-shahidi Def. 2.1 (pp. 5–6);
  - cai-friedberg-kaplan §1 (pp. 6–8);
  - hundley-sayag §§4.1–4.2, Lemmas 4.1–4.2, Def. 4.3 (pp. 11–12).
- Library declarations opened at the pins:
  - Mathlib: `AlgebraicGeometry/Morphisms/SmoothFiber.lean:34`, `CliffordAlgebra/SpinGroup.lean:65, 128, 194, 332`, `QuadraticForm/Radical.lean:115`, `QuadraticForm/TensorProduct.lean:40, 128` (`baseChange` assumes `2` invertible);
  - Tau Ceti: `Lipschitz/CliffordGroup.lean:140` (hypotheses `[Invertible 2]`, `Nondegenerate`, a unit value), `QuadraticForm/OrthogonalGroup/Basic.lean:190, 409`, `ConstantForm/Basic.lean:324`, `Symplectic/Basic.lean:120`, `GeneralLinearGroup/Symplectic/Basic.lean:245`, `Pinning/Isomorphism.lean:102`, `SplitTorus/Maximal.lean:125`, `Spin/Polarization/Split/Odd.lean:55`, `CartanDieudonne/Basic.lean:651`, `SpecialOrthogonal/Smooth.lean:100`;
  - 30 further names of the Tau Ceti supplier bullets, each found under its stated namespace.
- Cross-roadmap citations resolved:
  - on main: LefschetzPencilsAndVanishingCycles §§2.1–2.2 (README lines 1491–1606); DeformationAndDerivedPatchingAlgebra §3.3 (lines 603–624); ArithmeticGaloisRepresentations §7.3 (lines 4613–4633) and its supplier contract (lines 590–603); Completed/OrthogonalSpinGroups (lines 75–84, 775–783); SchemeAndStackFoundations §2.11;
  - at their open heads: OrthogonalTamagawaAndLatticeMass §0.1 (rank-0 Spin trivial, line 137); ClassicalGroupsPartII CG.0.2 and CG.0.4 (characteristic zero, torus `diag(z, t z⁻¹)`); QuadraticFormsOverABase scope (lines 33–122).
- Automatic checks: all pass. The dependency check printed `depcheck: 200 roadmaps, 2231 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line; the two-roadmap edge of R02 was found by reading both *Needs* lines. The pull request changes only `TauCetiRoadmap/ReductiveGroups/README.md`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0 with exactly 11 `sorry` warnings (lines 152, 178, 198, 220, 241, 263, 284, 309, 332, 494, 537). A copy of the file with `#check @` for all 22 declarations reproduces their stated signatures, so no binder is lost. `Suggested.lean` is unchanged, and the new targets need group-scheme carriers that are absent at the pins.
- Pull request text: it agrees with the head. It lists 9 added headings and none removed or renumbered, says `Suggested.lean` is unchanged, and names every added supplier. The two † locators it mentions are the only ones left (lines 5072, 6769, 6771).
- Overlap check: read ClassicalGroupsPartII, OrthogonalTamagawaAndLatticeMass, QuadraticFormsOverABase, SurfaceGroupCharacterVarieties and PadicHodgeTheoryPartII (open), and ChevalleyGroups, GroupSchemesOverABase and ReductiveGroupsPartII (main). By object, also read LefschetzPencilsAndVanishingCycles, ArithmeticGaloisRepresentations, Completed/OrthogonalSpinGroups and its open revision. The shared objects and their owners are:
  - integral `O`, `SO` and `Spin`: ReductiveGroups §§9B.6–9B.7. QuadraticFormsOverABase Layer 3 and OrthogonalTamagawaAndLatticeMass §§0.1–0.1a still state them and must cite these sections in their own revisions;
  - the `GSp` group scheme: owned by ArithmeticGaloisRepresentations §7.3, consumed here, hence R02;
  - the `GSp` isogeny and torus in characteristic 0: ClassicalGroupsPartII CG.0.2 and CG.0.4, which are consumers;
  - ordinarity and `Z(q)`: LefschetzPencilsAndVanishingCycles §§2.1–2.2.

Source independence: 10 passages compared with 5 sources (conrad-rgs, jantzen-1985, asgari-shahidi, cai-friedberg-kaplan, hundley-sayag). None is shared beyond forced formulas and standard terms; the longest common run is 3 words ("the Dickson invariant", conrad-rgs line 12869). The largest share of locators is milne's, about 110 of about 200. Contents compared with milne (25 chapters): independent. Layer 2 ↔ Ch. 10 and Layer 3A ↔ Ch. 7 are out of Milne's order, and Layers 7a–7f, 9, 9E and 11 have no Milne chapter.

Research link: §§9B.5–9B.8 build the split classical and general spin group schemes and based root data on which Cai, Friedberg and Kaplan (2024) state the doubling method, and on which Asgari and Shahidi (2006) state generic transfer for GSpin. The roadmap as a whole develops Conrad's relative theory of reductive group schemes and Jantzen's rational representations. This rests on README §§9B.7–9B.8, cai-friedberg-kaplan §1 and asgari-shahidi §2.

## Not verifiable

- Asgari, *Local L-functions for split spinor groups*, Canad. J. Math. 54 (2002), §2. The sources service found only the Cambridge Core landing page, on a host it could not classify as open. The datum it is cited for agrees with asgari-shahidi Def. 2.1 and cai-friedberg-kaplan §1, and hundley-sayag (line 544) cites its §2, Proposition 2.4, p. 678.
- Knus–Merkurjev–Rost–Tignol, *The Book of Involutions*, §§12, 13, 23: the AMS book is behind a paywall. It is cited only in the reference list.

## Source issues

- none

## For the human reviewers

- none
