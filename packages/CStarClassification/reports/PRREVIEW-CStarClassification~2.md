# Review of CStarClassification (pull request #863 at db5a0c5)

**Verdict:** accepted

Gate at this head: every check passed (`depcheck=0 build=0 stray-files=0 outside-folder=0`). Dependency
check run by this review:
`depcheck: 200 roadmaps, 1319 edges, 0 problem(s)` (no UPWARD or CYCLE line; the roadmap now
contributes its own `*Needs:*` edges, 11 more than at the previous head). `git diff --stat
origin/main...HEAD -- . ':!TauCetiRoadmap/CStarClassification'` is empty. Elaboration of
`TauCetiRoadmap/CStarClassification/Suggested.lean` (after `lake build TauCeti.NumberTheory.Supernatural`):
six `sorry` warnings, nothing else. A scratch copy with one `#check @name` per declaration (18 names)
elaborated; the elaborated types are compared with the README under *Verified sound*. The one-tactic
padding probe (`first | rfl | simp | infer_instance | exact?` on a scratch copy) closes none of the six
sorried theorems.

## Repair of the previous review's findings (head a8c334e)

- R01 (P2, Glimm and EHS absent): repaired. `Suggested.lean` lines 139–212 declare
  `SimplicialPresentation`, `effros_handelman_shen`, `UHFPresentation`, `glimm_classification`,
  `uhf_unital_embedding_iff`, `exists_uhf`; the step lemma `factor_positive_map_killing_relation` is gone.
- R02 (P3, README shape): repaired. Every target paragraph ends with a `*Needs:*` line (24 of them),
  every definition has a `**Checks.**` list of three to five bullets, locators sit at the claims, every
  layer ends with `### Examples` and `### Dependencies`, and `## Exact supplier contracts` lists the
  seven suppliers.
- R03 (P3, README and Lean naming each other; docstring): repaired. All 15 Lean names occur in the README
  (lines 206, 317, 353, 355, 507–509, 536, 539, 540, 618, 621, 625–627); the module docstring lines 20–36
  name the non-statable headlines layer by layer with the missing carrier; namespace is
  `TauCetiRoadmap.CStarClassification`.
- R04 (P3, dropped binders): repaired. `HasRieszInterpolation`, `IsUnperforated`, `IsDimensionGroup`
  carry `[IsOrderedAddMonoid G]` in their own signatures (elaborated types below); `CuntzSubequivalent`
  and `IsScale` are README-only targets now.
- R05 (P3, API lemmas): repaired. `approximatelyUnitarilyEquivalent_iff_sequence` and
  `projection_cuntzSubequivalent_iff` are deleted; the README keeps both as targets (lines 208–210, 677–678).
- R06 (P3, unused exactness): repaired. README lines 895–900 state the factorization lemma without
  exactness, "No exactness of A is used", and attach exactness to the matrix-level Lemma 1.10
  (lines 900–905) with a Check (914–916) exhibiting a nonexact instance.
- R07 (P3, VonNeumannAlgebras labels): repaired. Cited by section title (lines 59–60, 172) on both open heads.

## R01 (P3) — A Check asserts a unitary equivalence that is false

Location: `TauCetiRoadmap/CStarClassification/README.md` lines 881–882: "Two unital maps `O₂→O₂` given
by the Cuntz pairs `(s₁,s₂)` and `(s₂,s₁)` are approximately unitarily equivalent, and in fact unitarily
equivalent by `u=s₁s₂*+s₂s₁*`."

Claim: the two maps are approximately unitarily equivalent (Kirchberg–Phillips, Proposition 0.7, `kp00`
line 139) but not unitarily equivalent, and the named unitary does not conjugate one to the other.

Witness: `u` is a self-adjoint unitary (`u*u = s₂s₂*+s₁s₁* = 1`) and `u s₁ = s₂`, so
`u s₁ u* = s₂ u = s₂s₁s₂* + s₂s₂s₁*`, whereas `s₂ = s₂s₁s₁* + s₂s₂s₂*`; cutting down on the right by
`s₂` gives `s₂s₁` versus `0`, so `Ad(u)(s₁) ≠ s₂`. No unitary works: if `w s_i w* = s_{σ(i)}` then `Ad(w)`
commutes with the gauge action, so `w*γ_z(w)` is central, hence scalar, so `w` lies in a gauge
spectral subspace of degree `k`; a unitary of degree `k ≥ 1` would be `Σ_{|μ|=k} s_μ a_μ` with
`a_μ a_ν* = δ_{μν}` for `2^k ≥ 2` unitaries `a_μ` of the UHF core, impossible; so `w` lies in the core
`M_{2^∞}` and `Ad(w)` restricts there to the product flip `⊗Ad(σ)`, which is outer: for
`x = 1_{2^m}⊗diag(1,−1)⊗1` and `w_m ∈ M_{2^m}` with `‖w−w_m‖<ε`, `‖wxw*−x‖<4ε` but `⊗Ad(σ)(x) = −x`
has distance 2 from `x`.

Repair: replace the clause after "approximately unitarily equivalent" by "but not unitarily equivalent:
the swap automorphism of `O₂` is outer (an implementing unitary would be gauge-covariant, hence in the
UHF core, where it would make the product-type flip inner)". This turns the Check into the negative
control that the theorem of §5.3 is about approximate, not exact, equivalence.

## R02 (P3) — A Check's two projections are not orthogonal in the quotient

