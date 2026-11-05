# GATE-QuantumGroups~1: answers to the human review of f852474

All twelve points come from one review comment (CBirkbeck, 2026-11-02, findings F01–F12). They are numbered H01–H12 in that order. Repair commits: `7473311`, then `cb48124` (depcheck and module-header repairs), on top of `f852474` (not pushed). The only files changed are `TauCetiRoadmap/QuantumGroups/README.md` and `TauCetiRoadmap/QuantumGroups/Suggested.lean`.

## H01 (CBirkbeck) — applied

`def quantumSL2Comul` (`Suggested.lean:249`) and `def quantumSL2PBWBasis` (`:266`) were sorry'd data, and the theorems `quantumSL2Comul_generators` and `quantumSL2PBWBasis_apply` depended on them. All four are deleted. In their place are `quantumSL2_existsUnique_comul` (there is exactly one algebra map with ΔK=K⊗K, ΔE=E⊗1+K⊗E, ΔF=F⊗K⁻¹+1⊗F, and it is coassociative) and `quantumSL2_exists_pbwBasis` (∃ a basis indexed by ℕ×ℤ×ℕ whose (a,n,c) entry is F^a K^n E^c, so (0,0,0)↦1 and (0,−1,0)↦K⁻¹). The quotient `QuantumSL2` and the unit `quantumSL2KUnit` are kept; the gate now reports `sorry-data=0`.

## H02 (CBirkbeck) — applied

The cycle is real. `QuantumEnvelopingAlgebras` (open roadmap PR, README §"From TauCetiRoadmap.QuantumGroups" line 181, and line 348) consumes QuantumGroups Q8.1's rank-one Hopf algebra. Q9 consumed QEA0–QEA1 in the other direction. QuantumGroups is also a merged roadmap, which is extended only by a Part II. Q9 and every line that introduced it are therefore removed from this README: the title, the summary sentence, the "Q1–Q8 use complex algebras" scope sentence, the last sentence of the Q8 order paragraph, §Q9 and the two Q9 source bullets. The README is back to main's text plus the repairs listed under H04, H07, H10 and H12. The Q9 text at `f852474` is where **QuantumGroups, Part II** starts, placed after QuantumEnvelopingAlgebras. This job cannot create that folder; its introduction must say that the base roadmap stops at the rank-one lane Q8.

## H03 (CBirkbeck) — applied

Checked against the KacMoody roadmap at the head of its open PR. There is no KM5 section: its Layer 5 is labelled "(KM6)", path representatives, and its scope (README lines 52–60) assigns type-1 quantum integrable modules, quantum complete reducibility and crystal bases to **KacMoody, Part II**, which exists nowhere yet. With Q9 removed (H02), this README no longer cites KM5 or QEA. The Part II must name that missing supplier as a gap in its contracts, or own the finite-type type-1 modules itself. It must also derive the R coefficients from QEA1's pairing, since no quasi-R target exists in KacMoody.

## H04 (CBirkbeck) — applied differently

The TemperleyLiebOperatorAlgebras head has Layers 1–4 and no A1–A6, and that roadmap is later in the merge order than this merged one, so the supplier row (`README.md:43` at `f852474`) is removed rather than re-pointed. The positive TL quotient, its path models, the sign isomorphism δ ↔ −δ (e_i ↦ −e_i) and the unitary TL fusion rules Q7 uses are now target Q0.4 of this roadmap. In Q7 "A1–A6's positive-loop parameter" becomes "the positive-loop parameter of Q0.4". The algebraic input stays `../TemperleyLieb/README.md` Layers 0–7, a roadmap on main.

## H05 (CBirkbeck) — applied

The import header is `public import Mathlib` followed by only the two Tau Ceti modules used: `TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.FromMatrix` and `TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive`. These are now also `public import`, under a `module` header with `@[expose] public section` inside the namespace, as in `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean` on main. There is no `set_option`. The gate reports `imports=0 mathlib-subimports=0 no-import-mathlib=0`, and the build no longer warns "consider adding `module`".

## H06 (CBirkbeck) — applied

