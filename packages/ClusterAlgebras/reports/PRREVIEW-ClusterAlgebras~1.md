# Review of ClusterAlgebras (pull request #1858 at 1f1a405)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ClusterAlgebras/README.md` (1884 lines) and `TauCetiRoadmap/ClusterAlgebras/Suggested.lean` (260 lines, 29 declarations) against Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (the branch pin equals main's pin). The worker's gate fails on this head (`sorry-data=2`, `imports=1`, `mathlib-subimports=5`, `no-import-mathlib=1`; build, depcheck, tex, latex and stray-files pass). Two blocking findings (R01, R02) and five P3 findings. The sampled targets §§2.1–2.6 were checked against the fetched texts of BZ, BFZ III, FZ IV, BCDX, Nakanishi–Rupel, Rupel, GLS, FZ I, FZ II, NZ and GHKK: every locator in the sample resolves to the statement the README attributes to it (details under *Verified sound*).

## R01 (P2) — `Suggested.lean` states no headline theorem; the statable ones are absent

**Location.** `TauCetiRoadmap/ClusterAlgebras/Suggested.lean` lines 15–31 (module docstring: "The statements here suggest Lean forms for particular milestones") and the whole file: 12 structures/defs, 7 sorried API lemmas, no end theorem.

**Claim.** The file is an interface catalogue. The README's headline theorems (Layer 2 Laurent phenomenon, §2.4 Somos-4 integrality, §4.1 finite-type classification, §5.2 Laurent positivity, §5.3 sign-coherence, §6.3 coordinate rings of double Bruhat cells) are not stated, and the docstring does not say which are unstatable and what each lacks.

**Witness.** At the pins the following are statable with only the file's own `ExchangeMatrix` and `matrixMutation` plus two small definitions, and I elaborated them (scratch file, `lake env lean`, only `sorry` warnings):

- sign-coherence of c-vectors (GHKK Corollary 5.5, text line 2036): with `matrixMutationWord` (fold of `matrixMutation` over a `List K`) and `principalExtension B := Matrix.fromRows B 1 : Matrix (K ⊕ K) K ℤ`, the statement `∀ w k, (∀ j, 0 ≤ (μ_w (B;Id)) (inr j) k) ∨ (∀ j, (μ_w (B;Id)) (inr j) k ≤ 0)`;
- finite type (FZ II Theorem 1.8 (2)⟺(3), text line 274): with `cartanCompanion B i j := if i = j then 2 else -|B i j|` and the pinned `TauCeti.IsFiniteType` (`TauCeti/LinearAlgebra/RootSystem/FiniteType/Basic.lean:129`, import `TauCeti.LinearAlgebra.RootSystem.FiniteType.Basic`), `(∃ w, IsFiniteType (cartanCompanion (μ_w B))) ↔ ∀ w i j, i ≠ j → |(μ_w B) i j * (μ_w B) j i| ≤ 3`;
- the geometric-type Laurent phenomenon (FZ I Theorem 3.1, text line 405): with `clusterMutation row B x k` (binomial exchange divided by `x (row k)` in a field, `zpow` exponents, other coordinates kept) folded along a word, every reached coordinate lies in `Set.range c.toAlgHom` for the file's `LaurentChart ℤ I F` evaluated at the monomials `single (Finsupp.single i 1) 1`, for `B` with a skew-symmetrizable principal block;
- §2.4 Somos-4: `a : ℕ → ℚ` with the stated recurrence satisfies `∀ n, ∃ m : ℕ, a n = m` (statable with no definition at all).

Laurent positivity (classical, ℕ-coefficients of the expansion) is statable the same way; §6.3 needs the double Bruhat cell and generalized minors, which are not at the pins and belong in the docstring as unstatable.

**Repair.** Replace the file's body by these headline statements (sorried), keep only the definitions they need (`ExchangeMatrix`, `matrixMutation`, `matrixMutationWord`, `principalExtension`, `cartanCompanion`, `clusterMutation`/`clusterWord`, `LaurentRing`, `LaurentChart`), and rewrite the module docstring in the required form ("<title>: target signatures"; the roadmap is README.md; which headlines are not statable and what each lacks: §6.3's `G^{u,v}` and `Δ_{uω_i,vω_i}`, the quantum Laurent phenomenon's faithful chart into an Ore division ring, §5.1's cluster scattering diagram). The statements above elaborate at the pins as given; the exact forms are in this report's *Verified sound*.

