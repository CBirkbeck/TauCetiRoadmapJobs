# Review of EtaleMassFormula (pull request #1820 at b9fab3a)

**Verdict:** needs changes

Full review of the folder (Layers 0–4). The mathematics of Layer 4 held on every instance computed
(table under *Verified sound*): Kedlaya's and Wood's formulas, the counting function, the fibre count,
the transitive mass, the recursion and the closed forms all agree with the sources and with each
other. Two blocking findings: the gate's build counter (R01) and supplier declarations cited by names
and files that do not exist at the pin, one of which the supplier's own status record lists as
unproved (R02). Four P3.

## R01 (P1) — Gate `build=1`: the module-system advisory fails the gate

Location: `TauCetiRoadmap/EtaleMassFormula/Suggested.lean` line 1; `gate.md` at b9fab3a:
`build=1 FAIL`, "imports `Mathlib` from package `mathlib`, which is designed for use with the
module system; consider adding `module`".

Claim: the targeted build passes.

Witness: elaboration itself is clean. `lake env lean` on a scratch copy of the file gives exactly
23 `declaration uses sorry` warnings, no error, exit 0. The worker's gate nevertheless counts the
advisory as a build failure, and no acceptance is possible while it does.

Repair, tested: make the first line of `Suggested.lean` the word `module`, before `import Mathlib`,
leaving the six import lines and everything else unchanged. A scratch copy in that form elaborates
with the same 23 `sorry` warnings and no other diagnostic (exit 0). Eleven Suggested files on main
already use this header.

## R02 (P2) — Supplier declarations cited by name and file that do not exist at the pin