Location: `README.md` lines 272–275: "in `D=ℓ∞(ℕ,M₂)` with `J=c₀(ℕ,M₂)`, the classes of the constant
sequence `diag(1,0)` and of `(q_n)`, `q_n` the rank-one projection at angle `1/n` to it, are orthogonal
in `D/J`".

Claim: as written the two classes coincide, so there is no map `ℂ²→D/J` to lift.

Witness: a rank-one projection at angle `1/n` to `p = diag(1,0)` has `‖q_n − p‖ = sin(1/n) → 0`, so
`(q_n) − (p) ∈ c₀` and `[q_n] = [p]`; the product class is `[p] ≠ 0`.

Repair: take `q_n` at angle `1/n` to the complement `diag(0,1)`; then `p q_n → 0`, the classes are
orthogonal, and the stage-`n` lift needs the unitary at distance `O(1/n)` from 1 rotating `q_m`
(`m ≥ n`) onto `diag(0,1)`, which is the point of the Check.

## R03 (P3) — Four locators point at the wrong statement of the right source

Location and claim, each with the witness in the fetched text:

- `README.md` lines 892–893 (§5.4): the dilation of a u.c.p. map `M_n→B` to `x↦t*π(x)t` is cited as
  "Kirchberg–Phillips, Lemma 1.14". Lemma 1.14 (`kp00` line 621) is the approximate unitary equivalence of
  `1⊗φ` and `1⊗ψ` into `O₂⊗B`, used in §5.5. The dilation is Lemma 1.6 (`kp00` line 346, a partial
  isometry in `M_n⊗M_n⊗A` for any unital `A`); the excision of a state by a projection is Lemma 1.4
  (line 262); the compression of nuclear u.c.p. maps by isometries is Proposition 1.7 (line 367).
- `README.md` lines 763, 768 (§4.5) and 870–871 (§5.3): "Phillips, §1" for exponential length,
  `K₁`-injectivity and the comparison of full projections. Phillips's §1 (`phillips00` lines 220–550) is
  about asymptotic morphisms; the material is §2.1: Definition 2.1.1 (line 619, `cel`), Theorem 2.1.3
  (line 643, the `vλ(v*) ≈ u` statement under finite `cel` and `K₁`-injectivity), Lemmas 2.1.7–2.1.8
  (lines 681, 734).
- `README.md` lines 1327–1329 (§8.2): the kernel of `Aut(A)→KK(A,A)ˣ` is cited to Theorem 4.2.1. That
  theorem (`phillips00` line 2270) gives only the surjectivity (an isomorphism `K⊗A→K⊗B` with class `η`);
  that two automorphisms with equal class are asymptotically unitarily equivalent is Theorem 4.1.3
  (line 2202, applied with `K⊗O∞⊗A ≅ A` for stable Kirchberg `A`).
- `README.md` line 421 (§2.4): "Bratteli, Theorem 3.3 for ideals and quotients". Theorem 3.3
  (`bratteli72` line 634) is the lattice correspondence of ideals with diagram subsets; that a closed ideal
  is the closure of its finite-stage pieces, which makes ideals and quotients AF, is Lemma 3.1 (line 556).

Repair: write "Lemmas 1.4 and 1.6, Proposition 1.7", "Phillips, §2.1 (Theorem 2.1.3, Lemmas
2.1.7–2.1.8)", "Theorems 4.1.3 and 4.2.1", and "Bratteli, Lemma 3.1 and Theorem 3.3". While there: Glimm's
Definition 1.1 (`glimm60` lines 48–57) requires the matrix sizes to tend to infinity, so Theorem 1.12
classifies only infinite-dimensional UHF algebras; the docstring of `glimm_classification` could say that
the finite case (a divisibility chain with finite supremum is eventually constant, so `A = M_N`) is
trivial.

## R04 (P3) — Three supplier citations resolve to a neighbouring section or a different name

- `README.md` lines 384 and 445 (§2.2, §2.5): "OperatorKTheory K3 (continuity of K₀)". At the head of
  pull request 866, continuity of `K₀` and `K₁` under C*-inductive limits with noninjective maps is in
  K2 (`TauCetiRoadmap/OperatorKTheory/README.md` line 172, inside "## K2. Unitaries, K₁, and functorial
  properties", lines 152–235); K3 (line 236) is Bott periodicity. The supplier-contract range "K1–K3"
  (line 152) is right; the two per-target lines should say K2.
- `README.md` lines 907–908 (§5.4): "CStarAlgebras C3–C4 (operator systems, Arveson extension, CP
  dilations)". CStarAlgebras at its head (`README.md` lines 44–46) states that Arveson extension is owned
  by VonNeumannAlgebras V13a (the hyperfiniteness layer, `rev/889` line 3525) and consumed there; C3–C4
  own operator spaces, dilations and CB maps. Cite VonNeumannAlgebras for the extension theorem.
- `README.md` line 829 (§5.1): "Mathlib `Filter.Ultrafilter`". At the pin the structure is `Ultrafilter`
  in the root namespace (`Mathlib/Order/Filter/Ultrafilter/Defs.lean` line 41); `Filter.Ultrafilter`
  names nothing.

## R05 (P3) — A Check's group contradicts the section's own normalization

Location: `README.md` lines 651–653: "`M₃(CAR)≇CAR` … the latter two are stably isomorphic since
`3ℤ[1/2]` and `ℤ[1/2]` differ by the rational factor 3".

Claim: with the formula of line 623, `Q_ν = {a/b : ofNat(b) ≤ ν}`, the invariant `ofNat 3·2^∞` gives
`Q = {a/(3·2^k)} = (1/3)ℤ[1/2]`, not `3ℤ[1/2]` (which does not contain 1, the class of the unit under
the stated normalization). The conclusion (the two groups differ by a positive rational factor, hence
stable isomorphism) is unaffected.

