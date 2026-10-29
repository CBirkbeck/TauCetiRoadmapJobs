# Review of ProfiniteCohomology (pull request #616 at da3c848)

**Verdict:** needs changes

Full review of both requested files at `da3c848671b816633ccb618693e7bdeab7df015e`. There are eight findings: two P1, two P2, four P3. The gate passes; the mathematical and supplier findings below prevent acceptance. No pull-request file was changed.

**Previous findings, checked individually against this head.** These refer to the eight findings in the review at `a925164`, not to the numbering below.

- Previous R01, orphan Lean files: **repaired**. Both helper files are deleted. The retained module says “only its consequence for the invariants is stated here” (`Suggested.lean:41`); it contains four theorem declarations and no admitted constructions.
- Previous R02, missing pinned declarations: **partly repaired**. Dimension shifting now cites `TauCeti.DiscreteCoind.unit`, `TauCeti.ContCohomology.CoindQuotient` and `TauCeti.ContCohomology.coindShortExact`. But “The pinned Tau Ceti supplies” (`README.md:2351`) still introduces absent norm declarations, and the class-module route introduces further absent declarations. See R02.
- Previous R03, missing strict-dimension headline: **not repaired**. “the criteria for ordinary and strict cohomological dimension” remain in the module's list of already-proved results (`Suggested.lean:17`). The criterion is still absent from the pin and the acceptance test. See R03.
- Previous R04, duplicated library work: **partly repaired**. “The Mackey formula is Tau Ceti's as well” (`README.md:1156`) now correctly resolves, as do the all-degree connecting-map compatibilities, Galois restriction/corestriction and class-module change of group. “the interaction of conjugation with restriction and corestriction” remains planned as new (`README.md:1164`); part of it is already supplied. See R04.
- Previous R05, inaccurate headline inventory: **not repaired**. “Tau Ceti proves it only when `G ⧸ V` is a cyclic `p`-group” (`Suggested.lean:27`) is still false at this pin; the strict criterion and class-level norm claims remain inaccurate. Covered by R02 and R03, not counted again.
- Previous R06, Kahn's Remarque II.2.3: **repaired**. “the warning that the field-theoretic formula … does not hold for an arbitrary group” (`README.md:2747`) is what the remark says. The newly explicit rank-one reading of I.4.2 has a different error, R01.
- Previous R07, locators: **partly repaired**. Private extraction locators have been removed. The purported pinned arithmetic file ending in `CohomologicalDimension/AbsoluteGaloisGroup.lean` (`README.md:1872`) is still absent; see R06. Kozlowski Lemma 2.4 is now correctly limited to the special cover, but the separate Proposition 2.1 attribution needs R05.
- Previous R08, per-target dependencies and Checks: **not repaired overall**. “Each layer opens with a **Prerequisites** line” (`README.md:591`) remains the organizing rule. Only four `*Needs:*` lines occur, and Layers 0–11 still lack the required closing Examples/Dependencies subsections. See R07.

## R01 (P1) — The rank-one induction formula omits the quotient character

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2745`–`2747`: “whose rank-one case `w(Ind α) = N(1 + α)` … `cor α` as its `w₁`”.

**Claim:** The degree-one term of an induced real line is not just the corestriction of its first class. The quotient character contributes even when the original line is trivial.

**Witness:** Take `H = 1 ⊂ G = C₂`, `α = 0`. Induction gives `1 ⊕ sign`, so `w = 1 + d`, `w₁ = d ≠ 0`; the displayed right sides give `1` and `0`.

**Repair:** Retain the norm identification in degree two, but write the rank-one specialization as `w(Ind α) = N(1 + α) + d`, hence `w₁ = cor α + d` and `w₂ = N(α)`. Cite Kahn I.4.2, formula (6′), printed pp. 239–240 (`Kahn line 674`–`683`), with `d` the character of `G/H`. Add the trivial-line example as a negative control. On the witness the corrected terms are `1 + d`, `d`, and `0`, exactly the classes of `1 ⊕ sign`. This is an error in the README's specialization, not in Kahn.

## R02 (P1) — Essential supplier declarations do not exist at the pinned revision

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2030`–`2033`, `:2351`–`2364`, `:2517`–`2521`; `Suggested.lean:17`–`28`. Representative claim: “The pinned Tau Ceti supplies, and this roadmap consumes by these names”.

**Claim:** The strict criterion, class-module cyclic case and transfer/inflation route, norm on cohomology classes, and Galois norm are treated as supplied inputs. They are not supplied by Tau Ceti `a91d3aaf`. No declared gap owns these missing inputs. The full 36-name inventory is below.

**Witness:** At this pin, `ClassModule/` contains only `Basic.lean` and `ChangeOfGroup.lean`. `Evens/Class.lean:276` defines `graphClass` on a continuous homomorphism; neither `evensNormIndexTwo` nor `abelianizationProPTransfer` occurs anywhere in the pinned Tau Ceti tree.

**Repair:** Separate genuine pinned inputs from the missing construction and theorem targets. Keep `graphClass`, its cochain comparison, the cochain-level dihedral identity, the actual class-module carrier/class and change-of-group equivalences. Own the missing strict criterion, transfer/inflation results, cyclic case, descent of the graph construction to classes, class-level pullback equation and Galois norm in the appropriate layers, with exact hypotheses and dependencies. Remove the incorrect supplied-status claims from the module docstring. Do not substitute a later library revision for the pin. The actual dimension-shifting repair already demonstrates the alternative: its cited `coindShortExact` and `dimensionShiftIso` resolve at this pin. Recheck all 36 entries after repair; every retained supplier citation must resolve to its claimed object.

## R03 (P2) — The strict-dimension criterion is a statable missing headline

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:1993`–`2005`; `Suggested.lean:17`: “the criteria for ordinary and strict cohomological dimension”.

**Claim:** The criterion `scd_p G ≤ n ↔ cd_p G ≤ n ∧ ∀ open U, Hⁿ⁺¹(U, ℤ)(p) = 0` is a headline used by the ClassFieldTheory contract. It is neither proved at the pin nor stated in the acceptance test. Its native carriers already exist.

**Witness:** A scratch copy adding the statement below elaborated with the same three imports and only admission warnings. `CohomologicalDimension/Strict.lean:158` supplies the bound `scd_p ≤ cd_p + 1`, not this criterion.

**Repair:** Add the criterion under Layer 11 and correct the module's headline inventory. The following signature elaborates after making the pin's `TopRep.distribMulAction` and `TopRep.smulCommClass` local instances:

```lean
theorem strictCriterion (p : ℕ) (hp : p.Prime) (G : Type u)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (n : ℕ) :
    strictCohomologicalDimensionAt.{u} p G ≤ n ↔
      cohomologicalDimensionAt.{u} p G ≤ n ∧
        ∀ U : OpenSubgroup G, AddCommGroup.primaryComponent
          (continuousCohomology (n + 1)
            (TopRep.of (ContRepresentation.trivial ℤ U.toSubgroup
              (ULift.{u} ℤ)))) p = ⊥ := by
  sorry