## R02 (P2) — sorry'd data: `ExchangeMatrix.mutate` and the instance `latticeCocycle_isFactorSet`

**Location.** `Suggested.lean:92–98` (`def ExchangeMatrix.mutate … symmetrized := by sorry`) and `Suggested.lean:130–133` (`instance latticeCocycle_isFactorSet … := by sorry`).

**Claim.** A `def` or `instance` whose body contains `sorry` is sorry'd data, and nothing may mention one. `BasedTorus`, `torusMonomial`, `torusMonomial_mul`, `ExchangeFrame`, `PolynomialFrame`, `exchangeCoordinate`, `polynomialSubalgebra` and `PolynomialRealization` all elaborate through the sorried instance; `mutate_involutive` through the sorried `mutate`. The gate reports both (`sorry-data=2`).

**Witness.** The instance is provable in three lines from bilinearity: with `α a b = u ^ Λ a b`, the cocycle identity is `u^(Λ(g+h)j) · u^(Λ g h) = u^(Λ h j) · u^(Λ g (h+j))`, which after `map_add`, `LinearMap.add_apply`, `zpow_add` is a rearrangement in the commutative group `Rˣ`; `one_left`/`one_right` are `map_zero`/`zpow_zero`. I elaborated this proof (scratch file, `lake env lean`, no error): `cocycle g h j := by simp only [latticeCocycle, toAdd_mul, map_add, LinearMap.add_apply, zpow_add]; simp only [mul_assoc, mul_comm]`, `one_left g := by simp [latticeCocycle]`, `one_right g := by simp [latticeCocycle]`.

**Repair.** Prove the instance as above. For `mutate`, either prove `symmetrized` for `matrixMutation` (for `i = k` or `j = k` it is the hypothesis negated; otherwise use `s_i [b_ik]_+ = s_k [−b_ki]_+` and `s_k [b_kj]_+ = s_j [−b_jk]_+`, both from the symmetrizer identity and `s_k > 0`) or delete `mutate` and `mutate_involutive` (the README §1.1 keeps both statements; under R01 the headline statements use only `matrixMutation`).

## R03 (P3) — import header: no `public import Mathlib`, five `Mathlib.<submodule>` imports

**Location.** `Suggested.lean:8–13`.

**Claim.** The gate's import rule requires `import Mathlib` (the module form `public import Mathlib` is accepted) first, then only the `TauCeti.*` modules used; `Mathlib.Algebra.Group.Torsion`, `Mathlib.Algebra.Polynomial.Reverse`, `Mathlib.LinearAlgebra.Matrix.BilinearForm`, `Mathlib.Algebra.Algebra.Subalgebra.Lattice`, `Mathlib.Algebra.Field.Subfield.Basic` are refused (gate `imports`, `mathlib-subimports`, `no-import-mathlib`).

**Repair.** Header lines 8–13 become `public import Mathlib` then `public import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic` (and, under R01, `public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Basic`). The scratch repair file with exactly this header elaborates.

## R04 (P3) — padding: API lemmas and transport definitions instead of headlines

**Location.** `Suggested.lean:46–54` (`coefficientSemifield_isMulTorsionFree`, `coefficientGroupRing_isDomain`), `66–72` (`LaurentChart.map`), `100–103` (`mutate_involutive`), `146–150` (`torusMonomial_mul`), `164–168` (`independentColumns`), `190–197` (`reverse_properties`), `226–230` (`exchangeCoordinate_ne_zero`), `250–258` (`PolynomialRealization.map`).

**Claim.** None is a headline. `torusMonomial_mul` closes in one tactic from the pinned multiplication table; the two `map` definitions are composition of an algebra map with an injective map; `reverse_properties` restates `Polynomial.coeff_zero_reverse`, `reverse_natDegree`, `reverse_leadingCoeff` (`Mathlib/Algebra/Polynomial/Reverse.lean:222,254,257`); `independentColumns` is a linear-algebra lemma; the two coefficient-semifield lemmas and `exchangeCoordinate_ne_zero` are Layer-0/1 API targets of the README.

