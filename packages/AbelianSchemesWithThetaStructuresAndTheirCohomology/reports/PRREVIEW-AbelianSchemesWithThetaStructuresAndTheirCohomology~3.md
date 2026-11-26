# Review of AbelianSchemesWithThetaStructuresAndTheirCohomology (pull request #3175 at d9a72b0)
Folder: `TauCetiRoadmap/ShortGRH/AbelianSchemesWithThetaStructuresAndTheirCohomology/`
**Verdict:** needs changes

**Summary.** The fifteen sampled sections state what the formal proof [ShortProof] proves at the pinned commit, and the computed checks on the four headline theorems hold. The problems are ownership and form. The roadmap plans a second model of the unitary PEL moduli space next to PELModuli on main, using PELModuli's names ("PEL data", "neat", "full level structure", "universal family") with different definitions and no comparison. It also restates abelian schemes, theta groups and complex uniformisation, which AbelianSchemesAndArithmeticModuli on main owns. Three further findings: it cites two sibling roadmaps that also cite it, `Suggested.lean` leaves out Frobenius' dimension formula although the formula can be stated at the pins, and the pull request edits files outside the roadmap folders. That makes five findings (all P2), three small corrections and one format note. Four questions are left to the human reviewers: whether to plan a library around one unrefereed formal proof, whether to accept its replacement for étale cohomology, the licence of [ShortProof], and the re-rooting of the GRH umbrella.

## R01 (P2) — Layers 3 and 6–8 plan a second model of the unitary PEL moduli space beside PELModuli, under PELModuli's names with other definitions, and nothing relates the two

As written, the library would get two "PEL data", two notions of "neat", two adelic level structures and two universal families for the same unitary Shimura varieties. Because nothing compares them, PELModuli's theorems (smooth models at good primes, the Hecke action, complex points as a double coset) cannot be used here, and this roadmap's results cannot be used there.

PELModuli on main already defines these objects:
- unitary PEL data (§M5.5), with the trace form `Tr(δH)`, `δ̄ = −δ`, `Im τ(δ) > 0`, which are this roadmap's `ξ` and polarisation form in 3.2–3.3;
- adelic level structures (§§M1.4–M1.6) and the moduli problem (§M1.7);
- the Hecke action (§M1.13);
- neat subgroups, by Pink's condition (§M2.2);
- smooth models and the universal family at good primes (§§M2.8, M2.9);
- deformations (§M2.12);
- complex points as an adelic double coset (§M3.4).

This roadmap defines its own versions:
- *PEL data* as another tuple (3.2, line 438);
- *neat* by a rational-intersection condition (8.1, line 1435);
- *full level structure* (6.1, line 1012);
- a *universal family* (7.4, line 1324) whose base is a closure of theta values, "with no moduli property" (line 1315).

The Summary says "The construction avoids a moduli problem" (line 14). Of PELModuli it cites only §M2.12, in 7.3 (line 1306). Sections 6.3 and 7.5 mention the double-coset description only as "the nearest published result".

The smallest change keeps the theta-closure construction. Add to Layer 7 a target comparing it with PELModuli: over `R`, the base of 7.4 with its theta family is (a union of components of) PELModuli's `M_H` for the unitary datum of §M5.5 at the corresponding level, with the universal family of §M2.9 and the Hecke correspondences of §M1.13. Then cite §§M2.2, M3.4 and M5.5 where 8.1, 6.3/7.5 and 3.7 use the same notions.

Alternatively, build Layers 6–8 directly on §§M2.8, M2.9 and M1.13, and keep here only what PELModuli lacks: theta coordinates on that model, the congruence relation and the fixed-point count. Either way, rename this roadmap's "PEL data", "neat" and "universal family" (for example "theta-PEL data") so that each name means one object.

## R02 (P2) — Layers 4 and 5 restate objects and theorems that AbelianSchemesAndArithmeticModuli on main owns, in another encoding and mostly without citing it

This gives a second definition of objects that already have an owner. The equivalence between the two is asserted in prose but never stated as a target, and the sign of the Riemann form differs from the owner's (C03).

AbelianSchemesAndArithmeticModuli on main owns:
- abelian schemes (§A0.1);
- the theorem of the cube, with `[n]^*L ≅ L^{n²}` for symmetric `L` (§A1.5);
- the theta group `G(L)` over `K(L)`, and lifts of translations (§A3.6);
- Weil pairings (§§A3.5, A3.7);
- lattice uniformisation, including homomorphisms as lattice-preserving linear maps (§A5.1);
- Riemann forms (§A5.2) and the Appell–Humbert theorem (§A5.3).