The four UPWARD edges (`README.md:40–43` at `f852474`, VonNeumannAlgebras, HilbertModules, CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras) went from this merged roadmap to roadmaps later in the merge order. They are removed by moving the consumed notions down into a new section Q0 of this README. Q0.1 covers state spaces, state extension, GNS against Mathlib's `PositiveLinearMap.gnsStarAlgHom` and the finite-dimensional bicommutant theorem. Q0.2 covers left Hilbert algebras, Tomita's theorem and KMS uniqueness. Q0.3 covers C*-tensor categories, conjugates, standard solutions, the sign ε and intrinsic dimension. Q0.4 covers positive TL quotients and the unitary TL category. Q0.5 covers free Hilbert modules H⊗A, `L_A ≅ M(K_A)` and the leg identifications. Every in-text citation (V1, V10/V11, CA1, CA2a, TL-OA §2.1) now points at the matching Q0.n. The CYCLE line disappears with the QuantumGroups → CA and → TL-OA edges, and depcheck now reports 0 problems.

## H07 (CBirkbeck) — applied

`Suggested.lean` now states the Q8 headlines on the actual quotient, all with q≠0 and q^r≠1 for r>0:
- `quantumSL2_isDomain`;
- `quantumSL2_center_eq_adjoin_casimir` (centre = `Algebra.adjoin ℂ {Ω}`, and Ω is transcendental);
- `quantumSL2_isSemisimpleModule` (every finite-dimensional module, with an explicit scalar tower);
- the classification of finite-dimensional simples, as three theorems: `quantumSL2_exists_highestWeightVector`, `quantumSL2_nonempty_linearEquiv_of_highestWeight` and `quantumSL2_exists_ladderAction`;
- the PBW and coproduct statements of H01.

The module docstring names every headline that cannot be stated at the pins and what it lacks:
- Q1, Q2, Q4 and Q7 lack the minimal C*-tensor product; neither library has one.
- Q2 also lacks the free Hilbert module H⊗A. Mathlib has `CStarModule` but not this construction.
- Q6 lacks a unitary rigid C*-tensor category and fibre functors.
- Q8.5 and Q8.6 lack the monoidal, rigid and pivotal finite Hopf-module category.

Q9's ribbon theorem leaves with Q9 (H02).

## H08 (CBirkbeck) — disputed

Rewriting Q1–Q8 into layers with `*Needs:*` lines, per-definition Checks and Examples/Dependencies endings would re-plan the merged roadmap. A merged roadmap is built on, not re-planned, and this PR's subject was Q9; the gate's shape counters (`layer-ids`, `target-ids`, `empty-sections`) are all 0. The nonsimply-laced example demanded for Q9.5 belongs to the QuantumGroups Part II, which must be written in the full layered shape: Checks for `RepUqg` such as the empty datum, the A₁ eigenvalues s and −s⁻³, and a B₂ case keeping both qᵢ.

## H09 (CBirkbeck) — answered

The Q9 locators (Chari–Pressley, Kassel, Snyder–Tingley v3) leave with Q9 (H02). The version and page check of Snyder–Tingley Theorem 3.16 (reported as preprint p. 7) is for the Part II; it was not fetched here. For Q8, the Virelizier bullet in "Sources and API evidence" already says that the centre, signed generalized-weight splitting, local finiteness, Clebsch–Gordan, compact pairing and classical specialization are developments specified in this README. Their inputs and proof routes are given inline: for example, item 3 gives the commutator formula, the operators X_r and the block argument. No new citation was added and no Jantzen locator was put into `Suggested.lean`, because that text is not openly available here.

## H10 (CBirkbeck) — applied

These links are replaced by repository-relative links:
- the PivotalSpherical commit-pinned blob (`README.md:49`) → `../PivotalSpherical/README.md`, Layers 0–2 and 7;
- the AmenableGroups "PR #821" link (`:48`) → `../AmenableGroups/README.md`, now "Layers 1, 5 and 7" with Layer 5 (Følner criteria for arbitrary discrete groups) named. The process sentence "without waiting for a merge" is dropped;
- the TemperleyLieb "PR #58" link → `../TemperleyLieb/README.md`;
- the commit-pinned Mathlib blob for `IsGroupLikeElem` (Q8.5) → the file path `RingTheory/Coalgebra/GroupLike.lean`, checked at the pin (line 37).

The QEA and KM5 blobs and the #1124/#1125 references left with Q9. The gate now reports `blob=0 prnum=0`.

## H11 (CBirkbeck) — applied

These are deleted from `Suggested.lean`:
- `FiniteHopfModuleCat`, `finiteProperty`, `toBaseModules`, `toFiniteBaseModules` and their two faithfulness instances (no headline used them);
- `freeOrthogonalCupVector` (unused);
- `freeOrthogonalCup_zigzag`. Its proof was entry (j,k) of its hypothesis: with F=[[0,1],[−2,0]] both sides give −2 on the diagonal and 0 off it.