```

Tested mathematically at `G = ℤ_p`: for `n = 1`, both sides are false because `scd_p = 2` and `H²(U, ℤ)(p) = ℚ_p/ℤ_p`; for `n = 2`, both are true because `H³(U, ℤ) = 0`. For the trivial group and `n = 0`, both are true. This repair adds the missing acceptance statement without manufacturing a substitute carrier.

## R04 (P2) — Conjugation compatibility with corestriction is still planned twice

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:1162`–`1165`, `:1218`–`1219`: “What remains to build here is … the interaction of conjugation with restriction and corestriction”.

**Claim:** The corestriction part, including degree two on the explicit carrier, is already proved for the required general coefficients. It should be a supplier contract, not new library work.

**Witness:** `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Conjugation.lean:172` has `ContinuousCohomology.map_comp_corestriction_of_conj`; line 254 has `ContCohomology.explicitCor2_explicitMap2_of_conj`, for a discrete continuous `G`-module and conjugate open finite-index subgroups.

**Repair:** Cite these declarations and delimit any genuinely missing explicit degree-one transport or restriction compatibility separately. On `G = S₃`, `U = ⟨(12)⟩`, `V = ⟨(23)⟩`, trivial `ℤ` coefficients and degree zero, both routes send `1` to `3`. With `𝔽₂` in degree two, the nonzero class of either order-two subgroup corestricts to the same nonzero class of `S₃`. The pinned statements cover these comparisons directly.

## R05 (P3) — Kozlowski Proposition 2.1 concerns a different transfer

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2499`–`2501`: “the characteristic-two norm in every degree and its multiplicativity (Prop. 2.1, p. 311)”.

**Claim:** Proposition 2.1 is about the augmented total-class transfer, not the homogeneous operation `Hⁱ → Hⁿⁱ` whose multiplicativity is cited here.

**Witness:** `Kozlowski1984 line 90`–`102` defines the homogeneous norm and states its multiplicativity. Lines 103–114 introduce a different, corrected transfer on the total-class group and then state Proposition 2.1 about it.

**Repair:** Cite the unnumbered homogeneous-norm construction and multiplicativity in §2, printed pp. 310–311. Keep Lemma 2.4 for its stated special cover only. There, for degree-one `x`, its formula gives `N(x) = x² + tx`; at `x = 0` both sides vanish. No change to the norm theorem is needed.

## R06 (P3) — The arithmetic universe example cites a nonexistent pinned file

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:1870`–`1872`: “the local-field theorems of `TauCeti/NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean`”.

**Claim:** This purported pinned example is used to justify the two universe conventions, but the cited file is absent.

**Witness:** The pin has `TauCeti/NumberTheory/ClassFieldTheory/Local/CohomologicalDimension.lean`, not the cited subdirectory/file; that file contains no use of `cohomologicalDimensionAt` or `strictCohomologicalDimensionAt` establishing this example.

**Repair:** Delete this example or replace it with an actual declaration, including its elaborated universe parameters. The roadmap-level arithmetic need can instead be located precisely at `TauCetiRoadmap/ClassFieldTheory/README.md:1279`–`1297`, which specifies the dimension results and consumes the strict criterion. This does not assert that the arithmetic theorem is already in the pinned library. The two retained universe-equality signatures were separately elaborated and remain meaningful; the trivial group gives 0 = 0 for both invariants.

## R07 (P3) — Layers 0–11 lack the required per-target dependencies and discriminating Checks

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:591`–`613`, `:636`–`648`: “For **finite** `M` and discrete `N`, the internal hom `M →+ N` … is again a discrete `G`-module”.

**Claim:** The document retains the Prerequisites/API/Source field format instead of the required prose subsections and per-target dependencies. Four `*Needs:*` lines do not cover fourteen layers. Definitions such as this internal hom have no attached three discriminating Checks; Layers 0–11 have no closing Examples/Dependencies subsections. Scope, conventions and supplier contracts also need the prescribed headings and opening Summary.

**Witness:** Layer 0 gives the internal hom and evaluation pairing without any Checks block. The first `*Needs:*` appears at line 1920. Only Layers 12 and 13 end in `### Examples` and `### Dependencies`.

**Repair:** Reorganize without deleting the mathematical detail: distinguish owned targets from consumed contracts, give each remaining definition its API and three computed Checks, add each target's statement/proof-route dependencies, and close every layer as required. For the internal hom, three useful tests are: trivial `C₂`-actions on `𝔽₃` give three fixed homomorphisms; sign action on the source and trivial action on the target give only the zero fixed homomorphism; with those actions, evaluation at `φ = m = 1` satisfies `(-φ)(-m) = 1`, whereas the erroneous trivial action on the hom gives `-1`. These discriminate the advertised conjugation action.

## R08 (P3) — Two Checks incorrectly claim to distinguish continuity

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:829`–`831`: “both true only because of continuity”.

**Claim:** Neither `H¹(ℤ_p, ℤ/pᵏ) ≅ ℤ/pᵏ` nor `H¹(ℤ_p, ℤ) = 0`, with trivial action, distinguishes continuous from abstract cohomology in degree one. The worked examples later correctly say the opposite.

**Witness:** Every abstract homomorphism to `ℤ/pᵏ` kills `pᵏℤ_p`; every abstract homomorphism to `ℤ` has image divisible by all powers of a prime `q ≠ p`, hence zero. README lines 2580–2585 already give these arguments.

**Repair:** Remove the necessity claim and point to the discrete rational coefficient example already present: continuous `Hom(ℤ_p, ℚ) = 0`, while abstract homomorphisms are nonzero. Keep the finite-coefficient and integral computations as value Checks. The corrected positive controls have the same values `pᵏ` and `0`; the rational negative control separates the two theories.

## Verified sound

**Scope and principles.** The worktree is at the requested head. The outside-folder diff against `origin/main` is empty and the worktree remains clean. This is a revision of the existing owner, not a competing new foundational roadmap. The general discrete commutative coefficient-ring norm is retained; no good-prime restriction, algorithmic substitute, admitted data, `set_option`, forbidden import or route-specific arithmetic shortcut was found in the requested files. The two orphan Lean files from the previous head are gone. I read the normative root README and CONTRIBUTING, and compared the shape and ownership with the main-branch InductionRestriction, ClassFieldTheory and completed ProfiniteProPGroups roadmaps.

**Gate and independent elaboration.** The supplied gate reports every check at zero, including `stray-files`, `outside-folder`, `depcheck` and `build`, ending in `OK`. I built the two individually imported Tau Ceti modules to make their object files available, then ran the requested direct elaboration of `Suggested.lean`: exactly four `declaration uses sorry` warnings, no errors or other warnings. The independent dependency command returned:

```text
depcheck: 199 roadmaps, 1274 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The hand audit distinguished suppliers from consumers: InductionRestriction is a supplier on main; ClassFieldTheory, ProfiniteProPGroups, LocalGaloisGroups and QuadraticFormInvariants consume this roadmap. None is needed as a supplier for its cohomological conclusions. R02 concerns library supplier drift which this graph check does not detect. No declared gaps were supplied in the brief.

