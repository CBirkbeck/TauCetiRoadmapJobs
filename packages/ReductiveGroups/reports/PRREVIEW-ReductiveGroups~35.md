# Review of ReductiveGroups (pull request #1797 at 6dc200b)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/` at `6dc200b88d273a0459b10866875ecdff5a1c7983` (the folder changed by 4794 lines since `4fe7620`, the head the previous review read). The repair commit replaced the folded 1789-line `Suggested.lean` and the old README by the revision of this folder that review PRREVIEW-ReductiveGroups~19 accepted (pull request #1676 at 92ab639), adapted to the bumped pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 per `lake-manifest.json`), with the module-system header, Layer 7a owning Lang's theorem, Layer 1.1 owning rational cohomology and cotensor induction, Layer 11A owning the configuration/braid comparison, and the Levi headline stated. The seven `*Targets.lean` companions are deleted from the tree, so the pull request now removes their 273 statements rather than folding them (the README keeps every one as a target or Check). All twelve findings of the previous review are repaired (list below). Two defects remain, both P3, neither blocking.

## R01 (P3) — a merge leftover in the folder: `Suggested.lean.orig`

Location: `TauCetiRoadmap/ReductiveGroups/Suggested.lean.orig` (362 lines, tracked at this head; `git ls-tree HEAD TauCetiRoadmap/ReductiveGroups/` lists it beside `README.md`, `Suggested.lean`, `metadata.toml`, `PROGRESS.md`, `STATUS.md`).

Claim: the folder holds only roadmap files.

Witness: the gate at this head, rerun today, prints `stray-files=1 … FAIL` with the line `TauCetiRoadmap/ReductiveGroups/Suggested.lean.orig: not a roadmap file`. The file differs from `Suggested.lean` in four lines only (three `noncomputable` keywords at lines 112, 116, 119 and `TauCeti.AlgHom.mapValue` versus `AlgHom.mapValue` at line 240): it is the pre-merge copy left by the merge commit 56fd8a86 / 4154e2e9.

Repair: `git rm TauCetiRoadmap/ReductiveGroups/Suggested.lean.orig`. Tested: with the file removed the gate's stray-files scanner has nothing to list (the same scanner lists `TauCetiRoadmap/AlgebraicTopology/Suggested.lean.orig` under `outside-folder`, the sibling folder's own review).

## R02 (P3) — three definitions in `Suggested.lean` that no headline theorem uses

Location: `TauCetiRoadmap/ReductiveGroups/Suggested.lean:316–359` (`namespace CoverLifts`: `liftSubgroup`, `LiftGroup`, `projection`), the docstring sentence at lines 28–32 ("Layer 9A.1a-L's group of kernel-fixing lifts … is defined here … its kernel theorem and the signed ADE instance are README targets"), and `README.md:2188–2191` ("`Suggested.lean` declares this subgroup … as `CoverLifts.liftSubgroup`, with `CoverLifts.LiftGroup` its group and `CoverLifts.projection` the homomorphism to `A`").

Claim: the acceptance test may carry a definition on its own.

Witness: the file states no theorem whose type mentions `liftSubgroup`, `LiftGroup` or `projection` (`grep -n 'liftSubgroup\|LiftGroup\|projection' Suggested.lean` finds only lines 316–359 and the docstring); the rules for `Suggested.lean` admit definitions only to make a headline statable and want no API catalogue. The section is new relative to the accepted revision (92ab639 has no `CoverLifts`); it is the surviving fragment of the old main file's `CoverLifts` block, whose sorry'd proof fields are now proved.

Repair: delete lines 316–359 and the docstring sentence at lines 28–32; in `README.md:2188–2191` replace the sentence by prose without a backticked name of this roadmap's own ("Construct the subgroup of `MulAut(Cover) × A` of pairs `(φ, g)` … with its projection to `A`" is already said at lines 2182–2188, so the sentence can simply go). The README keeps the construction as the 9A.1a-L target. Tested: a scratch copy of `Suggested.lean` with lines 316–359 removed elaborates with `lake env lean` (exit 0, the same 12 `declaration uses sorry` warnings, no other output). The alternative, stating the headline the definitions were meant to serve (the kernel of `projection` for the signed ADE cover is `Hom(Q, ℤˣ)`), is not statable at the pins: the signed ADE cover is not a pinned carrier (module docstring, "Layer 9: … signed ADE cover Lie algebras").

## Previous findings