This roadmap restates them as follows:
- 4.1 (line 632) defines its own abelian scheme. A parenthesis calls it "the usual notion", which is true (a finite component group is killed by its order, so surjective `[m]` forces connected geometric fibres), but no target states the equivalence.
- 4.2 (c) restates `[m]^*c = m²c` (line 670) without citing §A1.5.
- 4.5 restates lifts of translations over `K([N])` without citing §A3.6.
- 5.4 (b) restates the Weil pairing without citing §§A3.5, A3.7.
- 5.2 (d) is, in the README's own words, "the same theorem in the form of 5.1" as §A5.1 (line 878).
- 5.3 is a statement that, by the README's own account, §A5.3 implies (line 899).

The smallest change:
- Cite §A0.1 for abelian schemes, and add a one-line target that the definition of 4.1 agrees with it.
- Cite §§A1.5 and A3.5–A3.7 in 4.2 (c), 4.5 and 5.4 (b), and keep there only what is new (the parallelogram-law encoding of classes, the rigidity of theta structures).
- For 5.2 (d) and 5.3, state the bridge from §§A5.1 and A5.3 to the form of 5.1, not the theorems again: that the analytic uniformisation of §A5.1 gives a uniformisation in the sense of 5.1, and that theta coordinates come from the factor of automorphy of §A5.3. If the route cannot use §A5.1, say why in a scope paragraph.

## R03 (P2) — Frobenius' dimension formula, headline (1), can be stated at the pins, but `Suggested.lean` states nothing and its docstring does not name the headlines that cannot be stated

With nothing stated, the acceptance test is empty: the finished roadmap is tested against nothing. A reader also cannot tell which headlines are blocked by missing carriers. The docstring (lines 6–7) says only that no Lean signature is stated.

Headline (1) needs only a lattice, a form and a submodule of functions. In a scratch copy I wrote:
- `riemannForm B u v := (B u v − B v u).im / (2 * π)` for `B : V →L[ℝ] V →L[ℂ] ℂ`;
- the dual lattice as an `AddSubgroup V`;
- `thetaSpace B L χ` as a `Submodule ℂ (V → ℂ)`, cut out by differentiability and the functional equation of 1.1;
- the predicate of Appell–Humbert data;
- the theorem `Module.finrank ℂ (thetaSpace B L χ) ^ 2 = L.toAddSubgroup.relIndex (dualLattice B L)`, under `[DiscreteTopology L] [IsZLattice ℝ L]` and positivity `0 < riemannForm B u (I • u)` for `u ≠ 0`.

All of it elaborates under `import Mathlib` at the pin. The only messages are the `sorry` warning and two deprecation notices from the probe's own proofs.

The smallest change is to state 1.2 (c) with those definitions (and, if wanted, 1.2 (b) and 1.4 (a)). Then name in the docstring each of headlines (2)–(4) that cannot be stated at the pins, with the carrier it lacks.

## R04 (P2) — Supply runs both ways between this roadmap and two siblings, GaloisRepresentationsOfUnitaryEigenforms and WeilRepresentationsOnBanachSpacesOfData

When two roadmaps cite each other, no merge order can put either one first, and no direction of supply can be read off.

The citations run as follows:
- This roadmap cites GaloisRepresentationsOfUnitaryEigenforms §§1.1, 1.3 in 9.6 (b) and 9.8 (lines 1794, 1805, 1864, 1874).
- GaloisRepresentationsOfUnitaryEigenforms cites this roadmap's §§3.1, 3.7, 8.1, 8.4, 9.2, 9.3, 9.6, 9.8 (its lines 530–540, 834, 963, 987).
- This roadmap cites WeilRepresentationsOnBanachSpacesOfData §9.1 in 8.1 (line 1456).
- WeilRepresentationsOnBanachSpacesOfData §4.3 needs this roadmap's §1.2 (c) (its line 833).

No cycle forms at the level of sections. Galois §1.1 needs only AdelicUnitaryGroupsAndAlgebraicModularForms and Weil §§9.1–9.2, Galois §1.3 only CrystallineRepresentationsAndKisinModules §3.1, and Weil §9.1 only AdelicUnitaryGroupsAndAlgebraicModularForms. The dependency check does not report the problem because the siblings are not yet in the merge order.

The smallest change puts this roadmap first:
- 9.8 already writes `P_w` out. For jumps and local data, cite CrystallineRepresentationsAndKisinModules §3.1, which Galois §1.3 itself rests on.
- Define here the weights and jumps that 9.6 (b) uses, or take them from that supplier.
- In 8.1, replace Weil §9.1 by the coset decomposition that 8.1's own method sketch uses, or by AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.9, on which Weil §9.1 rests.