**Elaborated signatures and padding.** One scratch copy used `#check @name` for all four declarations. The two universe equalities retain `p`, arbitrary `G : Type u`, the group, topology and topological-group instances. The two class-module statements additionally retain primality, compactness, total disconnectedness, the strict-dimension bound, normality and openness. No standing hypothesis silently disappeared; no signature needed changing. In particular, the index is finite because the subgroup is open in a compact group. A separate scratch copy tried `rfl`, `simp` and `infer_instance` on every admitted statement; none closed. Searching the pinned declarations yielded no one-lemma proof of these four exact statements. There are no small-value or boundary-case theorems in this acceptance file. The additional strict-criterion probe in R03 elaborated, with only the expected admission warnings.

**Headline inventory.** The README's scope and deep targets comprise the explicit/canonical comparisons; finite-quotient colimit; long exact and five-term sequences; change of groups, Mackey, Shapiro and dimension shifting; Hilbert 90 and Kummer; ordinary and strict cohomological dimension including dévissage and the strict criterion; the two universe equalities; the class-module theorem; graded cup products and their identities; the index-two and general Evens norms, with the Galois transport. The comparisons, colimit, sequences, Shapiro, dimension shifting, ordinary-dimension tests, graded cup and Galois restriction/corestriction are substantial pinned inputs. Four remaining headlines are stated. The strict criterion is statable and missing (R03). The general norm's resolution-level construction is reasonably classified as not a few simple definitions, and the module names it as unstatable. The index-two descent and cyclic class-module subcase must not be called pinned results (R02); their genuinely missing acceptance statements should be reassessed after restoring their ownership.

**Adversarial computations.** The 112-row table records the computed values, not proofs of the universal theorems. Finite groups carry the discrete topology; actions are trivial unless specified; `p` is prime. The symbol `0` for a group means the trivial group. Rows cover the target constructions, formulas and conventions across all fourteen layers, the source sample, the four Lean headlines, and every mathematical finding. For inventory assertions about nonexistent declarations, the measured value is the number of matches in the pinned source tree. Cases outside a statement's hypotheses are explicitly identified as negative controls.