- R01 (45 sorry'd definitions and instances) — repaired: the folded statements are gone; gate `sorry-data=0`; the 28 declarations are 16 definitions and instances with real bodies and 12 sorried theorems.
- R02 (Layer 7a and ReductiveGroupsPartII RG2.3.7 supplying each other) — repaired: `README.md:9–27` and `:1504–1577` ("This layer owns Lang's theorem for the `q`-Frobenius … Nothing in this layer is imported from a roadmap that consumes this one"); ReductiveGroupsPartII appears only at lines 25–26 and 3676 as a consumer; no `**Supplier:**` paragraph remains (`grep` finds none).
- R03 (FormalConnectionsOpers F4.3 as prerequisite) — repaired: FormalConnectionsOpers appears only at `README.md:1333` and `:3677` as a consumer; Layer 3A.5 (`README.md:789–880`) owns the classical complex-point topology, charts and the orbit comparisons that Layer 11 consumes.
- R04 (IntegralHeckeAndGaloisDeterminants §0.7 and IG.5.1 consumed) — repaired: Layer 1.1 (`README.md:447–548`) owns rational cohomology and cotensor induction; 11A (`README.md:3336–3403`) owns the configuration/braid comparison; both open roadmaps appear only in the Scope and Downstream paragraphs as consumers.
- R05 (Levi headline absent; docstring silent) — repaired: `StructureAcceptance.exists_levi_complement` at `Suggested.lean:191–209`; the docstring lists the unstatable headlines with their missing carriers (lines 34–85).
- R06 (build: module header; `arrangementAction`) — repaired: `module` / `public import` / `@[expose] public section`; `arrangementAction` gone; gate `build=0`; `lake env lean` exit 0.
- R07 (import order; submodule import) — repaired: `imports=0`, `mathlib-subimports=0`.
- R08 (seven blob links) — repaired: `blob=0`.
- R09 (link to `BruhatCoordinateTargets.lean`) — repaired: `grep Targets.lean README.md` finds nothing; the A2 regressions are Checks at `README.md:386–398`.
- R10 (thirty padding declarations) — repaired: all gone with the fold.
- R11 (Layer 0 re-planning fppf descent and torsors) — repaired: `README.md:34–40` and `:279–285` consume SchemeAndStackFoundations §1.1, §§1.5, 1.13–1.15; Layer 0 (`README.md:361–367`) builds only the Hopf/points adapters.
- R12 (house shape) — repaired: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, layers with `*Needs:*` lines (56) and `**Checks.**` lists (44), Examples and Dependencies per layer, Downstream consumers, References.

## Verified sound

**Change set.** `git diff --stat origin/main...HEAD` outside the five folders the brief names as the pull request's own is empty. Inside this folder the pull request deletes the seven `*Targets.lean` files, rewrites `README.md` (3759 lines) and `Suggested.lean` (362 lines), and adds the `.orig` file of R01. The pull request's description still describes a fold of 273 statements into sections of `Suggested.lean`; that text is outside the folder and is left to the author.

**Gate at this head** (rerun today):

```text
gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=1 dirty=0 outside-folder=44 source-material=0 FAIL
```

`stray-files=1` is R01; `outside-folder=44` lists the four sibling folders the brief names as the pull request's own and is not a finding. The worker's run adds `build=0`.

**Dependency check** (`--movable`, board order, content checkout at ffac5139):

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every roadmap that is not on main and is named in the README (FormalConnectionsOpers, AdelicAlgebraicGroups, IntegralHeckeAndGaloisDeterminants, ComplexComparisonPartII, InverseGaloisAndArithmeticFundamentalGroups, ReductiveGroupsPartII's extension role) appears only as a consumer (lines 25–31, 1333, 3676–3686), never in a `*Needs:*` line, a Dependencies paragraph or a "consume" sentence. Every supplier cited is on main: SchemeAndStackFoundations §§0.3, 0.7, 0.8, 1.1, 1.2, 1.5, 1.13, 1.14, 1.15, 2.6, 4.12 (headings at its lines 551, 755, 798, 2071, 2091, 2167, 2418, 2458, 2502, 3437, 5613); ModularCurves §0E (effective descent, line 386) and §0F (finite-locally-free Weil restriction, line 412); RootSystems §2.1 (line 434, `weylCoxeterHom_injective` at 437), §3.1 (line 506) and its supplier contract naming `existsUnique_mem_orbit_inter_dominantChamber`, `stabilizer_eq_closure_wallReflections`, `existsUnique_dynkinType`, `DynkinType.simplyConnectedRootDatum`, `DynkinType.rationalRootSystem` (lines 193–224); LieHighestWeight Layers 3–4 and 7 (lines 405, 537, 931; Lie Chevalley restriction at 980, Serre's relations at 1158); InductionRestriction Layer 2.1 (line 346, the anchor the link uses); GroebnerGeometry G5 (line 394); ReflectionInvariantTheory §§1, 3; IntegralLattices (`integralForm` at line 833); LieGroups Layers 2, 7, 8 (`RepresentationTheory/LieGroups/README.md:275, 407, 428`); SmoothBundlesConnections B1.0, B1.1, B1.4 (lines 26–31); DGFloer Layer 1 item 2 (the based fibration sequence, lines 442–500); AlgebraicVectorBundles; AlgebraicTopology's based van Kampen (its line 25). None of these cites ReductiveGroups as a supplier except NilpotentOrbits, SchubertGeometry and CFSGStatement, which the README lists as consumers.

**Ownership against open work.** IntegralHeckeAndGaloisDeterminants §0.7 at its open head still constructs rational cohomology and algebraic induction itself (its lines 1145–1210) and cites ReductiveGroups only for root data; AdelicAlgebraicGroups §3.1 states a Levi decomposition for closed subgroups (its "Algebraic Levi decompositions" paragraph); ReductiveGroupsPartII RG2.3.7 on main states Lang's theorem with `*Needs:*` into ReductiveGroups layers 3 and 0. In each case this roadmap, on main, is the lower owner and the Scope paragraph records the other as a consumer; the reciprocal edits (citing Layer 1.1, 6A, 7a) belong to those roadmaps and are only recorded here. Ownership against open pull requests whose files the brief does not give was checked through the roadmap index only.

**Elaboration at the pins.** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` from the worktree: exit 0 in 3 s, 12 `declaration uses sorry` warnings (the 12 sorried theorems), nothing else. The worker's `#check @name` table (`signatures.md`, 28 declarations, 0 flagged) was compared entry by entry with the README: the five 3A theorems carry `IsAlgClosed k`, `IsAffine G.left`, `Smooth G.hom`, `QuasiCompact G.hom`, `LocallyOfFiniteType X.hom`, `QuasiCompact X.hom`, `IsSeparated X.hom` in their own signatures as `README.md:712–716` requires, with `Nonempty (Points X)` on `exists_closed_orbit`; `linearlyReductive_of_reductive` carries `[CharZero k]`; `exists_levi_complement` and `lang_surjective` carry `Algebra.Smooth k H`, geometric connectedness and (for Lang) `[Finite k]`, `[IsAlgClosed K]`, the Frobenius value equation; `exists_conjugate_eq_of_isBorelOverAlgClosed` takes algebraic closedness from the Borel predicate (`Borel/Basic.lean:148–150`, `IsAlgClosed k ∧ Minimal …`). No signature was changed, so nothing was re-elaborated.

**One-tactic probe** (two scratch copies, every `by sorry` replaced by `by simp`): none of the 12 theorems closes (`simp` leaves unsolved goals on the five 3A theorems, `linearlyReductive_of_reductive`, `exists_levi_complement`, `lang_surjective`, `exists_coordinatePresentation`, `permutation_nonsplit`; "simp made no progress" on `exists_conjugate_eq_of_isBorelOverAlgClosed` and `plane_braid`). The definitions have real bodies on native carriers (`Set.range`, `closure`, `topologicalKrullDim`, `Matrix.det`, `Subtype`, `Quotient`, `MulAction`); the `CoverLifts` ones are R02.

**Library declarations opened at the pins** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b): `reductiveCommHopfAlgProperty` (`Algebra/AlgebraicGroup/Reductive/Basic.lean:71–84`, smooth ∧ geometrically connected ∧ no smooth connected normal unipotent subgroup over the closure); `linearlyReductiveCommHopfAlgProperty` (`LinearlyReductive.lean:61–63`, `Coalgebra.IsLinearlyReductive`: every finite-dimensional comodule in the base universe completely reducible); `geometricallyConnectedCommHopfAlgProperty` (`Connected/CommHopfAlgCat.lean:59–62`, `PrimeSpectrum (H ⊗ K)` connected for every field extension); `IsBorelOverAlgClosed` (`Borel/Basic.lean:148`); `HopfIdeal.conjugate` (`HopfIdeal/Conjugation.lean:75`); `unipotentRadicalDefiningIdeal` (`Unipotent/Radical/Construction.lean:69`); `coinvariants` (`Algebra/Bialgebra/ComoduleAlgebra.lean:136`, the equalizer of the coaction and `includeLeft`); `AlgHom.mapValue` (`FunctorOfPoints.lean:143`, postcomposition `toConv (φ.comp f.ofConv)`); `GeneralLinear.genericMatrix` (`GeneralLinear/Coordinate/HopfAlgebra.lean:464`); `SpecialLinear.coordinateHopfAlgebra` (`SpecialLinear/Basic.lean:47–96`, the determinant-one quotient); `BraidGroup` (`Braid/Basic.lean:99`, `ArtinGroup (CoxeterMatrix.A (n − 1))`), `permHom` (358), `pureSubgroup` (504), `ArtinGroup.exponentSum` (used at 153–155); Mathlib `AlgebraicGeometry.Smooth` (`Morphisms/Smooth.lean:59`), `IsSeparated` (`Morphisms/Separated.lean:44`), `weylGroupRootRep` / `weylGroupCorootRep` (`LinearAlgebra/RootSystem/WeylGroup.lean:132, 136`, the latter a `weylGroup.op` representation as `README.md:3414–3416` says). The 150 further names the README's supplier contracts and layers backtick (listed in the scratch file `names.txt`) were all found in the pinned Mathlib or Tau Ceti sources; `Adjunction.ofNatIsoLeft`, `isLocallyConstructible_image`, `soIndefiniteEquiv`, `typeBEquivSo'`, `weylGroupRootRep` live in Mathlib, the rest in Tau Ceti.

**Seeded sample.**

- "1.1 Rational cohomology and algebraic induction" (`README.md:447–548`): Jantzen, *Representations of Algebraic Groups I* (1985 preprint, `jantzen-1985`; printed page = cache page marker − 5, e.g. marker 60 shows printed 55 at line 1558). §2.8 "The Comodule Map" and the equivalence of G-modules with k[G]-comodules at lines 1100–1136 (markers 41–43, printed 36–38; cited "pp. 36–39" ✓); §3.9 (injective G-modules, "any G-module can be embedded into an injective G-module", `I ⊗ k[G] = ind I` injective) at lines 1688–1707, marker 65, printed 60 ✓; §§3.3–3.7 between §3.2 (line 1499, marker 57, printed 52) and §3.8 (line 1647, marker 63, printed 58), so printed 52–57 ✓ ("53–57"), with reciprocity's inverse map `(u ⊗ id)∘ρ_N` and transitivity at lines 1559–1583; §4.2 between §4.1 (line 1886, printed 68) and §4.5 (line 1969, printed 71) ✓ ("69–70"); §4.7 between §4.5 and §4.9 (line 2033, printed 74) ✓ ("72–73"); §§4.14–4.16 between §4.12 (line 2081, printed 76) and §4.17 (line 2162, printed 80) ✓ ("77–79a"). The enough-injectives argument at `README.md:479–485` (embed into an injective module, `M → M ⊗ H → I ⊗ H`, flatness, cofree right adjoint) is Jantzen's 3.9 proof at lines 1699–1707. The source states the subgroup case; the README says so and proves the equalizer form for arbitrary Hopf maps.
- "8.1 Split reductive data" (`README.md:1970–1992`): Conrad, *Reductive Group Schemes* (`conrad-rgs`), Definition 5.1.1 at line 5651 after the page-136 marker (5636) ✓: a reductive group over a non-empty scheme, a maximal torus `T ≃ D_S(M)` with `M` finite free, the weights on `𝔤` constant sections of `M`, each root space free of rank one, each coroot a constant section of `M∨`; the text says it does not assume `S` connected, matching the README's "even on disconnected bases" and the empty-base Check.
- "8.2 Pinnings" (`README.md:1994–2012`): Conrad, Definition 6.1.1 at lines 7725–7737 (page-186 marker at 7712) ✓: a positive system (equivalently a base) and trivializing sections `X_a ∈ 𝔤_a(S)` for the simple roots; Remark 6.1.2 at lines 7738–7751 (p. 186; the README's "pp. 186–187" also covers the isomorphism notion that opens p. 187) ✓: on a disconnected base a Borel containing `T` need not come from a constant `Φ⁺`, which is the README's `Spec(k × k)` Check.

**Other locators read today.** McNinch (`mcninch`): §3.1 p. 6, lines 236–252 (Levi factor defined by `M ⋉ R → G` an isomorphism; characteristic zero always has one) and (3.2.1) p. 7, lines 280–281 (the Greenberg transform `H` of a split semisimple group over `W₂(k)` has no Levi decomposition, remark (a) for `SL₂`) ✓. Dudas–Michel (`dudas-michel`): Lemma 7.6 p. 25 (line 1145, (i) needs `A` connected, (ii) adds normality) ✓; Prop. 8.7 p. 31 (1424) and 8.9 p. 32 (1457, common torus `T`, `(P∩Q)U` parabolic with Levi `L∩M`, `P∩Q` connected, unique factorization) ✓; Prop. 9.4 p. 36 (1614, biadjunction, `*R ≃ ΛU^F\G^F ⊗ −`) ✓; Theorem 9.6 p. 37 (1665, the Mackey formula as displayed at `README.md:1791–1794`, `S(L,M)` as at 1750) ✓; Theorem 10.1 p. 41 (1808; the source proves only `Λ = ℂ` and cites Howlett–Lehrer and Dipper–Du for general `Λ`, as the README says) ✓. Conrad–Feng (`conrad-feng`): Prop. 12.3.1 p. 127 (line 5345) ✓, Theorem F.3.7 p. 208 (8986) ✓, Prop. F.5.10 p. 218 (9448) and the Galois-descent sentence at 9446 ✓, Definition H.1.1 p. 238 (10356) ✓. Conrad: Theorem 5.1.13 pp. 143–145 (6011) ✓, Theorems 6.1.16–6.1.17 pp. 196–197 (8159, 8173) ✓, Theorem 3.3.4 p. 98 (4072) ✓, Theorem 4.1.7 p. 112 (4632) ✓. SGA 1 (`sga1`, arXiv revised edition): Exposé XII starts at printed p. 239 (cache marker 255), Prop. 2.1 p. 242 (9493), Prop. 3.1 p. 244 (9594), Prop. 3.2 pp. 244–245 (9639) ✓. Frenkel–Kac: (2.3) p. 40 (762), Prop. 2.2 p. 41 (781) ✓. Gros–Kaneda: (2.1) p. 6 (576), theorem announced p. 2 (75) ✓. Brieskorn: Proposition 1 at printed p. 25 (line 98; the cache's page 6 carries a cover page offset, its last page 25 being printed 44) ✓. Salvetti: Theorem 1 p. 611 (366) ✓. Callegaro: Theorems 2.4–2.5 p. 272 (219–233, footer "– 272 –" at 240) ✓. Birman–Brendle pp. 4–5 and p. 69 (markers 107, 148, 2626; Fox–Neuwirth presentation at 2659–2662) ✓. Fox–Neuwirth §7 begins at the foot of p. 122 (line 153) and runs over pp. 123–126 ✓. Fadell–Neuwirth: Theorem 3 (`π : F_{m,n} → F_{m,r}` locally trivial) on p. 114 (line 129) ✓. Riche: Remark 1.23 p. 27 (1054), §2.9.1 p. 50 (2111) ✓. Hedén §§1, 3 (16, 238) ✓. Milne: see Not verifiable.

**Adversarial calculations.** One row per statement checked; "Pass" means the statement holds on the instance with the hypotheses as written.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `orbit_locallyClosed` etc., hypotheses | empty `X` | `Points X = ∅`; `exists_closed_orbit` needs `Nonempty (Points X)`, the others take an `x` | Pass |
| `boundary_dimension_lt` | constant `S₃` on itself | orbit six points, closure the same, boundary `∅`, `topologicalKrullDim ∅ = ⊥ < 0` | Pass |
| `boundary_dimension_lt` | `𝔾_m` on `ℙ¹`, `x = [1:1]` | orbit `ℙ¹ ∖ {0, ∞}` dim 1, boundary two points dim 0 | Pass |
| `exists_closed_orbit_in_closure` | `𝔾_m` on `𝔸¹`, `x = 1` | closure `𝔸¹`, contains the closed orbit `{0}` | Pass |
| 3A Check, `𝔾_a` on `𝔸²` | `(x,y) ↦ (x+ay, y)` | orbits `{y = c}` (dim 1) and points `(x,0)` (dim 0), all closed | Pass (closed orbits of two dimensions) |
| `linearlyReductive_of_reductive` | `H = k` (trivial group) | reductive (no nontrivial subgroup); every comodule trivial, semisimple | Pass |
| same, hypothesis needed | `SL₂` in char `p`, binary forms `R_p` | submodule `⟨x^p, y^p⟩` has no complement; excluded by `[CharZero k]` | Pass |
| `exists_levi_complement` | reductive `G` | `I_u` = augmentation ideal, coinvariants `= O(G)`, `J = 0`, composite the identity | Pass |
| same | unipotent `G` | `I_u = 0`, coinvariants `= k`, `J` = augmentation ideal, `k → k` | Pass |
| same, wrong model | Borel of `SL₂`, `O(B) = k[a,a⁻¹,b]` | `J = (b)`: composite `k[a,a⁻¹] → k[a,a⁻¹]` bijective; `J = (a−1)`: `a ↦ 1`, not injective | Pass (not every `J`) |
| same, characteristic hypothesis | Greenberg transform of `SL₂` over `W₂(k)` | no Levi factor (McNinch (3.2.1)); excluded by `[CharZero k]` | Pass |
| `exists_conjugate_eq_of_isBorelOverAlgClosed` | `SL₂`, upper and lower Borels | `w = [[0,1],[−1,0]]`: `w[[a,b],[0,d]]w⁻¹ = [[d,0],[−b,a]]` | Pass |
| same | constant `S₃`, `μ_p` | only smooth connected solvable subgroup is trivial; `I = J`, `g = 1` | Pass |
| same, field hypothesis | `SL₂` over `ℝ` | diagonal torus and `SO₂` not conjugate (unbounded vs compact points); `IsAlgClosed` is a conjunct of the predicate | Pass |
| `lang_surjective`, convention | `𝔾_a` over `𝔽₂`, `θ² + θ + 1 = 0` | `θ⁻¹F(θ)` additive form `θ² − θ = 1`; derivative of `t² − t` is `1` | Pass |
| same | `𝔾_m` over `𝔽₂` | `θ⁻¹θ² = θ`, `θ·θ⁻² = θ⁻¹ = θ²` (`θ³ = 1`) | Pass (the two conventions differ) |
| same | `SL₂`, `u(θ)` | `u(−θ)u(θ²) = u(θ² − θ) = u(1)` | Pass |
| same | `𝔾_a` over `𝔽₃`, `η² = −1` | `η³ − η = −2η = η` | Pass |
| same, connectedness | `μ₂`, `q` odd; constant `C₂` | Lang map `z ↦ z^(q−1) = 1` misses `−1`; `C₂` has `F = id`, value `1` only | Pass (excluded) |
| fixed-coset lifting Check | `H = F̄_qˣ`, `J = {±1}`, `a^(q−1) = −1` | `σ(a) = −a ∈ aJ`, coset `{a, −a}`, `σ(−a) = a`: no fixed element | Pass (hypothesis needed) |
| 7a Check | `SL₂(F_q)` | `q(q²−1) / (q(q−1)) = q + 1 = |ℙ¹(F_q)|` | Pass |
| 7b Check | `GL₂`, `P = B⁺`, `Q = uB⁻u⁻¹`, `u = [[1,1],[0,1]]` | `T ∩ uTu⁻¹` = scalars; `P ∩ Q` = stabilizer of `⟨e₁⟩, ⟨e₁+e₂⟩` = `uTu⁻¹` (dim 2) vs `(L∩M)⋉1` (dim 1) | Pass (hypothesis needed) |
| 7e Check | `GL₂(𝔽₃)`, `t = diag(2,1)`, `w` the swap | `tw = [[0,2],[1,0]]`, `wt = [[0,1],[2,0]]`; second columns `(2,0)`, `(1,0)`, invariant under right `U⁻` | Pass |
| 7f identity | `S₃`, `H = ⟨(12)⟩`, `g = (12)` | fixed cosets: `H` only (`(13)(12)(13) = (23) ∉ H`); `1·2 = 2 = |C_G(g)|·|g^G ∩ H| = 2·1` | Pass |
| 7f identity | `g = 1` | `|G/H|·|H| = |G|·1` | Pass |
| `exists_coordinatePresentation` | `n = 0, 1, 2` | relation `0`, `x − 1`, `ad − bc − 1`; algebras `ℤ`, `ℤ`, `O(SL₂)`; over `ℤ/4`, `[[1,1],[0,1]]⁻¹` has entry `−1 = 3` | Pass |
| `plane_braid` | `n = 0, 1` | `UnorderedPlane` a point / `ℂ`, `π₁ = 1`; `BraidGroup n = ArtinGroup (A (n−1))` with `0 − 1 = 0`, trivial | Pass (junk value harmless) |
| `plane_braid` | `n = 2` | `Conf₂(ℂ) ≅ ℂ × ℂˣ`, `π₁ = ℤ = ArtinGroup (A 1)` | Pass |
| `permute` direction | `n = 3`, `σ = (012)`, `z = (0,1,2)` | `(σ·z)_i = z_(σ⁻¹ i) = (2,0,1)`; `z_(σ i)` would give `(1,2,0)` | Pass |
| `permutation_nonsplit` | `n = 2` | `ℤ → C₂` parity; section needs `m` with `2m = 0`, `m` odd | Pass |
| same | `n ≥ 3` | lifted transposition `b`, `b² = 1` gives `2·es(b) = 0`, parity of `es(b)` odd | Pass |
| Layer 0 Check | `GL₂(ℤ)` | `[[1,1],[0,1]]·[[1,0],[1,1]] = [[2,1],[1,1]]`, reverse `[[1,1],[1,2]]` | Pass |
| Layer 1.1 cofree complex | `H = ℤ[t,t⁻¹]`, weight-one line | `d(1⊗(t−1)) = 1⊗[t⊗(t−1) − (t⊗t − 1⊗1) + (t−1)⊗1] = 0` | Pass |
| Layer 1.1 trivial group | `H = ℤ`, `M = ℤ/2` | `d⁰ = 0`, `d¹ = id − id + id = id`, `d² = 0`; `H⁰ = ℤ/2`, `H¹ = H² = 0` | Pass |
| Layer 1.1 induction Check | `C₂ ⊂ S₃`, trivial coefficients | functions on `C₂\S₃`, rank 3; `f(g) = F(g⁻¹)` sends `1_{C₂(123)}` to `1_{(132)C₂}` | Pass |
| Layer 1.1 nonsurjective `q` | `ℤ → ℤ[t,t⁻¹]` | induction = invariants: weight-one line `0`, trivial line `ℤ` | Pass |
| Layer 3 Hopf ideal | `(tⁿ − 1) ⊂ k[t,t⁻¹]` | `Δ = (tⁿ−1)⊗tⁿ + 1⊗(tⁿ−1)`, `ε = 0`, `S = −t⁻ⁿ(tⁿ−1)`; `(t − 2)` has `ε = −1` | Pass |
| Layer 4 Jordan | `[[2,1],[0,2]]` over `ℚ`; `[[0,1],[a,0]]` over `𝔽₂(a)` | `g_s = 2I`, `g_u = [[1,1/2],[0,1]]`; `x² − a = (x − √a)²`, `g_s` needs `√a` | Pass (perfectness needed) |
| Layer 5P | `X = E₁₂ + E₂₃` | `X² = E₁₃`, `exp X = I + X + E₁₃/2` | Pass (char 0) |
| Layer 6A Check | `𝔾_m` on weight-one `𝔾_a` | regular cocycle `a(ts) = a(t) + t a(s)` forces `a_n = 0` for `n ≠ 0,1`, `a_0 + a_1 = 0`, so `a = a_1(t − 1) = d(a_1)` | Pass (`H¹ = 0`) |
| Layer 6B Check | `GL₂/O₂`, `g = diag(2,1)`, `h` the swap | `ggᵗ = (gh)(gh)ᵗ = diag(4,1)`; `gᵗg = diag(4,1)`, `(gh)ᵗ(gh) = diag(1,4)` | Pass |
| 9A.1a sign | `A₂`, `α₁ < α₂`, `a = (1,1)` | `ε(a,−a) = (−1)^(bond(2,1)·1·(−1)) = −1`; `[E₁₃, −E₃₁] = −(E₁₁ − E₃₃)` | Pass |
| 9A.1b folded Cartan | `A₃` flip; `A₄`; `D₄` triality | `[[2,−2],[−1,2]]`; `[[2,−1],[−2,2]]`; `[[2,−3],[−1,2]]` from `C_(O,P) = c_O Σ_(i∈O) B(α_i,α_j)` | Pass |
| 9A.1b `B(β_O,β_O)` | regular orbit | `B(S_O,S_O) = |O| d_O`, so `B(β_O,β_O) = d_O/|O|` | Pass |
| 9A.1b `A₂` exchange | `e = x_α + x_β`, `f`, `h` | cross brackets vanish (`α − β ∉ Φ`); `[e,f] = h`, `[h,e] = (2 − 1)e = e`; frame `E,2f,2h` index 4 | Pass |
| 9A.1b dimensions | `D₄` triality; `E₆` reversal | `6 + 6 + 2 = 14`; `24 + 24 + 4 = 52` | Pass |
| 9B.1 big cell | `SL₂`, `g = [[a,b],[c,d]]` | `u₋(c/a)·diag(a,a⁻¹)·u₊(b/a) = [[a,b],[c,(1+bc)/a]]`, `(1+bc)/a = d`; `|SL₂(ℤ/4)| = 48`; `[[2,1],[3,2]]` has no unit in `(2,3)` | Pass |
| 9B Weyl word | `SL₂(ℤ/4)` | `x_α(1)x_(−α)(−1)x_α(1) = [[0,1],[−1,0]] = [[0,1],[3,0]]` | Pass |
| 9B special isogeny | `B₂`, `α` short, `β` long | `τ*: α ↦ β ↦ 2α`, `β ↦ 2α ↦ 2β`: `(τ*)² = 2` | Pass |
| 9B short-root ideal | `G₂`: `a = α₁`, `b = −α₁−α₂` | `(a,b) = ½|a|²` (60°), `a`-string `b−2a, b−a, b, b+a`, `N = ±3`; `⟨α₂, α₁∨⟩ = −3`; ideal exactly in char 3 | Pass |
| same | `F₄`: short `a`, `b` with long sum | string `b−a, b, b+a`, `N = ±2`; `⟨long, short∨⟩ = ±2`; char 2 | Pass |
| 9C Checks | `𝔾_m`; `SL₂` | `binom(3,2) = 3`; `E^(1)E^(1) = 2E^(2)`; first Frobenius kernel dim `p³` | Pass |
| 10A.1 | `𝔾_m`, `p = 2` | weight `p` line: `binom(p,p) = 1`; weight 1 lines contract to 0, their tensor (weight 2) to weight 1 | Pass (not monoidal) |
| 10B Steinberg | `SL₂`, `p = 2, 3`; `PGL₂`, `p = 2` | dims `2 = 2¹`, `3 = 3¹`; `ρ = α/2 ∉ ℤα` | Pass |
| 10C | char 3, `n = 4`; char 2, `n = 2` | `dim L(4) = 2·2 = 4`, socle `x⁴, x³y, xy³, y⁴`; `dim L(2) = 1·2 = 2`, `g·(xy) = −cd u² + (ad+bc)uv − ab v²` spans `R₂` | Pass |
| 11E | `n = 2` | centred configurations `(z,−z) ≅ ℂˣ`, unordered `z ↦ z²`, `B₂ ≅ ℤ` | Pass |
| Layer 11 Check | `𝔰𝔩₂` | `𝔱_reg ≅ ℂˣ`, `W` by `t ↦ −t`, `B_W ≅ ℂˣ` via `t²`, discriminant `4t²`; lift of `exp(2πis)` ends at `−1`, monodromy mod 2 | Pass |
| 8.1 / 8.2 Checks | split torus rank `r`; `SL₂` vs `PGL₂`; `Spec(k×k)` | `X = Y = ℤʳ`, no roots; root `2ϖ` vs generator; signs `(+,−)` not a constant `Φ⁺` (Conrad 6.1.2) | Pass |
| Milne Lang statement vs Lean | `G` connected group variety over `F̄_q` | source map `g ↦ gF(g⁻¹)`, Lean map `g ↦ g⁻¹F(g)`: inverse of the source value after inversion; both surjective | Pass |

**Principles.** No copied passage (locators and statements are the author's own words; the fenced blocks are gate output and formulas); no algorithm; no process word (`residue=0`, `round-labels=0`; the only "optional" at `README.md:1108` reads "not optional"); no pull-request number; `set_option` absent; no LaTeX delimiters; `theorem` throughout, no `lemma`; the module docstring names the roadmap and the unstatable headlines; every backticked name of this roadmap's own in the README is declared (`readme-ids-missing=0`), and every Lean name appears in the README.

## Not verifiable

- Milne, *Algebraic Groups* (CUP 2017) locators throughout the README and `Suggested.lean` (Theorem 17.9(b) p. 354, Theorem 17.96 / Corollary 17.97 pp. 382–383, Theorem 22.42 p. 477, Propositions 1.65–1.66 pp. 26–27, and the rest): the cache `milne-iag` is the v2.00 course notes (528 pages, line 9), whose numbering differs. Content was checked there: Lang's theorem for a Steinberg endomorphism at Prop. 27.54, p. 487 (line 20248), Corollaries 27.55–27.56, p. 488 (20264, 20269); conjugacy of Borel subgroups by a rational point at line 12774; "linearly reductive in characteristic zero" at Aside 14.52 (9899). The CUP page and theorem numbers themselves are taken on trust.
- Waterhouse, Borel, Springer: settled as uncertified, cited by locator only.
- Howlett–Lehrer, Dipper–Du, Carter §1.17, Lang 1956, Steinberg 1968, Serre §§2.3/3.3, Gassmann 1926 (`README.md:1957–1966`): cited by locator only; not in the cache; no finding touches them.
- Conrad–Gabber–Prasad is no longer cited (the F.5.10 / p. 218 sentence replaces it).
- Ownership against open pull requests whose files the brief does not give (IntegralHeckeAndGaloisDeterminants, AdelicAlgebraicGroups, ComplexComparisonPartII, FormalConnectionsOpers, InverseGaloisAndArithmeticFundamentalGroups) was checked through `roadmaps show` text only.

## Source issues

- none