**Witness.** One-tactic probe on a scratch copy: `torusMonomial_mul` is closed by `simp [torusMonomial, BasedTorus, latticeCocycle, ofAdd_add, TauCeti.TwistedMonoidAlgebra.of_mul_of]` (`of_mul_of` is `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean:336`). The other six sorried theorems do not close under `infer_instance`/`rfl`/`simp`; they are API, not headlines.

**Repair.** Delete these nine declarations from `Suggested.lean`; the README keeps their statements (§§0.1, 0.2, 0.4, 1.1, 1.5, 1.6).

## R05 (P3) — README is not in TauCetiRoadmap form

**Location.** `README.md:1` (title `# Cluster algebras`, no `# Roadmap:` and no `**Summary.**`), `30` (`## Scope and dependency boundaries`), `117` (`## Ownership and proof dependencies`), `151` (`## Library interfaces and conventions`), `184–1794` (Layers 0, 1, 3–6 are bold paragraphs `**0.1 …**`, `**3.1 …**`, …, not `### k.n` subsections; only Layer 2 uses `### 2.1`–`### 2.6`), no `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, no `### Examples`/`### Dependencies` in any layer, no `## Downstream consumers`; `1795` (`## Completion criteria`); 13 ```` ```math ```` fences with LaTeX (`\begin{cases}`, `\frac`, `\sum`) at lines 422, 464, 586, 696, 712, 732, 764, 944, 989, 1001, 1186, 1304, 1314, 1322; `78` links ScatteringDiagrams by a fork commit URL (`github.com/yuma-mizuno/…/blob/6406dabd…`).

**Claim.** The README shape rules (headings as upstream uses them, prose `### k.n` subsections with `*Needs:*` lines, Checks per definition, `### Examples` and `### Dependencies` per layer, Unicode mathematics with no LaTeX display, citations by roadmap name and section, never a pinned URL) are not met. The `**Checks.**` lists exist only per section, not per definition; many definitions (e.g. `Trop(J)`, `Qsf(K)`, exchange frames, lattice seeds) have no three discriminating Checks of their own.

**Repair.** Restructure into the house form (compare `RepresentationTheory/RootSystems/README.md` on main): `# Roadmap: cluster algebras` + `**Summary.**`; `## Scope and ownership`; `## Conventions`; `## Exact supplier contracts` with `### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.ScatteringDiagrams`, `… RootSystems`, `… ReductiveGroups`, `… SchemeAndStackFoundations`, `… AnalyticToricGeometry`, `… InductionRestriction`; `## How to read the build`; every layer with `### k.n` subsections each ending in a `*Needs:*` line, `### Examples`, `### Dependencies`; `## Downstream consumers`; `## References`. Replace each ```` ```math ```` block by an inline code span or indented code block in Unicode (e.g. the mutation rule as `b'_ij = −b_ij` if `i = k` or `j = k`, else `b_ij + [b_ik]_+[b_kj]_+ − [−b_ik]_+[−b_kj]_+`). Cite ScatteringDiagrams as "ScatteringDiagrams §4.2" with a relative link `../ScatteringDiagrams/README.md`, never a commit URL.

## R06 (P3) — no supplier edge is recorded: the dependency check sees zero `*Needs:*` lines

**Location.** `README.md` (0 occurrences of `*Needs:*`; `grep -c 'Needs:'` = 0); depcheck output below (`0 problem(s)` on 2360 edges, none from this roadmap).