| Statement / location | Instance(s) | Values computed on the two sides or positive/negative models | Result / change |
|---|---|---|---|
| Discrete action and open stabilizers, Layer 0 | `C₂` on `𝔽₃`, sign versus trivial | Stabilizer of `1`: `{1}` versus `C₂`; both open. Fixed groups: `0` versus `𝔽₃`. | Consistent; openness does not mean trivial action. |
| Finite coefficients factor through an open quotient | Same sign module | Kernel `{1}`, quotient order `2`, action of nonidentity `1 ↦ 2`. | Factors with the nontrivial action preserved. |
| Union of open-normal invariants | `ℤ_p` on trivial `𝔽_p`; sign `C₂` on `𝔽₃` | First union is all `𝔽_p`; second includes `M^{1} = 𝔽₃` though `M^{C₂} = 0`. | Correct union; using only `M^G` fails. |
| Quotient action on `M^U` | `C₄`, sign `ℤ`, `U = C₂` | `M^U = ℤ`; quotient generator acts by `-1`; `(generator)²` acts by `1`. | Well-defined quotient action. |
| Finite versus infinite products | `𝔽₂²` and `∏ℕ 𝔽₂` | Singleton zero is open in the four-element product; every basic zero-neighborhood in the infinite product contains a nonzero vector. | Finite-product restriction has a witness. |
| Internal hom, R07 | `M = N = 𝔽₃`, trivial actions | `Hom(M,N) = 𝔽₃`, fixed group has `3` elements. | Positive control. |
| Internal hom conjugation, R07 | Source sign, target trivial | Action on `φ` is `-φ`; fixed group has `1` element, versus `3` for the wrong trivial action. | Discriminating Check to add. |
| Evaluation equivariance, R07 | Same modules, `φ = m = 1` | `(-φ)(-m) = 1 = g·φ(m)`; wrong hom action gives `φ(-m) = -1`. | Discriminating Check to add. |
| Continuous sections | `ℤ_p → ℤ/p` | Representatives `0,…,p-1` give a continuous section; every homomorphic section would send `1` to a `p`-torsion element of `ℤ_p`, necessarily `0`. | Set section exists, group section does not. |
| Compact/profinite section hypothesis | `ℝ → ℝ/ℤ` | A section would split fundamental-group map `0 → ℤ`; its composite cannot be `id_ℤ`. | Negative control outside profinite case. |
| Extension into nonempty discrete target | Closed `{0,1}` in a profinite space, target `𝔽₂` | A clopen separation extends values `0,1`; empty target admits no extension from the empty set to a nonempty space. | Nonempty hypothesis needed. |
| Native `TopRep` versus jointly continuous group action, Layer 1 | Discrete `ℤ`, `G = ∏ℕ C₂`, a discontinuous sign character | Each group element acts by continuous `±id`; orbit of `1` has nonopen stabilizer. Trivial character has stabilizer `G`. | Native carrier alone does not impose joint continuity. |
| Scalar continuity | Nonzero discrete real vector space | For `v ≠ 0`, preimage of `{0}` under `r ↦ rv` is `{0}`, not open in `ℝ`. | Continuous scalar action cannot be inferred from discreteness. |
| Canonical carrier in degree zero | `G = 1`, `M = ℤ`; `C₂` sign `ℤ` | `H⁰ = ℤ = M^1`; respectively `H⁰ = 0 = M^{C₂}`. | Matches invariants, not all underlying coefficients. |
| Compatible-pair direction and composition | Multiplication maps `ℤ → ℤ`, trivial group | Coefficient maps `×2`, `×3` compose to `×6`; group pullback of `C₂` parity along `C₄ → C₂` takes generator to `1`. | Covariance in coefficients, contravariance in groups. |
| Unnormalized differential, Layers 2–3 | `G = 1`, `M = ℤ` | `d⁰ = 0`, `d¹ = id`, `d² = 0`; hence `H¹ = H² = 0`, `H⁰ = ℤ`. | A constant nonzero 2-cocycle can be a coboundary; normalization is not imposed on cochains. |
| Differential sign | `C₂`, sign `ℤ`, `m = 1` | `d⁰m(s) = -2`; using `m-s·m` gives `2`. | Convention fixed. |
| Twisted 1-cocycle | `C₂`, sign `ℤ`, `f(s) = 1`, `f(1)=0` | `d¹f(s,s) = -1-0+1 = 0`; `H¹ = ℤ/2`, `H² = 0`. | Action factor essential. |
| `d¹d⁰ = 0` | Same `C₂` module | At `(s,s)`, `s·(-2) - 0 + (-2) = 2-2 = 0`. | Correct differential signs. |
| 2-cocycle and `d²` | `C_p`, integral carry `c(i,j)=⌊(i+j)/p⌋` | At `(p-1,1,1)`, `c(1,1)-c(0,1)+c(p-1,2 mod p)-c(p-1,1)=0` for `p=2,3`; all are the associativity carry identity. | Class generates `H²(C_p,ℤ)=ℤ/p`. |
| Zero coefficients | Any `G`, `M = 0` | Cochains, cycles, boundaries and all cohomology groups are `0`; every operation is the unique zero map. | No spurious nontriviality requirement. |
| Trivial-action H¹ and continuity, R08 | `ℤ_p → ℤ/pᵏ`, `k=0,1,2` | Continuous and abstract Hom have respectively `1,p,p²` elements. | Values correct; claimed discrimination false. |
| Integral H¹, R08 | `ℤ_p → ℤ` | Both continuous and abstract Hom are `0`; divisibility by all `qʳ`, `q≠p`, forces image zero. | Remove necessity claim. |
| Rational negative control, R08 | `ℤ_p → ℚ` | Continuous Hom `0`; nonzero `ℚ`-linear maps `ℚ_p → ℚ` restrict to nonzero abstract Hom. | Correct replacement Check. |
| Inner conjugation | `S₃`, `𝔽₂`, sign character | `(23)` and its conjugate `(13)` both map to `1`; zero character maps to `0` in both routes. | Milne 0.15 agrees. |
| Explicit/canonical comparisons | Trivial group, then `C₂` sign `ℤ` | Degree-zero class `1 ↦ 1`; higher groups `0 ↔ 0`. For sign module, degree-one groups both `ℤ/2`, degree-two groups both `0`. | Excludes zero comparison in degree zero. |
| Topology on explicit H¹ | `G=∏ℕ C₂`, coefficients `𝔽₂` | Finitely many evaluations impose finitely many linear equations on infinitely many coordinate characters; a nonzero solution remains. Compact-open maps are discrete, pointwise characters are not. | Separate discrete topology is meaningful. |
| Finite-quotient transition, Layer 4 | `C₄`, `U=C₂`, `V=1`, `𝔽₂` | Inflation sends nonzero character of `C₄/U` to `(0,1,0,1)` on `C₄`. | Transition is toward the finer quotient. |
| Finite-quotient colimit | `ℤ_p`, `𝔽_p` | Degree-one generator already occurs at quotient `C_p`; colimit and continuous H¹ both `𝔽_p`. Zero module gives `0=0`. | Correct on finite-image control. |
| Inflation need not be injective in degree two | `C₄ → C₂`, `𝔽₂` | Generator `x²` of `H²(C₂)` inflates to `χ²=0` in `H²(C₄)`. | Degree-one behavior must not be imposed in degree two. |
| Long exact sequence, Layer 5 | `C₂`, `0→ℤ --2→ℤ→𝔽₂→0` | `δ⁰=0` since constants lift; `δ¹:𝔽₂→ℤ/2` is an isomorphism; image has order `2`, equal to kernel of `×2` on `H²`. | Exactness and Bockstein value agree. |
| Five-term sequence | `C₄ ▹ C₂`, trivial `𝔽₂` | `inf¹` iso, `res¹=0`, transgression iso, `inf²=0`; image/kernel orders at the three middle nodes are `2/2`, `1/1`, `2/2`. | Correct exact sequence. |
| Transgression sign from a lifted cochain | `C₉ ▹ C₃`, `𝔽₃`, lift `f(i)=⌊i/3⌋` | At quotient pair `(2,1)`, `df=0-1+0=2=-1`; positive carry is `1`. | Pins the lift-differential convention; signs are not interchangeable. |
| Transversal word, Layer 6 | `C₄`, subgroup `C₂`, reps `1,s` | `ℓ_U(s)=s²`, `ℓ_{sU}(s)=1`; product at `(s,s)` is `s²`, equal to `ℓ_U(s²)`. | Schreier identity and left-coset convention agree. |
| Corestriction normalization in degree zero | `C₄ ⊃ C₂`, `ℤ` | `cor(res 1)=2=2·1`. With sign action, `cor⁰(1)=1+(-1)=0`. | The action factor cannot be deleted. |
| Cochain correction for `cor res` | `C₄`, sign `ℤ`, `f(s)=1` | `res f=0`, so left side at `s` is `0`; right side is `2 + d⁰(1)(s)=2-2=0`. Without correction it is `2`. | Correct cochain/class distinction. |
| Transitivity | `C₈ ⊃ C₄ ⊃ C₂`, `H⁰(-,ℤ)` | Direct transfer `×4`; composite `×2 ∘ ×2 = ×4`. | Correct index factors. |
| Mackey | `S₃`, `U=V=C₂`, trivial `ℤ` | Two double cosets of sizes `2,4`; contributions `1,2`; sum `3=res cor(1)`. Wrong fixed intersection gives `2`. | Genuine pinned input. |
| Conjugation/corestriction, R04 | Conjugate order-two subgroups of `S₃` | Both maps send degree-zero `1` to `3`; degree-two nonzero `𝔽₂` class to the same nonzero class. | Already supplied at the pin. |
| Projection formula | `C₄ ⊃ C₂`, degree zero, `a=3,b=5` | `cor(res a·b)=2·15=30`; `a·cor b=3·10=30`. | Direction and coefficient action agree. |
| Coinduction convention, Layer 7 | `C₂`, subgroup `1`, `𝔽₂` | Coinduced module has `4` elements; invariants are `(0,0),(1,1)`; evaluation at identity gives `𝔽₂`. | Shapiro in degree zero; complexes need not be isomorphic. |
| Shapiro in positive degrees | Same coinduced module | `H¹(C₂,𝔽₂[C₂])=0=H¹(1,𝔽₂)`; original trivial coefficient gives `H¹(C₂,𝔽₂)=𝔽₂`. | Distinguishes coinduction from trivial two-dimensional coefficients. |
| Dimension shifting at degree zero | `C₂`, sign `ℤ`, embedding `m↦(m,-m)` | Quotient of `ℤ²` by image is `ℤ`; invariants map by `×2`; cokernel `ℤ/2=H¹(sign ℤ)`, whereas `H⁰(quotient)=ℤ`. | Cokernel statement is necessary. |
| Higher dimension shifting | Same example | `H¹(C₂,ℤ)=0=H²(C₂,sign ℤ)`; no false degree-zero isomorphism used. | Correct positive-degree shift. |
| Cup `(0,0)` | Trivial group, integral multiplication | `2⌣3=6`, zero pairing gives `0`. | Pairing determines the operation. |
| Cups `(0,1)` and `(1,0)` | Trivial action, constants `2` and 1-cochain value `3` | Both formulas give `6`; a sign action in the second slot of `(1,0)` changes the latter value to `-6`. | Required action twist visible. |
| Cups `(0,2)` and `(2,0)` | Pairing multiplication, cochain value `3`, invariant `2` | Both give `6`; for arbitrary second 0-cochain with sign action and `gh=s`, `(2,0)` gives `-6`. | Product `gh` is the correct acting element. |
| Cup `(1,1)` | `C₂`, `𝔽₂`, nonzero character `x` | `(x⌣x)(s,s)=1`; its cohomology class is nonzero. | Cup is not zero even when signs disappear. |
| Graded commutativity | `C₃`, `𝔽₃`, degree-one `x` | `x²=-x²`, hence class `x²=0`; the cochain value at `(1,1)` is `1`. | Equality is on classes, not raw cochains. |
| Associativity and unit | Integral degree-zero classes `2,3,5` | `(2·3)·5=30=2·(3·5)`; `1·3=3=3·1`. | Unit and associator normalized correctly. |
| Hilbert 90, Layer 9 | `ℂ/ℝ`, cocycle `σ↦-1` | `σ(i)/i=(-i)/i=-1`; hence its class is `0`. Trivial Galois group gives `H¹=0`. | Multiplicative coboundary convention agrees. |
| Kummer | `ℝ`, `n=2`; separably closed characteristic-zero field | Power-class quotient and `H¹(μ₂)` both have order `2`; in separably closed case both have order `1`. | Correct isomorphism and edge case. |
| Kummer invertibility hypothesis | `𝔽₂(t)`, `n=2` | `μ₂(Kˢ)={1}`, hence H¹ is `0`; `[t]` in `Kˣ/Kˣ²` is nonzero. | Excluded inseparable control refutes unrestricted claim. |
| Kummer `n=1` | Any field | Power map is identity; quotient and `H¹(μ₁)` are both `0`. | No division-by-zero or empty torsion case. |
| Galois restriction/corestriction | Quadratic `ℂ/ℝ`, `𝔽₂` | On H⁰, restriction is identity and corestriction is `×2=0`; composite `0=2·id`. | The subgroup has index exactly two. |
| Canonical operations in all degrees, Layer 10 | `C₂`, `𝔽₂`, then zero module | Hⁿ is `𝔽₂` for every `n≥0`; for zero coefficients every degree is `0`. | No accidental degree-two truncation. |
| Filtered coefficients | `ℤ_p`, trivial finite p-power torsion system | `colim H¹(ℤ_p,ℤ/pᵏ)=ℚ_p/ℤ_p=H¹(ℤ_p,ℚ_p/ℤ_p)`. | Positive continuous-colimit control. |
| Closed-subgroup descent false shortcut | Diagonal `𝔽₂↪𝔽₂[C₂]` | `H¹(C₂,𝔽₂)=𝔽₂` maps to `H¹(C₂,𝔽₂[C₂])=0`. | Injective coefficient map need not induce injective cohomology. |
| Compactness in torsion theorem | Discrete `⊕ℕ ℤ`, coefficients `ℚ_p/ℤ_p` | Character with basis values `1/pᵏ` survives multiplication by every `pʳ` at coordinate `r+1`. | Noncompact counterexample excluded. |
| Torsion vanishing for rational coefficients | Compact `G`, discrete trivial `ℚ` | Positive-degree cohomology is both torsion and a rational vector space, hence `0`. For `G=1`, H⁰ is `ℚ`, not `0`. | Positive-degree condition essential. |
| Ordinary/strict dimension definitions, Layer 11 | `G=ℤ_p` | `cd_p=1`, `scd_p=2`; `H²(G,ℤ)(p)=ℚ_p/ℤ_p≠0`. | Torsion restriction in ordinary dimension cannot be dropped. |
| First dimensions | `1`, `C_p`, `ℤ_q` with `q≠p` | `(cd_p,scd_p)` respectively `(0,0)`, `(∞,∞)`, `(0,0)`. | Trivial, torsion and prime-to-p controls. |
| Bound `cd_p≤scd_p≤cd_p+1` | `1`, `ℤ_p`, `C_p` | `0≤0≤1`; `1≤2≤2`; `∞≤∞≤∞`. | Upper bound attained. |
| Single-degree and elementary-abelian test | `ℤ_p`, then `C_p` | `H²(ℤ_p,𝔽_p)=0`, giving `cd_p≤1`; `Hⁿ(C_p,𝔽_p)=𝔽_p` for all n, giving no finite bound. | Nontrivial negative control. |
| Closed-subgroup inequality | `1⊂ℤ_p`; `pℤ_p⊂ℤ_p` | Ordinary values `0≤1`, `1≤1`; strict values `0≤2`, `2≤2`. | No reversed inequality. |
| Prime-to-p index equality | `ℤ_p⊂ℤ_p×C_ℓ`, `ℓ≠p` | Ordinary dimensions `1=1`; strict dimensions `2=2`. | Prime-to-p restriction matches averaging. |
| Procyclic calculation | `Ẑ`, finite `ℤ/n`, and `ℤ` | `H¹(Ẑ,ℤ/n)=ℤ/n`, `H²(Ẑ,ℤ/n)=0`; `H²(Ẑ,ℤ)=ℚ/ℤ`. | Finite/torsion versus integral distinction is real. |
| Ordinary universe equality, Lean line 62 | `1`, `ℤ_p`, `C_p`; arbitrary u | Values at v=u and v=0 are `0=0`, `1=1`, `∞=∞`; both coefficient bounds are `max u u=max u 0=u`. | Sound test; equality is not `rfl` at the pin. |
| Strict universe equality, Lean line 70 | Same groups | `0=0`, `2=2`, `∞=∞`; identity comparison sends degree-zero `[1]` to `[1]`, not `[-1]`. | Additivity preserves primary components. |
| Strict criterion, R03 | `ℤ_p`, n=1 and n=2; `1`, n=0 | `false↔false`, since H² integral has nonzero p-part; `true↔true`, H³=0; `true↔true` for trivial group. | Statable headline omitted. |
| Finite-index junk value | Open subgroup of compact G versus infinite-index subgroup | Valid index is positive finite; infinite index would give Lean index `0`, factorization `0`, modulus `1`. | Infinite-index junk excluded by hypotheses. |
| Class module and factor set | `ℤ_p⊃pℤ_p` | Coefficient module `pℤ_p`, quotient `C_p`, action trivial; carry at `(p-1,1)` equals `p`, while zero factor set has value `0`. | Specified extension class, not arbitrary H² element. |
| Class-module H¹, Lean line 80 | `ℤ_p⊃pℤ_p`; V=G | `Hom(C_p,pℤ_p)=0`; for quotient `1`, H¹=0. | Fits theorem at nontrivial and boundary quotients. |
| Class-module H² and generator, Lean line 94 | Same, p=2 and p=3 | H²=`pℤ_p/p²ℤ_p`, orders `2,3`; carry class `p` maps to `1∈ℤ/p`. | Correct generator, not merely cyclicity. |
| Class-module prime-to-p quotient | `G=ℤ_p×C_ℓ`, V=`ℤ_p`, ℓ≠p | H²=`ℤ_p/ℓℤ_p=0`; p-part of index is `1`, so `ZMod 1=0`. | Full index ℓ would be wrong. |
| Class-module boundary | V=G | H²=0; exponent `v_p(1)=0`; `ZMod 1` has `1=0`, so class-to-one equation holds. | Boundary is meaningful, not false. |
| Class-module strict bound | `G=ℤ_p²`, V=`pG` | `cd_p=2`, `scd_p=3`; H²(`C_p²`,`ℤ_p²`) has order `p⁴`, not index `p²`. | Shows why ordinary `cd≤2` cannot replace strict bound. |
| Class-module excluded finite group | `G=C_p`, V=1 | H² with zero coefficient is `0`, desired modulus has order p; `scd_p=∞` excludes it. | Hypothesis prevents concrete false case. |
| Class-module noncyclic ambient test | Free pro-p group rank 2, index-p V | V-ab has `ℤ_p[C_p]⊕ℤ_p`; H¹=`0⊕0`; H²=`0⊕ℤ/p`. | Supports generality beyond procyclic G. |
| Transfer underlying class-module route | Abelian `ℤ_p`, V=`pℤ_p` | `Ver(x)=px`; at `x=1`, value `p`; restriction to V is multiplication by p. | Correct intended map; supplier claims still missing (R02). |
| Cyclic quotient factor set | C_p acting trivially on torsion-free A | H¹=`A[p]=0`; H²=`A/pA`; for A=`pℤ_p`, class `[p]` has order p. | Native finite-cyclic API supports this instance, not the claimed absent theorem. |
| Cup connecting-map sign, Layer 12 | Degrees (m,n)=(2,1),(1,2), and n=0 | Exponent `mn+(m+1)n`: signs `-1,+1,+1`; not uniformly `(-1)^m`. | Correct sign; opposite-pairing route needed. |
| Bockstein | `C₂`, `𝔽₂`, degree-one x | `βx=x²`; `β(x²)=2x³=0`; `β1=0`. | Derivation and square-zero controls. |
| General norm index one, Layer 13 | U=G, arbitrary class x | `N(x)=x`; degree-zero `N(3)=3`. | Identity normalization. |
| Norm versus additive transfer | Index 2, degree zero, ℤ | `N(3)=3²=9`; additive transfer gives `6`. | Norm is not an additive homomorphism. |
| Norm unit/zero-ring cases | Index 2, ℤ; zero coefficient ring | `N(1)=1`, `N(0)=0`; zero ring has `1=0` and unique cochain/class in all degrees. | No unnecessary nonzero-ring restriction. |
| Norm transitivity | `1⊂C₂⊂C₄`, degree zero, x=2 | Direct norm `2⁴=16`; composite `(2²)²=16`. | Indices multiply. |
| Norm multiplicativity | Index 2, degree zero, x=2,y=3 | `N(6)=36=N(2)N(3)=4·9`. | Source property tested. |
| Nonadditivity in odd characteristic | `C₃×C₂⊃C₃`, `𝔽₃`, nonzero a∈H² | `res N(a)=a²≠0`; `N(2a)=4N(a)=N(a)`, whereas `2N(a)≠N(a)`. | General coefficient-ring target retained. |
| Norm double-coset law | Same normal index-two subgroup | Two factors, `a·s(a)=a²`; at index one there is one factor x. | Product, not sum. |
| Norm expansion, Evens Theorem 1 | Index 2, degree-zero x=2; same a above | `N(1+2)=9=1+4+4`; after restriction in graded example, `1+2a+a²=(1+a)²`. | Lowest terms 1 and cor match source. |
| Norm parity | Two tensor factors in degree q | Swap sign is `(-1)^(q²)`: `+1` for q=2, `-1` for q=1; in characteristic 2, `-1=1`. | Even-degree scope and char-two extension distinguished. |
| Monomial embedding | S₃, U=1, representatives x | All Schreier factors 1; left translations compose `(12)(23)=(123)`; inverse convention reverses to `(132)`. | Nonabelian convention witness. |
| Monomial map need not be locally constant | U=G=`ℤ_p`, one coset | Base component is γ; identity map has infinite image and is not locally constant. | Continuity, not local constancy, is the right claim. |
| Monomial index-two values | C₄⊃C₂, reps 1,s | Base factors at s are `(s²,1)`; permutation swaps the two cosets. | Matches transversal convention. |
| Tensor-induced ring multiplication | Index 2, trivial action, A=ℤ | Pure tensor `2⊗3` maps to `6`; swapping factors maps `3⊗2` to `6`; unit tensor maps to 1. | Positive ring/equivariance control. |
| Graph components | C₄⊃C₂, α nonzero | `b₁=(0,1,1,0)`, `b_s=(0,0,1,1)`; `b₁(s²)=1≠0=b₁(s)+b₁(s)`. | Components are not individually cocycles. |
| Graph cocycle formula | Same C₄ | Rows of ν are `0000`, `0100`, `0011`, `0010`; all 64 coboundary evaluations are 0. | Finite enumeration confirms exact formula. |
| Graph class anchor | Same C₄ | Lifted generator's fourth power has kernel coordinate `ν(0,1)+ν(1,1)+ν(2,1)+ν(3,1)=1`; zero extension gives 0. | Nonzero class is C₈, not C₂×C₄. |
| Norm restriction | Same C₄ | `res N(α)=α²≠0`; both source/target H² have order 2. | Nonzero normalization. |
| Norm polarization | α=β≠0 on C₂⊂C₄ | Left side `N(0)-N(α)-N(α)=0`; right `cor(α²)=0` since subsequent restriction is 0 and res² is injective here. | Correct cross-term identity. |
| Conjugate defined as `res cor-id` | Same subgroup, H¹ over 𝔽₂ | `cor α=χ`, `res χ=0`; hence `evensConj α=-α=α`, agreeing with trivial conjugation action. | Minus sign matters outside char two. |
| Norm of restricted class | Wreath C₂≀C₂, y=quotient character d | `res d=0`; `N(0)=0=d²+d²`; d² restricts nontrivially to the swap C₂. | Omitting the d·y term would be false. |
| Index-two exactness | C₄⊃C₂, 𝔽₂ | χ²=0, res¹=0, cor¹ iso, res² iso; images and kernels match at these nodes. | Correct sequence. |
| Index-two hypothesis | S₃⊃C₂, index 3 | res¹ and cor¹ are isomorphisms on 𝔽₂; image res has order 2, kernel cor has order 1. | Same exactness claim fails at index 3. |
| Dihedral extension | D₁₆→C₂≀C₂ | Group orders 16→8, kernel `{1,r⁴}` order 2 and central; extension is nonsplit on the C₄ anchor above. | Correct extension and direction; class-level citation missing. |
| Kozlowski special-cover norm, R05 | Degree-one x, double cover of §2 | `Sq⁰x·t+Sq¹x=xt+x²`; x=0 gives 0. | Lemma 2.4 supports this specialization only. |
| Kahn rank-one formula, R01 | H=1⊂C₂, α=0 | Actual total class `1+d`, alleged value 1; actual w₁=d, alleged value 0. Corrected formula gives `1+d`, d. | False specialization; repair required. |
| Kahn second rank-one control | C₂⊂C₄, α nontrivial | Induced real plane is rotation by 90°; determinant +1, so w₁=0. `cor α=χ`, quotient d=χ, sum 0; w₂ is nonzero norm class. | Corrected formula also handles nonsplit quotient. |
| Galois norm transport | Identity extension; quadratic ℂ/ℝ | Identity extension: res/cor identity, general norm identity. Quadratic extension: H¹(G_ℂ)=0, so norm domain 0 and N(0)=0. | Index-two norm never applied to identity extension. |
| Missing supplied declarations, R02 | All 458 distinct fully qualified TauCeti names in README | 36 final identifiers have zero occurrences in pinned TauCeti; e.g. norm-on-classes and class transfer expected ≥1, actual 0. | Supplier inventory false; full list below. |
| Stale arithmetic locator, R06 | Cited path versus pin | Cited file count 0; nearby actual file count 1, dimension-invariant uses there 0. | Replace or remove the example. |