## R05 (P2) — The pull request changes files outside the roadmap folders

Against its base, the pull request makes two such changes:
- It adds a line for `TauCetiRoadmap/ShortGRH/README.md` to the roadmap list of the top-level `README.md`. That list is regenerated after merge and is not edited by hand.
- It rewrites `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` (about 3,150 lines added and 16,400 removed), re-rooting the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml`, lines 1–2).

The smallest change is to drop the line in the top-level README, and to move the umbrella change to a pull request of its own, where the re-rooting is a visible decision.

## C01 — Three declarations that the README says the library has are not in the pinned Mathlib or Tau Ceti

None of these occurs anywhere in the pinned sources:
- `AlgebraicGeometry.Scheme.Hom.existsUnique_section_of_valuationRing` (5.4, line 917, and the closing list, line 1892);
- `TauCeti.finrank_thetaSections` (1.2, line 176);
- `TauCeti.mdifferentiable_mulInvariantExp_complex` (5.2, line 876).

The extension over a valuative arc that 5.4 uses is in the pinned Mathlib as `AlgebraicGeometry.ValuativeCriterion.existence` and `.uniqueness`, with `IsProper.eq_valuativeCriterion` (Mathlib/AlgebraicGeometry/ValuativeCriterion.lean, lines 104, 107, 331). Cite those, and replace or drop the other two names.

## C02 — No published source is cited for the classical results

Every *Origin* line that reads "adapted from the published theory of …" names no work, and the README has no reference list. So these results cannot be checked against the literature: Frobenius' formula (1.2), Riemann's relation (3.5), Appell–Humbert (5.3), Cartier's theorem (7.1), Drinfeld's lemma (7.3) and Mumford's theta-null construction (7.4).

[ShortProof]'s own reference list names several of the sources:
- Mumford, *On the equations defining abelian varieties* I–II (Invent. Math. 1966 and 1967), for 7.4;
- Edixhoven–van der Geer–Moonen, Bosch–Lütkebohmert–Raynaud and Stacks 0BF9, for 4.3;
- Fulton–Harris, for Weyl's formula;
- Harris–Labesse (2004) and Labesse (2011), for the trace comparison that 9.4 and 9.6 replace.

Add them with locators, together with those AbelianSchemesAndArithmeticModuli already gives for Layers 4 and 5.

## C03 — The Riemann form here has the opposite sign to AbelianSchemesAndArithmeticModuli's

Take the line bundle of `H(z, w) = z w̄` on `ℂ/(ℤ + iℤ)`. Its factor of automorphy is that of `B(u, v) = π ū v` here, and `E_B(1, i) = Im(πi − (−πi))/2π = +1`. For the same bundle §A5.3 gives `E(1, i) = −1`. Both roadmaps are internally consistent: `E_B` here is the first Chern class, which §A5.3 calls `−E`. Once the citations of R02 are made, say in the Conventions that `E_B = −E` of §§A5.2–A5.3.

## N01 — The README is not in the house shape

There is no `# Roadmap:` title, and no `## Scope and ownership`, `## Exact supplier contracts` or `## References`. No layer ends with Examples and Dependencies. The two closing lists do the work of the supplier contracts.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 (a)–(c) | general `u, v`; `l, m ∈ L` | `U_uU_v/U_{u+v} = exp((B(u,v)−B(v,u))/2) = exp(πiE_B(u,v))` iff `Re B` symmetric; `U_l f = χ(l)f`; symmetry of `χ(l+m)` gives `E_B(L,L) ⊂ ℤ` | holds; source agrees | none |
| 1.2 (c), headline (1) | `dim V = 0`; `V = ℂ`, `L = ℤ[i]`, `B = πkūv` | dim 0: `Θ = ℂ` since `χ(0) = 1`, index 1. Else `E_B(1,i) = k`, `L^⊥ = k⁻¹ℤ[i]`, index `k²`, `dim Θ = k` | `k² = k²`; source `finrank_sq_eq_relIndex` agrees | R03 |
| 1.4 (a) | one orbit of `L^⊥/L`, `d = dim Θ` | Schur: `Σ_a U_a⁻¹XU_a = d·tr X`, so LHS `= √(d²)·d·f(z)g(w) = d²·f(z)g(w) = |T|·f(z)g(w)` | holds; source takes `Nat.sqrt` of a square | none |
| 1.5 (b) | `F(a)` complex-linear | `#(a⁻¹L/L) = |det_ℝ F(a)| = |det_ℂ F(a)|²` | holds | none |
| 2.1 (a), (c) | trivial `v`; torsion `x`, `l ∈ L` | `s_f(x+l) = v(χ(l))·v(e^{−πiE_B(x,l)})·s_f(x)`, both roots of unity; trivial `v`: sizes in `{0,1}`, sup multiplicative | holds; `TorsionSizes` agrees | none |
| 2.1 (d) | `v(N) = v(r) = 1` | dual lattice of `r^jB` is `r^{−j}L^⊥`, killed by `Nr^j`, and `v(Nr^j) = 1` | holds | none |
| 3.1 | `J = uwᵀ − 1`, `wᵀu = 2`; dimensions | `Ju = u`; `Jv = −v` when `wᵀv = 0`; `J² = 1`; `dim_ℝ (E⊗ℝ)ⁿ = 2fn` gives `dim_ℂ V = nf` | holds; `AdelicFrames` agrees | none |
| 3.2 | `σ_j`; parity of `#T` | `#{y : r^jy ∈ T} = #T·r^{2fnj}`, so `σ_j = dim Θ(r^jB)` by 1.2 (c); `Λ ⊃ T_n[r]` and `#T` odd force `r` odd | consistent; `PEL`, `IsGoodAt` agree | R01 (name) |
| 3.3, `β₁` | `#T` odd | `β₁ + β̄₁ = #T − 2⌊#T/2⌋ = 1`, so `b = β₁` satisfies the condition of 1.3 (b) | holds | none |
| 3.4 | trivial `v`; `ρ = Φ_{v₀}` | trivial `v`: every nonzero `N`, `r` has `v = 1`; hypotheses of (b) match `hasGoodReduction_and_val_card_eq_one` | holds | none |
| 3.6 | the definition of "cut out" | three clauses equal the `IsCutOut` fields; (b) needs `v(#T) = 1`, as stated | holds | none |
| 4.1 | `[m]`-surjective against §A0.1 | `π₀` of a geometric fibre is finite; `m = #π₀` kills it, so surjective `[m]` forces `π₀ = 0`; converse via isogenies | true, not a target | R02 |
| 6.1 | theta family fields | (i)–(iv) equal `theta_law`, `class_laws`, `signature`, `eq_of_level_coords_eq`; hypotheses of (b), (c) agree | holds | R01 (level structure) |
| 6.3 | `exists_torusModel`, refined form | conclusion and the three hypotheses on `e∘Q` agree with the source, lines 152 and 390 | holds | none |
| 6.5 | junk value of `ncard` | monomials of degree `r^j` in finitely many variables are finitely many, so `ncard` is exact; (b), (c) agree with source lines 405, 862 | holds | none |
| 7.4, headline (2) | `R = E`; `R = 𝓞_E` | `R = E`: ideal `(0)` contains no prime `p`, so not good; `R = 𝓞_E`: `r` lies in some prime, so not good | consistent; no comparison with PELModuli | R01 |
| 8.1 (c) | `N(I) > (2|n|)^{[E:ℚ]}` | `tr(y−1) ∈ I` and `|σ(tr(y−1))| ≤ 2|n|` give `tr = 0`, so all eigenvalues are 1: unipotent in a compact group, so `y = 1` | holds (uses `f ≥ 2`) | none |
| 8.4, headline (3) | `W` a line, `U ⊃ W`, `dim U = u` | `A + W = U` for `U` and `q^{u−1}` hyperplanes; `(−1)^u q^{u(u−1)/2} − (−1)^u q^{u−1+(u−1)(u−2)/2} = 0` | holds | none |
| 8.4 against 9.8 | `a = 1` | relation `[Frob^f p_{g_0}] = [p_{g_{k_w}}]` gives `θ₀s − θ₁ = P_w(s) = 0` for geometric Frobenius `s` | consistent with 9.8 (a) | none |
| 9.2 | `a = 1`; direction of dominance | no idempotent `≠ 0, 1` in `E_w`, so every `(J, χ)` is cuspidal; `Valued.v` increasing means `|s_i|` increasing | holds; `TestFunction` agrees | none |
| 9.6 (a) | `a` odd | `c₀ = (−1)^a∏x_i`, so `−c₀ = ∏x_i`; weight `m(a−1+a(f−1)) + l_j` equals source line 315 | holds | none |
| 9.8, headline (4) | `J = ∅` | `ρ = 0` satisfies (a)–(c), as the README says; `P_w` equals the source's `heckePoly` | holds, weak | R04 |
| 1.1 sign against §A5.3 | `H = z w̄` on `ℤ + iℤ` | here `E_B(1,i) = +1`; §A5.3 gives `E(1,i) = −1` | opposite signs | C03 |
| 5.2 (d), 5.3 | README text | 5.2 (d) is "the same theorem" as §A5.1; 5.3 is implied by §A5.3 | duplicated | R02 |
| 5.4, library input | search at the pins | cited name: no hit; `ValuativeCriterion.existence` at line 104 | pointer absent | C01 |