**Claim.** The roadmap consumes ScatteringDiagrams (§§0.8, 3.3–3.4, 4.2–4.4, 5.1–5.6, 7.1–7.7, cited at lines 78–87, 1239, 1534–1660), RootSystems, ReductiveGroups Layers 7/7C/8/10, SchemeAndStackFoundations §0.6, AnalyticToricGeometry Layer 0 and InductionRestriction Layer 7, but the dependency check reads edges only from `*Needs:*` lines, `### From TauCetiRoadmap.X` headings and `### Dependencies` sentences, none of which exist. ScatteringDiagrams is an open pull request (#1134, same author, head `6406dab`) that is neither on main nor in the merge order, so without an edge the intake cannot place ClusterAlgebras after it; its citations (`SkewLatticeDatum`, `AdaptedBasis`, `QuantumMonoidAlgebra`, `principalGradingDictionary`, `principalProjectionComparison`, `exists_outgoingCompletion`, `outgoingCompletion_unique`, `theta_presentationInvariant`, `cylinderBrokenLineLift`, `principalTheta_eq_projectedMonomialSum`, `theta_coefficients_nonnegative`, §1.4 sweep, `κ`, `D_n`) all resolve at that head (ScatteringDiagrams README at #1134 lines 1324–1395, 1168, 1230, 1887–1901, 2439, 746, 1327, 1336), so the dependency is real.

**Repair.** With R05, give each consuming target a `*Needs:*` line naming the supplier and section (e.g. "*Needs:* ScatteringDiagrams §4.2 `SkewLatticeDatum`, §3.3 `exists_outgoingCompletion`"), and add `### From TauCetiRoadmap.ScatteringDiagrams` (and the other five) under `## Exact supplier contracts`. The pull request's merge-order paragraph names ScatteringDiagrams as the open-revision supplier. Then rerun the dependency check; the expected output is a `moved:` line placing ClusterAlgebras after ScatteringDiagrams once that roadmap enters the order, no UPWARD/CYCLE.

## R07 (P3) — supplier drift: `RootSystems, Layers 1–6`; `MonoidAlgebra.tensorAlgEquiv`

**Location.** `README.md:88` ("RootSystems …, Layers 1–6") and `1530` ("RootSystems, Layers 1–6"); `README.md:1359` ("`MonoidAlgebra.scalarTensorEquiv`/`MonoidAlgebra.tensorAlgEquiv`").

**Witness.** `RepresentationTheory/RootSystems/README.md` on main (eaf17b1) has `## Layer 1` (line 248), `## Layer 2` (432), `## Layer 3` (504) and nothing beyond. At the Mathlib pin `grep -rn tensorAlgEquiv Mathlib` finds only `AdjoinRoot.tensorAlgEquiv` (`Mathlib/RingTheory/AdjoinRoot.lean:1082`), a polynomial-quotient equivalence, not a monoid-algebra one; `MonoidAlgebra.scalarTensorEquiv` exists (`Mathlib/RingTheory/TensorProduct/MonoidAlgebra.lean:108`).

**Repair.** Cite "RootSystems, Layers 1–3" (the classification is Layer 3) in both places. In §3.3 cite `MonoidAlgebra.scalarTensorEquiv` alone (or its `AddMonoidAlgebra` counterpart in the same file) and drop `tensorAlgEquiv`.

## Verified sound

**Gate and build.** Worker's gate at 1f1a405: FAIL on `sorry-data=2`, `imports=1`, `mathlib-subimports=5`, `no-import-mathlib=1`; `build=0`, `depcheck=0`, `latex=0`, `tex=0`, `prnum=0`, `stray-files=0`, `outside-folder=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClusterAlgebras'` is empty. `metadata.toml` has `topic = "math.RA"`.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 240 roadmaps, 2360 edges, 0 problem(s)` — no UPWARD or CYCLE line; vacuous for this roadmap (R06).

**Signatures.** All 29 `#check @name` outputs of the scratch copy agree with the README statements (no lost section binder); the elaborated types match `scratch/signatures.md`.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b): `TauCeti.twistedMonoidAlgebra`, `TauCeti.IsFactorSet` (cocycle/one_left/one_right, `Twisted/Basic.lean:99`), `TauCeti.TwistedMonoidAlgebra.of` (322), `of_mul_of` (336), `Module.Free` instance (363); `TauCeti.MonoidAlgebra.isLocalization_away_mapDomainRingHom` (`MonoidAlgebra/Localization.lean:53`); `TauCeti.laurentEval` (`Polynomial/Laurent/Basic.lean:124`), `laurentEvalEquiv` (152); `TauCeti.DynkinType`, `DynkinType.Valid` (`RootSystem/DynkinType.lean:153`), `DynkinType.cartanMatrix` (219); `TauCeti.IsFiniteType` (`FiniteType/Basic.lean:129`: `Finite B ∧ diag 2 ∧ offdiag ≤ 0 ∧ symmetric vanishing ∧ ∃ positive d, (d_i A_ij) PosDef`, matching §4.1's use); `IsMulTorsionFree` (`Mathlib/Algebra/Group/Monoid.lean:552`); `RootPairing.Base.cartanMatrix` (`Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean:107`, entry `P.pairing i j = ⟨α_i, α_j^∨⟩`, so §4.2's "transpose of FZ II's convention" is right); `Matrix.toBilin'` (`Matrix/BilinearForm.lean:93`), `LinearMap.IsAlt` (`SesquilinearForm/Basic.lean:241`); `OreLocalization.oreDiv_eq_iff` (`GroupTheory/OreLocalization/Basic.lean:131`), `numeratorHom_inj` (`RingTheory/OreLocalization/Ring.lean:194`), `universalHom` (133); `MonoidAlgebra.scalarTensorEquiv`; `Matrix.fromRows` (`Data/Matrix/ColumnRowPartitioned.lean:34`).

