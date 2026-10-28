# Review of CategoricalOperatorAlgebras (pull request #888 at 84eff3a)

**Verdict:** needs changes

## R01 (P2) — Upward supplier and two-roadmap cycle with TemperleyLiebOperatorAlgebras

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` line 71 ("TemperleyLiebOperatorAlgebras A3–A6 supplies positive diagram quotients, trace completions and the elementary unitary TL category used in CA8's planar input examples"), lines 689–691 ("Construct the unshaded positive TL factor planar algebra … from TemperleyLiebOperatorAlgebras A3–A6's dagger trace quotient/category") and line 771 ("Include the Temperley–Lieb examples from TemperleyLiebOperatorAlgebras A3–A6").

Claim: TemperleyLiebOperatorAlgebras is a supplier of this roadmap.

Witness: TemperleyLiebOperatorAlgebras at its open head, `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md` lines 92–95, lists CategoricalOperatorAlgebras CA1a, CA2a among its suppliers, and its A6 (lines 385–388) instantiates "the native dagger and C*-category interfaces of CategoricalOperatorAlgebras CA1a, CA2a". The merge order lists CategoricalOperatorAlgebras at position 236 and TemperleyLiebOperatorAlgebras at 237. Each roadmap therefore cites the other as a supplier, and this roadmap's citation is upward. The dependency check does not see it: it extracts edges only from `*Needs:*` lines, and this README has none. Running it on this README and on an unrelated README prints the same "159 roadmaps, 1105 edges, 0 problem(s)"; a probe README containing one line `*Needs:* TemperleyLiebOperatorAlgebras A6, HilbertModules H3.` run under this roadmap's name prints "161 roadmaps, 1140 edges" and a `moved:` line naming HilbertModules and TemperleyLiebOperatorAlgebras. So the passing `depcheck=0` in the gate is vacuous for this README.

Repair: keep the direction CategoricalOperatorAlgebras → TemperleyLiebOperatorAlgebras (the consumer is the one that instantiates CA1a/CA2a) and remove every consumption of TemperleyLiebOperatorAlgebras here. Concretely: delete the supplier bullet at line 71 and name TemperleyLiebOperatorAlgebras only as a downstream consumer (the sentences at lines 98 and 172 already describe it that way); in CA8 replace "from TemperleyLiebOperatorAlgebras A3–A6's dagger trace quotient/category" by a construction owned here from Subfactors S6's Temperley–Lieb planar algebra example (`TauCetiRoadmap/Subfactors/README.md` line 455, "Build TL and finite-group planar algebras as actual tangle-algebra examples"; Subfactors is at position 216, earlier), i.e. own the unshaded positive TL factor planar algebra `P[n]=Hom(1,x^⊗n)` at each permitted modulus as a CA8 target whose even restriction is S6's shaded example; at line 771 cite that CA8 target instead of A3–A6. Then add `*Needs:*` lines (see R02) so that the check sees the edge S6 → CA8 and the absence of any edge to TemperleyLiebOperatorAlgebras. Tested on the instance: with the probe README above the check reports the upward position; with the TemperleyLiebOperatorAlgebras item removed from the `*Needs:*` line it reports only the HilbertModules move, which is not a defect.

## R02 (P3) — No `*Needs:*` lines, Checks or supplier-contract section, so the build order and the gate's dependency check are unreadable

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md`, whole file (headings `## CA1.` … `## CA10.`, prose only).

Claim: the README gives each target its dependencies and each definition its Checks.

Witness: the file contains no `*Needs:*` line, no `**Checks.**` list and no `## Exact supplier contracts` section; `grep -c 'Needs:' README.md` gives 0. The consequence for the dependency check is shown under R01. The same shape is used by the sibling operator-algebra roadmaps (FreeProbability on main, Subfactors, VonNeumannAlgebras, HilbertModules at their open heads), so this is a family convention rather than an error of this author, and the gate's own checks (`layer-ids`, `target-ids`, `empty-sections`) accept it.

