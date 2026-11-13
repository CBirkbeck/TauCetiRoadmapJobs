# PORT-LocalGaloisDeformationRingsPartII

Branch `roadmap/local-galois-deformation-rings-part-ii`, head commit `7f3bea4a` ("LocalGaloisDeformationRingsPartII: roadmap (README, Suggested.lean, metadata)"), on top of `45f58db`. Files: `TauCetiRoadmap/LocalGaloisDeformationRingsPartII/{README.md,Suggested.lean,metadata.toml}`; nothing outside the folder changed.

## Build, gate, dependency check

- `lake build TauCetiRoadmap.LocalGaloisDeformationRingsPartII.Suggested`: `Build completed successfully (18239 jobs).` One Lean warning, `Suggested.lean:49:8: declaration uses 'sorry'`. Lake also prints its notice that the file "imports `Mathlib` … consider adding `module`" (once for the build step, once for the `irArts` step); this is the consequence of the brief's `import Mathlib` form, not a Lean warning in the file.
- Gate: `gate LocalGaloisDeformationRingsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`): `depcheck: 223 roadmaps, 1979 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This adds `LocalGaloisDeformationRingsPartII`, the explicit rank-two continuation of `LocalGaloisDeformationRings`: for `K/ℚ_p` unramified and a sufficiently generic semisimple `ρ̄ : G_K → GL₂(𝔽)`, it computes by explicit equations the framed potentially crystalline deformation rings whose labelled Hodge–Tate weights are `(3,0)` or `(2,1)` at every embedding, first for one tame inertial type and then for all `2^f` tame types whose reduction contains a fixed Serre weight, in one common chart. Along the way it builds characteristic-zero tame types with their orientations and Jordan–Hölder labels, gauge coordinates and an effective finite-jet form of the monodromy condition for rank-two Kisin modules with tame descent, the classification of semisimple residual representations by monomial étale `φ`-modules together with descent of isomorphisms from `G_{K∞}` to `G_K`, three explicit eight-variable charts with a `p³` Jacobian bound and an Elkik-type Newton approximation, and the exact small-weight ideals. The end theorems are the single-type presentation `R^{≤(3,0),τ}_ρ̄⟦X₁,…,X_{2f}⟧ ≅ (R/Σ_j I_j)⟦Y₁,…,Y₄⟧` with its `2^f` Hodge-labelled components and reduced special fibres, the multiple-type presentation with `4^f` components, and the integral relation `p ∈ (Q₁ ∩ Q₂) + P_{w̃,j,(3,0)}`, which is the local input of the patched-module gluing in Breuil–Herzig–Hu–Morra–Schraen's Gelfand–Kirillov dimension argument for mod `p` cohomology of `GL₂`. `Suggested.lean` states the one headline statable at the pins, primality of the crossing element `x₀x₁ + ϖ^d u` in `𝒪⟦x₀,…,x_{n+1}⟧`, and names the deformation-ring headlines that are not statable with the carrier each lacks.

## Dependencies that are still pull requests

PadicLocalLanglandsForGL2Qp, FiniteFlatGroupsAndIntegralPadicHodgeTheory, DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings, PurityForFlatCohomology (each an open new-roadmap pull request, all earlier in the merge order). ModpRepresentationsOfGL2OverLocalFields is cited from its board package, which has no pull request yet (merge order 266, this roadmap 356). On main: ClassFieldTheory, and LocalFieldsRamification under `Completed/`.

## Starting point

There was no `review.json`. The board package is the version merged with the package job (one Lean declaration, ten gaps); review rounds 2–7 were run on a revision that never reached the board. Every finding of rounds 1–7 was treated as a claim, checked against the board text, the sources and the suppliers at their heads, and applied where it holds for the board text (list below). The design's layer labels `T.0–T.7` are not used.

## What moved from the Lean to the README

Nothing: the package file already held only the headline `crossing_prime`. Its module docstring now also names the missing fundamental characters and residual genericity for §3.9, and the declaration docstring says that neither pin proves factoriality of power series in more than one variable.

Binder check: `#check @TauCetiRoadmap.LocalGaloisDeformationRingsPartII.crossing_prime`, elaborated with `lake env lean` in one scratch file together with every Mathlib and Tau Ceti name the README cites, gives `∀ {O} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O] {ϖ : O}, Irreducible ϖ → ∀ (n : ℕ) {d : ℕ}, 0 < d → ∀ (u : (MvPowerSeries (Fin (n + 2)) O)ˣ), Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`. There are no section variables; this is exactly README 5.3 (complete DVR, uniformiser, at least two variables, `d > 0`, unit `u`). Nothing changed. The same file confirmed `inferInstance : IsRegularLocalRing O` and `IsRegularLocalRing (PowerSeries O)` for a DVR `O`, and that no `UniqueFactorizationMonoid` instance is found for the multivariable ring, so the headline is not padding.

