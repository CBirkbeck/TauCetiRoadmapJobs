# GATE-NoncompactQuantumSymmetry~2: answers to the human review of head f7a5488

One review (CBirkbeck, 2026-10-27, five findings). Repairs are on top of `da553b0` as commit
`0c8773e1`, plus the depcheck repair commits `852d3a69` and `72e22bdc`. Only `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md` changed; `Suggested.lean`
states nothing about P.3, M5.AffineG5 or M6's branching measure, so it needed no change.

## H01 (CBirkbeck) — applied

P.3 used to say that `H¹` "equals the group of continuous crossed homomorphisms". It now defines principal crossed homomorphisms `f_z(g)=(g·z)z⁻¹`, identifies `Z¹_lc` with the continuous crossed homomorphisms (WagemannWockel2015 Remark I.4, source line 208), and defines `H¹_lc=Z¹_lc/B¹` (Remark I.3, source lines 189–191). It also says that for the trivial grading `B¹=1`, so `H¹_lc(G,𝕋)` is the group of continuous characters, which is the form P.4's exact sequence uses. A new P.3 Check computes the counterexample: for odd ℤ/2, `Z¹≅𝕋` and `f_z(t)=z⁻²` is onto, so `H¹=0`; for even ℤ/2, `Z¹≅ℤ/2`, `B¹=1` and `H¹=ℤ/2`.

## H02 (CBirkbeck) — applied

The topological extension theorem, its converse, the `H²_lc` classification sentence and the first API bullet of P.3 are now stated for Hausdorff G. The inclusion of 𝕋 is now required to be a topological embedding onto a closed subgroup. The text gives the reason: E/𝕋 with 𝕋 closed is T1, hence Hausdorff. It also says that Lean carries `[T2Space G]`, which `[IsTopologicalGroup G]` does not supply. The definitions of multipliers and `H²_lc` keep arbitrary G, because they do not need the hypothesis. A new Check records the `ℚ×C₂` (indiscrete `C₂`) example as the negative control.

## H03 (CBirkbeck) — disputed

SmoothBanachRepresentations is not on main: `RepresentationTheory/` on main has no `SmoothBanachRepresentations` folder. It exists only in an open pull request that revises the existing RepresentationTheory roadmap, and such a revision is never a dependency: RepresentationTheory may be cited only as it is on main, where SB0–SB4 do not exist. M0 therefore keeps its unitary-Hilbert Gårding and smooth-vector constructions. Once SmoothBanachRepresentations is on main, the ownership can be settled from that side, by consuming or generalizing M0.

## H04 (CBirkbeck) — applied

MetaplecticAutomorphicForms comes before this roadmap in the merge order, and its Layer 0 owns the bilinear Heisenberg extension. M5.AffineG5 now consumes it for the Heisenberg group and no longer builds its own adapter:
- The text "own the Heisenberg semidirect-product construction … Build the Heisenberg law" became: the law on `W⊕W` with centre ℝ is MetaplecticAutomorphicForms 0.1 for `B=ω/2=(η(a,b′)−η(a′,b))/2`, with the centre from 0.5–0.6, and the shear and Lorentz actions go through the isometry action of 0.7–0.8, jointly continuous by 0.13.
- NQS keeps the proof that the shear preserves ω (the change is `σ(η(b₂,b₁)−η(b₁,b₂))=0`), the semidirect product, the cocycle and the contraction.
- "Build the required bilinear adapter" became "this section owns only the η specialization and its coordinate comparison".
- The supplier table gained a MetaplecticAutomorphicForms Layer 0, 0.1–0.13 row.

## H05 (CBirkbeck) — applied