**Pinned-library audit.** The checked-out packages match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All references below are to those actual pins. The name scan examined 458 distinct fully qualified `TauCeti.*` identifiers in the README; 36 have no occurrence even by final identifier in Tau Ceti's source tree. This is an existence audit, not a claim to have mechanically verified 458 theorem types. Bodies and signatures were opened for the objects listed here and for the missing-object alternatives.

| Pinned file and line | Object read and conclusion |
|---|---|
| `Mathlib/RepresentationTheory/Continuous/Basic.lean:54` | `ContRepresentation` uses a homomorphism into continuous linear endomorphisms; it does not itself supply joint continuity in the group variable. |
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`, `:213` | `TopRep` and `TopRepEquivActionTop`: the categorical carrier is not a substitute for the roadmap's continuous group-action hypothesis. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean:148`, `:158`, `:163` | `ContinuousCohomology.map`, `map_id`, `map_comp`: native compatible-pair functoriality. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:131`, `:139`, `:146`, `:151` | The ordinary/strict predicates and invariants; actual coefficient-universe parameter and primary-component quantification. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Strict.lean:158` | `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`; does not state the open-subgroup integral criterion. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Corestriction.lean:111` | `corestriction_surjOn_primaryComponent_of_strictCohomologicalDimensionAt_le`; the file supplies surjectivity, not the claimed absent kernel theorem. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/Basic.lean:63`, `:67`, `:127`, `:144`, `:166` | `abelianizationProP`, its quotient map, factor set, continuous cocycle theorem and class. The group/coefficient carriers used in Suggested.lean are native, with openness used for the cocycle. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/ChangeOfGroup.lean:64`, `:95`, `:125`, `:152`, `:179` | Change-of-group equivalence, equivariance, H¹/H² maps and compatibility of the class; these are real supplied inputs. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Quotient.lean:71`, `:140` | `CoindQuotient` and `coindShortExact`; the revised dimension-shifting references resolve. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/DimensionShifting/Basic.lean:133`, `:146`, `:192` | `explicitDimensionShift1`, `explicitDimensionShift0`, `dimensionShiftIso`; positive-degree condition and degree-zero cokernel are explicit. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Conjugation.lean:172`, `:254` | Canonical all-degree and explicit degree-two conjugation/corestriction equations, with coefficient actions and subgroup hypotheses. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteCyclic.lean:111`, `:381`, `:392` | Finite-cyclic H¹ criterion, H² equivalence and representative formula. These do not provide the absent class-module cyclic theorem by the cited name. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Class.lean:276`, `:285` | `graphClass` and `graphClass_eq_cochainClass`; input is a continuous homomorphism, with local compactness in the context. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/DihedralPullback.lean:157`, `:190`, `:285` | Universal cochain correction, `indexTwoInd`, and `evensGraphCochain_eq_indexTwoInd_pullback`. The file explicitly distinguishes its cochain equation from the unformalized class-level consequence. |
| `TauCeti/RepresentationTheory/Tensor/Induction.lean:58`, `:235` | Wreath tensor representation and `Subgroup.tensorInductionFunctor`; representation-level tensor induction is not the cohomological norm. |
| `TauCeti/FieldTheory/GaloisCohomology/Corestriction/Exact.lean:75` | Galois restriction-kernel statement exists; this does not supply `galoisEvens`. |

The missing names in R02, grouped by object (prefix `TauCeti.` unless another prefix is displayed):

- **Norm descent and pullback (7):** `ContCohomology.homClass`, `ContCohomology.homClass_eq_cochainClass`, `ContCohomology.homClass_surjective`, `ContCohomology.graphClass_representative_independent`, `ContCohomology.evensNormIndexTwo`, `ContCohomology.evensNormIndexTwo_homClass`, `ContCohomology.evensNormIndexTwo_eq_ind_pullback` (`README.md:2358`–`2364`, `:2397`).
- **Strict criterion and top-degree kernel (3):** `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`, `corestriction_ker_primaryComponent_of_strictCohomologicalDimensionAt_le`, `ContinuousCohomology.conjNormalMap` (`README.md:1995`, `:2064`–`2066`).
- **Transfer and character arguments (11):** `abelianizationProPTransfer`, `continuous_abelianizationProPTransfer`, `abelianizationProPTransfer_eq_prod_lWord`, `zmodChar_eq_one_of_transfer_eq_one`, `zmodChar_eq_one_of_comp_transfer_eq_one`, `abelianizationProPTransfer_eq_one_iff`, `abelianizationProPTransfer_range`, `abelianizationProPTransfer_apply_of_mem`, `abelianizationProPTransfer_out`, `exists_abelianizationProPMk_eq_smul_div_of_mk_eq_one`, `abelianizationProPTransferLe` (`README.md:2079`–`2105`, `:2135`).
- **Cyclic and prime-order class-module results (4):** `subsingleton_h1_abelianizationProP_of_isCyclic`, `abelianizationProPClass_generates_of_isCyclic`, `subsingleton_h1_abelianizationProP_of_card_eq_prime`, `abelianizationProPClass_generates_of_card_eq_prime` (`README.md:2030`–`2031`, `:2115`–`2117`).
- **Transfer/inflation exactness (9):** `abelianizationProPTransferLe_injective`, `abelianizationProPTransferLe_range`, `abelianizationProPTransferLe_smul`, `continuous_abelianizationProPTransferLe`, `abelianizationProPInfl1`, `abelianizationProPInfl2`, `abelianizationProPInfl2_class`, `abelianizationProPInfl1_exact`, `abelianizationProPInfl2_exact` (`README.md:2136`–`2151`, `:2167`–`2169`).
- **Galois norm (2):** `galoisEvens`, `galoisEvens_galoisF2Iso_hom` (`README.md:2517`–`2521`).

**Source sample.** The supplied seed labels repeat “Prerequisites”, “API” and “Source” without line locators. I therefore used the broader set: all 14 Prerequisites paragraphs, all 11 API paragraphs, all 20 Source paragraphs, the introductory promise that hard theorems have hypotheses and sources, and the corresponding references. The pin audit handles the prerequisite-name part; the table handles the mathematical examples. Ten reference works were sought through the prescribed sources service; four were readable legally and six remain uncertified. No source manifest was edited. The following are the actual text checks, with numbering and hypotheses read at the locator:

| Source and legal copy | Locator checked | What the text supports |
|---|---|---|
| [Milne, Arithmetic Duality Theorems](https://www.jmilne.org/math/Books/ADTnot.pdf), author's copy | I §0, (0.1.1)–(0.1.6), printed p. 3; `Milne line 291`–`302` | Equivariant bilinear pairings; boundary, associativity, graded commutativity, restriction and inflation identities. The boundary signs agree with the roadmap. |
| Same | I Remark 0.11, printed p. 8; `Milne line 449`–`461` | Closed subgroup, continuous equivariant functions, right translation, adjunction and Shapiro. The displayed adjunction contains the misprint recorded below. |
| Same | I Proposition 0.15, printed p. 11; `Milne line 542`–`548` | The compatible action of inner conjugation is trivial on cohomology; not the converse about arbitrary automorphisms. |
| [Evens 1963](https://www.ams.org/journals/tran/1963-108-01/S0002-9947-1963-0153725-1/S0002-9947-1963-0153725-1.pdf), AMS open archive | §§2–5, especially printed pp. 59–60; `Evens1963 line 207`–`233` | Wreath-resolution construction, finite-index pullback, independence of transversal and coefficient-ring multiplication. The representative uses the permutation resolution together with the tensor resolution, not an ordinary cup product alone. |
| Same | §6 Propositions 1–4, printed pp. 60–62; `Evens1963 line 249`, `274`–`276`, `301`–`303`, `313`–`314` | Transitivity, double cosets, naturality under equality of indices, multiplicativity. The index condition in naturality is retained in the README. |
| Same | Theorem 1, printed p. 63; `Evens1963 line 345`–`348` | Expansion for a commutative G-ring and an even-degree class, with constant term 1 and first term ordinary transfer. |
| [Kozlowski 1984](https://www.ams.org/journals/proc/1984-091-02/S0002-9939-1984-0740192-9/S0002-9939-1984-0740192-9.pdf), AMS open archive | §2, printed pp. 310–311; `Kozlowski1984 line 90`–`114` | Homogeneous mod-two norm and its multiplicativity precede the different augmented transfer of Proposition 2.1. R05 identifies the locator error. |
| Same | Lemma 2.4, printed p. 311; `Kozlowski1984 line 126`–`130` | The specified universal double cover, with the Steenrod-square expression; degree one gives `x²+tx`. It is not the general group-theoretic index-two identity. |
| [Kahn 1984](https://webusers.imj-prg.fr/~bruno.kahn/preprints/sw-inventiones.pdf), author's institutional copy of the published article | I Theorem 4.2, printed pp. 239–240, equations (6), (6′); `Kahn line 674`–`683` | Induction of real representations along index two, including the correction term omitted in R01. Numbering agrees with the cited published version. |
| Same | II Remarque 2.3, printed pp. 242–243; `Kahn line 812`–`832` | The dihedral order-eight counterexample to extending the field formula to arbitrary groups. The repaired attribution is correct. |

The general continuous norm is a target extending the discrete source via finite quotients, not a theorem already established by those printed statements in a profinite setting. Its resolution construction must retain the permutation-resolution input visible in Evens §5. These text checks certify the readable locators and the stated restrictions; they do not certify the unavailable books listed below.

**Cross-roadmap and ownership audit.** Searches were by object as well as identifier, using the roadmap service and the readable main, board-package and supplied open-head trees: continuous cohomology carriers, coinduction, dimension predicates, class modules, norm/graph classes, internal hom, tensor induction and Galois transport. No new owner is needed for the missing inputs of R02: they are within this existing roadmap's scope. The found overlap with a pinned owner is R04.

| Citation or possible competing object | Resolved location and ownership result |
|---|---|
| `RepresentationTheory/InductionRestriction`, referenced at README 199, 309, 1316 | Main `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:1`–`30`, `:166`, `:213`, `:460`: algebraic induction/coinduction, finite-index comparison, transitivity/projection and Mackey. The continuous comparison belongs here; its pinned implementation is cited separately. |
| ClassFieldTheory's local dimension consumer | Main `TauCetiRoadmap/ClassFieldTheory/README.md:160`, `:187`, `:1279`–`1297`: local arithmetic values consume general dimension theory and the strict criterion at n=2. These are consumer citations, not reverse dependencies. |
| ProfiniteProPGroups' Sylow and presentation theory | Main `Completed/ProfiniteProPGroups/README.md:1`–`85`, and its supplied open head: owns pro-p/Sylow and presentation theory; consumes general cohomology. Its H¹/H² presentation applications are distinct from this roadmap's carrier. |
| LocalGaloisGroups' class-module consumer | Main `Completed/LocalGaloisGroups/README.md:125`–`139`: explicitly imports the class module and its generator theorem with `scd_p≤2`; arithmetic input is supplied by ClassFieldTheory. |
| QuadraticFormInvariants' norm application | Main `TauCetiRoadmap/QuadraticFormInvariants/README.md:669`–`694`, `:2254`–`2258`, `:2919`, `:3055`, `:3098`: owns the quadratic-form application and relative degree-two Stiefel–Whitney formula, imports the norm. It explicitly excludes a general total-class theorem. The base README's reference to “degrees ≤2” at 2418 is consistent with that boundary once R01 is corrected. |
| ProfiniteCohomologyPartII | `packages/ProfiniteCohomologyPartII/design/README.md`, introduction and M.0: extends the parent to continuous cochain DGAs, defining systems and Massey products. Its all-degree inhomogeneous DGA is not a second canonical cohomology carrier. Differential signs agree with the parent; the base stops its explicit quotient model at degree two. It is not a supplier of this base roadmap. |
| Nearby supplied open heads | ProfiniteProPGroups, ProfiniteArithmetic, SelmerIwasawaCohomologyPartII, GaloisSectionsPadicPeriodMaps and EtaleDualityAndPerverseSheavesPartII were inspected where object searches matched. Their pro-p, arithmetic, Selmer, filtered-module and sheaf constructions do not replace this roadmap's general continuous-cohomology ownership. |
| Suggested.lean names | Exact-name searches found the existing same-roadmap declarations and consumers referring to them, not a second distinct roadmap declaring these four fully qualified names. |

Search results from open revisions of existing roadmaps were not used to replace main as a supplier. Matches from open pull requests for which the brief supplies no file were not used as ownership evidence. No upward supplier citation was introduced, and no later roadmap's theorem is required to prove the four Lean targets.

## Not verifiable

- **NSW**, *Cohomology of Number Fields*, second edition: the service classified the publisher route as uncertified. The author's Heidelberg `NSW2.3.pdf` URL resolved to a landing page rather than a readable book in this run; the alternative HTTP request did not produce text. The cited (1.2.5), (1.3.2), (1.4.4), (1.5.1)–(1.5.9), (1.6.1), (1.6.4), (1.6.7), (1.7.7), (3.3.1)–(3.3.6), (3.3.11), (3.6.1)–(3.6.4), (6.2.1)–(6.2.2) and associated proof steps remain locator-only. In particular, the general p-primary class-module theorem and the strict-criterion proof were tested on the displayed examples and checked for statability, not certified against this book.
- **Ribes–Zalesskii**, *Profinite Groups*: publisher-only/uncertified through the service. The section theorem, colimit and five-term locators were not read in that text. The applicable pinned constructions were inspected instead.
- **Serre**, *Galois Cohomology*, and **Serre**, *Local Fields*: two separate requested works, publisher-only/uncertified. Their cited chapter/section/proposition locators, including the procyclic computations, were not certified from the books.
- **Koch**, *Galois Theory of p-Extensions*: publisher-only/uncertified; the listed theorem numbers and their exact generality remain uncertified.
- **Brown**, *Cohomology of Groups*: the title search did not locate a readable copy; the DOI route classified the work as uncertified. III §9, III (10.1), V (3.5), (3.6), (3.8) remain locator-only. Evens and Milne provide independently readable checks for parts of the norm, transfer and cup discussion, not certification of Brown's numbering.
- The extracted Evens/Kahn text has imperfect mathematical typography. The hypotheses and numbered statements above were readable; no missing superscript was treated as evidence for dropping a degree restriction.
- Ownership against open pull requests whose files were not supplied in the brief was not checked. Search hits alone were not treated as inspected supplier text.

The six inaccessible works are recorded here as uncertified, not as fresh missing-source requests. Transient failed URLs for Evens and Kahn were resolved to legal readable copies; they are not unresolved references. No source passage was copied into the repository or the report.

## Source issues

- **Misprint** in Milne at I Remark 0.11, printed p. 8: the source says the adjunction target uses the subgroup and the G-module as its two arguments; it should be the H-equivariant maps from the restricted G-module to the H-module; affects a stated result.