Repair: at the end of each `### CAk` subsection (or each paragraph that is one target) add one `*Needs:*` line naming the roadmap and section of every supplier used there (for example CA3's Q-system on `_N L²(M)_N` needs Subfactors S2; CA8's tower needs Subfactors S6, S8, HilbertModules H3, OperatorKTheory K1–K2 and CA7), so the check reads the real edges. Turn the computed regressions already present in prose into `**Checks.**` bullets (the one-edge weighting μ(v)=16, μ(w)=1 at lines 625–627; the II∞ inner amplification at lines 1088–1096; the N(δ²) count at lines 807–811; the zero presentations and size tests at lines 931–939), and add Checks for the definitions that have none (Q-system rescaling, the balanced projector, the signed self-duality sign on a two-dimensional symplectic example).

## R03 (P3) — `Suggested.lean` form: docstring, README agreement, namespace, unused hypotheses

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` lines 8–14 (module docstring), line 18 (`namespace CategoricalOperatorAlgebras`), lines 184–195 (the two `scaledAlgebraMorphism` theorems).

Claim: the file states the headline theorems statable at the pins and says which are not.

Witness: none of the roadmap's headline theorems (Penneys Theorems A and C in CA2, Q-system completion and the realization biequivalence in CA3, the compact W*-object correspondence in CA4, the discrete-inclusion equivalence in CA5, the anchored equivalence in CA6, the Pimsner six-term sequence and free-graph K-theory in CA7, the Watatani tower and K₀ cone in CA8, the complete W*-category biequivalence and representation uniqueness in CA9, the finite-depth bijection in CA10) is statable at the pins (no C*-category, Hilbert bimodule, planar algebra or factor exists in Mathlib or Tau Ceti at the pin), and the docstring does not say so; it says only "These are suggested forms". No Lean name of this file occurs in the README (`grep -c '\`balancedProjector' README.md` and the other sixteen names all give 0). The namespace is `CategoricalOperatorAlgebras`, as in the sibling files, not `TauCetiRoadmap.CategoricalOperatorAlgebras`. The elaborated signatures (scratch `#check @name` for all 29 declarations, elaborated once) show `scaledAlgebraMorphism_unit` and `scaledAlgebraMorphism_mul` carrying `[Dagger C] [MonoidalDagger]`, which their statements do not use, and the hypothesis `0 < d₂` is not needed for either: for d₂ ≤ 0 both sides of each equation are 0 because `Real.sqrt` of a nonpositive number is 0. For `_mul` even `0 < d₁` is unnecessary for the same reason; for `_unit` it is needed (d₁ = 0, d₂ = 1 gives 0 on the left and `MonObj.one` on the right).