Repair: write `(1/3)ℤ[1/2]`, or say "`ℤ[1/2]` with unit class 3" if the Morita-normalized coordinates are
meant.

## Verified sound

**Principles.** No route-specific shortcut: nonunital AF algebras and the zero algebra are included
(`IsAF`, README line 78), dimension groups are arbitrary countable ones, the Kirchberg–Phillips theorem is
stated without the UCT except in its UCT form, the exact (not merely nuclear) embedding theorem is kept
(lines 959–960). No re-planning of an existing roadmap: `roadmaps grep` over main and the 432 open heads
for "dimension group", "Effros–Handelman", "Glimm", "UHF", "purely infinite", "Kirchberg–Phillips",
"Riesz interpolation", "Bratteli", "approximately unitarily equivalent", "Cuntz subequivalen", "exact
embedding" finds no other roadmap that states any of them (the hits are the suppliers citing this roadmap:
CStarAlgebras line 66 "classification by dimension groups or K-theory has separate ownership",
OperatorKTheory line 141 "Dimension-group classification of AF algebras belongs to CStarClassification",
line 1042, lines 1140–1145; OperatorAlgebraDynamics main line 447; TemperleyLiebOperatorAlgebras at
pull request 867 lines 84, 242, 524–529, 557 consuming CL2 2.1–2.2 and `IsAF`). No copied passage: the
sentences around each of the 30 locators read below are in the author's words. No algorithm. No sorry'd
data, no `set_option`, single `import Mathlib` plus `TauCeti.NumberTheory.Supernatural` (exists at the
pin, built), `theorem` only, one module docstring, no `example`, no `#eval`. No edit outside the folder.
Ownership against open pull requests whose files this brief does not list was checked only through
`roadmaps grep` over all 432 heads.