Location: `TauCetiRoadmap/EtaleMassFormula/README.md` line 69 ("The first is Tau Ceti's
`IntermediateField.discriminantExponent`"), lines 92–98 ("In Tau Ceti these are
`TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent`
(`TauCeti/NumberTheory/LocalField/MassFormula/Main.lean`), … Consume them by those names. The
orbit count there is the totally ramified case of
`IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed`
(`TauCeti/FieldTheory/IntermediateField/Isomorphic.lean`) … §1.3 consumes that one"), line 315
("*Needs:* … the MassFormula contract (the general orbit count)"), lines 310–311 ("It is
`IntermediateField.ncard_isomorphic_mul_natCard_algEquiv_of_isSepClosed` … reuse that theorem
rather than prove it again"); `Suggested.lean` lines 28–29 and 266 (the same two claims in
docstrings).

Claim: Serre's Theorem 1, the orbit count, the discriminant-exponent wrapper, its invariance and a
general orbit count for any finite separable subextension of a separably closed field are Tau Ceti
declarations in the named files, and implementers consume them by those names.

Witness: at the pinned Tau Ceti (358314d4; the worktree's `.lake/packages` and the content
checkout's resolve to the same directory) there is no directory
`TauCeti/NumberTheory/LocalField/MassFormula/`, no file `TauCeti/FieldTheory/IntermediateField/Isomorphic.lean`,
and no declaration whose name contains `wildExponent`, `ncard_isomorphic` or
`of_isSepClosed` (listing of `NumberTheory/LocalField/` and `FieldTheory/IntermediateField/`, grep
over the package). On main, `TauCetiRoadmap/MassFormula/STATUS.md` line 12 says "In Layer 4,
everything except Theorem 1 is either proved or reduced to it … neither mass formula is proved in
general" and line 38 lists Theorem 1 as still to do, so
`TauCeti.tsum_one_div_natCard_residueField_pow_wildExponent` as a proved general theorem exists
nowhere. The MassFormula roadmap on main states the orbit count only for `σ_K n`
(`TauCetiRoadmap/MassFormula/Suggested.lean` line 467, `totallyRamifiedOfDegree`; README line 367);
no roadmap on main, no open pull request and nothing at the pin states or names
`…_of_isSepClosed`, so "the MassFormula contract (the general orbit count)" and "reuse that theorem"
point at nothing. (The previous review of this folder raised the first half of this; the stacked
commit kept the sentences and added the `Isomorphic.lean` one.)

Repair: delete "In Tau Ceti these are … Consume them by those names" and the two "is Tau Ceti's"
clauses (line 69), and the `Isomorphic.lean` sentence. Say instead that Theorem 1, the totally
ramified orbit count and the Layer 0 wrapper with its invariance are the mass formula roadmap's
Layer 4 and Layer 0 targets, consumed by the names of its `Suggested.lean`
(`MassFormula.tsum_one_div_natCard_residueField_pow_wildExponent`,
`MassFormula.ncard_isomorphic_mul_natCard_algEquiv`,
`MassFormula.intermediateFieldDiscriminantExponent_eq_of_algEquiv`), and that Tau Ceti
implementations beyond the pin replace those names when the pin moves. For the general orbit count:
this roadmap owns it (`ncard_isomorphic_mul_natCard_algEquiv_eq_finrank` is declared here and the
Scope says so); §1.3 and its *Needs:* line should say "stated here; the totally ramified case is the
MassFormula contract's orbit count", and the docstring at `Suggested.lean` 266 drops the
`_of_isSepClosed` name. If the author knows that name to exist on Tau Ceti main beyond the pin,
say "beyond the pin" and keep the roadmap as owner until the pin moves.

## R03 (P3) — §4.3 cites the finite-dimensional Galois correspondence for `SeparableClosure K`

Location: `README.md` line 516 ("*Needs:* 0.2; Mathlib `IntermediateField.fixingSubgroup_fixedField`").

Claim: that declaration gives `fixingSubgroup (fixedField H) = H` for the stabilizer `H` of `0`
in `Gal(K^sep/K)`.

Witness: at the pinned Mathlib (f6090c70) `IntermediateField.fixingSubgroup_fixedField` is
`Mathlib/FieldTheory/Galois/Basic.lean` line 281, with `[FiniteDimensional F E]`, which
`SeparableClosure K / K` is not. The infinite form is `InfiniteGalois.fixingSubgroup_fixedField`
(`Mathlib/FieldTheory/Galois/Infinite.lean` line 146), for a `ClosedSubgroup` under `[IsGalois k K]`;
the stabilizer is open (it contains the open kernel), hence closed.

Repair: cite `InfiniteGalois.fixingSubgroup_fixedField` (and the closedness of an open subgroup)
in §4.3 and add it to the Mathlib contract under "Galois theory of `SeparableClosure K`".

## R04 (P3) — Two Lean names of Layer 4 do not appear in the README

Location: `Suggested.lean` line 440 (`WreathGaloisSet.mulAction`) and line 498
(`wreathTransitiveMass`); `README.md` §4.1 and §4.4.

Witness: grep of the README for `WreathGaloisSet.mulAction` finds nothing; `wreathTransitiveMass`
occurs only inside `wreathTransitiveMass_eq` (line 526). The rule is that every Lean name appears in
the README.

Repair: in §4.1 name `WreathGaloisSet.mulAction` beside `baseMulAction` (the action on
`Fin n × Fin m` a wreath Galois set is), and in §4.4 write "`T_{m,n}` (`wreathTransitiveMass`), the
base-transitive part of `wreathMass`" before stating `wreathTransitiveMass_eq`.

## R05 (P3) — A ⚠ marker and an unverifiable claim about the source's text in §3.2

Location: `README.md` lines 411–412 ("⚠ The unramified factors form the component `t = 0`.
[Bhargava 2007] writes the product from `t = 1`; the statement needs `S_{n_0}` …").

Claim: Bhargava's text omits the unramified component.

Witness: the article is not legally readable here (see *Not verifiable*); the two texts in the cache
that use the result, kedlaya2007b and wood2008, do not restate that proof. The marker is a process
annotation (a reader a year from now cannot tell what it flags), and a claim that a source's proof
is incomplete belongs in the errata register through a review's *Source issues*, not in the README.

Repair: delete "⚠" and the sentence "[Bhargava 2007] writes the product from `t = 1`"; keep "The
unramified factors form the component `t = 0`: the statement needs `S_{n_0}`, and the case `π = ∅`
is exactly the count of its conjugacy classes."

## R06 (P3) — Wood's Theorem 1.1 is cited for natural-number coefficients it does not state

Location: `README.md` lines 565–568 ("**Wood's formula for `S_m ≀ S_n`** (`exists_wreathMass_eq_aeval`;
[Wood 2008, Thm. 1.1]): `W_{m,n}` is a polynomial in `q^{−1}` with natural-number coefficients");
`Suggested.lean` lines 540–541 (the same locator for `Polynomial ℕ`).

Witness: wood2008 (arXiv 0804.4679v1) lines 161–167 define "has a mass formula" as equality with
`f(1/q)` for a polynomial `f ∈ ℤ[x]`, and Theorem 1.1 (lines 99–100) asserts exactly that. The
natural-number refinement is true and is the roadmap's own: the generating function
`∏_{k≤m} ∏_{e≥1} (1 − x^e q^{1−e−k})^{−q(k, m−k)}` of §4.5 expands with coefficients in `ℕ` in `x`
and `q^{−1}` (checked: for `m = 1` it is Bhargava's generating function, for `m = 2` Kedlaya's
(8.6.1), kedlaya2007b line 556).

Repair: write "a polynomial in `q^{−1}` with integer coefficients, the same for every
non-archimedean local field ([Wood 2008, Thm. 1.1]); the coefficients are natural numbers because
the generating function below is a product of binomial series with natural-number coefficients", in
the README and in the Lean docstring; the statement in `Polynomial ℕ` stays.

## Verified sound

**Gate at b9fab3a** (`gate.md`): every scanner 0 (`set_option`, `prnum`, `tex`, `imports`,
`mathlib-subimports`, `sorry-data`, `sorry-examples`, `readme-ids-missing`, `stray-files`,
`outside-folder`, `dirty`, `depcheck`, `metadata`, `long-fences`); only `build=1`, the module advisory
(R01). `git diff --stat origin/main...HEAD` outside the folder: nothing (the two commits touch only
`README.md` and `Suggested.lean` of this folder). The folder holds `README.md`, `Suggested.lean`,
`metadata.toml` (`topic = "math.NT"`).

**Depcheck**: `depcheck: 241 roadmaps, 2310 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
EtaleMassFormula and MassFormula are both on main and absent from the merge order;
PadicExtensionFamilies (order line 378) is named only under *Downstream consumers* and *Scope*, never
as a supplier. Suppliers cited: MassFormula (main), LocalFieldsRamification (main, `Completed/`),
Mathlib, Tau Ceti.

**Elaboration**: `lake env lean` on a scratch copy of `Suggested.lean`: 23 `declaration uses sorry`,
nothing else, exit 0. One-tactic probe (each `sorry` replaced by
`by first | rfl | simp | infer_instance | (exact sorry)`): 14 declarations fall through to `sorry`,
9 leave `simp` with unsolved goals (`finrank_fixedField_stabilizer`,
`tsum_etaleDiscriminantExponent`, `unramifiedExtension_inertiaDegree_le`,
`ncard_isomorphic_mul_natCard_algEquiv_eq_finrank`, `tsum_inertiaDegree_eq`,
`etaleMass_isTransitive_splittingSymbol`, `etaleMass_splittingSymbol`,
`etaleMass_ramificationPartition`, `wreathTransitiveMass_eq`); none closes, so nothing is padding by
that test. `baseMulAction` is the only proved declaration and is a definition. Elaborated types
(the worker's `signatures.md`, 47 declarations) compared with the README: the nine declarations
flagged as dropping `[ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` are the
carriers and actions (`GaloisSet`, `GaloisSet.mulAction`, `GaloisSet.IsTransitive`, `homMulAction`,
`RelativeGaloisSet`, `WreathGaloisSet`, `WreathGaloisSet.mulAction`, `baseMulAction`,
`IsBaseTransitive`), whose types mention no local-field structure: a Galois set is a continuous
permutation representation of `Gal(K^sep/K)` for any field, so this is correct. Every theorem of
Layer 4 keeps the four binders; `tsum_relativeGaloisSet` keeps `[FiniteDimensional K L]`,
`natCard_base_fibre` keeps `hn : 0 < n`, `[NeZero m]` and `ρ₀.IsTransitive`,
`wreathTransitiveMass_eq` keeps `hn`, `exists_wreathMass_eq_aeval` quantifies over `F : Type u`
and mentions no `K` (correct: the polynomial is uniform). No `set_option`, no sorried data, no
`lemma`, imports `Mathlib` plus five `TauCeti.*` modules that exist at the pin. All six headline
theorems named in the module docstring are stated (`etaleMass_eq`, `etaleMass_splittingSymbol`,
`etaleMass_ramificationPartition`, `tsum_etaleDiscriminantExponent`, `wreathMass_two`,
`exists_wreathMass_eq_aeval`); the docstring says all are statable, and they are.

**Ownership**: `roadmaps grep` over main and the 457 indexed open pull requests for "Mass formulas
for local Galois", "S_2 ≀ S_n", "S_m ≀ S_n", "hyperoctahedral", "W(B_n)", "wreath … mass", "Galois set
over", `RelativeGaloisSet`, `WreathGaloisSet`: no roadmap other than this one states a mass formula
for a wreath product or a Galois set over a subextension (ProfiniteCohomology and
PolynomialGaloisGroups use wreath products as groups only; SatoTateGroups names the hyperoctahedral
group as a Sato–Tate group). The previous review's ownership result for Layers 0–3 (no other owner of
Bhargava's formula, the Galois-set weight, the splitting symbol) stands at the current index.

**Library declarations opened at the pins** (Mathlib f6090c70, Tau Ceti 358314d4):
`TauCeti.discriminantExponent_tower` (`Discriminant/Tower.lean` 42–50:
`δ(M/K) = [M:L] δ(L/K) + f(L/K) δ(M/L)`, the form §4.1 and §4.2 use), `TauCeti.inertiaDegree`,
the four `TauCeti.finiteIntermediateField*` adapters (`FiniteExtension/IntermediateField.lean`),
`TauCeti.unramifiedExtension`, `TauCeti.maximalUnramifiedExtension`,
`TauCeti.existsUnique_isUnramified_finrank_eq`, `TauCeti.discriminantExponent_eq_zero_iff`,
`TauCeti.discriminantExponent_eq_of_algEquiv` (all present, as in the previous review). Mathlib:
`Nat.Partition.genFun` (`Combinatorics/Enumerative/Partition/GenFun.lean` 56) and
`Nat.Partition.hasProd_genFun` (170), `Fintype (Nat.Partition n)` (`Partition/Basic.lean` 201, so
`Fintype.card (n − j).Partition` in `wreathMass_two` elaborates), `IsSepClosure.equiv`
(`FieldTheory/IsSepClosed.lean` 309), `MulAction.index_stabilizer` (`GroupTheory/Index.lean` 937),
`IntermediateField.fixingSubgroup_isOpen` (`KrullTopology.lean` 169),
`InfiniteGalois.fixingSubgroup_fixedField` (`Galois/Infinite.lean` 146; R03),
`IntermediateField.fixingSubgroup_fixedField` (`Galois/Basic.lean` 281, finite-dimensional; R03),
`Nat.divisors`, `Polynomial.aeval` (used in the file, which builds).

**Cross-roadmap citations resolved**: MassFormula on main (`### Layer 4: the mass formulas`,
Theorem 1 at `Suggested.lean` 448, orbit count 467 for `totallyRamifiedOfDegree`, the Layer 0
wrapper 136 and its invariance 248: present as targets; the general orbit count absent, R02);
LocalFieldsRamification under `Completed/` (every cited Tau Ceti declaration found at the pin, now
attributed to its Layers 0, 2 and 3); PadicExtensionFamilies at its open head, a consumer only.

**Sources** (seeded sample: all fifteen subsections). kedlaya2007b (arXiv math/0511135v4): Theorem
1.1 (lines 44–57, `∑_{k=0}^{n} P(n, n−k) q^{−k}` with `P(n, 0) = 1` for `n = 0`, `0` for `n > 0`:
§3.3's `∑_{k ≤ n}` with the `n = 0` value `1`); Lemma 3.1 (158–174, étale algebras ↔ continuous
`G_K → S_n` up to conjugation, fields ↔ transitive: §0.4), Lemma 3.2 (177–182, `w(L) = w(ρ)`:
§0.4's `n!/#Aut`), Lemma 3.3 (185–187, `c(Ind ρ) = f(L/K) c(ρ) + n c(L/K)`), Lemma 3.4 (189–195,
discriminant exponent additive over factors and equal to the conductor of the permutation
representation: §0.1, §0.4); (4.0.1) (229–242, `(1/n!) ∑_{ρ transitive, f(ρ)=f} q^{−c(ρ)} =
q^{f−n}/f`: §§2.1–2.3); Definition 2.2 (110–116, `M(K, Γ) = (1/|Γ|) ∑_ρ q^{−c(ρ)}`: the
normalization of `wreathMass`); Lemma 8.2 (454–462, towers `M/L/K` with `L/K` separable of degree
`n` and `M` étale of degree 2 over `L` ↔ `ρ : G_K → W(B_n)` with transitive image in `S_n`: §4.3
for `m = 2`), Lemma 8.4 (465–471, `c(ρ) = f(L/K) c(M/L) + c(L/K)`, by Lemma 3.3 applied to the
induced one-dimensional representation: §4.1's conductor for `m = 2`), Theorem 8.5 (472–546, the
transitive contribution split into `M = L ⊕ L`, (8.5.1) `∑_{f|n} q^{f−n}/(2f)`, and `M` a field,
`∑_{f|n} (q^{f−n}/f)(1/2 + q^{−f})`, total (8.5.2) `∑_{f|n} (q^{f−n} + q^{−n})/f`: §4.4 and its
`m = 2` Check), Remark 8.6 (549–587, (8.6.1) `∏_i (1 − x^i q^{−i})^{−1} (1 − x^i q^{1−i})^{−1}` and
the closed form `q^{−n} ∑_j ∑_i P(j, i) P(n−j) q^i`, which is `∑_j M_j P(n−j) q^{−(n−j)}`:
`wreathMass_two`), Remark 8.8 (591–595, Wood's generalization needs a counting function that is not
an Artin conductor: the Layer 4 header), Theorem A.7 and Propositions 9.2–9.3 (774, 602, 644:
*Long horizon*). wood2008 (arXiv 0804.4679v1): Theorem 1.1 (99–100), the definition of a mass formula
by type with `f ∈ ℤ[x]` (153–167; R06), Theorem 2.1 (174–176) with (4) and (5) (195–210,
`c(ρ) = c_B(ρ̄) + ∑_i f_i c_A(ρ_i)`) and the Remark (214–227, `d_{A≀B} = |A| d_B(ρ̄) + ∑ f_i d_A(ρ_i)`,
so `c = d(X) − (m − 1) d(Y)`: §4.1), Lemma 2.2 (228–242, `Ψ` is `|A|^{|B|−r}`-to-one, with the
labellings `α_j` and the formula (6): §4.3's `(m!)^{n−1}` for `r = 1`), (7) (243–281, the sum by
wreath type factors through the stabilizers' fixed fields with residue size `q^{f_i}`: §4.4), §5
(401–416, `M(K, D_4, c) = 8 + 16/q + 16/q²`, Wood's sum undivided by `|Γ|`; 427, `d` is
`Disc(M/K) = Disc(L/K)² N(Disc(M/L))`; 474, `M(ℚ_2, D_4, d) = 121/8`; 478–479, `8 + 8/q + 16/q² + 8/q³`
for odd `q`, `17` at `q = 2`: the §4.5 Checks). Bhargava 2007 is not legally readable (below); its
statements are confirmed through Kedlaya and Wood as above. Serre's Theorem 1 is consumed from the
mass formula roadmap and not re-verified.

**Adversarial table** (`q` the residue cardinality; `M_n` the étale mass, `T_{m,n}` the transitive
wreath mass, `W_{m,n}` the wreath mass; values in `ℝ≥0∞`):

| statement | instances | values each side | result |
|---|---|---|---|
| `etaleMass_eq` | `n = 0, 1, 2, 3, 4` | `1`; `1`; `1 + q⁻¹` (ℚ_2: `1/2 + 1/2 + (2·2⁻² + 4·2⁻³)/2 = 3/2`); `1 + q⁻¹ + q⁻²`; `1 + q⁻¹ + 2q⁻² + q⁻³` | holds; `k = n > 0` term `q(n,0) = 0` |
| `tsum_isTransitive` (no `hg` now) | `n = 2`, ℚ_2; `n = 3`, `g` = indicator of `ℚ_2(∛2)` | `1 + 2·2⁻² + 4·2⁻³ = 2 = 1!·2`; `2 = 2!·1` | holds without invariance |
| `tsum_inertiaDegree_eq` | `(f,e) = (2,1)`; `(1,2)` ℚ_2; `(1,2)` odd `p`; general | `1 = 1·q⁰`; `2·2⁻² + 4·2⁻³ = 1 = 2·2⁻¹`; `2/p`; `q^{−f(e−1)} ∑ (q^f)^{−c} = e q^{−f(e−1)}` | holds |
| `etaleMass_isTransitive_splittingSymbol` | `(2,1)`; `(1,2)` ℚ_2; general | `(1/2!)·1!·1 = 1/2`; `1/2`; `(fe−1)!·e·q^{−f(e−1)}/(fe)! = q^{−f(e−1)}/f` | equals (4.0.1) `q^{f−n}/f` |
| `etaleMass_splittingSymbol` | `{(1,1),(1,1)}`; `{(1,2),(1,1)}`; `{(1,2),(1,2)}`; `σ = {(0,1)}`, `n = 0` | `1/2`; `q⁻¹`; `3·(2q⁻¹)²/4! = 1/(2q²)`; left `0`, right `1/(0·1) = ⊤` | holds; `hσ` necessary |
| `etaleMass_ramificationPartition` | `n = 4`, `π = (1,1)`; `n = 5`, `π = (1,1)`; `n = 3`, `k = 2`, `π = (1,1)` | `1/2 + 1/2 → q⁻²`; `1/2 + 1/2 → q⁻²`; left `0`, `n_0 = −1` | holds; `hπ` necessary |
| `tsum_etaleDiscriminantExponent`, `etaleDiscriminantExponent_pi` | `n = 0` (zero ring); `n = 2` ℚ_2; `(ℚ_2(i), ℚ_2)` | `1 = M_0`; `3/2 = M_2`; orbits of sizes `2, 1`, `2 + 0 = 2` | holds |
| `finrank_fixedField_stabilizer`, `inf_maximalUnramifiedExtension` | trivial `ρ`, `n = 2`; `L = ⊥, ℚ_2(i), ℚ_4, K^ur` | `1 = 1`; `⊥ = K_1`, `⊥ = K_1`, `ℚ_4 = K_2`, `K^ur ≠ ⊥ = K_0` (infinite) | holds; finiteness necessary |
| `natCard_algEquiv_eq_mul`, `ncard_isomorphic_…_eq_finrank` | `ℚ_2(ζ_12)`; `ℚ_2(∜−3)`; `ℚ_4`; `⊥` | `4 = 2·2`, `2 = 2·1`, `2 = 1·2`, `1 = 1·1`; `1·2 = 2`, `2·2 = 4`, `1·1 = 1` | holds |
| §0.1 Check 3 (new) | countably many copies of the `ℚ_2(i)` orbit | `∑ᶠ` of a non-finitely-supported function is `0`: `d(X) = d(X ⊔ Y) = 0`, `d(Y) = 2` | holds; states why finiteness matters |
| `WreathGaloisSet.conductor` exactness | base orbit with `L`, fibre algebra `M/L`: share `= m d(L/K) + f d(M/L)` (tower law) | `≥ (m−1) d(L/K)`, so `d(X) − (m−1) d(Y)` is exact and equals `∑ (d(L_i/K) + f_i d(M_i/L_i))` | holds |
| `conductor`, `m = 2` vs Artin conductor | `L = ℚ_2(i)`, `M = L × L`; `M/L` quadratic with `d(M/L) = 3` | `4 − 2 = 2 = d(L/K)`; `(4 + 3) − 2 = 5 = d(L/K) + f·d(M/L)`, the conductor of `Ind(χ_M)` (Kedlaya Lemma 8.4) | agrees |
| wrong models of `c` | `c' = d(X) − m·d(Y)`; `c'' = d(X)` | `c'(L × L) = 0 ≠ 2` (excluded by the §4.1 Check); `c''` gives `121/8` vs `17` for `D_4` (§4.5 Check) | both excluded |
| `baseMulAction` (proved) | `m = 1`; `ρ` from `(ρ₀, χ)` | `Fin n × Fin 1 ≅ Fin n`, base `= ρ`; base `= ρ₀` | holds |
| `tsum_relativeGaloisSet` | `L = ⊥`; `m = 0`; `m = 2`, `L = ℚ_2(i)`; `L = ℚ_4` | `M_m(K)` both sides; `1 = 1`; trivial `χ`: `d_K = 2 + 2`, exponent `0`, `1/2`; transitive `χ`: `(1/2)·∑_{[M:L]=2} 2^{−d(M/L)} = (1/2)·2 = 1`; total `3/2 = 1 + 2⁻¹`; `1 + 4⁻¹ = 5/4` | holds |
| `tsum_relativeGaloisSet` exponent, hypotheses | `d_K(χ) = m d(L/K) + f d_L(χ)` | truncated subtraction exact; `L` infinite would give open-kernel actions of a non-open subgroup with junk weights `0`, left side `∞` | `[FiniteDimensional K L]` necessary |
| `natCard_base_fibre` | `n = 1`; `m = n = 2`; general | `1`; `2`; `ρ(g)(j, ·) = α_{ρ₀(g)j} χ(σ_{ρ₀(g)j}⁻¹ g σ_j) α_j⁻¹` with `α_0 = 1`, `(m!)^{n−1}` choices, kernel ⊇ core of `ker χ` (open) | holds; the wrong model `(m!)^n` fails at `n = 1` |
| `natCard_base_fibre` quantifier | `L.fixingSubgroup` vs `stabilizer 0` | stabilizer ⊇ open kernel, open hence closed, so `fixingSubgroup (fixedField H) = H` (Infinite.lean 146) | consistent (R03 is the locator only) |
| `wreathTransitiveMass_eq` | `m = 2`, `n = 1`; `m = 2`, `n = 2`; `m = 1`; `n = 0` | `1 + q⁻¹`; `q⁻¹(1 + q⁻¹) + (1/2)(1 + q⁻²) = 1/2 + q⁻¹ + (3/2)q⁻²` (`11/8` at `q = 2`); `∑_{f|n} q^{−(n−f)}/f`; left `1` (empty action is pretransitive), right `0` | holds; `hn` necessary; equals (8.5.2) |
| `wreathTransitiveMass_eq` derivation | `(1/((m!)^n n!)) · (m!)^{n−1} · m! · (n−1)! · ∑_f (n/f) q^{−(n−f)} ∑_k q(k,m−k) q^{−fk}` | `= ∑_f (1/f) q^{−(n−f)} ∑_k …` | normalization matches |
| `wreathMass_recursion` | `m = 1`, `n = 1, 2`; `m = 2`, `n = 2`; `n = 0` | `1 = 1`; `2M_2 = 1 + (1 + 2q⁻¹)`; `2W_2 = (1+q⁻¹)² + (1 + 2q⁻¹ + 3q⁻²) = 2 + 4q⁻¹ + 4q⁻²`; `0 = 0` | holds; `C(n−1,k−1) k! (n−k)! = (n−1)! k` |
| `wreathMass_two` | `n = 1, 2, 3` | `1 + q⁻¹`; `1 + 2q⁻¹ + 2q⁻²`; `1 + 2q⁻¹ + 4q⁻² + 3q⁻³` (recursion: `3W_3 = 3 + 6q⁻¹ + 12q⁻² + 9q⁻³`) | both routes agree; equals Kedlaya's `q^{−n} ∑_j ∑_i P(j,i)P(n−j)q^i` |
| `wreathMass_two` generating function | `∑ M_j x^j = ∏ (1 − x^i q^{1−i})⁻¹`; `∑ P(j) q^{−j} x^j = ∏ (1 − x^i q^{−i})⁻¹` | `x²`: `1 + q⁻¹`; `x³`: `1 + q⁻¹ + q⁻²`; recursion weights `k t_k = ∑_{i|k} i a_i^{k/i}`: `T_{1,k} = ∑_{f|k} q^{−(k−f)}/f`, `t_k = σ(k) q^{−k}/k`, `T_{2,k} = T_{1,k} + t_k` | the proof route of §4.5 is correct |
| `exists_wreathMass_eq_aeval` | `m = 1`; `m = 2`; `n = 0`; coefficients | `∏_e (1 − x^e q^{1−e})⁻¹`; (8.6.1); `P = 1`; `∏_{k≤m}∏_{e≥1}(1 − x^e q^{1−e−k})^{−q(k,m−k)}` has coefficients in `ℕ[q⁻¹]` (`k = m` term empty for `m ≥ 1`) | holds; `ℕ` is the roadmap's refinement of Wood's `ℤ[x]` (R06) |
| `wreathMass_one` | `m = 1` | fibre condition vacuous on `Fin n × Fin 1`, `c = d(X) − 0`, normalization `(1!)^n n! = n!` | `W_{1,n} = M_n` |
| §4.5 Checks | `8 W_{2,2}`; `m = 3`, `n = 1`; `𝔽_2((t))` | `8 + 16/q + 16/q²` (wood2008 line 416); `M_3 = 1 + q⁻¹ + q⁻²`; infinitely many wreath Galois sets, finite value | agree |
| `subgroupOrbitDiscriminantExponent` | `H = ⊤` | stabilizers mapped by `H.subtype` are the full stabilizers; equals `orbitDiscriminantExponent` | consistent |
| generality | README "every non-archimedean local field", `m ≥ 1`, all `n` | Lean `[IsNonarchimedeanLocalField K]`, `[NeZero m]`, sums in `ℝ≥0∞` | equal |

Other checks: the four `*Needs:*` lines of Layer 4 point downward only (0.1, 0.2, 0.3, 2.2, 3.3, 4.1–4.4
and the LocalFieldsRamification contract); no target-level cycle (4.1 → 0.1; 4.2 → 3.3; 4.3 → 0.2;
4.4 → 0.3, 2.2, 4.1–4.3; 4.5 → 3.3, 4.4). Every Layer 4 definition has at least three Checks (4.1:
three; 4.2: three; 4.3: two bullets with three instances; 4.4: two bullets with four instances; 4.5:
five). The README has `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`,
`## How to read the build`, Layers 0–4 each with `### Dependencies`, `## Downstream consumers`,
`## References`; no `### Examples` subsection in any layer (the worked values sit in the Checks; the
previous review already noted this and the author chose the Check form, which the gate accepts). No
LaTeX delimiters, no pull-request numbers, no process words other than the ⚠ of R05.

## Not verifiable

- Bhargava 2007 (IMRN rnm052): no legal full text (the previous review's two attempts through the
  sources service got HTTP 403 from the publisher; no arXiv, author or repository copy; not retried).
  Its statements as the README gives them are confirmed through kedlaya2007b Theorem 1.1, Lemmas
  3.1–3.4, (4.0.1) and wood2008 lines 168–169. The README's claim that the published article numbers
  its results Thm. 1.1, Props. 2.1–2.3, eqs. (2.1)–(2.4) with an Appendix is neither confirmed nor
  refuted: kedlaya2007b line 979 cites the preprint and wood2008 line 548 cites the article "to
  appear", and both write "Theorem 1", "Proposition 1", "§8"/"Section 8.2".
- Ownership against open pull requests was checked through `roadmaps grep` over the 457 indexed
  pull requests and the sibling checkouts the brief lists; a pull request outside that index was not
  checked.
- The dependency checker prints only its summary line; the edges it recorded for this roadmap could
  not be listed, but it reports no UPWARD, CYCLE or moved line.

## Source issues

- none