Repair: rewrite the docstring as "Categorical operator algebras: target signatures", stating that the roadmap is `README.md`, that this file states headline theorems against the pinned APIs, and listing the headline theorems above with the carrier each lacks; mention in the README's CA3 paragraph the names `QSystem`, `QSystemBimodule`, `balancedProjector` and the two `balancedProjector_*` theorems, and in CA3's rescaling paragraph `scaledUnit`, `scaledMultiplication`, `scaledAlgebraMorphism`; drop the unused `[MonoidalDagger]` section variable from the rescaling section (close the `Monoidal` section's dagger variable before it or state the theorems before `variable [MonoidalDagger]`), and drop `h₂` from both theorems and `h₁` from `_mul`.

## R04 (P3) — The sorried theorems are not headline results

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` lines 159–170 and 184–195.

Claim: the four `sorry`'d theorems are the roadmap's acceptance test.

Witness: `balancedProjector_selfAdjoint` and `balancedProjector_idempotent` follow from the structure fields by the computation `p = (1_X⊗λ_Y)(ρ_X†⊗1_Y) = (ρ_X⊗1_Y)(1_X⊗λ_Y†)` (right Frobenius in the form `(ρ⊗1)(1⊗m†)=ρ†ρ`, then the right unit law; and symmetrically), after which `p† = p` is immediate and `p² = p` uses `ρ†ρ=(1⊗m)(ρ†⊗1)`, associativity and `λλ†=1`; this is CHPJP line 830 verbatim in the source's notation. The two `scaledAlgebraMorphism` theorems are the scalar identities `√d₁·√(d₂/d₁)=√d₂` and `√(d₂/d₁)/√d₁=(d₂/d₁)/√d₂`. The one-tactic probe (`simp [defs, hf]`, with and without the square-root lemmas) closed none of the four, so by the brief's test they are not padding; they are nevertheless API lemmas of CA3, not the deep results the finished roadmap is tested against.

Repair: keep them if the author wants a nontrivial check of the `QSystemBimodule` axioms (they are correct and the axioms are the source's), but they should be labelled in the docstring as the CA3 separability-projector lemma and the rescaling lemma rather than as headline theorems; alternatively delete the two scaled theorems from `Suggested.lean` (the README keeps the statement at lines 365–372).

## R05 (P3) — Two statements narrower than their sources

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 249–256 ("connected zero boxes `P_(0,±)=ℂ` … `1=1_+⊕1_-` with simple summands") and line 641 ("For a connected graph prove `A(Λ,μ)=∅` implies …").

Claim: the shaded planar correspondence is stated for connected zero boxes only; the kernel criterion for the free graph algebra is stated for connected graphs only.

Witness: Penneys-UDF lines 165–185 (Theorem C) take "a unitary multitensor category … an orthogonal decomposition `1_C = 1_+ ⊕ 1_-`" with no simplicity of `1_±`, i.e. box spaces `P_{0,±}` that are finite-dimensional commutative C*-algebras; HP-CstarPlanarI line 1732 (Theorem 5.23) proves "If A(Λ,μ) is empty, then S(Λ,μ) ∩ K(F(Y(Λ))) = {0}" for every countable weighted graph, with local finiteness only for the converse.

Repair: state both in the source's generality (multitensor with nonsimple unit summands; arbitrary countable graph for the first direction, locally finite for the converse) and keep the simple-summand case and the connected case as Checks.

## R06 (P3) — A supplier's theorem restated as a target

Location: `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 378–380 ("For the standard solution prove `d_Q=d(X)²=Ind(E₀)≤[M:N]`, with equality exactly in the extremal case").

Claim: this roadmap proves the inequality between the minimal index and the Jones index.

Witness: Subfactors S2, `TauCetiRoadmap/Subfactors/README.md` lines 184–186, already states and owns "`Ind(E_0)=d(X)^2≤[M:N]` for X=_N L²(M)_M with S2's standard duality".

Repair: prove here only `d_Q = d(X)²` for the Q-system built on `X⊗_M X̄` and cite Subfactors S2 for `d(X)² = Ind(E₀) ≤ [M:N]` and the extremal equality case.

## Verified sound

Gate: the worker's gate at this head passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`); `git diff --stat origin/main...HEAD` outside the folder is empty. The roadmap folder does not exist on main (new roadmap; all seven branch commits are this folder).

Lean: `lake env lean` on a copy of `Suggested.lean` (the `TauCeti.CategoryTheory.Monoidal.Rigid.Basic` olean present at the pin) finished in 5 s with exactly four `sorry` warnings (lines 159, 165, 184, 190) and no other diagnostic. A scratch file importing the module elaborated `#check @name` for all 29 declarations; each elaborated type was compared with the README: the dagger, unitary, Q-system, bimodule, balanced-projector, rescaling, splitting and real-structure signatures agree with CA1a, CA2a, CA3 and CA6 (differences noted under R03 are unused binders only). Pinned declarations opened: `CategoryTheory.exactPairingCongrLeft` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:596`), `TauCeti.exactPairingCongrLeft_evaluation` (`TauCeti/CategoryTheory/Monoidal/Rigid/Basic.lean:44`, type `ε_ X Y = Y ◁ i.hom ≫ ε_ X' Y`, used by the proved `SymmetricSelfDuality.transport`), `MonObj` with fields `one`, `mul`, `one_mul`, `mul_one`, `mul_assoc` (`Mathlib/CategoryTheory/Monoidal/Mon.lean:72–83`), `Mon` (`Mon.lean:251`), `EndMonoidal` (`Mathlib/CategoryTheory/Bicategory/End.lean:24`), `HalfBraiding`, `Center` (`Mathlib/CategoryTheory/Monoidal/Center.lean:53, 72`), `MonoidalPreadditive`, `MonoidalLinear`; Tau Ceti files `Rigid/DoubleDual.lean` and `Rigid/Functor.lean` exist as cited. Mathlib at the pin has no dagger-category notion (only a probability-kernel file mentions the word), so `Dagger` is this roadmap's to define.

Duplication audit by object (via `roadmaps grep` over main and the 384 open heads): Q-systems, dagger/C*/W*-categories, Cuntz–Pimsner algebras, the tube algebra, the non-tracial Ocneanu ultrapower, anchored planar algebras, Watatani index and bicommutant categories are constructed by no other roadmap; VonNeumannAlgebras V12 (lines 2346–2364) builds only the tracial ultrapower, which CA9 cites for the finite case. Supplier citations resolved at the heads named in the brief: VonNeumannAlgebras V4 (`V4.Normality` sub-label, lines 78–90), V5 (line 784, countable splitting line 797), V6, V11 (standard form line 1864, tensor commutation lines 1881–1882, continuous core 2211), V12, V13 (II∞/III₁ uniqueness 2724–2729); Subfactors S1 (conjugates, double conjugate, fusion, unitors, opposite weight: lines 88–108), S2 (dualizable `_N L²(M)_M`, line 185), S5–S9 (S6 TL example line 455, angle/winding weights 461–490; S7 tower graph 596, 612; S8 GJS/orthogonal 668–710; S9 standard model 777–790); HilbertModules H1–H4 (H3 imprimitivity and Morita invariance of simplicity, line 284); CStarAlgebras C1–C5; OperatorKTheory K1–K8 (K5 KK-equivalence line 621, K7 Toeplitz–Cuntz 770); FreeProbability F2–F4 on main; PivotalSpherical and QuantumGroups on main (QuantumGroups line 42 consumes CA1a/CA2a); OperatorAlgebraDynamics D6 owns O_n (line 457). Subfactors line 65 names this roadmap as a downstream consumer only (no cycle there).

Sources: all 14 cited works fetched through the sources service from arXiv (JP-OpAlg 1611.04620v2, JP-QSys 1707.02155v1, CHPJP-QSysCompletion 2105.12010v2, JP-Realizations 1704.02035v2, Penneys-UDF 1808.00323v1, HPT-Anchored 2301.11114v2, HP-CstarPlanarI 1401.2485v1, HP-CstarPlanarII 1401.2486v1, HNP-CompleteWstar 2411.01678v1, HP-Bicommutant 1511.05226v2, HP-RepFusion 2004.08271v1, MT-ApproxInner 0802.0344v1, Tomatsu-CentrallyFree 1812.04222v1, HPT-FiniteDepth 2307.13822v1). The seeded sample of 15 targets, each checked at its locator for number, hypotheses and support of the statement as written:

1. CHPJP Definition 3.1 (line 555–571): Q-system axioms (Q1)–(Q4) with separable `mm†=1`; matches CA3.
2. CHPJP Definition 3.14 (733–747): bimodule axioms (B1)–(B4); matches the `QSystemBimodule` fields.
3. CHPJP Definition 3.18 and Remark 3.19 (795–834): separability projector `p = (1⊗λ)(ρ†⊗1) = (ρ⊗1)(ρ†⊗1)`, coequalizer; matches CA3's `p` (see table row 2).
4. CHPJP Theorem 3.36 (1131–1135): complete iff every Q-system splits; matches CA3.
5. JP-QSys Proposition 4.11 and Lemma 4.12 (827–835): `m = d_H^{1/2}·(projected trivalent)`, `i = d_H^{-1/2}·coev`, `m m* = d_H`, unit isometric; matches CA4's scaling and the unit-isometric convention.
6. JP-OpAlg Theorems 3.8, 3.20, 4.28 (976, 1216, 1958): algebra objects ≃ cyclic module categories; *-algebra objects ≃ cyclic dagger module categories; internal Stinespring with `θ = Ad(v)∘π`, `v` an isometry; matches CA4.
7. JP-Realizations Theorem 5.35 and Corollary 7.14 (2317–2318, 3091–3096; morphism classes at lines 12–13, 152): `ConAlg ≃ DisInc_H` with ucp/state-preserving morphisms, restricting to *-homomorphisms; matches CA5.
8. Penneys-UDF Theorem A (122–131): pseudounitary pivotal structures ↔ unitary dual functors ↔ `U → ℝ_{>0}`, character `dim_L/dim_R`; Theorem C (165–187) as in R05; matches CA2a.
9. HPT-Anchored Theorem A (94–106), Definition 3.4 (943–945), Definition 4.5 (1362–1379), real structure (619–620), right-adjoint hypothesis (78); matches CA6 including `r̄ r = ν` and the `coev†` pairing.
10. HP-CstarPlanarI Definition 5.17 (1528–1536): `a = ⁴√(μ(s(ε'))/μ(t(ε')))`, `T_ε = aL(ε')+a⁻¹L(ε'')*+a⁻¹L(ε'')+aL(ε')*`; Theorem 5.23 (1732–1733), Theorem 5.25 (1753–1754, K₀ free on vertices, K₁ = 0); matches CA7 (table row 4).
11. HP-CstarPlanarII Theorem C (98–100), Theorem 5.1/5.5 (689–694, 826–827), Definition 6.11 (1224–1225, `N(a)=min{n>a}`), Theorem 6.13 (1229–1262, sharpness via `[1₂]≠δ²[1₀]`), Corollary 6.8 (1217, Watatani index δ²); matches CA8.
12. HNP-CompleteWstar Theorem 7.4 (1540–1547): `vN2 ≃ W*Cat` as bi-involutive bicategories; HNP uses left modules `BH ⊠_A −`, the README fixes right modules `K_A ↦ K⊗_A H` and says so (CA9 lines 835–841); matches up to that declared convention.
13. HP-RepFusion Theorem 3.10 (651–655), Theorem 3.15 (776–777), Corollary 3.16 (789–790); matches CA9's existence and uniqueness statements with their hypotheses (hyperfinite, separable predual, both type II or both III₁).
14. MT-ApproxInner Definition 2.4 (137–148), Definition 3.1 (711–716), Corollary 3.16(3)–(4) (1329–1332), Main Theorem (59–60), dual action convention `θ_s(λ(t)) = e^{-ist}λ(t)` (695); matches CA9 after the sign conversion the README states (table row 6).
15. Tomatsu-CentrallyFree Theorem D (76–80), Definition 2.3 (399–405), Proposition 2.7 (457–458), Definition 2.16 (713–720), Remark 2.17(1) citing Masuda–Tomatsu Lemma 8.2 (723–726), cocycle-action convention (557–570), left inverse (2.6) (580); HPT-FiniteDepth p. 16 setup (801–818), Lemma 3.7 (459–460), symmetric self-duality (41–45); HP-Bicommutant Theorem A (58–60). All match CA9/CA10.

Adversarial table (one row per statement, values computed on each side):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA2a symmetric self-duality: `ev_x(r⊗1) = ev_{x∨}(φ_x⊗r)` ⇔ `r̄ r = φ_x` | general rigid dagger category, `r̄ = (r†)∨`, `r` unitary | `ev_{x∨}((r†)∨⊗1) = ev_x(1⊗r†)` by the mate law; so `ev_{x∨}(r̄r⊗r) = ev_x(r⊗r†r) = ev_x(r⊗1)`; converse by nondegeneracy of `ev_{x∨}` and invertibility of `−⊗r` | consistent, types check (`r̄ r: x→x∨→x∨∨`) | none |
| CA3 balanced projector `p=(ρ_X⊗λ_Y)(1⊗m†i⊗1)` | arbitrary Q-system bimodules with the Lean fields | right Frobenius `(ρ⊗1)(1⊗m†)=ρ†ρ` and `ρ(1⊗i)=1` give `p=(1⊗λ)(ρ†⊗1)`; left Frobenius gives `p=(ρ⊗1)(1⊗λ†)`; `p†=p`; `p²=(1⊗λ)(ρ†ρ⊗1)(1⊗λ†)=(1⊗λ(m⊗1)(1⊗λ†))(ρ†⊗1)=(1⊗λλ†λ)(ρ†⊗1)=p` | self-adjoint and idempotent from the stated axioms, equals CHPJP line 830 | none |
| CA3 rescaling `m'=d^{-1/2}m`, `i'=d^{1/2}i` | unit-isometric `i†i=1`, `mm†=d` | `m'm'†=d^{-1}d=1`; `i'†i'=d`; `i'†m'=d^{1/2}d^{-1/2}i†m=i†m` | consistent | none |
| CA3 morphism rescaling `f'=√(d₂/d₁)f` | `f i₁=i₂`, `f m₁=m₂(f⊗f)` | `f'i₁'=√(d₂/d₁)√d₁ i₂=√d₂ i₂=i₂'`; `f'm₁'=√d₂/d₁·m₂(f⊗f)`; `m₂'(f'⊗f')=(d₂/d₁)d₂^{-1/2}m₂(f⊗f)=√d₂/d₁·m₂(f⊗f)` | equal; degenerate `d₁=0`: left side 0, right side `i₂'`, so `0<d₁` is needed for the unit law; `d₂≤0` makes both sides 0 | none (hypothesis note in R03) |
| CA7 weighted edge generator and moments | `x=p_vT_εp_w`, `ε':v→w`, vacuum expectation `E` | `x=aL(ε')+a⁻¹L(ε'')†`; `E(x†x)=a²⟨ε',ε'⟩=a²p_w`; `E(xx†)=a⁻²⟨ε'',ε''⟩=a⁻²p_v`; `τ_μ(x†x)=a²μ(w)`, `τ_μ(xx†)=a⁻²μ(v)`, equal iff `a⁴=μ(v)/μ(w)` | traciality forces the stated `a` | none |
| CA7 one-edge regression | `μ(v)=16`, `μ(w)=1` | `a=2`: `a²μ(w)=4`, `a⁻²μ(v)=4`; `a=1/2`: `1/4` and `64` | matches README; wrong orientation fails as claimed | none |
| CA7 `A(Λ,μ)` for the principal-graph weighting | `μ(v)=d_v`, `δ>1` | `a_μ(v)=Σ_w n(v,w)d_w=δ d_v>d_v` | `A=∅` | none |
| CA7 `S(Λ,μ)∩K=0` first direction | source Theorem 5.23 | no connectedness hypothesis in the source | README narrower | R05 |
| CA8 basis count `N(δ²)` | `δ²=2` (δ=√2): `N=3`; `δ²=4`: `N=5`; `δ²=φ²≈2.618`: `N=3` | Pimsner–Popa trace bound `n≥δ²` excludes `n<⌈δ²⌉`; for integral δ² the K₀ obstruction excludes `n=δ²` | `N(δ²)=⌊δ²⌋+1` in all cases, equals `min{n>δ²}` | none |
| CA8 permitted moduli | `n=3`: `2cos(π/3)=1`, excluded by `δ>1`; `n=4`: `√2` | first admitted value is `n=4` | set as stated | none |
| CA8 K₀ cone and scale | Theorem C of HP-II | `K₀^+={0}∪{τ_*>0}`, `Σ={0,[1]}∪{0<τ_*<1}` | identical | none |
| CA9 inner amplification | `n` isometries, `ρ(x)=Σv_ixv_i†`, `φ_ρ(x)=n⁻¹Σv_i†xv_i` | `τ∘φ_ρ=n⁻¹Στ(xv_iv_i†)=n⁻¹τ`; `d_ρ=n`; `(D(τ/n):Dτ)_t=n^{-it}`; `ρ̌(u_t)=n^{-it}u_t`; `ρ̃(u_t)=n^{it}n^{-it}u_t=u_t`; module `θ_0` | rank `r=n`, module trivial; the doubled phase gives `n^{-2it}` | none |
| CA9 sign bridge to Masuda–Tomatsu | MT line 695 `θ_s(λ(t))=e^{-ist}λ(t)`, MT line 716 `ρ̌=θ_{log d}∘ρ̃`, Main Theorem `mod(ρ)=θ_{log(r/d)}` | README positive convention: `ρ̃=θ_{+log d}∘ρ̌`, `mod(ρ)=θ_{log(d/r)}`; at `d=r=n` both give `θ_0` | conversions consistent | none |
| CA9 Følner amenability | fusion `C`, `K=Irr(C)` | `F·K⊆K`, `|(F·K)△K|_σ=0≤ε|K|_σ` | every fusion category amenable | none |
| CA9 central-sequence inequality | `φ` normal state, `x,y` bounded | `φ(xy−yx)=(φx−xφ)(y)`, `|·|≤‖xφ−φx‖‖y‖` | holds | none |
| CA9 size test | `I` uncountable, `B(ℓ²(I))` | any nonzero normal representation contains `ℓ²(I)` as a subrepresentation, dimension `|I|>ℵ₀` | no separable normal representation | none |
| CA9 approximate innerness definition | MT Definition 2.4 items (1)–(4) | `[r]+1` partial isometries, `v_{[r]+1}=0` for integral `r`, `Σv_iv_i†=1`, `‖r⁻¹v_iψ−(ψ∘φ_ρ)v_i‖→0` | identical | none |
| CA10 tube multiplication | `f:(i,j;k)`, `g:(j,h;l)`, `v:s→k⊗l` | composite `i⊗s→i⊗k⊗l→k⊗j⊗l→k⊗l⊗h→s⊗h` lands in `(i,h;s)`; mismatched middle label gives no `g` to compose | typed and well defined | none |
| CA6 representability criterion | `V` semisimple, `Hom_C(Φ(v),c)` contravariant in `v` | representing object `⊕_s Hom_C(Φ(s),c)^*⊗s` is in `V` iff finitely many `s` contribute | criterion as stated; fusion `V` always | none |
| CA6 connectedness | `P[0]=Tr_V(1_C)` | `Hom_V(v,Tr_V(1))≅Hom_C(Fv,1)`, so `P[0]≅1_V` iff `F` fully faithful; `Φ` fully faithful does not imply it (identity lift `Z(C)→Z(C)`, forgetful not full) | README's distinction correct | none |
| CA2b planar correspondence hypotheses | Penneys Theorem C | source allows nonsimple `1_±` | README narrower | R05 |

Headline theorems: as listed under R03, none is statable at the pins; nothing is forced through a stand-in. Padding probe: the four sorried theorems were each tried on a scratch copy with `simp [definitions, hypothesis]` (and, for the rescaling ones, additionally with `smul_smul`, `Complex.ofReal_mul`, `Real.sqrt_mul`, `mul_div_cancel₀`); all four left unsolved goals, so none closes in one tactic. The proved declarations (`IsUnitary.dagger`, `dagger_smul`, `multiplicationSplitEpi`, `SymmetricSelfDuality.transport`, `UnitarySplitting.selfAdjoint`, `UnitarySplitting.idempotent`) are correct; their proofs were re-read and `transport` was elaborated against the pinned `TauCeti.exactPairingCongrLeft_evaluation`.

Ownership against open pull requests: checked by object over the 384 open heads and main with `roadmaps grep` (see the duplication audit); no sibling `Suggested.lean` declares a name of this file's namespace.

Dependency check output on this README (unchanged by `--movable`): `depcheck: 159 roadmaps, 1105 edges, 0 problem(s)`; the same two numbers appear for every README passed, which is the vacuity recorded under R01. Declared gaps: none (no `design/plan.json`).

## Not verifiable

- None. Every cited source was readable on arXiv. Version note: the sources were read at the arXiv versions listed above; the README cites by arXiv identifier without a version, and the theorem numbers it uses agree with those versions.

## Source issues

- **Misprint** in JP-QSys at Proposition 4.11, proof, printed page 14: the source writes the unit relation of the normalized Q-system as the composite i then i-star equal to the identity of the unit object; it should be i-star after i (the composite 1 → Q → 1); affects nothing.