- Source locators checked: the 15 sampled sections against [ShortProof] at commit 72fead10 (Apache-2.0; read from the operator's local copy of the public repository). I opened 58 declarations in 17 files under `grh/src/Lib/Shimura` and found no discrepancy in hypotheses or conclusions.
- Library declarations opened at the pins:
  - Mathlib `AlgebraicGeometry/ValuativeCriterion.lean` 104, 107, 331; `ZariskisMainTheorem.lean` 373; `Morphisms/Smooth.lean` 127; `GroupTheory/Index.lean` 62; `Algebra/Module/ZLattice/Basic.lean` 434;
  - Tau Ceti `GroupScheme/Cokernel.lean` 44; `Lie/Exponential/CommutativeGroup/Basic.lean` 248; `RepresentationTheory/Compact/Finite.lean` 507; `HeckeRing/Associativity.lean` 484;
  - three names absent (C01).
- Cross-roadmap citations resolved:
  - 27 section citations into 8 sibling roadmaps at the head;
  - on main: AbelianSchemesAndArithmeticModuli §§A0.1, A1.5, A3.1, A3.6, A3.8, A5.1–A5.4; PELModuli §§M0.5, M1.4, M1.7, M1.13, M2.2, M2.8, M2.9, M2.12, M3.4, M5.5; SpecialFunctionsTheta §7.4; AutomorphicGaloisRepresentations §0.6.
- Dependency check: `depcheck: 115 roadmaps, 1309 edges, 0 problem(s)`. The two-way citations of R04 involve roadmaps that are not in the merge order.
- Elaboration: `Suggested.lean` elaborates with no message. It declares nothing, so there is nothing to `#check` or to probe for padding. The scratch probe of R03 elaborates with `sorry` as its only warning.
- Automatic checks: the only failure is the change outside the folders, which is real (R05).

Overlap check: read AbelianSchemesAndArithmeticModuli, PELModuli and AutomorphicGaloisRepresentations (and SpecialFunctionsTheta §7.4). Abelian schemes, the cube, theta groups, Weil pairings, uniformisation and Appell–Humbert are owned by AbelianSchemesAndArithmeticModuli (R02). PEL data, level structures, neat levels, smooth models, the universal family, Hecke action, deformations and complex points are owned by PELModuli (R01). Theta functions of principal type are owned by SpecialFunctionsTheta §7.4, which 1.2 generalises with a stated reason. Nothing is shared with AutomorphicGaloisRepresentations §0.6 (signature (2,1)). The overlap tool listed no closest roadmaps. Ownership against open pull requests was checked by searching their heads for Kuga–Sato and Eichler–Shimura: nothing shared.

Source independence: 21 passages compared with 1 source ([ShortProof] declarations, docstrings and comments); none shares more than six consecutive words, and those words are forced by the formulas. Largest share [ShortProof], 50 of 50 section locators. Contents compared with [ShortProof]'s contents list (the Shimura part): the layers follow the dependency order, not the source's listing, but most sections take the scope of one source file.

Research link: 7.4 is a theta-null construction after Mumford, *On the equations defining abelian varieties* I–II (1966–67), and 9.8 is a route to Galois representations of eigenforms on definite unitary groups, the subject of Shin (2011) and Chenevier–Harris. Rests on the README's Origin lines and [ShortProof]'s reference list.

## Not verifiable

- None of the sampled targets: [ShortProof] was read at the pinned commit. The published results that the *Origin* lines name only by subject carry no locator to verify (C02).

## Source issues

- none

## For the human reviewers

- Scope: the roadmap's only source is [ShortProof] (lsernau/grh-lean at 72fead10), an unrefereed formal proof of GRH of about 300,000 lines. Most sections are labelled "particular to this proof", and the description says no statement has been read by a specialist.
- Scope: the Conventions (line 82) make `Vⁿ` stand in for ℓ-adic étale cohomology with no comparison, and the Summary (line 14) avoids a moduli problem. Whether the project accepts such replacements of standard theory is for humans.
- Licence: [ShortProof] is Apache-2.0, according to the family index. Most sections restate, in prose, the scope and statements of one of its files. Whether its attribution and NOTICE terms bind the roadmap is for humans.
- The pull request re-roots the umbrella GRH from RiemannHypothesisForDirichletLFunctions to ShortGRH (`umbrellas/GRH.toml`, lines 1–2), which changes what work on the GRH umbrella targets.