M6 "A zero-momentum Lorentz input and a spacelike input" cited "Theorem4.1 and Eq.3.6" twice; both now cite "Theorem 4.1 and the measure `dm_(σ,μ)` defined before Corollary 3.5 (§3.5, p.26 of arXiv v3)". This was checked against MollersOshima2015 (arXiv:1209.2312v3): the measure is at lines 1133–1141 on PDF p.26, §3.5 is headed at line 1045, Remark 3.6 (line 1158) is the Jacobi degeneration, and Theorem 4.1 is at line 1231. The published-version pages pp.312–313 were not checked, so the locator names the arXiv v3 version that was read. The specialization was recomputed: the atom index range is `j∈[0,Re(σ−μ)/4)`. With σ=2s and μ=1 this gives one atom `τ=2s−1` exactly when s>1/2. With μ=3 it would need s>3/2, which is outside the range σ=2s∈(0,2) of Theorem 4.1.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `H¹_lc=Z¹_lc/B¹` | ℤ/2 odd; ℤ/2 even; trivial grading, any G | odd: Z¹=𝕋, B¹=𝕋 (z⁻² onto), H¹=0. Even: Z¹=±1, B¹=1, H¹=ℤ/2. Trivial grading: f_z≡1, H¹=Hom_cont(G,𝕋) | old statement wrong in the odd case (gave 𝕋) | repaired, and a Check added |
| Crossed hom continuous near 1 ⇒ continuous | f(gh)=f(g)(g·f(h)) with fixed g and h→1 | `g·` is continuous on 𝕋 (identity or conjugation) | holds | none |
| Extension theorem, Hausdorff G | ℚ×C₂ indiscrete, ω≡1 | closure of {1} is {0}×C₂, so not T1; a closed kernel would force T1 | false without T2 | hypothesis added, and a Check added |
| Isomorphism ω/2 = Metaplectic B | (a₂,b₂),(a₁,b₁) | ω/2=(η(a₂,b₁)−η(a₁,b₂))/2=B | equal | none |
| Shear preserves ω | σ arbitrary | Δω=σ(η(b₂,b₁)−η(b₁,b₂))=0 | holds because η is symmetric | stated |
| Metaplectic 0.6 hypotheses (nondegenerate, 2 invertible) | ω on W⊕W | ω(x,·)=0 forces a=0 and b=0 because η is nondegenerate; 2 is invertible in ℝ | holds | none |
| Möllers–Oshima atom count | μ=1,3 with σ=2s∈(0,2) | μ=1: atom iff s>1/2 at τ=2s−1. μ=3: none | agrees with the README | locator only |

No Lean declaration changed, so the `#check` signature comparison has nothing new to compare. All sorry'd declarations elaborate in the build below.

## Ownership, sources, suspicious text

- **Ownership:** MetaplecticAutomorphicForms Layer 0 was read at its open head `22bee85`. Its line 24 already names M5.AffineG5 as the consumer, and it does not cite NoncompactQuantumSymmetry as a supplier, so there is no cycle. SmoothBanachRepresentations was read at the head given for its pull request (`a1c513cc`).
- **Sources:** both were fetched through the sources service: WagemannWockel2015 is arXiv:1110.3304v3 and MollersOshima2015 is arXiv:1209.2312v3. This job may not create the roadmap's `sources.toml`, so the folder still has no manifest.
- **Needs-references:** none.
- **Suspicious text:** none found in the review.

## Depcheck repair (commits `852d3a69` and `72e22bdc`)

The worker's gate found three UPWARD edges. All three are repaired.