The README's Q8.5 keeps the category's construction, now as unbackticked prose ("the finite Hopf-module category FiniteHopfModuleCat k H").

## H12 (CBirkbeck) — applied

The namespace is now `TauCetiRoadmap.QuantumGroups`. The module docstring has the "target signatures" form, and the file has the section comments `## Q3`, `## Q5` and `## Q8` in README order. Every declaration has a docstring that states its mathematics. `quantumSL2Casimir_commute` is deleted: it is implied by the centre theorem. Each of the 24 retained names is now named in the README at its claim:
- Q3: `StarCompatibleHopf`, `counit_star`, `antipode_star_antipode_star`, `coefficientMatrix_map_antipode_eq_star`, `antipode_coefficient`, `AlgebraicHaar`, `schur_orthogonality`;
- Q5: `freeOrthogonalRelation`, `freeOrthogonalCup_invariant`, `suqMatrix`, `SUqRelations`, `suqMatrix_unitary_iff`;
- Q8.1–8.3: the generator, relation and quotient names and the theorems of H01/H07.

The gate reports `readme-ids-missing=0`.

## Build

`lake build TauCetiRoadmap.QuantumGroups.Suggested`: **Build completed successfully (8985 jobs)**. The only warnings are the 13 `declaration uses 'sorry'` warnings, one per sorry'd theorem. The `module` warning is gone.

## Gate

    gate QuantumGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check (`--depcheck --movable`)

    depcheck: 235 roadmaps, 2063 edges, 0 problem(s)

There are no UPWARD, CYCLE or `moved:` lines. Two remaining supplier rows, CStarAlgebras (C1–C5, C8) and OperatorAlgebraDynamics, are neither on main nor in the merge order, so the scanner does not place them. They were not part of this repair.

## Elaborated signatures