**Cross-roadmap citations resolved.** ScatteringDiagrams at #1134 head 6406dab: §0.8, §§3.3–3.4, §§4.2–4.4, §§5.1–5.6, §§7.1–7.7 and the 11 named targets (lines listed in R06). On main: ReductiveGroups `### Layer 7` (627), `#### Layer 7C` (652), `### Layer 8` (1023), `### Layer 10` (1731); SchemeAndStackFoundations `### 0.6 Reflexive sheaves, reflexive hulls and Hartogs` (678); `Completed/AnalyticToricGeometry` `## Layer 0: the algebraic supplier` (186); InductionRestriction Layer 7 twisted group algebra consuming `TauCeti.twistedMonoidAlgebra` (187, 794–813); QuantumGroups σ-derivation Ore extension / PBW (601–627); SchubertGeometry exists. RootSystems: see R07.

**Sources at their locators** (cache ids in `scratch/sources.toml`; line numbers are of the extracted texts).
- BZ (math/0404446): Thm 5.1 l.593 (`U` mutation invariant), Cor 5.2 l.606 (quantum Laurent phenomenon), Lemma 5.4 l.660 (one-exchange intersection (5.8)–(5.9)), Lemma 5.5 l.669 (normal forms (5.10)–(5.11)), Lemma 5.6 l.694 (coefficient `c_{−r}` divisible by `P^{rb_1,+}`, via (5.12) `(X'_1)^r = P^{rb_1,+}(X^{e'_1})^r`, `e'_1 = −e_1 − Σ_{b_i1<0} b_i1 e_i`, which is §2.1's `α_k`), Prop 5.7 l.705 (two directions; commuting case by relative primality in the center and Prop 11.2, full rank via Prop 3.3), Lemma 5.8 l.733 (`X''_2`); Def 4.3 l.423 (toric frame `M(c) = φ(X^{η(c)})`), Prop 4.7 l.498, (4.22)–(4.23) l.513–535 (binary mutation `X'_k = M(−e_k + [b]_+) + M(−e_k + [−b]_+)`), Prop 6.2 l.823 (bar involution), Prop 11.1 l.1734 (Ore), Prop 11.2 l.1749 (center `X^f`, `f ∈ ker Λ`; `Tz_1 ∩ Tz_2 = Tz_1z_2` for relatively prime central `z_i`). §2.1's description of BZ §5 and §0.6's "infinite-order hypothesis" remark on the center agree with these.
- BFZ III (math/0305434v3): Thm 1.5 (upper bound invariance under coprimality) l.201/269, Thm 1.16/1.18 l.292/303, Prop 2.6 l.537 (`B̃(i)` full rank), Lemma 2.12 l.714 (p.16), Lemma 2.13 l.759 (codimension ≥ 2, p.17), Cor 2.17 l.803 (p.18), Thm 2.10 referenced l.775–799 (pp.17–18); upper-bound proof Lemma 4.1 l.1178 (p.25), Lemma 4.2 l.1210, Prop 4.3 l.1217 (p.26), Lemma 4.4 l.1253 (p.27): "PDF pp. 24–28" and "pp. 15–18" are right.
- FZ IV (math/0602259): Def 2.1 (`Qsf`) l.220, Def 2.2 (`Trop`) l.227, Def 2.3 l.257, Def 2.4 l.283; Thm 3.7 l.650 ((3.5) `x_{ℓ;t} = X|_F / F|_P`, §2.3 L7b); Cor 6.3 l.1081 ((6.5) `x = x^g F|_F(ŷ)/F|_P(y)`, §2.3's final display); Prop 6.6 l.1174 ((6.12) `g' = −g + Σ[b_ik]_+ g_i − Σ[c_{jk}]_+ b^0_j`, exactly §2.2 L6b's recurrence; (6.14) `G_tB_t = B_0C_t`).
- BCDX (2203.06928): Def 2.3 l.174 ((2.3) `X'_i = Σ_r h_{i,r} X(r[β_i]_+ + (d_i−r)[−β_i]_+ − e_i)`, the file's `exchangeCoordinate`), Thm 3.1 l.222, Lemma 4.1 l.781 ((4.1)–(4.2) powers), Prop 4.2 l.812, Prop 4.6 l.938 (coprime), Prop 4.7 l.945, Thm 4.9 l.1143 (coprime ⇒ upper bound invariant), coprimality definition l.756: §2.6's attributions are right.
- Nakanishi–Rupel (1504.06758): §3 l.238–262: `Z_i` monic with `z_{i,0} = z_{i,d_i} = 1`, reversed `Z̄_i(u) = u^{d_i} Z_i(u^{−1})`, Def 3.1 (3.1): reversal mutation without reciprocity, as §2.6 states.
- Rupel (ALCO 2 (2019), numdam): Thm 5.1 l.1641 on PDF p.29 whose running footer is journal p.1266, proof continuing on p.1267: "§5, Theorem 5.1 (pp. 1266–1267)" is right.
- GLS (1807.09826): specialization of upper quantum cluster algebras l.46–74; cited only for the distinction, right.
- FZ I Thm 3.1 l.405 (Laurent phenomenon, `ℤP` coefficients). FZ II Thm 1.4 l.239, 1.5 l.252, 1.6–1.9 l.266–298, Thm 7.1 l.1208, Thm 8.6 l.1411, (5.3)–(5.4) l.962–979, Prop 11.2 l.1848. NZ Thm 1.2 l.155 ((1.11) `G^T = (C^{−Bᵀ})^{−1}`), Prop 1.3 l.185 ((1.15) recurrences), (2.7) l.242 (`C^{−Bᵀ} = DCD^{−1}` with `DB` skew-symmetric), which together give §5.3's `G_tᵀD_sC_t = D_s`. GHKK (1411.1394v2): Thm 1.24 l.1102 (p.30), Thm 1.28 l.1150, Constr 1.30 l.1230, Lemma 2.10 l.1390, Thm 2.13 l.1438, Prop 3.6 l.1549, Prop 4.3 l.1733, Thm 4.4 l.1784, Thm 4.9 l.1873 (p.49), Thm 4.10 l.1893, Constr 5.1 l.1944, Lemma 5.2 l.1976, Cor 5.3 l.1990, Cor 5.5 l.2036, Prop 5.7 l.2125, Cor 5.9 l.2152, Thm 5.11 l.2197, (A.2) l.4434 (p.111), Remark B.8 l.4644, Constr B.9 l.4039, Remark B.10 l.1928, Prop B.11 l.4716 (p.118): the page ranges in the References are right.

**Adversarial table** (values computed on both sides).

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `matrixMutation` vs FZ rule | `b_ik,b_kj = (1,1),(−1,−1),(1,−1)` | `+1, −1, 0` | `[b_ik]_+[b_kj]_+ − [−b_ik]_+[−b_kj]_+` = `1, −1, 0` | agree |
| `ExchangeMatrix.symmetrized` forces zero diagonal | `i = j` | `s_i b_ii` | `−s_i b_ii`, `s_i > 0` | `b_ii = 0`, as §1.1 claims |
| involutivity of `matrixMutation` | generic entries | `b_ij + [b]_+[b]_+ − [−b]_+[−b]_+ + [−b]_+[−b]_+ − [b]_+[b]_+` | `b_ij` | holds for every `B`, no symmetrizer needed |
| §1.1 `μ_k B̃ = E_ε B̃ F_ε`, `E_εᵀD_sF_ε = D_s` | `B = ((0,b),(−c,0))`, `D = diag(c,b)`, `k = 1`, `ε = +` | `EBF = ((0,−b),(c,0))`; `EᵀDF = diag(c,b)` | `μ_1B`; `D` | agree |
| §1.5 principal pair | `Λ_pr = ((0,−D),(D,BᵀD))` | `B̃ᵀΛ = (D, −BᵀD + BᵀD)` | `(D 0)`; `(BᵀD)ᵀ = DB = −BᵀD` | compatible, alternating |
| §2.6 degree-compatible principal pair | `V = diag(d_k/r_k)` | `(Bᵀ, D_r)·Λ = (D_rV, −BᵀV + BᵀV)` | `(D_d, 0)`; entry `(1/r_i) b_ji (d_j/r_j)` integral by `r_i ∣ b_ji`, `r_j ∣ d_j` | agree |
| §1.5 `w_i b_ij = −w_j b_ji` | `B̃ᵀΛB̃` | `(B̃ᵀΛB̃)_ij = w_i b_ij` | skew-symmetric | holds |
| §2.1 `r_kν_k = w_k` | `ν_k = Λ(β_k, e_k)` | `Λ(b^k, e_k)/r_k · r_k` | `w_k` | holds |
| §2.1 rank-one quantum check | `Λ = ((0,−1),(1,0))`, `B̃ = (0,1)ᵀ` | `X_1X'_1 = 1 + v^{Λ_12}X_2`, `X'_1X_1 = 1 + v^{Λ_21}X_2`, `(X'_1)² = M(−2e_1+2e_2) + (v+v^{−1})M(−2e_1+e_2) + M(−2e_1)` | `1 + v^{−1}X_2`, `1 + vX_2`, `(1+vX_2)(1+v³X_2)X_1^{−2}` expanded with `X_2X_1^{−2} = v^{−2}M(−2e_1+e_2)`, `X_2²X_1^{−2} = v^{−4}M(−2e_1+2e_2)` | agree |
| Q1 `u`-powers vanish | `(u^νM(β))^lM(α)` | exponent `lν − lΛ(β,e_k) + l r Λ(β,[−β]_+)` | `Λ(β,[−β]_+) = (w_k/r)([−β]_+)_k = 0` (`b_kk = 0`) | `X'_k = H(u^νM(β))M(α)` |
| §0.5 check | `xz = v²zx`, `y = (1+z)x^{−1}` | `y² = (1+z)(x^{−1}(1+z)x)x^{−2}` | `(1+z)(1+v^{−2}z)x^{−2}` | agree |
| §0.7 checks | `x* = (1+z)/x` | `(1+x*)/z`, `((x*)²+x*+1)/z` | `x*z* − 1`, `(x*)²z* − x* − z − 2`; at `x=z=1`: `3`, `7` | agree (numerators `1+x+z`, `1+x+x²+2z+xz+z²` both sides) |
| §2.1 `UB ≠ U` check | `B = 0`, rank 2, `H = 1+T` | `2/(xy) ∈ L_s ∩ L_{μ_1s} ∩ L_{μ_2s}` | `2/(xy) = x'y'/2 ∉ ℤ[x'^{±1},y'^{±1}]` | agree |
| §2.1 pairwise-independence check | `((0,1,−1),(−1,0,1),(1,−1,0))`, `μ_1` | `b'_23 = 1 + 0 − 1 = 0`, columns 2,3 | `(−1,0,0)`, `(1,0,0)` | opposite, as claimed |
| §2.1 ideal-criterion checks | `D = ℤ[√−5]`, `E = 2`, `F = 1+√−5` | `6 ∈ (E)∩(F)` | `6/(EF) = (1−√−5)/2 ∉ D` | agree |
| §2.1 frozen-variable check | `((0,1),(−1,0),(1,−1))` | `(1+x')/y`, `(1+y')/x`, `zh` | `(x+y+z)/(xy)` ×2, `x'y' − 1 = z(x+y+z)/(xy)`; at `z = 0`: `x^{−1}+y^{−1}`, total degree −1 | agree |
| §2.3 L8 check | `P = Multiplicative ℚ`, `⊕ = min` | `x'_1`, `x'_2` | `(1+w^{1/2})/x_1`, `(1+w^{1/3})/x_2` (`y_2⊕1 = w^{−1/3}`) | agree |
| §2.4 Somos-4 | matrix, `k_n = n mod 4`, 8 steps | entries after `n` mutations | initial `(i−n, j−n)` entries; column `k_n` = `(0,1,−2,1)` pattern; `a_0..a_8 = 1,1,1,1,2,3,7,23,59` | agree (computed) |
| §2.5 check | `𝔽_7`, `u = 2`, `ν = 1` | `(1+2T)(1+T)(1+4T)` | `1 + 7T + 14T² + 8T³ ≡ 1 + T³` | agree; `Aut 𝔽_7 = 1` |
| §2.6 checks | `B = ((0,3),(−3,0))`, `H = 1+2T+T³`, `u = 1` | `x' = (y³+2y²+1)/x`; unreversed `x'' = x(y³+2y+1)/(y³+2y²+1)`; reversed `x'' = x` | formula `Σ_l h_l M(−e_k + l[β]_+ + (3−l)[−β]_+)` | agree |
| §2.6 endpoint check | `H_1 = 1+T`, `H_2 = 1+2T`, word `1,2,1` | `x' = (1+y)/x`, `y' = (x'+2)/y`, `x'' = (y'+1)/x'` | `1/y + x(y+2)/(y(y+1))` | agree, not Laurent |
| §2.6 compatible-form check | `B = ((0,3),(−3,0))`, `w = (1,1)` | `BᵀΛ = diag(3λ,3λ)` | `λ = 1/3 ∉ ℤ` | no integral form, as claimed |
| §2.2 g-vector recurrence vs FZ IV | two forms | `−g + G[b]_+ − B_0[c]_+` | `−g + G[−b]_+ − B_0[−c]_+`; difference `Gb_k − B_0c_k = 0` by (6.14) | agree |
| §5.3 duality check | `B = ((0,1),(−2,0))`, `D_s = diag(2,1)`, `μ_1` | `C' = ((−1,1),(0,1))`, `G' = ((−1,0),(2,1))`, `g = (−1,2)` | `G'ᵀD_sC' = diag(2,1)` | agree |
| §3 lattice check | `d = (1,2)`, `{e_1,e_2} = −1` | `ε = ((0,−2),(1,0)) = Bᵀ`, `s = L/d = (2,1)`, `p_1^*(e_1) = −2f_2` | `T_1(f_1) = f_1 − 2f_2`, `T_1(−f_1) = −f_1`, `T_1^{min}(∓f_1) = −T_1(±f_1)` | agree |
| §4.2 counts | `A_2, B_2, G_2, A_1×A_1` | `n + |Φ_+|` | `5, 6, 8, 4` | agree |
| §4.2 Cartan convention | Mathlib `pairing i j = ⟨α_i, α_j^∨⟩` | Bourbaki `(i,j)` | FZ II `s_i(α_j) = α_j − a_ijα_i` ⇒ `a_ij = ⟨α_j,α_i^∨⟩` | transpose, as stated |
| `CoefficientSemifield` torsion-free | `p^n = 1` | `(1⊕p⊕…⊕p^{n−1})p` | same sum | `p = 1` (commutative `⊕` needed, present) |
| `latticeCocycle` factor set | `g,h,j` | `u^{Λ(g+h,j)}u^{Λ(g,h)}` | `u^{Λ(h,j)}u^{Λ(g,h+j)}` | equal (proved in scratch) |
| `PolynomialData` in the zero ring | `R = 0` | `degree_pos` | `natDegree 0 = 0` | no instance, vacuous, harmless |
| `exchangeCoordinate` zero column | `β = 0` | `Σ_l h_l M(−e_k)` | `H_k(1)X_k^{−1}` | agrees with P1 |

**Headline/padding probe.** One-tactic probe on all 7 sorried theorems: 1 closes (`torusMonomial_mul`), 6 fail (see R04).

## Not verifiable

- none in the sample: every cited text of §§2.1–2.6 was readable from arXiv or Numdam. Ownership against open pull requests was checked only against the sibling checkouts the brief lists and ScatteringDiagrams #1134 (via `roadmaps show`); `scratch/overlaps.md` lists no other close roadmap.

## Source issues

- none