**Supplier citations resolved** (every `*Needs:*` line and contract, at the heads this brief names).
CStarAlgebras (#860): C1 (line 85), C2 (263), C3 (459), C4 (497), C5 (546; bounded products, c₀ sums,
inductive limits with noninjective maps, lines 602–607), C6 (637), C7 (730; Choi–Effros lines 752–759),
C8 (792), C9 (833; Voiculescu homotopy invariance and `CA` quasidiagonal, 842–845; Dadarlat, 848;
matrix-unit stability with unitary conjugacy by a unitary close to 1, 850–862, "CStarClassification uses
these norm perturbation lemmas", 862–864; approximate intertwining, 865–870; AF subquotient theorem
892–902). HilbertModules (#861): H1–H4 (lines 123, 176, 259, 322); the H3 type-I definition (line 318:
"type I means every irreducible image contains K(H)"). OperatorKTheory (#866): K1 cone and scale
(128–131, order unit `[1_A]`); K2 continuity (172–177); K5 countable additivity "used by
CStarClassification CL8" (543–550); K7 `E_n`, `O_n`, `O_∞`, `K₀(O_n)=ℤ/(n−1)`, `[1]↦1` (1018–1041); K8
bootstrap class, UCT condition, lifting of K-isomorphisms, `ℂ→O_∞` KK-equivalence (1073–1146); K9
asymptotic morphisms, homotopy into `C([0,1],B)`, reparameterization (1204–1235). OperatorAlgebraDynamics
(main): D1 (75), D2 coefficient-tensor identification and `G=ℤ` generator formulas "used by
CStarClassification CL5" (194–200), D3 (205), D4 (254), D6 owns `O_n` (457), D8 CAR with `CAR(ℂⁿ)≃M_{2ⁿ}`
and the inductive limit (554–566). VonNeumannAlgebras (#889 Layer 0 line 243, Layer 3 line 831; #1041 V0
line 37, V3 line 190): faithful direct-sum representation (#889 lines 265–266), matrix units from
orthogonal equivalent projections (836), inclusion matrices and `M₂⊕ℂ⊂M₅⊕M₃` (861–863).
AlgebraicTopology (main): Stage 6.0 lim/lim¹ with "CStarClassification CL8 consumes lim¹" (961–992).
Tau Ceti: `Supernatural := Nat.Primes → ℕ∞` (line 67), `CompleteLattice` (89), `iSup_apply` (139),
`one_eq_bot` (151), `ofNat` (299), `ofNat_one` (307), `ofNat_mul` (314), `ofNat_le_ofNat_iff` (346),
`ofNat_gcd` (371), `ofNat_lcm` (385). Mathlib at the pin: `CStarMatrix` (`Analysis/CStarAlgebra/CStarMatrix.lean`
44), `NonUnitalStarSubalgebra` (`Algebra/Star/NonUnitalSubalgebra.lean` 101), `StarSubalgebra`
(`Algebra/Star/Subalgebra.lean` 26), `IsStarProjection` (`Algebra/Star/StarProjection.lean` 26),
`StarAlgEquiv.toNonUnitalStarAlgHom` (`Algebra/Star/StarAlgHom.lean` 896),
`CStarAlgebra.toNonUnitalCStarAlgebra` (`Analysis/CStarAlgebra/Classes.lean` 44), `IsOrderedAddMonoid`
(`Algebra/Order/Monoid/Defs.lean` 27), `AntisymmRel` (`Order/Antisymmetrization.lean` 39),
`Module.DirectLimit` (`Algebra/Colimit/Module.lean` 58). Mathlib has no dimension group, Riesz
interpolation, unperforation, UHF, Cuntz, nuclear, purely infinite, hereditary C*-subalgebra or C*-K-theory
file (grep of the pin: 0 files each; the three "hereditary" hits are unrelated), so the module docstring's
"not statable" list is right. Merge order: `VonNeumannAlgebras` (line 4) and `HilbertModules` (10) precede
`CStarClassification` (213); `TemperleyLiebOperatorAlgebras` (228) follows it; CStarAlgebras and
OperatorKTheory are new-folder pull requests of the same author, allowed suppliers.

**Sources read at their locators** (the seeded sample and every other locator of the sampled sections;
`rordam02` and `blackadar98` under *Not verifiable*). `kp00` (arXiv funct-an/9712002v1): Prop 0.4 line
122 (operator-system form; the README's map-pair form follows with `E=φ₁(A)`, `S=φ₂∘φ₁⁻¹` nuclear since
`B₂` is), Def 0.5 line 130 (sequence of unitaries in unital `B`, `A` separable: §1.1), Lemma 0.6 line 135
(§1.5 and the docstring of `elliott_intertwining`), Prop 0.7 line 139 (§5.3), Lemma 1.4 line 262, Lemma 1.6
line 346, Prop 1.7 line 367, Lemma 1.10 line 445 (§5.4, exactness used through the nuclear embedding, line
450), Lemma 1.12 line 502 (§5.2, §5.5), Lemma 1.14 line 621, Thm 1.15 line 639 (§5.5), Lemma 2.2 line 660
(§5.6), Cor 2.3 line 723 (§5.6), Lemma 2.4 line 737 (§5.7: the source's hypothesis is an approximately
injective ideal, of which the README's nuclear ideal is a special case), Lemma 2.6 line 788 and Lemma 2.7
line 823 (§5.7 crossed-product lift, `vₙ⊗1`), Thm 2.8 line 832 with `B₀=(C₀(ℝ)⊗A)†` line 834 (§5.8).
`gw01` (arXiv math/0011083v1): Thm 3.3 line 356 (direct limits of simplicial groups are exactly the
dimension groups; the README's sequential countable form is the cited EHS Theorem 2.2) and the Triangle
Lemma lines 359–362 (`f=g∘φ`, `ker f=ker φ`; the README's single-element form is its special case).
`phillips00` (Doc. Math. 5, EMS open access): abstract lines 22–25 (asymptotic unitary equivalence with
unitaries in `B⁺`: §7.2), Def 1.2.1 line 294 (tail projection), Def 1.2.5 line 344 (fullness), Thm 2.1.3
line 643, Lemmas 2.1.7–2.1.8 lines 681, 734, Prop 2.1.11 line 800 (§6.3 homotopy of unital maps from
`O∞`), Thm 2.3.7 line 1382 (`D₀` unital only; the README's "nonzero separable" is narrower), Cor 2.3.10
line 1623, Thm 4.1.1 line 2090, Thm 4.1.3 line 2202 (with the Kasparov-product clause, line 2212), Thm
4.2.1 line 2270, Cor 4.2.2 line 2451 (`[1_A]×η=[1_B]`), Thm 4.2.4 line 2473 ("both unital or both
nonunital"). `glimm60` (AMS, publisher-open): Def 1.1 lines 48–57, Def 1.3 lines 79–82 (the supernatural
invariant `sup{n : xⁿ | pᵢ}`: `supernaturalOfSizes`), Lemma 1.11 line 242 (approximate `n×n` matrix units
in a type `I_q` factor force `n | q`: the `M_{2^∞}` versus `M_{3^∞}` Check), Thm 1.12 line 252, Thm 1.13
lines 264–271 (second statement: the invariant as a supremum over matrix subalgebras, as the docstring of
`uhf_unital_embedding_iff` says). `bratteli72` (AMS, publisher-open): 1.8 line 188 (diagrams), Thm 2.2
lines 327–334 (unital, separable plus local approximation, and the nested sequence containing a given
finite-dimensional subalgebra: §2.1), Lemma 3.1 line 556, Thm 3.3 line 634.

**Elaborated signatures versus the README** (scratch `#check` scaffold). `ApproximatelyUnitarilyEquivalent :
{A B} → [NonUnitalCStarAlgebra A] → [CStarAlgebra B] → (A →⋆ₙₐ[ℂ] B) → (A →⋆ₙₐ[ℂ] B) → Prop` (README 206–207,
unitaries in `B`). `elliott_intertwining` carries `[CStarAlgebra A] [CStarAlgebra B]` and both
`SeparableSpace` instances (README 317–321). `IsAF : (A) → [NonUnitalCStarAlgebra A] → Prop`,
`isAF_iff_local_approximation` carries `[SeparableSpace A]` (README 353–357). `HasRieszInterpolation`,
`IsUnperforated`, `IsDimensionGroup : (G) → [AddCommGroup G] → [PartialOrder G] → [IsOrderedAddMonoid G] → Prop`
(README 506–509). `effros_handelman_shen` carries `[IsOrderedAddMonoid G]` and no countability hypothesis
(README 540–542). `SimplicialPresentation : (G) → [AddCommGroup G] → [PartialOrder G] → Type` (no
`IsOrderedAddMonoid`: the structure is pure data and is consumed only under that instance, so this is
not a defect). `UHFPresentation : (A) → [CStarAlgebra A] → Type`, `supernaturalOfSizes : (ℕ → ℕ+) →
Supernatural`, and the three Glimm statements as in README 625–628. `bondIter` has type `(Fin (rank n) → ℤ)
→+ (Fin (rank (n + k)) → ℤ)` and composes `bond (n+k)` after `bondIter n k`.

**Adversarial table.** One row per statement; values on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `elliott_intertwining` unital forcing (README 330–331) | `ψφ ≈ id_A` | `‖u ψφ(1) u* − 1‖ < 1` forces the projection `ψφ(1) = 1`; then `φ(ψ(1)) = φ(ψ(1))φ(1) ≤ φ(1)` and `φψ(1) = 1` give `φ(1) = 1` | both maps unital | none |
| `elliott_intertwining`, one-sided control (327–329) | `A=ℂ`, `B=ℂ²`, `φ(z)=(z,z)`, `ψ(z,w)=z` | `ψφ = id`; `φψ(z,w)=(z,z)`, unitaries of `ℂ²` diagonal, `‖u(z,z)u*−(z,w)‖ = |z−w|` | hypothesis needed | none |
| `elliott_intertwining`, degenerate | `A = B = 0`; `A = 0`, `B = ℂ` | first: `θ = id`, hypotheses vacuous; second: `φψ = 0`, `‖u·0·u* − 1‖ = 1 ≥ ε` | consistent | none |
| `IsAF` / `isAF_iff_local_approximation` | `A = 0`; `C[0,1]`; `ℓ∞(ℕ)`; `K` | `0`: `S = ⊥`; `C[0,1]`: finite-dim subalgebras `0`, `ℂ1`, `inf_c ‖x − c‖ = 1/2`; `ℓ∞`: step functions dense locally, nonseparable; `K`: stages `M_n`, union finite-rank, no stage has 1 | separability needed; nonunital clause needed | none |
| Nonunital reduction `A` AF iff `A⁺` AF (357–358) | `a ∈ A`, `f_n ∈ F_n ⊂ A⁺` | write `f_n = b_n + λ_n 1`; `|λ_n| = |π(f_n) − π(a)| ≤ ‖f_n − a‖ → 0`, so `b_n ∈ A ∩ F_n` approximates `a` | reduction works | none |
| `HasRieszInterpolation` on `ℤ²`, strict-quadrant cone (520–523) | `a₁=(0,0)`, `a₂=(1,−1)`, `b₁=(2,1)`, `b₂=(3,1)` | hypotheses: `(2,1),(3,1),(1,2),(2,2)` in cone; from `a₂≤c≤b₁`: `c ∈ {(1,−1),(2,1)}`; from `a₂≤c≤b₂`: `c ∈ {(1,−1),(2,0),(3,1)}`; intersection `(1,−1)`, which fails `a₁ ≤ c` | no interpolant; Check's reasoning incomplete but conclusion right | none |
| `ℤ` with cone `{0}∪{n≥2}` (524–526) | `a=(0,1)`, `b=(3,4)` | `2·1 ≥ 0`, `1 ≱ 0`; interpolant `c ≥ 3` from `1 ≤ c`, `c ≤ 3` from `3−c ∈ cone`, then `4−3 = 1 ∉ cone` | perforated, no interpolation, directed via `max+2` | none |
| `IsUnperforated` torsion-freeness (527–529) | `n•g = 0`, `n ≥ 1`; `ℤ/2` trivial cone | `g ≥ 0` and `−g ≥ 0` give `g = 0`; `2•1 = 0 ≥ 0`, `1 ≱ 0` | holds; `ℤ/2` perforated | none |
| `ℚ⊕ℤ`, cone `{(r,n): r>0}∪{0}` (530–532, 609–613) | strict and equality cases; `u=(1,0)` | `c=(t,0)` with `max rᵢ < t < min sⱼ`; `(1,0)−(1/2,1) = (1/2,−1) ≥ 0`; `(r,±1) ≥ 0` for all `r>0` forces `s(0,1)=0`; `(0,1)` infinitesimal since `(1,∓n) ≥ 0` | simple dimension group with infinitesimal, unique state | none |
| `effros_handelman_shen`, `⇐` interpolation | `aᵢ ≤ bⱼ` in `G` | lift to stage `n`: `bⱼ − aᵢ = β(z_{ij})`, `z_{ij} ≥ 0`; `eventually_zero` pushes `yⱼ − xᵢ − z_{ij}` to 0, so `xᵢ' ≤ yⱼ'` in `ℤ^r`; `c = max(x₁',x₂')` interpolates, `β` monotone | dimension group | none |
| `effros_handelman_shen`, `⇐` unperforation and countability | `n g ≥ 0` | `n g = β(y)`, `y ≥ 0`, `g = β(x)`; `n x' = y' ≥ 0` in `ℤ^r` gives `x' ≥ 0`; `G = ⋃ β_n(ℤ^{r_n})` countable | holds; `Countable` on the right is forced, as the docstring says | none |
| `effros_handelman_shen`, degenerate | `G = 0`; `G = ℝ`; `ℤ` with trivial order | `0`: ranks 0, all fields hold; `ℝ`: uncountable, no presentation, and `Countable ℝ` false; trivial order on `ℤ`: not directed, and monotone `β` from `ℤ^r` with trivial target order is 0, cannot exhaust | both sides agree | none |
| `SimplicialPresentation` of `ℚ` (554–555) | rank 1, `bond_n = ×(n+1)`, `β_n(x) = x/n!` | `β_{n+1}((n+1)x) = x/n!`; image `⋃ (1/n!)ℤ = ℚ`; positives `ℚ≥0`; kernel 0 | presentation | none |
| No presentation of `ℤ`, cone `{0}∪{n≥2}` (557–559) | `1 = β_n(x)`, `2 = β_m(y)`, `y ≥ 0` | `2x' = y' ≥ 0` in `ℤ^r` forces `x' ≥ 0`, so `1 = β(x') ≥ 0`, but `1 ∉ cone` | consistent with `⇒` direction | none |
| Factorization Check (560–563) | `f(a,b)=2a+3b`, `x=(3,−2)` | `α(x)=0` gives `3α(e₁)=2α(e₂)`, so `α(e₁)=2w`, `α(e₂)=3w`, `w ≥ 0`; `β(2w)=2`, `β(3w)=3` give `β(w)=1 ∉ cone` | hypothesis necessary | none |
| Scale (567–568, 580–583) | `ℤ`: `{0,1,2}`, `{0,1,3}`, `ℕ`, `{0}`; `ℤ²`: `[0,(1,0)]∪[0,(0,1)]` | `{0,1,3}` misses `2 ≤ 3`; `{0}` generates only `G⁺ = 0`; the union of intervals has no upper bound for `(1,0),(0,1)` | discriminating | none |
| Domination form (568–570) | `g ≤ s₁+s₂` | Riesz decomposition `g = g₁+g₂`, `0 ≤ gᵢ ≤ sᵢ`, hereditary gives `gᵢ ∈ Σ` | equivalent under interpolation | none |
| `K⁺` invariant (603–606) | `[e]=(1,0)`, `[1]=(0,1)` | `[1−e] = (−1,1)`; cone `{(a,b): b>0} ∪ {(a,0): a≥0}` (remove or add finite rank inside a rank-`b` scalar part); order ideals `0`, `ℤ⊕0`, `ℤ²`; `0 ≤ (−1,1) ≤ (0,1)` with `(0,1)−(−1,1) = (1,0) ≥ 0` | matches ideals `0`, `K`, `K⁺` | none |
| `Q_ν` formula (623) | `ν = 2^∞`, `⊤`, `ofNat 6`, `3·2^∞` | `ℤ[1/2]`, `ℚ`, `(1/6)ℤ` (`1/2 = 3/6`, `1/3 = 2/6`); `{a/(3·2^k)} = (1/3)ℤ[1/2]`; subgroup since `ofNat(lcm) = ofNat b₁ ⊔ ofNat b₂ ≤ ν` | formula right; Check at 652 writes `3ℤ[1/2]` | R05 |
| `glimm_classification`, finite case | chain `d_n | d_{n+1}` with `⨆ = ofNat N` | chain of divisors of `N` is eventually constant `= N`; stage `= M_N` closed, dense, so `A = M_N`; `M_N ≅ M_M` iff `N = M` | holds; Glimm's Def 1.1 excludes it | R03 note |
| `glimm_classification`, presentation independence | unital `M_d ⊂ A` | `M_d` conjugates into some stage `M_{d_n}` by §1.3, so `d | d_n` and `ofNat d ≤ ⨆`; invariant `= sup` over unital matrix subalgebras (Glimm 1.13) | intrinsic, so isomorphism-invariant | none |
| `uhf_unital_embedding_iff` | `A = CAR`, `B = M₂`; `A = M₂`, `B = M₆`, `B = M₃`; `A = ℂ` | `2^∞ ≰ ofNat 2` (exponent `⊤` vs 1) and no injective map from an infinite-dimensional simple algebra; `ofNat 2 ≤ ofNat 6`, `≰ ofNat 3` by `ofNat_le_ofNat_iff`; `⊥ ≤ ν` and `ℂ → B` unital | both directions | none |
| `uhf_unital_embedding_iff`, `⇐` | `ofNat d_n ≤ ⨆_m ofNat e_m` | `d_n` has finitely many primes, exponents of a divisibility chain increase, so some `m` has `d_n | e_m`; unital `M_{d_n}→M_{e_m}` all unitarily equivalent, so compatible choices exist | map exists | none |
| `exists_uhf` | `ν = ⊥`; `ν = ⊤`; `ν = 2^∞` | `d_n = 1`, `A = ℂ`, `ofNat 1 = ⊥`; `d_n = n!`, `sup_n v_p(n!) = ∞` for every `p`; `d_n = 2^n` | every `ν` realized, in `Type` | none |
| UHF Checks (640–653) | `ofNat 2·ofNat 3 = ofNat 6`; `ofNat 2·2^∞ = 2^∞`; `ofNat 3·2^∞ ≠ 2^∞` | `ofNat_mul`; exponent at 2: `1+⊤ = ⊤`; exponent at 3: `1 ≠ 0` | `M₂(CAR) ≅ CAR`, `M₃(CAR) ≇ CAR` | none |
| Multiplicity matrices (249–253) | `M₂⊕ℂ→M₅⊕M₃`, `((2,1),(1,1))`, `((2,1),(2,0))` | `2·2+1·1 = 5`, `1·2+1·1 = 3`; `2·2+0 = 4 > 3`; composition `(2)(2) = (4)` | first unital, second impossible | none |
| §1.3 Check 2 (272–275) | `q_n` at angle `1/n` to `diag(1,0)` | `‖q_n − p‖ = sin(1/n) → 0`, `[q_n] = [p]`, `[p][q_n] = [p] ≠ 0` | not orthogonal | R02 |
| Cancellation and lifting (297–304) | `B = M₂`, `1 ↦ 1`, `1 ↦ 3`; `B = O₂` | `Σ(M₂) = {0,1,2}`, `3 ∉ Σ`; `1⊕1 ∼ 1 = 1⊕0` in `M₂(O₂)` while `1 ≁ 0`; `x⊗1`, `1⊗x` conjugate by the flip | lifting needs cancellation | none |
| Injectivity criterion (474–475, 485–487) | `ℂ⊕ℂ→ℂ`; `ℂ→M₂` | `K₀`-map `(a,b)↦a` kills `(0,1) ∈ Σ`; `1 ↦ 1 ≠ 0` | iff holds (nonzero AF ideal has a nonzero projection) | none |
| Scaled invariants (481–484) | `M₂`, `M₃`; `ℂ⊕ℂ`, `M₂` | `(ℤ,ℕ,{0,1,2})` vs `(ℤ,ℕ,{0,1,2,3})`; `ℤ²` vs `ℤ` | stably isomorphic / not | none |
| Mapping cone K-theory (1347–1348, 1354–1357) | `f: X→Y`, `X=Y=C₀(ℝ)⊗K`, degree `n`; `f = 0` | `K₁(X)→K₁(Y)` is `×n`; sequence `K₁(X)→K₁(Y)→K₀(C_f)→K₀(X)=0` gives `K₀(C_f) = ℤ/n`; `K₀(Y)=0→K₁(C_f)→K₁(X)→K₁(Y)` gives `K₁(C_f) = ker(×n) = 0`; `C_0 = SY`, `K₀ = ℤ` | correct | none |
| Milnor sequence example (1422–1428) | `O∞→M₂(O∞)→…`, `x↦diag(x,x)` | `K₀`-map `×2`, dual on `Hom(ℤ,ℤ)=ℤ` is `×2`; `lim = 0`, `lim¹ = ℤ̂₂/ℤ = Ext(ℤ[1/2],ℤ)`; `Hom(ℤ[1/2],ℤ) = 0` | matches UCT | none |
| `M_k(O_n)` classification (1455–1457, 1464–1468) | `n=2,3,4`; `O₃⊗O₄` | units of `ℤ/(n−1)` act by multiplication, orbit of `k` determined by `gcd(k,n−1)`; `gcd(2,3)=1`, `gcd(3,3)=3`; `ℤ/2⊗ℤ/3 = 0 = Tor(ℤ/2,ℤ/3)` | correct; `O₃⊗O₄ ≅ O₂` | none |
| Toeplitz unit (708–711) | `K₀(T)` | `[1] ↦ 1` under the character `T→ℂ`, so cone `⊆ ℕ`, and `ℕ ⊆` cone; two copies of 1 leave class `−1` | infinite, not properly infinite | none |
| `O₃` projections (777–778, 802–803) | `s₁s₁*`, `s₁s₁*+s₂s₂*` | `[s₁s₁*] = [1]` (`s₁*s₁ = 1`); `[s₁s₁*+s₂s₂*] = 2[1] = 0 ≠ 1` in `ℤ/2`; class 0, full, properly infinite gives unital `O₂ → pO₃p` | correct | none |
| §5.3 Check (881–882) | `u = s₁s₂*+s₂s₁*` | `u*u = 1`, `u s₁ = s₂`, `u s₁ u* = s₂ u ≠ s₂` (cut down by `s₂`: `s₂s₁` vs `0`); any implementing `w` is gauge-covariant, degree `k ≠ 0` impossible, degree 0 contradicts outerness of `⊗Ad(σ)` on `M_{2^∞}` (`x = 1⊗diag(1,−1)⊗1`, `‖wxw*−x‖ < 4ε` vs `2`) | approximately, not exactly, equivalent | R01 |
| `vγ(v*) ≈ u` (871–872, 885–886) | `u = 1`; `u = −1` | `v = 1`; `K₁(O₂) = 0` so `−1 ∈ U₀`, Phillips Thm 2.1.3 with `m=2`: `(m−1)K₁ = K₁` | consistent | none |
| `O₂ → M₂` (883–884) | isometries of `M₂` | an isometry of `M₂` is unitary, so `s₁s₁*+s₂s₂* = 2 ≠ 1` | no unital map | none |
| `ℂ² → O₂` uniqueness (938–941) | `(1,0) ↦ p, q` | `[p]=[q]=0`, `1−p ≠ 0 ≠ 1−q` (injective), `p ∼ q`, `1−p ∼ 1−q`, `u = v+w` unitary | unitarily equivalent | none |
| Lifting lemma `D ≠ 0` (976–980, 994–996) | `D=0`, `E=J=ℂ` | `E/J = 0`, zero map unital; no linear `0→ℂ` with `0 ↦ 1` | hypothesis needed | none |
| Factorization lemma without exactness (895–900, 914–916) | `A = B₁` nonexact, `φ₁ = id` | `η_n = φ₂` u.c.p., `η_nφ₁ = φ₂` exactly; general case: `S = φ₂∘φ₁⁻¹` on `φ₁(A)` nuclear as `B₂` is, `kp00` Prop 0.4 | exactness unused | none |
| Dilation in `O₂` (921–922) | `x ↦ x₁₁1`, `π(x) = Σ xᵢⱼ sᵢsⱼ*`, `t = s₁` | `s₁*π(x)s₁ = Σ xᵢⱼ s₁*sᵢsⱼ*s₁ = x₁₁` | correct | none |
| Bilateral shift path (1013–1014, 1030–1032) | `S` on `ℓ²(ℤ)` | `σ(S) = 𝕋`, Borel logarithm `h` bounded by `π`, `t ↦ exp(ith)` norm-continuous from 1 to `S` | bundle trivial | none |
| Spectrum of `s₁s₂*+s₂s₁*` (1033) | `u² = 1`, `u ≠ ±1` | spectrum `{±1}` | not full circle | none |
| `C*_r(F₂)⊗O₂` (1061–1063) | slice map | `C*_r(F₂)⊗1` is the range of `id⊗ω`, nuclearity passes to it | not nuclear, not `O₂` | none |
| Central sequences (1082–1087) | `D = M₂`, `A = ℂ`, `O₃`, `CAR`; `D = ℂ²` | `M(ℂ)_ω = ℂ` has no unital `M₂`; `gcd(2,2) ≠ gcd(1,2)`; tail factors of `⊗M₂`; `(1,0)⊗1` and `1⊗(1,0)` have central supports `(1,0)⊗1 ≠ 1⊗(1,0)` | correct | none |
| Finite-set criterion (1122–1125) | `A = O∞` generators; `A = M_n` | `s₁*s_{n+1} = 0 ≠ s_{n+1}s₁*`; isometries of `M_n` are unitary, ranges not orthogonal | correct | none |
| `KK(O∞,ℂ)` (1140–1142) | UCT, free `K_*` | `Hom(ℤ,ℤ) = ℤ`; no unital `O∞ → ℂ` (two isometries of `ℂ` are 1) | inverse not a homomorphism | none |
| Zero element of §7.3 (1238–1242) | `e⊗(1−s₁s₁*)` | class `[1]−[s₁s₁*] = 0`; dominates `e⊗s₂s₂* ≠ 0`; corner properly infinite, full, class 0, so unital `O₂` inside | correct | none |
| `KK(O∞,O∞)`, `KK(O₃,O₃)` (1258–1265, 1375–1376) | UCT | `ℤ ⊕ Ext(ℤ,ℤ) = ℤ`; `ℤ/2 ⊕ Ext(ℤ/2,ℤ/2) = ℤ/2 ⊕ ℤ/2`, order `4 = (3−1)²`; `Aut(ℤ/2) = 1` so every invertible class fixes `[1]`; `−1` on `ℤ` sends `1 ↦ −1 ≠ 1` | correct | none |
| Point-norm versus KK (1280–1283) | `f = z`, rotation by `θ` | `‖z̄ − e^{iθ}z‖_∞ = sup|1 − e^{iθ}z²| = 2` | distance 2 | none |
| §8.5 Check (1395–1397) | `A = ℂ` | `I = K`, `E = K + O₂`, `K ∩ O₂ = 0` (`K` nonunital), `[1_E] = [1_{O₂}] = 0`; `KK(φ) = 1 + 0`; limit has `(ℤ,0,0) = pO∞p` | correct | none |
| Range Checks (1442–1448) | `(ℤ,0,0)`, `(ℤ,1,ℤ)`, `(ℚ,1,ℚ/ℤ)` | `pO∞p` with `[p]=0 ≠ 1 = [1_{O∞}]`; `O∞⊗C(S¹)` has the invariant but is not simple; countable groups only | correct | none |
| Automorphisms (1334–1339) | `O₂⊗K`, `O∞⊗K`, `O∞` | `KK = 0`; `ℤˣ = {±1}`, flip exists by Thm 4.2.1; `{η : η(1) = 1} = {1}` | correct; kernel locator | R03 |

**Headline theorems.** From the README summary (lines 13–16): Elliott's AF classification with the
scaled range theorem, Glimm's classification, the exact embedding theorem, `A⊗O₂ ≅ O₂` and `A ≅ A⊗O∞`,
Phillips's homomorphism theorem, Kirchberg–Phillips classification with its UCT form. Statable at the pins:
Glimm's classification (stated, three forms). Not statable, named in the docstring with the missing
carrier: all the others (no `K₀`, no minimal tensor product, no nuclearity or exactness predicate, no
`O₂`, no `KK`). Also stated as milestones: Elliott's intertwining, Bratteli's local characterization,
Effros–Handelman–Shen. No statable headline is absent and none is forced through a stand-in. Padding
probe: none of the six sorried theorems closes with one tactic; none restates a definition, mirrors a
Check or computes a value.

## Not verifiable

- Rørdam, *Classification of Nuclear C*-Algebras* (Part I of Rørdam–Størmer, EMS 126, Springer 2002):
  Definitions 1.1.15, 1.4.1, Theorems 1.3.3, 1.4.4, Propositions 1.3.4, 1.4.5, §2.3, §§4.1–4.2, Chapters
  5–7, §§8.2–8.4. The sources service resolves the citation only to a paywalled publisher page
  (`rordam02: uncertified`). Cited by locator; the mathematics attributed to these locators was checked
  independently in the table where it could be computed.
- Blackadar, *K-Theory for Operator Algebras*, 2nd ed. (MSRI 5): Theorems 7.3.2, 7.4.1, §§21.3, 21.5,
  Theorem 21.5.2. The MSRI online edition host (`library.msri.org/books/Book5`) timed out twice through
  the service and the SLMath mirror path returns 404; recorded in `needs-references.toml`.
- Effros–Handelman–Shen, *Dimension groups and their affine representations* (Amer. J. Math. 102, 1980),
  Theorem 2.2: cited only through Goodearl–Wehrung; not fetched (JSTOR).

## Source issues

- **Misprint** in kp00 at Lemma 2.4, page 15: the source asks only for an injective homomorphism into the
  quotient but concludes with a unital completely positive lift; it should ask for a unital injective
  homomorphism, as its proof's reduction to the identity map assumes; affects nothing.