All 24 declarations were checked mechanically. I appended `#check @name` lines for every one to the file temporarily, built once, then restored the file. Every elaborated type matches its README statement:
- `quantumSL2_isSemisimpleModule`, `quantumSL2_exists_highestWeightVector` and `quantumSL2_nonempty_linearEquiv_of_highestWeight` keep `[IsScalarTower ℂ (QuantumSL2 q) V]`, `[FiniteDimensional ℂ V]` and, where needed, `[IsSimpleModule …]` as explicit binders.
- `schur_orthogonality` keeps `StarModule`, `StarCompatibleHopf` and `IsSimpleOrder (Subcomodule)`.
- `StarModule` is absent from `coefficientMatrix_map_antipode_eq_star`, `antipode_coefficient`, `AlgebraicHaar`, `freeOrthogonalRelation`, `suqMatrix` and `SUqRelations`. This is now an explicit `omit` or simply not mentioned, and none of these bodies or statements uses scalar–star compatibility; `freeOrthogonalCup_invariant` and `suqMatrix_unitary_iff` keep it.
- The `DecidableEq` lead on the deleted cup vector is gone with it.
- The second repair changed only the header (`module`, `public import`, `@[expose] public section` … `end`). No declaration's statement or binders changed, and the rebuilt file elaborates the same 24 declarations.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `quantumSL2_existsUnique_comul` | relation KE=q²EK; relation [E,F]; generic q, and q=±1 (junk `(q−q⁻¹)⁻¹=0`) | ΔKΔE=KE⊗K+K²⊗KE=q²ΔEΔK. [ΔE,ΔF]=[E,F]⊗K⁻¹+(KF⊗EK⁻¹−FK⊗K⁻¹E)+K⊗[E,F]; middle term q⁻²FK⊗EK⁻¹−q⁻²FK⊗EK⁻¹=0; total c(K⊗K−K⁻¹⊗K⁻¹)=c(ΔK−ΔK⁻¹). At q=±1, c=0 and both sides are 0 | holds | new |
| coassociativity in the same theorem | E, F, K | (Δ⊗id)ΔE=E⊗1⊗1+K⊗E⊗1+K⊗K⊗E=(id⊗Δ)ΔE; (Δ⊗id)ΔF=F⊗K⁻¹⊗K⁻¹+1⊗F⊗K⁻¹+1⊗1⊗F=(id⊗Δ)ΔF; K grouplike | holds | new |
| `quantumSL2_exists_pbwBasis` | (0,0,0), (0,−1,0), (1,1,0) | 1, K⁻¹, FK; the reversed product KF=q⁻²FK (relation `kf`) is a rescaled basis vector, not a new one | holds; hypothesis matches Q8's standing hypothesis | new |
| `quantumSL2_isDomain` | generic q; q=i (excluded) | at q=i, r=4 violates `hgeneric`; U_q is still a domain there, so the hypothesis is stronger than needed (P3 note, kept for agreement with Q8's standing hypotheses) | holds | new |
| `quantumSL2_exists_highestWeightVector` | L₀⁻ (dim 1); L₁⁺ (dim 2) | L₀⁻: K=−1, ε=−1, q^(1−1)=1, so −1·1=−1. L₁⁺: Kv₀=q v₀=1·q^(2−1)v₀. Natural subtraction never hits dim 0, since a simple module is nontrivial | holds | new |
| `quantumSL2_nonempty_linearEquiv_of_highestWeight` | L₀⁺ vs L₀⁻; L₁⁺ vs L₁⁻ | eigenvalues 1 vs −1 and q vs −q differ, so the hypothesis fails and nothing is claimed; equal μ: both modules are simple quotients of the Verma module M(μ) | holds | new |
| `quantumSL2_exists_ladderAction` | m=0, ε=−1; m=1, ε=1 | m=0: K=−1, E=F=0, [E,F]=0=(−1−(−1))/(q−q⁻¹). m=1: K=diag(q,q⁻¹), Fv₀=v₁, Ev₁=v₀; [E,F]v₀=v₀=((q−q⁻¹)/(q−q⁻¹))v₀; [E,F]v₁=−v₁=((q⁻¹−q)/(q−q⁻¹))v₁ | holds | new |
| `quantumSL2_center_eq_adjoin_casimir` | Ω on L₀^±; q=±1 (junk, negative control) | Ω|L₀^±=±(q+q⁻¹)/(q−q⁻¹)², matching README's ε(q^(m+1)+q^(−m−1))/(q−q⁻¹)²; the values for m=0,1,2,… are pairwise distinct, so Ω is transcendental. At q=1, `(q−q⁻¹)⁻²=0`, so Ω=FE and the algebra is commutative: centre = everything ≠ ℂ[Ω]. Excluded by `hgeneric` at r=1 | holds; hypothesis necessary | new |
| `quantumSL2_isSemisimpleModule` | V=0; L₀⁻⊕L₁⁺; q=1 (junk, negative control) | dims 0 and 3, decompositions 0 and 1+2. At q=1 the quotient is ℂ[E,F,K^±1], commutative, and E acting on ℂ² by [[0,1],[0,0]] gives a non-semisimple module. Excluded by `hgeneric` | holds; hypothesis necessary | new |
| `schur_orthogonality` (docstring only) | trivial comodule, u=[1] | Tr F̃=Tr F̃⁻¹ forces F̃=[1]; h(1·1)=1=1/1 on both forms | holds | docstring |
| `freeOrthogonalCup_invariant` (docstring only) | n=1, F=[f] | the relation gives u=u*, and unitarity gives u²=1; claim u f u=f ⇔ u²=1 | holds | docstring |
| `suqMatrix_unitary_iff` (`omit` only) | A=ℂ, a=1, c=0, q=1 and q=0 | u=I unitary; relations: 1+0=1, 1+0=1, ac=0=q·ca | holds | binder explicit |
| Q0.1 states | A=ℂ² | states = {(t,1−t): 0≤t≤1}, compact; dropping φ(1)=1 gives the cone {(α,β): α,β≥0}, not compact | holds | new (moved down) |
| Q0.1 finite bicommutant | diagonal D ⊂ M₂; ℂe₁₁ (non-unital); upper-triangular T (non-star) | D′=D, D″=D; (ℂe₁₁)′=D, so (ℂe₁₁)″=D ⊋ ℂe₁₁; T′=ℂ1 (diag(a,b)e₁₂=a e₁₂, e₁₂diag(a,b)=b e₁₂ forces a=b), so T″=M₂ ⊋ T | holds; unital and star hypotheses necessary | new (moved down) |
| Q0.2 modular group / KMS sign | M₂, ρ=diag(1/3,2/3), x=e₁₂, y=e₂₁ | φ(xy)=1/3. σ_t=ρ^(it)·ρ^(−it): σ_(−i)(x)=(1/2)e₁₂, φ(yσ_(−i)x)=(1/2)(2/3)=1/3, equal. Reversed sign: σ_(−i)(x)=2e₁₂, value 4/3, not equal | convention pinned, agrees with Q3's `h(ab)=h(bσ_(−i)(a))` | new (moved down) |
| Q0.2 faithfulness | vector state at e₁ on M₂ | e₁₂e₁=0 but e₂₁e₁=e₂≠0, so x ξ ↦ x* ξ is ill-defined | hypothesis necessary | new (moved down) |
| Q0.3 standard solutions, d | ℂⁿ; (λR, λ⁻¹R̄), λ>0, λ≠1; SU(2) and SO(3) fundamental representations; ℤ/2 | ‖R‖²=n, d=n; rescaled pair: zigzag factor λ·λ⁻¹=1 so it still solves, but R*(ι⊗T)R=λ²Tr T ≠ λ⁻²Tr T, so it is not standard; ε=−1 for SU(2), ε=+1 for SO(3); d(g)=1; SUq(2): d=|q|+|q|⁻¹ against rank 2 | holds | new (moved down) |
| Q0.4 TL positivity | n=2, Gram [[δ²,δ],[δ,δ²]]; δ=1=2cos(π/3); δ=√2, n=3 | det=δ²(δ²−1): >0 for δ≥2; at δ=1 the radical is ℂ(1−e) (δ²−δ=0), quotient dim 1 = paths 0→1→0; at √2, dim TL₃ quotient = 2²=4 (both length-3 paths end at 1) against Catalan 5 | holds | new (moved down) |
| Q0.4 sign twist | e ↦ −e | (−e)²=e²=δe=(−δ)(−e), so it is an isomorphism TL(δ)→TL(−δ); the identity would need δe=−δe | holds | new (moved down) |
| Q0.5 L_A ≅ M(K_A) | A=ℂ; A=M₂, H=ℂ; A=C[0,1], J={f: f(0)=0} | B(H)=M(K(H)) ⊋ K(H) for infinite-dimensional H; right multiplication by a non-central a is not right A-linear; J→A is bounded and A-linear, but an adjoint would need f∈J with x*f=x* on J, so f=1 on (0,1] and f(0)=0, impossible | holds; adjointability is not automatic | new (moved down) |

## Ownership, suppliers, sources

- **Ownership.** The rank-one U_q(sl₂) algebra, PBW, centre and modules are owned here: the QuantumEnvelopingAlgebras README (line 56) assigns them to QuantumGroups Q8. No declaration in `Suggested.lean` shares a fully qualified name with another roadmap's.
- **Suppliers / moved down.** VonNeumannAlgebras (V1, V10–V11), HilbertModules (H1–H3), CategoricalOperatorAlgebras (CA1a, CA2a) and TemperleyLiebOperatorAlgebras (§§1.1–1.4, 2.1, 3.1–3.4) are later in the merge order than this roadmap, which is on main. The notions consumed from them move down to Q0.1–Q0.5 here, and those roadmaps consume them from QuantumGroups Q0. The Mathlib inputs cited in Q0 were checked at the pin: `PositiveLinearMap.GNS`, `PositiveLinearMap.gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:147,246`), `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean:72`), `WeakDual.isCompact_polar` (`Analysis/Normed/Module/WeakDual.lean:313`), and `VonNeumannAlgebra` with `commutant` (`Analysis/VonNeumannAlgebra/Basic.lean:67,123`). The structure field `centralizer_centralizer'` makes the bicommutant equation part of the definition, so the bicommutant theorem for a given star subalgebra is not at the pin. Mathlib has no dagger or C*-tensor category and no Temperley–Lieb algebra at the pin. No Lean declaration was added for Q0, because these are README targets and not headlines.
- **Sources.** No source was fetched. Q0 cites standard textbooks by section only: Murphy, *C*-Algebras and Operator Theory*, §§3.3, 4.1; Takesaki, *Theory of Operator Algebras II*, Chapters VI §1 and VIII §1; Neshveyev–Tuset, *Compact Quantum Groups and Their Representation Categories*, Chapter 2; and Lance, *Hilbert C*-Modules*, Chapters 2 and 4. These citations are uncertified. They are not yet recorded in a `sources.toml`, which this repair did not create. No `needs-references.toml` was written, because no statement depends on reading a passage of these texts.
- **Untrusted text.** The review contained no instructions outside its mathematical claims.