- **HilbertModules (#238), README lines 37 and 959: repaired by moving the notions down.** HilbertModules is not on main. It is the open new-roadmap pull request #861, which comes later in the merge order. Its H3/H5 inputs are now owned here as two new Layer P items:
  - **P.7:** interior tensor products, induction through a correspondence, induction in steps, kernels of induced representations, imprimitivity bimodules, the Rieffel correspondence, the homeomorphism `Ind_X` of spectra, the small unitary-dual carrier and the irreducible-image convention. Locators are Echterhoff2010 (arXiv:1006.4975) §5.1, Definition 5.2, Propositions 5.4, 5.11, 5.12, 5.16 and Remark 5.10, read at Echterhoff2010 lines 724–734, 738–747, 828–835, 975–994 and 1001–1013.
  - **P.8:** C₀(X)-algebras, fibres, upper semicontinuity of fibre norms, continuous C₀(X)-algebras as continuous fields, trivial fields, and Hilbert-field reconstruction. Locators are DixmierDouady1963 Definition 7 (line 1662, p.267) and Propositions 1 and 3 (lines 103–143, pp.229–230), with §9 (line 740, p.244).
  - **Repointed uses:** every HilbertModules use now points to P.7 or P.8. These are the scope bullet (line 14), the supplier-table row (line 37, deleted), M1 (the old lines 959 and 1009), M2 (1345, 1440), M4 (2078) and M5 (3214, 3228, 3709, 3770, 4106, 4109, 4112, 5310).
  - **Induction in stages:** "module versus Hilbert-space induction" and induction in stages were already on main in OperatorAlgebraDynamics D3, so line 959 now consumes D3 alone, with P.7 for the interior-tensor form.
  - **Other edits:** the Layer P introduction, its Dependencies and the consumer map in Scope were updated, and both new sources were added to Source provenance.
- **DifferentialGeometry (#231), README line 31: repaired by removing an unneeded input.** The M0 Cartan-involution lift only needed smoothness of the lifted map. That map is a continuous homomorphism of Lie groups, so it is smooth by LieGroups Layer 2's automatic-smoothness theorem (main, `RepresentationTheory/LieGroups/README.md` lines 297–298). The supplier row was deleted, and line 645 now reads "Consume LieGroups Layer5's covering/lift construction; the lift is a continuous homomorphism, hence smooth by LieGroups Layer2's automatic smoothness theorem."
- **AffineLieAlgebras (#365), README line 362: repaired by moving the notion down (commit `72e22bdc`).** AffineLieAlgebras is on main, but the merge order places it at #365, after this roadmap (#214), and the worker's gate refuses that edge. No roadmap earlier in the order plans the Lie-algebra Whitehead lemmas: `roadmaps grep` for Whitehead lemma/vanishing finds only AffineLieAlgebras §A1. P.4 now proves them itself, and only from pinned library results:
  - **Library inputs.** The first is Mathlib `LieAlgebra.IsSemisimple.instHasTrivialRadical` (`Mathlib/Algebra/Lie/Semisimple/Basic.lean:286`). The second is `LieAlgebra.HasTrivialRadical.instIsKilling` (`Mathlib/Algebra/Lie/CartanCriterion.lean:256`, over a characteristic-zero domain with `IsNoetherian` and `Module.Free`). The third is Tau Ceti `TauCeti.exists_isCompl_of_isKilling` (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`). Its section variables are `[Field K] [CharZero K] [IsKilling K L] [FiniteDimensional K L]` and `[FiniteDimensional K M]`; the `IsAlgClosed` hypothesis is confined to the earlier `AlgClosed` section, so the theorem holds over ℝ.
  - **Degree one.** For a 1-cocycle f, `V⊕K` with `x·(v,t)=(x·v+t f(x),0)` is a module. An invariant complement of `V⊕0` is spanned by some `(v₀,1)`, which gives `f=δ(−v₀)`.
  - **Degree two.** Put `φ_c(x)=c(x,·)` in `Hom(g,V)`. Then `d₁₂φ_c=−ι∘c`, where `ι(v)(z)=z·v` is equivariant with kernel `V^g`. On `V′` (the complement of `V^g`), an equivariant projection onto `ι(V′)` makes c a coboundary. On `V^g`, `φ_c` is a 1-cocycle in g*, so `φ_c=δλ` and `c=d₁₂λ`.
  - **Generality and edits.** The statement is now over any field of characteristic zero (ℝ in every use), with the Mathlib sign convention for `d₁₂` written out. The supplier bullet (line 18), the Layer P introduction, the P.4 bullet and its `*Needs:*` line were rewritten.
  - **New Checks.** The adjoint so(3) coboundary and the injectivity of ι; the one-dimensional abelian counterexample `H¹(ℝ,ℝ)=ℝ`, with its non-split module; and the so(3) scalar 2-coboundary set against the abelian ℝ² class.
  - **Sources.** Source provenance now expands the Layer P keys Neeb2004, WagemannWockel2015 and Weibel1994. Weibel1994 is a textbook cited by section (§7.8) without a fetched text. The route above does not depend on it.
  - **Earlier dispute withdrawn.** The earlier draft kept this citation as a false positive. That is withdrawn: the edge is upward in the merge order, and the move-down rule applies.

**Ownership of P.7/P.8.** I searched main and every open roadmap head for the objects: the Rieffel correspondence, C₀(X)-algebras and interior tensor products. On main, only OperatorAlgebraDynamics names them (lines 44 and 380), and it consumes them from HilbertModules; it does not own them. The only planner is HilbertModules (#861), which is later in the merge order, so by the move-down rule this roadmap owns them now. `Suggested.lean` gained no declaration and declares none of HilbertModules' names.

**Lean signatures.** `Suggested.lean` is unchanged in this commit, and the new README text introduces no backticked name of this roadmap's own. So the `#check` signature comparison has nothing new to compare.

### Adversarial pass on the P.7/P.8 statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `B⊗_ΨF≃F` (E=B, Ψ nondegenerate) | B=ℂ, F=ℂⁿ, Ψ=id; Ψ=0 | `‖b⊗η‖²=‖⟨η,Ψ(b*b)η⟩‖=‖Ψ(b)η‖²`; Ψ=0 gives norm 0 on every tensor | holds; the Hausdorff quotient is necessary | Check |
| Induction in steps | E=F=B=ℂ | `ℂ⊗_ℂ(ℂ⊗_ℂH)≅H≅(ℂ⊗_ℂℂ)⊗_ℂH` | consistent | none |
| `ker Ind_Eπ` = induced ideal | B=ℂ⊕ℂ, E=ℂ⊕0, π=χ₂ | `⟨(1,0),(1,0)⟩=(1,0)`, `χ₂(1,0)=0`, so Ind=0 and the induced ideal is all of A=ℂ = ker 0 | holds | none |
| Rieffel correspondence needs fullness | the same non-full E; ideals 0 and 0⊕ℂ | `⟨aξ,η⟩∈ℂ⊕0`, so it lies in `0⊕ℂ` iff it is 0: both ideals induce 0 | not injective without fullness | negative-control Check |
| `Ind_X` homeomorphism | X=ℂⁿ between `M_n(ℂ)` and ℂ | ℂ̂ = one point, induced to the defining representation on ℂⁿ (dim n), irreducible; ideals {0,ℂ}↔{0,M_n} | bijective | Check |
| Linearity convention | B=M₂, E=B, ξ=1, η=E₁₁, b=E₁₂ | `⟨x,y⟩=x*y`: `⟨1,E₁₁E₁₂⟩=E₁₂=⟨1,E₁₁⟩E₁₂`; the convention `⟨x,y⟩=xy*`: `⟨1,E₁₂⟩=E₂₁`, while `⟨1,E₁₁⟩E₁₂=E₁₂` | the conventions differ; the second-variable one is pinned | Check |
| Type I across Morita | `M_n(ℂ)` and ℂ | both images contain the compacts (everything) | consistent | none |
| `‖a(x)‖=inf‖φ(f)a‖`, `‖a‖=sup‖a(x)‖` | X=[0,1], A=C([0,1]), a=t | `inf_f sup_t f(t)·t` at x: f concentrated near x, value → x = ‖a(x)‖; `sup_x x=1=‖a‖` | holds | none |
| u.s.c. of fibre norms (route) | A=C₀([0,1))⊕ℂ, a=(0,1) | `‖a(t)‖=0` for t<1 and 1 at t=1; at t=1 the bound `‖a(y)‖≤‖φ(f)a‖/f(y)` holds with `‖φ(f)a‖=f(1)=1`; the set `{‖a‖<1/2}=[0,1)` is open, while `{‖a‖>1/2}={1}` is not | u.s.c., not continuous | negative-control Check |
| Trivial field | `C₀(ℝ)⊗M₂`, a=`e^(−x²)E₁₁` | `‖a(x)‖=e^(−x²)`, sup 1 at x=0 | continuous, vanishes at ∞ | Check |
| DD reconstruction hypotheses | H(z)=ℂ on ℝ; Λ=span{1, 1_[0,∞)}; Λ=constants | first: values dense, `‖1_[0,∞)‖` jumps 0→1 at 0, so (T_ii) fails; second: the field is C(ℝ,ℂ) | the hypothesis is needed | Check |
| Lift smooth via automatic smoothness | G=SU(2)→Ad=SO(3), θ=conjugation by diag(1,−1) | the lift is the continuous automorphism `g↦diag(1,−1)g diag(1,−1)`, hence smooth | holds | wording |
| Whitehead H¹ via the extension module | g=ℝ abelian, V=ℝ trivial, f=id; g=so(3), V adjoint, f(x)=x×a | abelian: x·(v,t)=(xt,0), so x·(v₀,1)=(x,0)≠0 and there is no invariant complement, and H¹=ℝ. so(3): (δa)(x)=x×a=f | semisimplicity is needed; route consistent | negative-control Check |
| Bracket compatibility of `x·(v,t)=(x·v+t f(x),0)` | general x,y | x·(y·(v,t))−y·(x·(v,t))=([x,y]v+t(x f(y)−y f(x)),0)=([x,y]v+t f([x,y]),0) | holds exactly when f is a 1-cocycle | none |
| `d₁₂φ_c=−ι∘c` | general cocycle c, using Mathlib's `d₁₂` sign and `(x·φ)(z)=xφ(z)−φ([x,z])` | (d₁₂φ_c)(x,y)(z)=x c(y,z)−c(y,[x,z])−y c(x,z)+c(x,[y,z])−c([x,y],z), which by dc=0 is −z·c(x,y) | holds | stated in route |
| ι equivariant, kernel V^g | (x·ι(v))(z)=xzv−[x,z]v | =z x v=ι(xv)(z); ι(v)=0 ⇔ zv=0 for all z | holds | none |
| Trivial-coefficient H² | so(3), c(x,z)=⟨a,x×z⟩; abelian ℝ², ab′−a′b | so(3): λ(w)=−⟨a,w⟩ gives d₁₂λ(x,z)=−λ(x×z)=c. ℝ²: d₁₂λ=−λ∘[,]=0≠c | consistent with `H²(ℝ²,ℝ)=ℝ` | Check |
| Context of `TauCeti.exists_isCompl_of_isKilling` | K=ℝ | its variables are Field, CharZero, IsKilling and FiniteDimensional; `IsAlgClosed` lies only in the `AlgClosed` section (lines 113–196), and the theorem is at line 259, outside it | applies over ℝ | none |

## Build and gate

- `lake build TauCetiRoadmap.NoncompactQuantumSymmetry.Suggested` at `72e22bdc`: `Build completed successfully (9024 jobs).` The only warnings are `declaration uses sorry`.
- Gate summary line: `gate NoncompactQuantumSymmetry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Movable depcheck output:

```
depcheck: 159 roadmaps, 1105 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line remains.

- **Citation lead.** `roadmaps resolve` listed one lead, `Gassmann.almostConjugate_iff_permutation_equiv` (README line 1186). It is a planned name of RepresentationTheory/InductionRestriction Layer 2.1 on main (lines 197–198 and 378 there), cited with that section, so it is not a defect.
- **Lean signatures.** `Suggested.lean` is unchanged in all three commits, so the `#check` signature comparison had nothing new to compare and was not rerun.
- **Ownership.** Ownership against the open pull requests was checked with `roadmaps grep`.
- **Needs-references.** None. Weibel1994 is a textbook cited by section only, and no proof step depends on reading it.
