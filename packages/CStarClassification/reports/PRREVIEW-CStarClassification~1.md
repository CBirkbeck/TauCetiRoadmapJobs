# Review of CStarClassification (pull request #863 at a8c334e)

**Verdict:** needs changes

Gate at this head: every check passed (`depcheck=0 build=0`). Dependency check run by this review:
`depcheck: 200 roadmaps, 1308 edges, 0 problem(s)` (no UPWARD or CYCLE line; see R02 for why this
check currently sees no edges of this roadmap). Elaboration of `TauCetiRoadmap/CStarClassification/Suggested.lean`
with one `#check @name` per declaration: four `sorry` warnings, nothing else; the elaborated types are
compared with the README under R04.

## R01 (P2) — Glimm's UHF classification is statable at the pins but absent from `Suggested.lean`

Location: `TauCetiRoadmap/CStarClassification/Suggested.lean` lines 118–124 (`supernaturalOfSizes`) and
`README.md` lines 254–265 ("Construct a UHF algebra for every supernatural number and prove Glimm's
classification … unital embedding exists exactly when ν≤μ").

Claim: the file defines the UHF invariant `supernaturalOfSizes` "to make a headline statable", but no
statement uses it; the headline it serves (Glimm's theorem) is statable with the pinned Mathlib and
Tau Ceti and is not stated. Nothing in the file is a headline theorem of the roadmap.

Witness: a scratch probe elaborated (only `sorry` warnings) with these carriers: a structure
`UHFPresentation A` over `[CStarAlgebra A]` with fields `size : ℕ → ℕ+`, `stage : ℕ → StarSubalgebra ℂ A`,
`Monotone stage`, `∀ n, Nonempty (stage n ≃⋆ₐ[ℂ] Matrix (Fin (size n)) (Fin (size n)) ℂ)` and
`Dense (⋃ n, (stage n : Set A))`; then

```lean
theorem glimm_classification {A B : Type*} [CStarAlgebra A] [CStarAlgebra B]
    (PA : UHFPresentation A) (PB : UHFPresentation B) :
    Nonempty (A ≃⋆ₐ[ℂ] B) ↔ supernaturalOfSizes PA.size = supernaturalOfSizes PB.size
theorem uhf_unital_embedding_iff … :
    Nonempty (A →⋆ₐ[ℂ] B) ↔ supernaturalOfSizes PA.size ≤ supernaturalOfSizes PB.size
theorem exists_uhf (ν : TauCeti.Supernatural) :
    ∃ (A : Type) (_ : CStarAlgebra A) (P : UHFPresentation A), supernaturalOfSizes P.size = ν
```

All three elaborate against the pins (`StarAlgEquiv`, `StarSubalgebra`, `TauCeti.Supernatural.ofNat`
and the `CompleteLattice` instance on `TauCeti.Supernatural` exist at the pinned revisions). The
statements are true as written: a unital `*`-homomorphism out of a UHF algebra is injective (simple
domain), and `ofNat_le_ofNat_iff` at the pin gives `ofNat m ≤ ofNat n ↔ m ∣ n`, so the supremum
comparison is exactly divisibility of supernatural numbers. Negative control for the "iff": the
2^∞ and 3^∞ presentations have invariants `ofNat 2`-powers versus `ofNat 3`-powers, neither ≤ the
other, and indeed neither algebra embeds unitally in the other (a unital copy of `M_2` cannot sit in
a unital inductive limit of `M_{3^k}`).

Repair: add the presentation structure (a kept definition in the sense of the acceptance-test rules:
it bundles data that exists at the pins) and the three statements above, with docstrings citing
Glimm (Rørdam–Størmer §§1.2–1.3 or Blackadar §7); or, if the authors prefer a smaller file, delete
`supernaturalOfSizes`, which otherwise serves no stated theorem. The same remark applies, with a
longer encoding, to the countable Effros–Handelman–Shen theorem (CL3, README lines 213–215): it is
statable algebraically as the existence of a sequential simplicial system `(ℤ^{r_n}, ℕ^{r_n})` with
positive bonding maps and positive maps `β_n` into `G` whose images exhaust `G` and `G⁺` and whose
kernels are the eventual kernels of the system; `factor_positive_map_killing_relation` is one step of
its proof, not the theorem.

## R02 (P3) — README shape: no `*Needs:*` lines, no `**Checks.**`, no locators at claims

Location: `TauCetiRoadmap/CStarClassification/README.md`, whole file (sections `## CL1` … `## CL8`,
`## Sources and API alignment`).

Claim: the README has no per-target `*Needs:*` lines, no `**Checks.**` lists for any definition
(dimension group, scale, Cuntz subequivalence, infinite and properly infinite projections, fullness,
image-fullness, Cuntz sum, tail projection, sequence algebras, …), no locator at any claim (all
locators are collected once in the final section), no `### Examples`/`### Dependencies` per layer and
no `## Exact supplier contracts` section.

Witness: `grep -c 'Needs:\|Checks\.' README.md` gives 0. Consequence that matters: the dependency
check reads supplier edges from `*Needs:*` lines, so this roadmap contributes no edges (the gate's
`depcheck=0` and the review's `0 problem(s)` are vacuous for it), and the pull request's generated
merge-order block states "It depends on no other author's open pull request" although CL1–CL8
consume `CStarAlgebras` (#860) and `OperatorKTheory` (#866), neither of which is on main or in the
merge order. The direction is right (both are new-folder pull requests of the same author, and
`HilbertModules`, `VonNeumannAlgebras` precede this roadmap in the order), but it is unverifiable
by the tooling as written.

Repair: give each target paragraph a `*Needs:*` line naming its inputs (`CStarAlgebras C9`,
`OperatorKTheory K8`, `OperatorAlgebraDynamics D2`, `AlgebraicTopology Stage 6.0`, Mathlib
declarations, earlier CL layers), a `**Checks.**` list of at least three discriminating tests per
definition (several are already present in prose and only need to be moved: the `ℚ⊕ℤ` infinitesimal
example, the `D=0, E=J=ℂ` negative control, the `ℂ⊕ℂ→ℂ` image-full non-full control, the
`M_k(O_n)` gcd computation, `Σ(M_2)={0,1,2}`), the locator in parentheses at each claim (also
correct "Lemmas 2.2–2.7" of Kirchberg–Phillips: 2.3 is a Corollary, `kp00` line 723), and the
layer-end `### Examples`/`### Dependencies` subsections.

## R03 (P3) — README and Lean do not name each other; module docstring does not name the non-statable headlines

Location: `TauCetiRoadmap/CStarClassification/Suggested.lean` lines 8–13 and 18; `README.md` lines 65–66.

Claim: none of the 13 declared names (`HasRieszInterpolation`, `IsUnperforated`, `IsDimensionGroup`,
`IsScale`, `factor_positive_map_killing_relation`, `IsAF`, `isAF_iff_local_approximation`,
`ApproximatelyUnitarilyEquivalent`, `approximatelyUnitarilyEquivalent_iff_sequence`,
`AsymptoticallyUnitarilyEquivalent`, `CuntzSubequivalent`, `projection_cuntzSubequivalent_iff`,
`supernaturalOfSizes`) occurs in the README (`grep -c` gives 0 for each). The module docstring says
only that K-theory, tensor and KK targets "require the actual constructions in the cited roadmaps";
it does not say which headline theorems are not statable and what each lacks. The namespace is
`CStarClassification`, not `TauCetiRoadmap.CStarClassification` (the family's `HilbertModules` uses
the latter; `CStarAlgebras`, `OperatorKTheory` and `OperatorAlgebraDynamics` on main use bare names,
so this is a consistency note, not a rule the gate enforces).

Repair: in the README, attach each kept Lean name to its definition or theorem sentence (e.g. "Define
`IsDimensionGroup` …", "Prove `isAF_iff_local_approximation` …"); in the docstring list the
non-statable headlines with the missing carrier: Elliott's AF classification and the scaled range
theorem (no `K₀` of a C*-algebra at the pins), Kirchberg–Phillips classification and the KK
homomorphism theorem (no `KK`, no `O∞`, no nuclearity predicate), the exact embedding theorem (no `O₂`,
no exactness predicate), `A⊗O₂≅O₂` and `O∞` absorption (no minimal tensor product of C*-algebras).

## R04 (P3) — Dropped section binders in the definitions

Location: `TauCetiRoadmap/CStarClassification/Suggested.lean` lines 20–22, 100–107.

Claim: the elaborated types are
`CuntzSubequivalent : {A} → [NonUnitalCStarAlgebra A] → [PartialOrder A] → {a // 0 ≤ a} → {a // 0 ≤ a} → Prop`
(the section's `[StarOrderedRing A]` is gone) and
`IsDimensionGroup : {G} → [AddCommGroup G] → [PartialOrder G] → Prop` (likewise `IsScale`,
`IsUnperforated`; `[IsOrderedAddMonoid G]` is gone). So `CuntzSubequivalent` is defined for an
arbitrary partial order on `A`, whose "positive" subtype need not be the C*-positive cone, and
`IsDimensionGroup` accepts a partial order that is not translation invariant, whereas the README
(lines 56–58, 202–205, 272–279) defines both on partially ordered abelian groups and on the
C*-positive cone. The theorems that consume them (`projection_cuntzSubequivalent_iff`,
`factor_positive_map_killing_relation`) do carry the binders, so nothing stated is false; the
definitions are just wider than their README statements.

Witness: the `#check` output above; `IsStarProjection.nonneg` (Mathlib `Algebra/Order/Star/Basic.lean`
line 226) needs `StarOrderedRing`, which is why the theorem keeps it and the definition does not.

Repair: write the binders in the definitions' own signatures (`def CuntzSubequivalent [StarOrderedRing A] …`,
`def IsDimensionGroup [IsOrderedAddMonoid G] …`, likewise `IsScale`, `IsUnperforated`) or add an
`include` line; re-run the `#check` scaffold.

## R05 (P3) — Two sorried statements are API lemmas, not headline theorems

Location: `TauCetiRoadmap/CStarClassification/Suggested.lean` lines 86–91
(`approximatelyUnitarilyEquivalent_iff_sequence`) and 109–114 (`projection_cuntzSubequivalent_iff`).

Claim: the first mirrors the README API sentence at line 72–74 ("For separable A this is equivalent
to a sequence of such unitaries"), a routine diagonal argument; the second is a standard comparison
lemma (Cuntz subequivalence of projections equals Murray–von Neumann subequivalence). Neither is an
end theorem of the roadmap. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) closes
neither, so they are not padding in the mechanical sense; they are API, which the acceptance-test
rules keep in the README.

Repair: delete both from `Suggested.lean` (the README keeps them as targets); keep
`isAF_iff_local_approximation` (Bratteli's local characterization is a genuine milestone of CL2) and
`factor_positive_map_killing_relation` only if the EHS theorem itself is not added under R01.

## R06 (P3) — Unused exactness hypothesis in the approximate-factorization lemma

Location: `README.md` lines 378–383 ("if A is separable unital exact, φ₁:A→B₁ is a unital embedding,
φ₂:A→B₂ is unital, and B₁,B₂ are separable unital with B₂ nuclear, construct u.c.p. maps
η_n:B₁→B₂ such that η_nφ₁(a)→φ₂(a)").

Claim: exactness of `A` is not used. Since `B₂` is nuclear, `φ₂` is a nuclear u.c.p. map, so
`φ₂ ≈ ψ∘ρ` on any finite set with `ρ:A→M_k`, `ψ:M_k→B₂` u.c.p.; `ρ∘φ₁⁻¹` is u.c.p. on the operator
system `φ₁(A)⊆B₁` and extends to `B₁` by Arveson (`M_k` is injective); `η = ψ∘ρ̃` does the job.

Witness: Kirchberg–Phillips Proposition 0.4 (`kp00` lines 122–129) states and proves exactly this
with no exactness hypothesis. Exactness enters only in the uniform matrix-level version, Lemma 1.10
(`kp00` lines 445–449), which is the "ultraproduct representative version, retaining finite
matrix-level inverse bounds" of the next README sentence.

Repair: drop "exact" from the first statement and attach it to the matrix-level version, naming
Lemma 1.10 as its source.

## R07 (P3) — VonNeumannAlgebras labels `V0`, `V3` resolve on only one of its two open heads

Location: `README.md` lines 49–52.

Claim: the citation "VonNeumannAlgebras V0 and V3" matches the section labels of the
foundations pull request (#1041: `## V0. C*-algebra and state prerequisites`, `## V3. Type I and
finite-dimensional algebras`); the full roadmap pull request (#889) names the same material
`## Layer 0: C*-algebra and state prerequisites` and `## Layer 3: Type I and finite-dimensional
algebras` with no `V0`/`V3` labels. Both heads contain the cited content (faithful direct-sum
representation; matrix units from orthogonal equivalent projections and the type I_n classification).

Repair: cite by section title ("VonNeumannAlgebras, *C*-algebra and state prerequisites* and
*Type I and finite-dimensional algebras*") so the citation survives whichever head merges.

## Verified sound

**Principles.** No route-specific shortcut (statements are at the generality of the sources:
nonunital AF algebras, arbitrary countable dimension groups, Kirchberg algebras without a UCT
assumption except where stated); no re-planning of an existing roadmap (ownership checked below); no
copied passages (checked the sentences around every locator read); no algorithms; no sorry'd data; no
`set_option`; no edits outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CStarClassification'`
is empty).

**Ownership against open work.** `roadmaps grep` over main and the 432 open heads for "dimension
group", "AF algebra", "Cuntz", "UHF", "purely infinite", "Kirchberg", "Riesz interpolation",
"Bratteli", "supernatural", "unperforated", "approximately unitarily": no other roadmap states AF
classification, dimension groups, pure infiniteness, O₂ embedding or Kirchberg–Phillips. The
overlaps found are suppliers, cited correctly: `OperatorAlgebraDynamics` D6 owns `O_n` (main, README
line 457) and D8 the CAR algebra (line 554); `OperatorKTheory` K7 owns `E_n`, `O_∞` and their K-theory
with `[1]↦1` (#866 lines 1018–1041) and K8 the bootstrap class, UCT condition and `ℂ→O_∞`
KK-equivalence (lines 1073–1146, which say the UCT condition "pins the condition used in
CStarClassification" and "*-isomorphism classification is owned by CStarClassification");
`CStarAlgebras` C9 owns the AF-embedding subquotient theorem and says it "does not assume the
O₂-embedding or K-theoretic classification results" (#860 lines 892–902); `CategoricalOperatorAlgebras`
(#888) builds Cuntz–Pimsner algebras, a different object; `VonNeumannAlgebras` (#889) mentions UHF only
for product-state representations. Tau Ceti at the pin has no C*-classification material (grep of
`TauCeti/` for Cuntz, UHF: none); Mathlib at the pin has no dimension groups, Riesz interpolation or
unperforation (grep: none). No declaration of `Suggested.lean` shares a fully qualified name with a
readable roadmap.

**Supplier citations resolved.** `CStarAlgebras` C1–C2, C5 (bounded products and c₀ sums, line 603–608;
inductive limits, line 605), C7 (Choi–Effros lifting, 752–761), C8 (quasidiagonality, 792–831), C9
(matrix-unit stability and finite-dimensional intertwining, 855–870; Voiculescu homotopy invariance
with "CA is quasidiagonal for every separable A", 842–845), all at #860. `HilbertModules` H1–H4 and the
H3 definition "type I means each irreducible image contains K(H)" (#861 line 318–319). `OperatorKTheory`
K5 countable additivity in the first variable (#866, K5 paragraph "Prove countable additivity in the
first variable"), K6 universal property, K8 as above (including countable free resolutions and the
product-compatible lifting of a K-isomorphism to a KK-equivalence), K9 asymptotic morphisms, homotopy
into `C([0,1],B)`, reparameterization and the E-theory universal property (lines 1204–1264).
`OperatorAlgebraDynamics` D2 coefficient-tensor identification and full-product/generator formulas
for `G=ℤ` "used by CStarClassification CL5" (main, lines 194–200), D6 `O_n` simplicity and nuclearity
(457–466), D8 CAR inductive limit with matrix stages (554–566). `AlgebraicTopology` Stage 6.0
lim/lim¹ with "CL8 consumes lim¹ and its functoriality for KK telescopes" (main, lines 961–992).
`TauCeti.NumberTheory.Supernatural`: `ofNat : ℕ+ → Supernatural`, `CompleteLattice` instance,
`ofNat_le_ofNat_iff`, `ofNat_mul`, `ofNat_gcd/lcm` exist at the pin (lines 89, 299, 314, 346, 371, 385).
Merge order: `VonNeumannAlgebras` (line 4) and `HilbertModules` (line 10) precede `CStarClassification`
(line 213); `CStarAlgebras` and `OperatorKTheory` are new-folder pull requests, allowed suppliers.

**Sources read at their locators** (20 targets; the worker's seeded sample found no headings, so
these are the README's own locators): `kp00` = arXiv funct-an/9712002v1 — Prop 0.4 (line 122),
Def 0.5 (130), Prop 0.7 (139), Lemma 1.10 (445), Lemma 1.12 (502), Lemma 1.14 (621), Thm 1.15 (639:
any two unital embeddings of a separable unital exact algebra into O₂ are approximately unitarily
equivalent, matching README 392–393), Lemma 2.2 (660), Cor 2.3 (723), Lemma 2.4 (737: tensor
criterion for a u.c.p. lift, matching README 411–416 including the reduction to separable
subalgebras), Lemma 2.5 (764), Lemma 2.6 (788: `C*(ℤ,A,σ)⊗min C = C*(ℤ,A⊗min C,σ⊗id)` and
`v_n⊗1`, matching README 429–433), Lemma 2.7 (823), Thm 2.8 (832–856: cone quasidiagonality,
`B₀=(C₀(ℝ)⊗A)†`, embedding of `C(S¹)` and `D⊗O₂≅O₂`, corner `γ(p)O₂γ(p)≅O₂`, matching README
435–456). `gw01` = arXiv math/0011083v1 — Thm 3.3 (356) and the Triangle Lemma (359–362:
`f=g∘φ`, `ker f = ker φ`), matching README 218–223 and the Lean factorization lemma. `phillips00` =
Doc. Math. 5 (2000), publisher-open — abstract definition of asymptotic unitary equivalence with
unitaries in the unitization `B⁺` (lines 22–25, matching README 541–543), Def 1.2.5 fullness via a
full tail projection (344–347, matching README 526–533), Thm 2.3.7 (1382: `D₀` unital, no
separability needed; README's extra "nonzero separable" is harmless), Cor 2.3.10 (1623), Thm 4.1.1
(2090), Thm 4.1.3 (2202, including Kasparov product = composition), Thm 4.2.1 (2270), Cor 4.2.2
(2451, `[1_A]×η=[1_B]`), Thm 4.2.4 (2473, "both unital or both nonunital", unit class preserved in
the unital case) — all matching README 544–608.

**Adversarial table.** One row per statement; values on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `IsUnperforated`, torsion-freeness (README 210) | `G=ℤ` with cone `{0}∪{n≥2}`; `ng=0`, `n≥1` | `2·1≥0` but `1≱0`, so perforated; in an unperforated group `n•g=0` gives `g≥0` and `−g≥0`, hence `g=0` | holds | none |
| `factor_positive_map_killing_relation` | `G=ℤ`, cone `{0}∪{n≥2}`, `f(a,b)=2a+3b`, `x=(3,−2)` | `α(x)=0` forces `α(e₁)=2w`, `α(e₂)=3w`; then `β(w)=1∉G⁺`: no factorization; with `IsDimensionGroup` hypothesis the instance is excluded; `r=0`, `G=0`: `s=0` works | hypothesis necessary and sufficient | none |
| `HasRieszInterpolation` on `ℚ⊕ℤ`, cone `{(r,n):r>0}∪{0}` | all-strict and one-equality cases | strict: `c=(t,0)` with `max rᵢ<t<min sⱼ`; equality `a₁=b₁`: `c=a₁` | dimension group, simple | none |
| Infinitesimal example (README 248–252) | order unit `(1,0)`, elements `(1/2,0)`, `(1/2,1)` | `(1,0)−(1/2,1)=(1/2,−1)≥0`, both in scale; unique state `s(r,n)=r` since `(r,±1)≥0 ∀r>0` forces `s(0,1)=0`; values both `1/2`, elements distinct | example correct | none |
| `IsScale` | `G=ℤ`: `{0,1,2}`, `{0,1,3}`, `ℕ` | first hereditary/directed/generating (`Σ(M₂)`); second not hereditary (`2≤3` missing); third `Σ(K)` | discriminates | none |
| Scale domination form (README 226–228) | `g≤s₁+s₂`, `sᵢ∈Σ` | Riesz decomposition gives `g=g₁+g₂`, `0≤gᵢ≤sᵢ`, so `gᵢ∈Σ` | equivalent under interpolation | none |
| `IsAF` / `isAF_iff_local_approximation` | `A=0`; `A=C[0,1]`; `A=ℓ∞(ℕ)` | `0`: both sides true; `C[0,1]`: only finite-dim subalgebras are `0`, `ℂ1`, cannot approximate `x↦x`, both sides false; `ℓ∞`: RHS true (step functions), LHS false (nonseparable) | separability hypothesis needed and present | none |
| `ApproximatelyUnitarilyEquivalent` iff sequence | dense `(a_k)`, `F_n`, `ε=1/n` | `‖u_nφ(a)u_n*−ψ(a)‖≤2‖a−a_k‖+‖u_nφ(a_k)u_n*−ψ(a_k)‖` (φ, ψ contractive) | true; API lemma | R05 |
| `AsymptoticallyUnitarilyEquivalent` | `atTop` on `{t:ℝ // 0≤t}` | directed nonempty preorder, filter nontrivial; no `u(0)=1` as README 78 says | consistent | none |
| `CuntzSubequivalent` order | `StarOrderedRing` on a C*-algebra | `≤` is determined: `b−a` a finite sum of `x*x`, i.e. positive; def body does not use `≤` | not vacuous; binder dropped | R04 |
| `projection_cuntzSubequivalent_iff` | `p=0`; `q=0,p≠0` | `p=0`: `x_n=0`, `v=0`; `q=0`: `x_n*0x_n=0↛p`, and `vv*≤0⇒v=0⇒p=0` | both directions | none |
| Multiplicity existence (README 86–87) | `M₂→M₃`, `h=1`; unital needs `h·2=3` | `1·2≤3` exists, nonunital; equality impossible, no unital map | correct | none |
| Finite-dim lifting with cancellation (README 105–108) | `F=M_n`, `B` unital cancellative | `α[1_F]∈Σ(B)` gives `q`; `[q]=Σnᵢα[eᵢ]` and cancellation transports the orthogonal decomposition; uniqueness: `[1−φ(1)]=[1−ψ(1)]` plus cancellation | correct | none |
| Injectivity criterion (README 196–197) | `kerφ≠0` | `kerφ` is a nonzero AF ideal, real rank zero gives projection `p≠0`, `[p]≠0` by cancellation, `K₀(φ)[p]=0` | iff holds | none |
| UHF invariant | `CAR`, sizes `2^n` | `Q_ν=ℤ[1/2]`, rank-one in `M_{2^n}` ↦ `2^{−n}` | matches README 268–269 | none |
| Stable UHF isomorphism | `Q_ν≅Q_μ` ordered | any hom `Q_ν→ℚ` is `×q`, `q>0` | `qQ_ν=Q_μ` | none |
| Properly infinite relation (README 287–291) | `p=0` | `0⊕0≼0` holds; infinite needs `p≠0` | nonzeroness kept explicit | none |
| Unital `O₂→pAp` (README 333–334) | `p` properly infinite, full, `[p]=0` | `q₁,q₂≤p`, `qᵢ∼p`, `r=p−q₁−q₂`; `[q₁+r]=[p]−[p]=0=[p]` and `q₁+r` full properly infinite, so `q₁+r∼p` | `[p]=0` necessary | none |
| `vγ(v*)≈u` (README 363–366) | `K₁` classes | `K₁(γ)=2`, so `[vγ(v*)]=−[v]`; any `[u]` reachable since `U(B)/U₀(B)≅K₁(B)` | consistent | none |
| Lifting lemma `D≠0` (README 411–420) | `D=0`, `E=J=ℂ` | `E/J=0`, zero map unital; a lift sends `1=0↦1`, impossible | hypothesis needed | none |
| Bilateral shift path (README 443–446) | `S` on `ℓ²(ℤ)` | `σ(S)=𝕋`, Borel log `h`, `‖h‖≤π`, `t↦exp(ith)` norm-continuous from `1` to `S` | bundle trivial | none |
| Central sequence iff (README 483–485) | `A=K`; `A=K⊗O∞` | `K`: `s e₁≈λe₁` for isometries in `B(H)_ω∩K'`, so no orthogonal ranges, no unital `O∞`, and `K≇K⊗O∞`; `K⊗O∞`: `n`-th tensor factor `1⊗O∞⊂M(A)` asymptotically commutes | both directions | none |
| Finite-set form (README 490–492) | two isometries with `‖v*w‖=δ` | `w'=(1−vv*)w`, `v*w'=0`, `w'*w'=1−w*vv*w` invertible for small δ; normalize | lifting works | none |
| Image-full control (README 535–538) | `A=ℂ⊕ℂ`, `B=ℂ`, `p=(1,1)`, `φ(z,w)=z` | `φ(p)=1` full; `φ(0,1)=0` | control correct | none |
| `[1_E]=0`, `KK(φ)=1` (README 643–648) | `E=I+O₂⊂M(I)` | `O₂∩I=0` since `I` nonunital; `[1_E]=s_*[1_{O₂}]=0`; `KK(φ)=KK(Ad s₁)+KK(s₂θs₂*)=1+0` | correct | none |
| Mapping-cone K-theory (README 617–625) | `f:X→Y` between c₀-sums of `C₀(ℝ)⊗K` | `K₀(X)=K₀(Y)=0`, `K₁=P₁,P₀`; six-term: `K₀(C_f)=coker f_*=G`, `K₁(C_f)=ker f_*=0` | correct | none |
| `M_k(O_n)` (README 686–687) | `n=2`; `n=3`, `k=1,2` | `n=2`: `K₀=0`, all isomorphic, `gcd(k,1)=1`; `n=3`: classes `1,0` in `ℤ/2`, `gcd(1,2)≠gcd(2,2)` | correct | none |
| Phillips hypotheses (README 544–548, 572–576) | `D₀` | source needs `D₀` unital only; README adds separable, nonzero | narrower, not wrong | none |

**Padding probe.** `simp`, `rfl`, `infer_instance`, `exact?` on copies of the four sorried theorems:
none closes (`simp` only reorders the existential in the factorization lemma). No `example`, no
`#eval`, no `True` placeholder.

**Lean form.** Single `import Mathlib` plus `TauCeti.NumberTheory.Supernatural` (exists at the pin,
builds); `theorem` only; one module docstring; no `set_option`; every `def` has a real body on native
carriers; README generality equals the Lean generality for the three definitions that the README
states in words (`IsAF`, approximate/asymptotic unitary equivalence with the unital-target
specialization labelled as such, Cuntz subequivalence unstabilized as announced).

## Not verifiable

- Rørdam, *Classification of Nuclear C*-Algebras* (Part I of Rørdam–Størmer, EMS 126): Def 1.1.15,
  Thm 1.3.3, Prop 1.3.4, Thm 1.4.4, Prop 1.4.5, §2.3, §§4.1–4.2, Ch. 5–7, §§8.2–8.4. Springer,
  paywalled; `sources fetch` by citation found no legal source. Cite as uncertified. The mathematics
  attributed to these locators was checked independently above where it could be computed.
- Blackadar, *K-Theory for Operator Algebras*, 2nd ed.: Thms 7.3.2, 7.4.1, §§21.3, 21.5, Thm 21.5.2.
  The MSRI online edition host (`library.msri.org/books/Book5`) timed out; web search returned only
  Springer and Cambridge catalogue pages. Recorded in `needs-references.toml` with the URL tried.
- Ownership against open pull requests whose files this brief does not list was not checked beyond
  `roadmaps grep` over all 432 open heads.

## Source issues

- none