## Supplier replacements and duplication removals

- gap:regular-local-factorial (on DeformationAndDerivedPatchingAlgebra) deleted: PurityForFlatCohomology §7.4 states `isRegularLocalRing_uniqueFactorizationMonoid` (open head). 5.3 now cites it with Tau Ceti `TauCeti.PowerSeries.isRegularLocalRing` and Mathlib `MvPowerSeries.finSuccEquiv`, `IsRegularLocalRing.of_ringEquiv`. Tau Ceti's `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` needs `ringKrullDim R ≤ 2`, so it does not cover `𝒪⟦x₁,x₂⟧`.
- gap:kummer-tower-tame-quotient (on LocalFieldsRamification, which is completed) deleted: no roadmap on main, at an open head or in a board package states the identification of tame quotients along the Kummer tower (searched by object). It is now the first assertion of 3.4 here, with route (Eisenstein ⇒ totally ramified of `p`-power degree, LocalFieldsRamification Layer 3; `K∞ ∩ K^t = K`) and a negative-control Check (the cyclotomic tower contains `K(μ_p)`). This roadmap is its owner.
- The framed deformation ring of a profinite group without `Φ_p` (needed for `G_{K∞}` in 7.3) is owned by nobody: PadicLocalLanglandsForGL2Qp §0.4 and LocalGaloisDeformationRings F.2.3–F.2.4 represent the framed functor only under `Φ_p`. New 3.10 owns `R□_{ρ̄,Γ} = lim_H R□_{ρ̄,Γ/H}` with its tangent space and surjectivity criterion; Check: `Hom(G_{K∞}, 𝔽)` contains the Artin–Schreier classes of `v^{−m}`, `p ∤ m`.
- Supplier names that the suppliers do not declare were replaced by section descriptions: `DeformationSupport.pstRing`, `DeformationSupport.crystallineRing`, `DeformationSupport.framed`, `HenniartType.sigma`, `HenniartType.reductionSS`, `fundamentalCharacter`, `relativeCotangent`, `coeffCompletedTensor`, `quotientCompletionComparison`; also the open-PR README-only names `heightLatticeFunctor`, `HodgeType`, `GaloisType`, `KisinModule`, `KisinModuleCoeff`, `kisinOpenDiscBounded`. Kept: `seriesPresentation_surjective`, `flatCompletion_finiteComparison` (declared in DeformationAndDerivedPatchingAlgebra's `Suggested.lean`).
- `MP.3`/`MP.5` ids replaced by ModpRepresentationsOfGL2OverLocalFields §§3.1, 3.2, 3.4, 5.4, 5.5 (the package's headings; contents checked: depth `N < r+1 < p−N`, `t_λ`, `τ(s,ν)` without `η`, `W(ρ̄) = {F(t_{μ−η}(sω))}`, Brauer reciprocity, `2^f` constituents of `P̃_σ[1/p]`).
- Duplication sweep by object (`roadmaps grep` on main and all open heads, and the board packages): "gauge basis", "cyclotomic free", "monomial étale", `τ(s, μ+η)`, Kummer-tower tame quotient: no other owner. "lowest alcove presentation" occurs in LocalGaloisDeformationRings §6.9 (`GL₃` charts, different objects) and PotentialAutomorphyInfrastructurePartII §10.5 (a gap on LocalGaloisDeformationRings for rank-`n` generic tame rings being domains, LLHLM23 Theorem 7.3.2; different scope). CompletedCohomologyAndLocalGlobalCompatibilityPartII owns patched-module density, not these rings. Nothing has two owners; no target was deleted for duplication.

## Fixes made as an upstream reviewer (each verified)

1. 3.3/3.4 cited the covariant `T_A` of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.39 (`(𝒪̂_{ℰ^ur} ⊗ M)^{φ=1}`, read at its head) for a statement fixing the contravariant `V*_K`. 3.3 now defines `V*_K(M) = Hom_φ(M, k((v))^sep ⊗ 𝔽)` and proves `V*_K(M) ≅ T_𝔽(M^∨)`; rank-one Check: Frobenius acts by `α` on `V*_K`, by `α^{−1}` on `T_𝔽`.
2. Cyclotomic freeness of `ad(ρ̄)` was used in 3.9, 5.7, 7.3 and owned nowhere (BHHMS23 line 1114 uses "the analog of" LLHLM18 Proposition 3.9, which LLHLM18 line 1118 states for `GL₃`, `p > 3`). 3.7 now proves it for 2-generic `ρ₁` and `ρ₂^ss ≅ ρ₁^ss`, with the digit route and the Check `a − b ≢ ±1 (mod p−1)`, negative control `ω ⊕ 1`; 3.9, 5.7, 7.3 cite 3.7.
3. 1.3/1.4 fixed an arbitrary residual eigenbasis; BHHMS23 line 859 fixes a gauge basis. Now a residual gauge basis, with a non-gauge Check stated for `f ≥ 2` (for `f = 1` the rescaling also enters through `φ*β̄`), and 4.2 says the monomial basis is gauge (degrees checked: `[[0, d₁v],[d₂v², 0]]`).
4. 2.1 assumed topologically finite type and then applied the result to `𝒪⟦8 variables⟧` "through the supplier's extension", which nothing defined. 2.1 and gap:relative-monodromy-criterion are now stated for `𝒪`-flat complete Noetherian local `R` with residue field `𝔽`, the class on which gap:rank-two-descent-kisin-modules defines `Y^{[0,h],τ}(R)`; the source's own hypothesis (BHHMS23 line 905) is recorded.
5. Conventions: `𝔽 ⊇ k₂ = 𝔽_{q²}` and `σ′₀` extending `σ₀`; `ω_{f′}` via `K′`. Without it `ω̃₂` is not `𝒪`-valued for `E = ℚ_p`, `f = 1`, `s = w`.
6. 5.4/5.5: in chart 1 `G₅ = e₁₁* X((a−1)(a−2)XY − 2p)`; at `e₁₁* = X = 0` every `G_i` and the whole `G₅` row of the Jacobian vanish, so no power of `p` is in `I + J₅` without inverting `e₁₁*`. 5.4 is now stated in `B_j` (polynomial ring with `e₁₁*`, resp. `e₂₂*`, inverted; chart 2 needs none) and 5.5 assumes that coordinate is a unit; Checks added (including `A = ℤ_p`, `e₁₁* = X = p³`: `v(G₅) = 7` for every `a° ≡ a mod p⁴`).
7. gap:tame-types-unramified named `R_s(μ)`; BHHMS23 line 733 and LLHL19 line 549 give `σ(τ(s,μ+η)) = R_s(μ+η)` (`f = 1`, `p = 7`, `s = 1`, `μ = (1,0)`: `τ = ω̃² ⊕ 1`, while `R_1((1,0))` has type `ω̃ ⊕ 1`). It now also supplies `σ(τ)` for every tame type, inflated from `GL₂(𝔽_q)`, in BHHMS23's normalization (`χ ∘ det` for scalar `τ`, BHHMS23 lines 593–596), which 4.3 and 7.2 quantify over.
8. 0.5 Check "twisting `τ` by `ω̃_f^c` twists constituents by `(N ∘ det)^c`" is false for `f ≥ 2`: the twist is `(σ₀ ∘ det)^c`; at `f = 2`, `c = 1` the exponents `1` and `1 + p` differ modulo `q − 1`. 0.5's scalar-type Check now uses `σ^cr(τ) = χ ∘ det`.
9. 5.4 Check "verified at 2000 random rational points" replaced by the coefficient computation (coefficients of `s³, s², s` vanish, constant `κp³(κ−1)²`); 5.2 Check "checked symbolically" replaced by the values at `a₂ = 5, 7`.
10. 5.3 said the source states the residue criterion as an equivalence; BHHMS23 line 1122 reads "distinct iff1̸≡ f2", i.e. "if `f₁ ≢ f₂`" with a lost space (compare "Iff∈A×" on line 1121). Sentence removed; the converse counterexample stays as a Check.
11. GHLS17 Theorem D hypothesis is `p ≠ n` (GHLS17 lines 174, 1041), not `p ∤ n`.
12. Locators: Definition 3.2.5 is p. 22 (BHHMS23 lines 1048–1053); 0.4 cites LLHL19 Proposition 2.2.16, p. 14, with its hypothesis `d ≥ n`; LLHLM18 Definition 3.8 and Proposition 3.9 p. 29, Proposition 5.3 p. 47, Theorem 6.14 p. 63; LLHL19 Definition 3.1.1 and Proposition 3.1.2 p. 16, Definition 3.2.23 p. 26, Corollary 2.3.5 p. 15; Hamann75 Theorem 8 (p. 158) added to gap:power-invariance, since the iteration requires the same number of variables on both sides and 6.3 first renames `2f` free variables.
13. 2.2 Check said the extra term `B^{−1}N_∇(B)` is harmless "since it is integral"; the reason is that `λ^{h−1}B^{−1}N_∇(B) = −u′λ^h B^{−1}dB/du′` vanishes to order `≥ h`. 2.3 Check said the opposite commutator "changes the sign of the off-diagonal terms of `P_N`"; it negates the off-diagonal entries of `[D, A]` only.
14. 3.6 Check for `s′ = 1` claimed the split family is all semisimple representations with that inertia; false for `a = b` (an unramified irreducible twist exists), which is why the theorem allows a finite extension of `𝔽`. Check corrected.
15. 4.3: the converse route now says how `σ(τ)` enters `P̃_σ[1/p]` (inflation and Brauer reciprocity, ModpRepresentationsOfGL2OverLocalFields §5.4); the central-character Check computes `z ↦ N(z)²`, nontrivial for `p > 3`. 4.2 Check bound made exact (`12 ≤ coordinate ≤ p − 12`).
16. 3.5 cited gap:fundamental-character-artin "for the normalization of `nr`"; `nr` is defined by arithmetic Frobenius and needs no Artin map. Replaced by LocalFieldsRamification Layers 2 and 4.
17. Downstream consumers: the sentence on the misprint in BHHMS23 p. 102 ended "this roadmap uses that convention throughout", contrary to 4.3 (which uses `N ∘ det`); removed.
18. References: Kisin06, LLHL19, LLHLM18, LLHLM23 were cited without entries; added. Pin hashes in headings (stale `6b7abb3`, `a91d3aa`; the manifest pins Mathlib `1b1ccf4`, Tau Ceti `2fd255d`) removed.
19. 7.1: `R_{w̃}` defined; 0.5 Check 1 now carries a dimension count; Layer 3 Examples gained the cyclotomic-freeness instance.

## Adversarial pass (computed this round)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 exponents | `f=1,s=1`; `f=1,s=w`; `f=1,p=7,μ=(0,0)` | `(μ₁+1, μ₂)`; `(μ₁+1+pμ₂, μ₂+p(μ₁+1))`, `p·first ≡ second mod p²−1`; `ω₁ ⊕ 1` vs `ω₁^{−1} ⊕ 1`, order 6 | holds | none |
| 0.1 twist bullet | `r=1`; `r=2` | shift `Σ b_j p^j`; `(1+q)Σ b_j p^j`, `ω̃_{2f}^{1+q} = ω̃_f` | holds | none |
| Example 0 | `f=1,p=5,s=w,μ=(1,0)` | `a′^(0) = (2,10)`, `10 ≡ 2·5 mod 24` | holds | none |
| 0.2 genericity | `N=12`, `p=23, 29` | `13 ≤ d ≤ p−13` needs `p ≥ 26`; `p=23` empty | holds | none |
| 0.3 orientation | `f=1,p=5,s=w,μ=(1,0)` | `a′^(1) = (0,2)+5(2,0) = (10,2)`; `w(2,10) = (10,2)` dominant; orientations `w, 1` | holds | none |
| 0.4 depth loss | `N=1`; `N ≥ 2` | definition; LLHL19 line 508 `d−n+1 = N−1` | holds, locator added | cite LLHL19 |
| 0.5 statement | BHHMS23 line 733 | `σ(τ) ≅ R_{sw^{−1}}(μ−sw^{−1}ν)` | holds | gap label fixed |
| 0.5 twist Check | `f=2,c=1`; `f=1` | `(σ₀det)^1` vs `(σ₀det)^{1+p}`, differ since `p²−1 ∤ p`; equal at `f=1` | false as written | fixed |
| 0.5 scalar Check | `τ = χ⊕χ` | root coordinates `p−1`, not 1-deep; BHHMS23 uses `χ∘det` | holds after fix | fixed |
| 1.1 indexing | `f=3`, `f=2` | `σ_{−1} = σ₂`; `σ₁ = σ_{−1}` at `f=2` | holds | none |
| 1.1 conjugation order | `P, D=diag(1,2), C` | `[[0,0],[1/2,0]]` vs `[[0,0],[2,0]]` (recomputed) | holds | none |
| 1.1 minors | `(2,1)`, `(3,0)` | exponents `1,3`; `0,3` | holds | none |
| 1.2 shapes | `diag(v²,v)`, `w·diag(v²,v)`, `diag(v,v²)` | `t^(2,1)`, `[[0,v],[v²,0]]`, `t^(1,2)` | holds | none |
| 1.3 degree bounds | `t^(2,1)`, `w t^(2,1)` | `(2,0;2,1)` and `(1,1;2,1)` with pivots at `(w(k),k)`; matches `A₁, A₂` | holds | none |
| 1.3 residual basis | `R = 𝔽`, `β̄` non-gauge, `f ≥ 2` | entry `v²(1+v)^{−1}` not polynomial | hypothesis needed | residual gauge basis |
| 1.4 ambiguity | `𝔽[ε]/ε²` | `(1+ε𝔽)²` per embedding, dim `2f` | holds | none |
| 2.1 Frobenius rule | `u′e`, trivial module | `−p(u′)^pλ` vs `−E(u′)^pφ(λ)`, equal iff `pλ = Eφ(λ)` | holds | none |
| 2.1 basis change | `B = 1+u′` | `−u′λ/(1+u′)` | holds | none |
| 2.1 ring class | `R_j = 𝒪⟦8 vars⟧` | not topologically of finite type (`𝔽⟦8⟧` not f.g. over `𝔽`) | mismatch with Layer 5 | restated |
| 2.2 jets | `h=1`, `h=3` | 0 jets; value + derivative | holds | Check reasoning fixed |
| 2.3 remainders | `h=3, N=12, L=11`; `h=2` | `p⁹, p⁸`; `L ≥ 3`, `10(p−1) ≥ 3`; one jet | holds | commutator Check fixed |
| 3.1 goodness | `f=1,s=w,μ=(a,a)`; `μ=(1,0)` | `(p+1)a`; `1, p` | holds | none |
| 3.2 alcove ⇒ good | `p=5,μ=(3,1)`; `f=2,p=3,δ=(2,−1)` | `8 ≡ 2 mod 6`; `|2−3| = 1 < 9` | holds | none |
| 3.3 variance | rank one, `φ(e)=αe`, `f=1` | `V*`: `α`; `T`: `α^{−1}` | covariant cite wrong | fixed |
| 3.4 Kummer tower | `K(p₁)` vs `K(μ_p)` | degrees `p` and `p−1`; `K(μ_p) = K((−p)^{1/(p−1)})` tame | holds; control needed | owned here |
| 3.5 twists | `c` constant; `f=2, (c,c^{−1})` | `nr(c^f)`; trivial | holds | Needs fixed |
| 3.6 classification | `f=1,s′=1,a=b` | irreducible `ω^a ⊗ ρ₀` not split over `𝔽` | extension of `𝔽` needed | Check fixed |
| 3.7 `ad(ρ̄)` | 2-deep digits `3 ≤ |δ_j| ≤ p−3`; `f=1` | `|Σp^j(δ_j∓1)| ≤ (p−2)(p^{f′}−1)/(p−1) < p^{f′}−1`, nonzero mod `p`; `a−b = r+1 ∈ [13, p−13]`; `ω⊕1`: `a−b = 1` | holds; 1-generic fails at the edge | added |
| 3.8 Hom | `(1,1)`, `(1,ω)` | both `𝔽`; hypothesis fails | holds | none |
| 3.9 Isom | different `ρ^ss` | both empty | holds | route via 3.4, 3.7 |
| 3.10 framed `G_{K∞}` | `n=1, ρ̄=1` | `Hom(G_{k((v))}, 𝔽) ≅ (k((v))/℘) ⊗ 𝔽 ∋ v^{−m}`, `p ∤ m` | not Noetherian | added |
| 4.1 types | `f=1,s=1,μ=(r+2,1)`, `U₁,U₂,U₃` | `τ(1,(r,0))`, `τ(w,(r+1,−1))`, `τ(1,(r+1,−1))`; depth `r, r+2 ∈ (N−1, p−N+1)` | matches BHHMS23 lines 1187–1190 | none |
| 4.2 bound | `N ≥ 12` | coordinate `r_j` or `r_j+2` in `[12, p−12]`, inside `(3, p−4)` | holds | Check sharpened |
| 4.3 `θ` | `f=1`; central character | `θ(0)=U₃`, `θ(η)=U₁` (BHHMS23 line 1251); `N(z)²` nontrivial for `p > 3` | holds | route, Check |
| 5.2 `κ` | `a₂ = 5, 7` | `κ = 9/10, 20/21`; `κ−1 = −2/(a₂(a₂−1))` | holds | Check rewritten |
| 5.2 hypersurface | `x=y=0`; `p=3,κ=−1,x=2,y=3`; `κ=1` | `p²`; `−27`; `(xy+p)²` | holds | none |
| 5.3 crossing | `d=0`; `u=x₁`; `u₂ = 1+x₁x₂` | unit; `x₁(x₂+ϖ)`; equal residues, distinct ideals | holds | attribution removed |
| 5.4 chart 2 identity | coefficients in `s = xy` | `s³: 0`, `s²: 0`, `s: 0`, const `κp³(κ−1)²`; `p=3,κ=−1`: `108` | holds | Check rewritten |
| 5.4 outer charts | `H = X(cXY−2p)` | `pH_X + cY(XH_X − 2YH_Y) = −2p²`; at `e=X=0` all minors vanish | needs `e` unit | restated in `B_j` |
| 5.5 Newton step | `n=7`; `n=6`; `e=X=p³` | `2(n−3) = 8 > 7`; `6 = 6`; `v(G₅(a°)) = 7` | unit hypothesis needed | added |
| 5.7 dimension | `f=1` | `3 + 4 = dim + 2` ⇒ `5 = 4+f` | holds | Needs 3.7 |
| 5.8 `ψ` | `N=9`, `12` | `p^{N−8}` ⊂ `𝔪`; `p⁴` | holds | none |
| 6.1 indices | `f=2, λ=((3,0),(2,1))` | `P_{0,(2,1)} + P_{1,(3,0)}` | holds | none |
| 6.2 dimension | `f=1,3` | `3f+4−2f = 5, 7`; `d²+Δ = 4+f` | holds | none |
| 6.3 special fibre | `f=1,U₂,λ=(2,1)` | `f+4+m = 6`, one crossing; free variables `3f+4−m ≥ 2f+4` for cancellation | holds | gap cites Theorem 8 |
| 7.1 substitution | Table 1 into Table 4 | `(z²d + z(c−pd) + b − pc)/v = zd + c + b/v`; `(zd₁₁+c₁₁)/v = d₁₁` iff `c₁₁ = −pd₁₁` | holds | `R_{w̃}` defined |
| 7.3 tangent bound | `K = max k_j ≥ 1` | `(p−1)K < p−1` contradiction | holds | route via 3.10 |
| 7.4 `Q` points | `p=5`, units `1` | `25−25`, `5−5`; `−5+5`; `5−5`, `25−25` | vanish | none |
| 7.5 elimination | `t+κp = (t+p) − 2p/(a(a−1))` | `c₂₁ + (2p/a₂)d₂₁*`; `ϖ` version false for `e ≥ 2` | holds | none |
| `crossing_prime` | `n=0`; binders | `Fin 2`; elaborated type above | matches 5.3 | none |

## Unresolved

- Eight supplier gaps remain declared, each checked to be unowned at the supplier's head: fundamental-character-artin and tame-types-unramified (PadicLocalLanglandsForGL2Qp §§0.3, 4.4), relative-monodromy-criterion and kummer-restriction-invariants (FiniteFlatGroupsAndIntegralPadicHodgeTheory), rank-two-descent-kisin-modules and ghls-existence (LocalGaloisDeformationRings §§6.9, 8.10), deligne-lusztig-reduction (ModpRepresentationsOfGL2OverLocalFields §3.2), power-invariance (DeformationAndDerivedPatchingAlgebra). They need routing to those roadmaps.
- HilbertModularVarietiesAndShimuraCurvesPartII (later in the merge order) cites this roadmap as `T.0–T.7` (design labels; the README has Layers 0–7) and declares three gaps on it (gap:tame-types, gap:single-type-rings, gap:breuil-mezard-pbt) about potentially Barsotti–Tate rings, which this roadmap excludes by scope. Not changed here; that pull request should cite Layers 0–7 and move those gaps.
- LLHLM23 and Kisin06 were not read; their locators are those BHHMS23 gives. LLHL19 and LLHLM18 were read in the shared source cache (arXiv versions). The package's `sources.toml` (not ported) does not record these four.
- Ownership against open pull requests was checked with `roadmaps grep`/`roadmaps show` at the heads of the index of 2026-11-13 and in the board packages.

No text read during the job asked for a command, a change of procedure or a credential.


Pull request: #2278 (roadmap/local-galois-deformation-rings-part-ii at 7f3bea4)
