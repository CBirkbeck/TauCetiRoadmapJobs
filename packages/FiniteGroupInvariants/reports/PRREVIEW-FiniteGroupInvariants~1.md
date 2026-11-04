# Review of FiniteGroupInvariants (pull request #1708 at 19a7fe9)

**Verdict:** needs changes

## R01 (P1) — The elementary-prime criterion fails for the trivial group

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:465–468`, “`elementaryPrimes G = 1 ↔ ¬ TauCeti.IsElementary G`”.

**Claim:** the product detects exactly the non-elementary groups.

**Witness:** for `G = 1`, the prime-factor set is empty, so the product is 1. The group is cyclic and elementary by `TauCeti.isElementary_of_isCyclic`, `TauCeti/GroupTheory/Elementary.lean:293`. Thus the two sides are true and false.

**Repair:** state the equivalence for nontrivial finite groups, or replace the right side by `Subsingleton G ∨ ¬ TauCeti.IsElementary G`. Keep the trivial group as a negative-control Check. The repaired equivalence gives true/true for `1`, false/false for `C₃` (product 3), and true/true for `S₃` (product 1).

## R02 (P1) — The commutator-length convention contradicts the definition

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:205–207`, “`1` exactly when every element of `G'` is a commutator”.

**Claim:** being a single commutator characterizes length exactly 1.

**Witness:** in `C₂`, `G' = {1}` and `[1,1] = 1`, so every derived-group element is a commutator. The zeroth pointwise power already covers `G'`, giving length 0, not 1.

**Repair:** use “at most 1”, as §4.1 already does, or add nonabelianness to the exact-1 criterion. For `C₂` the repaired inequality is `0 ≤ 1`; for `S₃`, all three derived-group elements are commutators and the length is 1. Use both Checks in the conventions and §4.1.

## R03 (P1) — Derived-length monotonicity needs solvability

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:357–363`, “monotonicity under subgroups and quotients”.

**Claim:** the natural-number invariant is monotone without a solvability qualification.

**Witness:** `C₂ ≤ A₅` has derived lengths 1 and 0. Also `A₅ × C₂ → C₂` has lengths 0 and 1. Both proposed inequalities become `1 ≤ 0`; the zero on the nonsolvable group is the declared junk value.

**Repair:** require the ambient group to be solvable for subgroup and quotient monotonicity, and for attainment by `derivedSeries_derivedLength`. The examples above are then excluded explicitly; `C₃ ≤ S₃` and `S₃ → C₂` give `1 ≤ 2`. Do not change the total-function convention silently.

## R04 (P1) — PolynomialGaloisGroups does not supply the cited classification

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:117–119`, `839–842`, `918–920`: “Layers 1C–1D (reference transitive groups to degree 11)” and the degree-16 pair attributed to Layer 9.

**Claim:** these sections supply the exhaustive finite lists used to prove the small-index Gassmann and elusive-group assertions.

**Witness:** on main, `Completed/PolynomialGaloisGroups/README.md:35` limits completeness to degree at most 5; line 57 excludes degrees 6–11. Its Layer 9, line 1385, realizes symmetric groups over ℚ. There are no Layers 1C–1D there.

**Repair:** cite the actual degree-at-most-five contract; cite InductionRestriction §2.2 for the degree-16 pair. Own the missing mathematical small-index classification/nonexistence results here, or consume a precise contract from an eligible earlier extension. Do not require the completed base roadmap to expand. Degree 6 is already outside the supplied classification; the repaired dependency list must account for that case before using degrees 7, 8 or 11.

## R05 (P1) — The worker's build gate fails on an extra warning

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean:1`.

**Claim/check:** the supplied gate records `build=1 FAIL`: importing the module-system Mathlib from this non-module file emits an additional warning. The acceptance rule allows only `sorry` warnings.

**Witness:** the targeted `lake build TauCetiRoadmap.FiniteGroupInvariants.Suggested` replayed the same module-system warning. It exited successfully; this is a warning-policy failure of the build gate, not an elaboration error. The text/dependency-only rerun did not clear it.

**Repair:** add the `module` header and rerun the targeted build and full worker gate. A scratch copy with that header elaborated successfully, with exactly the 57 expected `sorry` warnings and no other diagnostic. The pull-request file was not edited. Acceptance still requires the worker's full gate to pass on the repaired head.

## R06 (P1) — Two arithmetic proof inputs have no supplied contract

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:930–933` and `966–968`.

**Claims:** Jordan–Zassenhaus uses finiteness of maximal-order lattice classes; the biquadratic class-number formula is “consumed from the class-group roadmaps”.

**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15687` (§7.54) defines locally free lattices; line 16263 (§7.77) constructs their stable class group. Neither states the required finiteness theorem. `Completed/Multiquadratic/README.md:84` supplies fields and subfields, not Kuroda's formula.

**Repair:** name and own the missing finiteness theorem, including the passage from stable classes to actual lattice isomorphism classes, or cite an actual eligible supplier target. Give Kuroda's formula its own target here or an exact named supplier contract; “class-group roadmaps” is not an owner. The stated absence of declared gaps supplies no alternative contract. A useful negative control is the trivial rank-one `ℤ[C₂]`-lattice: its generic dimension is 1, so it is not a locally free rank-one lattice over the rank-two order `ℤ[C₂]`. Jordan–Zassenhaus must still cover it. For the class-number formula, specify the real and imaginary hypotheses separately: the displayed factors are `q/4` and `q/2`, not interchangeable.

## R07 (P2) — Specify rational-valued functions in the rational-character basis theorem

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:738–742`, “a `ℚ`-basis of the `ℚ`-span of class functions constant on divisions”.

**Claim:** the rational orbit sums span the stated space of complex-valued class functions over ℚ.

**Witness:** for the trivial group there is one orbit sum, the constant function 1. The constant function `i : 1 → ℂ` is constant on divisions but is not a rational multiple of 1.

**Repair:** state a ℚ-basis of the **ℚ-valued** functions constant on divisions, or a ℂ-basis of the complex-valued space. Keep the ℚ-valued formulation for the rational table. On the trivial group the repaired space is ℚ with basis `[1]`; on `C₃` the table `[[1,1],[2,−1]]` has determinant −3 and spans the two-dimensional rational space.

## R08 (P2) — Import the existing character-field and cyclotomic-action targets

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:700–721`, especially the new action, preservation of irreducibility and stabilizer description.

**Claim:** these are new Layer 6 targets owned here.

**Witness:** main's `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:762–802`, §4.4, already constructs that action, proves the power-value law and preservation of irreducibles, and states `fieldOfValues_eq_map_fixedField_stabilizer`.

**Repair:** delete those duplicate targets and import CharacterTheory §4.4 by its exact contract. Retain the new division/orbit-count bridge and rational-table results, explaining their additional conclusion. The conventions agree: on `C₅`, exponent 2 sends `ζ₅` to `ζ₅²`, not `ζ₅³`; on `Q₈`, the degree-two character field is ℚ and its full cyclotomic group fixes it. Also move the already-proved `commProb` identity (§4.1) and cyclic automorphism count (§3.1) to supplier contracts: `commProb_def'` and `IsCyclic.card_mulAut` at the pin supply them.

## R09 (P2) — The Diederichsen–Reiner statement is a bounded, weaker substitute

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean:631–643`; compare `README.md:937–945`.

**Claim:** the acceptance theorem represents the integral classification promised in §9.2.

**Witness:** `hp19 : p ≤ 19` excludes every larger prime, whereas Reiner's Corollary, printed p. 145 (`reiner` lines 139–142), classifies all prime orders into `2h + 1` classes. The first Lean alternative specifies only rank 1, not trivial action.

**Repair:** state the general prime-order classification on the actual integral modules, with ideal classes and the non-split extension models, if a few simple definitions suffice. Otherwise name that headline and its missing carriers explicitly in the module docstring and remove this substitute. A rank-one sign lattice for `C₂` has generator action −1 and satisfies the present first alternative, while the claimed trivial model has action +1. The general statement must distinguish those models; its hypotheses must also admit prime 23 without a numerical cutoff. The class-number-one special case belongs among README Checks.

## R10 (P2) — Statable headline theorems are absent

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean:12–18`, compared with `README.md:781–786` and `974–978`.

**Claim/check:** headline targets are omitted; the docstring groups “every milestone without a declaration below” together without identifying missing carriers.

**Witness:** both the rational-group character criterion (§6.6) and integral conjugacy of finite rational matrix groups (§10.1) elaborated in scratch using the existing carriers, without any new definition. Neither appears in the acceptance file.

**Repair:** add these two headline signatures. Audit the remaining headline inventory below individually; name any genuinely unavailable carrier in the module docstring instead of using a blanket omission. The integral-conjugacy statement can quantify over `H : Subgroup (GL (Fin n) ℚ)` and witnesses in `GL (Fin n) ℤ` using `Units.map`. It includes `n = 0`; the identity group gives an identity conjugator. The rational criterion gives true/true for `S₃` and false/false for `C₃` with character value `ζ₃`.

## R11 (P2) — The universal order-24 bound on nonclosure witnesses is impossible

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:401–403`, “each non-closure witnessed by a group of order `≤ 24`”.

**Claim:** this applies to every Layer 1 predicate, including quasisimple and almost simple groups.

**Witness:** a quasisimple group has a nonabelian simple quotient, whose smallest possible order is 60. Almost simple groups contain such a subgroup. There is no positive example of either predicate of order at most 24 from which to witness subgroup nonclosure.

**Repair:** remove the universal size bound and supply appropriately sized witnesses for each failed closure claim. For example `A₅` is quasisimple and almost simple, whereas its order-two subgroup is neither; the ambient order is 60. The existing order-120 `SL(2,5)` Check already exceeds the promised bound.

## R12 (P2) — The certificate/search layer is outside the mathematical roadmap contract

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:993–1012`, particularly §10.4 “The certificate interface”.

**Claim:** the deliverable includes decidable certificate verification, bounded searches over bases, and a large enumeration producing class counts.

**Witness:** §10.4 explicitly makes decidability of the first two certificate clauses a target, and §10.3 calls the lattice enumeration decidable. These are computational deliverables, which the review's binding scope excludes.

**Repair:** retain the mathematical classification, finiteness, conjugacy and exact count theorems. Remove the certificate interface and bounded-search targets and describe a mathematical proof route with its inputs. The repaired dimension-four claims still say `#ZClasses = 710`, `#QClasses = 227`, and `1152 ∣ 5760`; none needs a certificate format or executable search.

## R13 (P3) — The seeded sources lack exact locators and a complete reference record

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:347–354`, `452–458`, `575–593`, `615–619`, `647–679`, `700–803`, `914–920`, `974–978`, and References.

**Claim:** the sampled assertions can be checked at their sources.

**Witness:** §0.5 cites a whole chapter; §1.6 and §4.2 give no external locator; §6.4 cites Chapter 10 as a whole; §8.3 names Fein–Kantor–Schacher without a bibliography entry. No `sources.toml` is present.

**Repair:** attach a theorem/section and printed page, with exact hypotheses, to each assertion; record each work once in the source manifest when repairing the package. The source audit below distinguishes checked text from unavailable text. Concrete verified locators include Reiner's Theorem and Corollary, p. 145; Serre's §1.3.1, p. 4 of arXiv:1011.0346v1; and Fein–Kantor–Schacher Theorem 1, p. 41. The latter requires degree greater than 1 and explicitly uses CFSG: expose those conditions and that proof input where it is invoked. Do not describe an unread chapter as verified.

## R14 (P3) — Definitions and layers do not have the required APIs and Checks

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:306–405`, throughout Layers 0–10.

**Claim/check:** each definition must have its mathematical definition, API and at least three discriminating Checks, and each layer must end in Examples and Dependencies.

**Witness:** there are only three `**Checks.**` blocks (§§6.2, 6.3, 10.4); the last has two bullets. No layer has the prescribed closing subsections. Several predicate sections point to Pinned conventions, which does not actually define those predicates.

**Repair:** give the missing definitions and APIs in prose, distribute at least three actual tests to each definition, and use the required Summary, Conventions, Exact supplier contracts, How to read the build, Examples and Dependencies structure. Spell out dependencies target by target. For derived length, the values `0` on `1`, `1` on `C₂`, `2` on `S₃`, and junk `0` on `A₅` discriminate the needed cases. For invariant factors, explicitly guard “the last invariant” by nontriviality: the trivial group's list is empty. Replace undeclared backticked local API names by prose or retained headline declarations; e.g. `compositionLength_eq_zero_iff` and `hyperelementaryPrimes` are not declarations in the acceptance file.

## R15 (P3) — Remove Check and boundary-case padding from Suggested.lean

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean:131`, `169–175`, `237–238`, `255–259`, `283–285`, `335`, `417–432`, `469`, `492`, `526`, `589–590`, `712`.

**Claim/check:** the file is an acceptance test for deep headline results, not a second home for worked examples, constructors and elementary API consequences.

**Witness:** the file admits the specific values for `Out(Q₈)`, `μ_{S₄}(1)`, `permutationDegree(Q₈)` and `irrDegree(C₄×C₄)`, plus the boundary `jordanBound 1 = 1`; these mirror the README Checks. It also retains trivial-series and reflexive-isoclinism constructors.

**Repair:** for each such declaration, **delete it from `Suggested.lean`**; keep the mathematics in the README. Remove definitions used only by deleted padding, such as `elementaryPrimes` if no headline requires it. The 57 `simp`/`rfl`/`infer_instance` probes closed none of the admitted theorems. This is the separate Check/boundary padding rule. The values remain 6, −12, 8, ⊤ and 1. The deep classification counts 13, 73 and 710 are not padding.

## Verified sound

Reviewed all 64 milestones and Lean declarations at the stated head. Outside-folder diff: empty. No PR edits, stray sources, sorry-defined data, `set_option` or admitted examples.

### Build, signatures and dependency evidence

- Elaboration: 57 `sorry` warnings only. Targeted build: successful exit plus R05's module-system warning. **The full worker gate fails**; text/dependency scanners alone passed.
- All 111 named declarations elaborated with `#check @...`; the worker's 112th name, `is`, is comment text. Lost-binder leads inspected: `characterField`, `schurIndex`, `IsMonomial`, `irrDegreeC`, `linDegreeC`. Four definitions allow broader groups but their finite-group theorems retain finiteness; `IsMonomial` carries `Fintype`. No false theorem arose. Jordan's required binders remain present.
- All 57 admitted theorems resisted `simp`, `rfl`, `infer_instance`. Exact-library overlaps appear below. R10's two signatures elaborated; a scratch `module` header eliminated the extra warning. Elaboration does not prove truth.
- Mechanical dependency output:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

No `UPWARD` or `CYCLE`. This roadmap follows InductionRestrictionPartII; unlisted roadmaps were placed after their last supplier. Individual dependency checks still found R04/R06's missing contracts.

### Headline inventory and acceptance coverage

The headline inventory, grouped by acceptance-file coverage:

- **Stated:** chief/composition Jordan–Hölder and additivity; Fitting nilpotence and self-centralization; invariant-factor existence; Huppert and almost-simple criteria; Hall existence/conjugacy/converse; divisions as cyclotomic orbits; Guralnick's threshold and stem representatives; Hall's Eulerian formula; Johnson's permutation-degree formula; Schur-index divisibility and Brauer–Speiser; supersolvable implies monomial and Taketa; common finite quotient and Perlis; prime-degree non-elusiveness; Minkowski reduction/mod-3 divisibility; integral class counts 13/73/710; Jordan's characteristic-zero and finite-modulo-scalars bounds, irreducible-degree bound and Schur bound.
- **Absent or incomplete:** characteristically simple chief factors; invariant-factor uniqueness; Bender's centralizer theorem; general stem-cover assertions; faithful-character Möbius inversion; character-orbit/division count and rational table; Schur realization and rational-irreducible classification; rational-group character criterion; faithful-character socle criterion; arithmetic-invariant/counting corollaries; Jordan–Zassenhaus; Herbrand and biquadratic unit modules; stable integral lattice/conjugacy; sharp Minkowski bound; rational class counts; Collins' exact Jordan value. R10 establishes two statable omissions. The others need individual carrier explanations, which the blanket docstring lacks. Character action and covers must respect the existing owners below.
- **Defective coverage:** Diederichsen–Reiner has only the bounded substitute (R09); exhaustive small-index Gassmann and elusive-group results depend on the missing supplier (R04).

### Adversarial mathematics table

These 119 rows record **instance computations**, not general proofs. `1` denotes the trivial group; `d` derived length; `c` commutator length; `μ` subgroup-lattice Möbius value. Permutations compose rightmost first. Group calculations used independently constructed multiplication tables, subgroup closure, normality, conjugacy, power relations and integer Möbius recurrences on 14 groups (`1`, `C₂`, `C₃`, `C₄`, `C₆`, `S₃`, `A₃`, `S₄`, `A₄`, `A₅`, `Q₈`, `C₂²`, `C₂³`, `C₄²`). Generating tuples of lengths 0, 1 and 2 were counted directly and compared with the Möbius sums. Other rows are explicit hand calculations; boundary checks do not certify exhaustive classifications or unread sources.

| Statement / definition | Instances and values on the two sides | Result and change |
|---|---|---|
| Carrier, `FinGrp`, `IsoClass`, universe convention | `C₃` and `A₃`: multiplication-preserving identification, both cardinality 3; `C₃` versus `C₂`: 3 ≠ 2, no equivalence | Finite copies preserve the object; different order excludes a wrong identification. |
| 0.1 normal lattice, modular law | In `C₂²`, take distinct lines A,B and C=G: `A ∨ (B ∧ G)=G=(A∨B)∧G`, both order 4. In `S₃`, normal chain has orders 1,3,6; a transposition subgroup of order 2 is excluded | Correct native lattice, not the full subgroup lattice with false normality. |
| 0.1 atoms and coatoms | `S₃`: unique normal atom C₃, unique normal coatom C₃; quotient order 2 is simple. `1`: neither atom nor coatom | Both directions hold on these cases. |
| 0.2 chief series and factor multiset | `C₂²`: `1<G`, length 1, factor C₂², not two chief factors C₂. `S₄`: orders 1,4,12,24, factors V₄,C₃,C₂, length 3 | Chief series is distinguished from composition series. |
| 0.2 Jordan–Hölder with fixed endpoints | `C₆`: chains through C₂ and C₃ give multisets `{C₂,C₃}` and `{C₃,C₂}`; cardinality 2=2 | Correct endpoint-sensitive comparison. |
| 0.3 characteristically simple factors | `A₄`: chief factor V₄ = C₂², k=2; quotient C₃, k=1. `A₅`: one simple factor, k=1 | Product factors allow k>1; prime-order-only model fails. |
| 0.4 composition series and existence | `C₄`: orders 1,2,4; quotients C₂,C₂; length 2. `1`: length 0, `Fin 0` factor index, empty factors | Nonempty series structure includes the degenerate case. |
| 0.5 Jordan–Hölder, length and chief refinement | `A₄`: composition factors C₂,C₂,C₃, length 3=2+1; `S₄`: C₂,C₂,C₃,C₂, length 4=2+1+1 | Chief length and composition length are not conflated. |
| 0.5 quotient additivity | `S₄`, N=V₄: lengths `2+2=4`; `C₄`, N=C₂: `1+1=2`; N=1 or G adds 0 | Same multisets as the whole group. |
| 0.5 solvable order-factor formula | `S₄`: Ω(24)=4=length; `A₅`: Ω(60)=4 but length=1 | Solvability is necessary and stated. |
| 0.6 `sInf`, zero and one criteria | `1`: d=0, subsingleton true. `C₂`: d=1, abelian/nontrivial true. `A₅`: d=0 but nontrivial and nonsolvable | Zero has two meanings; README records this. |
| 0.6 metabelian case and bounds | `S₃`: d=2, derived C₃ abelian; `S₄`: d=3, derived A₄ nonabelian. `Q₈`: d=2 ≤ log₂(2)+1=2 | Criteria distinguish the next derived step. |
| 0.6 subgroup and quotient monotonicity | `C₂≤A₅`: `1≤0` false; `A₅×C₂→C₂`: `1≤0` false. Solvable controls give `1≤2` twice | R03: add solvability of the ambient group. |
| 0.7 minimal normal subgroup and socle | `S₃`: socle C₃, order 3. `C₄`: socle C₂, order 2. `1`: socle order 1. `A₅`: socle order 60 | A larger arbitrary normal subgroup is excluded by minimality. |
| 0.7 abelian socle and exponent | `S₄`: socle V₄, exponent 2, abelian; `C₆`: socle C₆, exponent 6 squarefree; `A₅`: nonabelian socle | Solvability guards the abelian assertion. |
| 0.8 Fitting/radical definitions | `S₃`: F=C₃, radical=G; `Q₈`: F=G, radical=G; `A₅`: both order 1 | Suprema are not automatically whole groups. |
| 0.8 Fitting nilpotence and top criterion | `S₃`: F order 3 nilpotent, F≠G and G not nilpotent. `Q₈`: F=G and G nilpotent | Both directions distinguish a nonnilpotent solvable group. |
| 0.8 self-centralization | `S₃`: centralizer(C₃)=C₃; `S₄`: centralizer(V₄)=V₄. `A₅`: centralizer(F)=G, orders 60>1 | Solvability is retained in the Lean theorem. |
| 0.8 p-cores and radical criterion | `S₃`: O₃=C₃, O₂=1, join C₃=F; its minimal normal C₃ is abelian, radical≠1. `A₅`: only minimal normal A₅, nonabelian, radical=1 | Correct on nonabelian controls. |
| 0.9 invariant factors | `1`: [], product 1; `C₄×C₆`: [2,12], product 24, exponent 12; `C₂²`: [2,2], product 4, exponent 2 | Guard “last invariant” for the empty list, R14. |
| 0.9 primary reconstruction | `C₄×C₆`: primary powers [2,4,3], product 24; combine by prime positions to [2,12] | Sorting divisibility factors differs from merely sorting prime powers. |
| Layer 1 order bound on witnesses | Quasisimple/ almost-simple positive example A₅ has order 60; its subgroup C₂ has order 2 and fails both predicates | No order≤24 witness can supply the positive ambient group; R11. |
| 1.1 supersolvable definition and nilpotent implication | `C₄`: cyclic chief factors 2,2, true; `Q₈`: chief factors 2,2,2, true; `A₄`: chief factor V₄ order 4, false | Normal-in-G series is required, not just any composition series. |
| 1.1 Huppert criterion | `S₃`: maximal indices 2,3,3,3, all prime, supersolvable true. `A₄`: maximal C₃ has index 4, not prime, supersolvable false | Both directions tested. |
| 1.1 closure and derived subgroup | `A₄`: normal V₄ and quotient C₃ supersolvable, whole group false; `S₃' = C₃` nilpotent | Extension closure correctly fails. |
| 1.2 metacyclic and Z-group implication | `S₃`: cyclic normal C₃ with quotient C₂; `Q₈`: cyclic C₄ with quotient C₂. `C₂³`: every cyclic subgroup order≤2, quotient rank≥2 | True,true,false; product nonclosure via C₂×C₂². |
| 1.2 metacyclic versus metabelian | `A₄`: derived V₄ abelian, but normal subgroups have orders 1,4,12 and none gives cyclic-by-cyclic | Metabelian true, metacyclic false. |
| 1.3 A- and Z-groups | `A₄`: Sylow V₄ and C₃ abelian, A=true/Z=false; `Q₈`: Sylow Q₈ nonabelian, A=false; `C₂²`: A=true/Z=false | Definitions discriminate cyclic and abelian Sylows. |
| 1.4 rational group | `C₃`: g²≠g and abelian conjugacy is equality, false. `S₃`: inverse 3-cycles conjugate, true. `Q₈`: i and −i conjugate, true | Coprime power relation has the intended direction. |
| 1.4 closure | `C₃≤S₃` changes rational true to false; quotient `S₃/C₃=C₂` stays true; product of two rational C₂'s true | Subgroup closure is correctly denied. |
| 1.5 quasisimple | `1`: simple quotient false; `A₅`: perfect=true, central quotient A₅ simple=true; `S₅`: derived A₅≠S₅, false | Perfectness excludes the almost-simple overgroup. |
| 1.5–1.6 separation | `SL₂(5)`: center order 2, simple quotient order 60, perfect, quasisimple true; nontrivial center makes almost-simple false. `S₅`: center 1, socle A₅, almost-simple true, quasisimple false | Correct predicates; this is a README Check, not an acceptance theorem. |
| 1.6 centralizer and automorphism formulations | `A₅`: C_G(A₅)=1 and image Inn(A₅) has order 60. `S₅`: embeds into Aut(A₅) of order 120, containing Inn of order 60 | Both formulations give true on the base and the overgroup. |
| 1.7 complete groups | `S₀,S₁`: trivial, center 1, Aut 1, true. `S₂`: center order 2, false. `S₃`: center 1, Inn=Aut order 6, true | Small n exceptions handled; S₆ excluded in signature. |
| 1.8 elementary products | `1`: empty product 1, elementary=true; `C₃`: product 3, true; `S₃`: elementary product 1, false, hyperelementary product 2 | Divisibility 1∣2 holds; iff fails only in the first of these controls, R01. |
| 1.9 implication diagram | `S₃`: supersolvable=true,nilpotent=false; `A₄`: solvable=true,supersolvable=false; `C₂³`: supersolvable=true,metacyclic=false; `A₅²`: perfect=true,quasisimple=false | Named non-implications discriminate the predicates. |
| 1.10 components, layer and F* | `S₃`: no component, E=1, F*=C₃, centralizer order 3. `A₅`: E=G, F=1, F*=G, centralizer order 1. `A₅²`: two commuting components | `C_G(F*)≤F*` gives 3≤3, 1≤60 and cross-commutator 1. |
| 2.1 Hall-for-π | `S₃`, π={2}: order 2,index 3; π={3}: order 3,index 2; π=∅: order 1,index 6 | Prime/order and prime/index conditions separate the two factors. |
| 2.1 normal Hall complement | `C₃⊴S₃`: gcd(3,2)=1, complement C₂, semidirect order 3·2=6; normal Hall C₃ is characteristic | Non-normal order-two Hall subgroup prevents replacing “normal” by nothing. |
| 2.2 Hall existence/conjugacy/containment | `S₃`: three order-two Hall subgroups in one conjugacy orbit, one order-three Hall subgroup; each π-subgroup embeds into the corresponding one | Counts 3 and 1; solvable hypothesis holds. |
| 2.2 Sylow systems | `S₃`: P₂P₃ has 6 elements=P₃P₂; three choices of P₂ give three conjugate systems | Permutable does not mean elementwise commuting. |
| 2.3 Hall converse | `S₃`: 2-complement order 3 and 3-complement order 2, solvable=true; `A₅`: no order-15 subgroup, nonsolvable=true | Complement premise fails in the nonsolvable control. |
| 2.4 Sylow characterizations | `Q₈`: one Sylow-2, normal, nilpotent=true, nonabelian; `S₃`: three Sylow-2s, normalizer order 2,index 3, not nilpotent | 3 Sylows=normalizer index 3; A-group and nilpotent differ. |
| 3.1 Inn, Out and cardinal identity | `C₃`: Inn=1,Out order 2, 2·1=2; `S₃`: Out order 1, quotient-center order 6, 1·6=6; `Q₈`: 6·4=24 | Correct normalization, trivial Out versus trivial Inn distinguished. |
| 3.1 cyclic automorphisms and φ ratio | `C₁`: 1/φ(1)=1; `C₄`: 2/φ(4)=1; `S₃`: 6/φ(6)=3 | Existing cyclic-count theorem should be consumed, R08. |
| 3.2 automorphisms need not be solvable | `C₂³`: GL₃(F₂) order `(8−1)(8−2)(8−4)=168`, nonsolvable; G itself abelian | Intended non-implication holds. |
| 3.3 autjugacy and map from classes | `C₄`: four singleton conjugacy classes collapse to three order orbits; `Q₈`: five classes collapse to `{1},{−1},{±i,±j,±k}`, three | 3≤4 and 3≤5; fibres preserve element order and class size. |
| 3.4 subgroup counts | `C₄`: (subgroups, conjugacy classes, normal, characteristic)=(3,3,3,3); `Q₈`=(6,6,6,3); `S₄` has 30 subgroups,4 normal | Distinguishes characteristic from merely normal. |
| 3.5 power maps and exponent | `C₄`, g generator: `(g²)²=1=g⁴`, orders {1:1,2:1,4:2}; lcm=4, total=4. `S₄`: {1:1,2:9,3:8,4:6}, total24,lcm12 | Identity order occurs exactly once; power convention consistent. |
| 3.6 division relation and cyclic-subgroup criterion | `C₃`: g,g² generate the same subgroup and form one division; identity separate. `C₄`: g,g³ together, g² separate | Division counts 2 and 3, not class counts 3 and 4. |
| 3.6 rational iff count equality | `S₃`: divisions/classes=3/3,rational=true; `Q₈`:5/5,true; `A₄`:3/4,false; `A₅`:4/5,false | Both directions agree. |
| 3.6 maximal divisions | `C₆`: four divisions, only order-6 maximal cyclic. `C₄×C₂`: maximal cyclic subgroups of orders4 and2 | “Maximal” cannot mean largest element order only in arbitrary groups. |
| 3.7 units action and exponent 1 | `1`: e=1, unique unit represented by 0, `1⁰=1`, one orbit=one division. `C₃`: −1 swaps g,g², two orbits=two divisions | Modulus-one junk representative is harmless. |
| 3.7 action composition and cyclotomic sign | `C₅`: exponent2 twice gives g⁴; exponent3 after2 gives g⁶=g; corresponding roots ζ→ζ²→ζ⁴ | Arithmetic-power convention, not inverse exponent. |
| 4.1 length zero / one | `C₂`: derived set {1}, zeroth power {1}, c=0; `S₃`: derived set size3=commutator-set size3,c=1; `Q₈`: sizes2=2,c=1 | R02 corrects the convention; the Lean zero criterion matches these values. |
| 4.1 threshold and products | `A₅`: order60<96, all60 elements commutators,c=1; `S₄`: order24, derived/commutators12/12,c=1; `S₃×C₂`: c=max(1,0)=1 | Tests support the small-order theorem; the two order-96 examples were not independently constructed. |
| 4.1 commuting probability | `S₃`: 18 commuting ordered pairs/36=1/2=3/6; `Q₈`:40/64=5/8 | Already `commProb_def'`, R08. |
| 4.2 commutator map and representatives | `S₃`: [(12),(23)]=(132); reversed pair gives (123). `Q₈`: [i,j]=−1=[−i,j] | Central quotient is well defined and the sign convention is testable. |
| 4.2 image generates the derived group | `Q₈`: image {1,−1}, generated group order2=|G'|; `C₃`: image{1}, derived order1 | Zero map is ruled out on Q₈. |
| 4.3 isoclinism and compatibility | `C₂,C₄`: central quotients and derived groups all1; isoclinic despite orders2≠4. `Q₈,D₈`: central quotients V₄, derived C₂, generator commutator nontrivial | Compatibility excludes an arbitrary pair of unrelated isomorphisms. |
| 4.3 derived/nilpotency invariance | `C₂,C₄`: d=1,class=1 on both; `1,C₂`: d=0 versus1 despite isoclinism | The nontriviality guard is essential and present in prose. |
| 4.4 stem representatives and divisibility | Abelian class: stem representative1, order1 divides2,4. Q₈,D₈ are stem order8; Q₈×C₂ order16 is isoclinic but not stem | 8∣16, and the stem condition distinguishes the enlarged center. |
| 4.4 maximal stem extensions | Over V₄: Q₈ and D₈ have kernel C₂, order2; two nonisomorphic covers are isoclinic. Over1: any stem extension E must be abelian and perfect, so E=1 | Uniqueness cannot be asserted without perfectness of the base. |
| 5.1 Möbius orientation and recursion | `C₄`: μ(H,G) by H orders1,2,4 is 0,−1,1; sums above bottom `0−1+1=0`. Normal μ(1,N) is1,−1,0 | Reversing the interval changes the data. |
| 5.1 cyclic formula and vanishing | `C₄`: μ(1,G)=0=μ_arith(4), Frattini=C₂ not≤1. `C₆`: value1=μ_arith(6). `C₂²`: value2, three maximal lines | General lattice invariant is not the number-theoretic Möbius of group order. |
| 5.1 named values | `(S₄,A₅,A₄,Q₈)` gives `(-12,-60,4,0)` by subgroup recurrences; subgroup totals `(30,59,10,6)` | Values independently recomputed; keep as README Checks. |
| 5.2 zero-tuple convention | `1`: count=1=sum1, rank0≤0 true; `C₂`: count0=`2⁰−1⁰=0`, rank1≤0 false | Empty tuple generates exactly the trivial group. |
| 5.2 Eulerian formula | k=2: `C₃`:8=9−1; `S₃`:18=36−9−3·4+3; `S₄`:216=24²−12²−3·8²−4·6²+3·4²+4·3²+12·2²−12 | Direct tuple counts equal independently evaluated Möbius sums. |
| 5.2 rank and free automorphism action | `Q₈`: k=1 count0, k=2 count24, Aut order24, ratio1; `C₂²`: count6, Aut order6, ratio1; `S₃`:18/6=3 | Minimal k=2 and divisibility hold; no division by zero. |
| 5.2 Burnside basis | `C₂³`: Frattini1, quotient dimension3, rank3; `Q₈`: Frattini C₂, quotient V₄ dimension2,rank2 | p-group hypothesis distinguishes vector-space quotient. |
| 5.3 faithful-character inversion | `S₃`:3−2=1; `S₄`:5−3=2; `A₄`:4−3=1; `A₅`:5−1=4; `Q₈`:5−4=1 | Matches faithful rows of the respective character tables. |
| 5.3 abelian faithful criterion | `C₄`:4−2=2 faithful characters; `C₂²`:4−3·2+2=0; `1`:1 faithful trivial character | Cyclic=true/false/true agrees with positivity. |
| 5.4 permutation and transitive degrees | `1`:0 and1; `C₆`:2+3=5 and6; `C₂³`:3·2=6 and8; `Q₈`:8 and8; `C₄²`:4+4=8 and16 | Empty faithful action included; transitive degree uses nonempty coset actions. |
| 5.4 Johnson formula and unique minimal normal | `C₆`: two coset actions of indices2,3 have trivial kernel intersection, sum5. `Q₈`: every nontrivial subgroup contains −1, so a faithful family needs the index8 trivial subgroup | Gives5=5 and8=8; a single orbit need not minimize in C₆. |
| 5.4 alternating/symmetric degrees | `A₃=C₃`: degree3=3; `A₄`:4=4; `S₃`:3=3; `S₄`:4=4 | Lower orders rule out smaller faithful symmetric embeddings in these cases. |
| 6.1 character fields and conductors | `C₃`, χ(g)=ζ₃: degree2, conductor3, 3∣3. `C₄`, χ(g)=i: degree2, conductor4. Q₈ degree-two χ: fieldℚ,conductor1 | Adjoining character values is smaller than the full cyclotomic field in Q₈. |
| 6.2 Galois orbits and divisions | `C₃`: orbit sizes1,2; count2=division count2. `A₅`: sizes1,2,1,1; count4=4. Rational Q₈: five singleton orbits=5 | Sampled orbit statements have correct computed controls; ownership R08. |
| 6.2 stabilizer/field degree | `C₄` faithfulχ: units group order2, stabilizer1, index2=field degree2. Q₈ faithfulχ: stabilizer order2,index1=field degree1 | Rules out assigning the full cyclotomic field to every character. |
| 6.3 orbit sum and degree | `C₃`: nontrivial row `(2,−1,−1)`, degree2=2·1. `A₅` paired degree3 rows: `(6,−2,0,1,1)`, degree6=2·3 | Sums, not averages; values integral. |
| 6.3 table and coefficient field | `C₃`: rational table `[[1,1],[2,−1]]`, determinant−3≠0; `1`: table[1], but complex function i is outside its rational span | R07 specifies the rational-valued function space. |
| 6.4 Schur index, realization and divisibility | Q₈ faithfulχ: degree2,m_Q=2,m_C=1, 2∣2; over Q(i), realization degree2, 2∣2. C₃ faithfulχ: m_Q=1,field degree2 | Realization-field degree is measured over F(χ), not automatically over ℚ. |
| 6.4 Brauer–Speiser and real indicator | Q₈ χ: real values `(2,−2,0)`, indicator−1,m_R=2,m_Q=2≤2. S₃ χ₂: indicator1,m_R=m_Q=1 | Quaternionic case distinguishes rational-valued from rationally realizable. |
| 6.5 rational representations | Q₈ non-linear rational irreducible: dimension4=Schur2·orbit-degree2. C₃: dimension2=1·2. Trivial group: dimension1=1·1 | The Schur factor cannot be dropped. |
| 6.6 rational-group criterion | S₃ and Q₈: all rows rational and all coprime powers conjugate, true/true. C₃: ζ₃∉ℚ and g² not conjugate to g, false/false | Missing Lean headline is directly statable, R10. |
| 6.7 induction normalization | S₃, H=C₃, nontrivial linear ψ: induced degree `[G:H]=2`; at 3-cycle value ζ₃+ζ₃²=−1. Division by |H|=3 cancels the three representatives in each coset | Correct nonzero denominator and conjugation convention. |
| 6.7 monomial implications and Taketa | S₃ χ₂ induced from C₃; A₄ χ₃ induced from a V₄ linear character. Both solvable; A₄ not supersolvable. SL₂(3) has no index2 subgroup (abelianization C₃), so its degree2 character is not induced | Distinguishes both strict implications in prose. |
| 6.8 faithful linear degrees and junk values | `1`: lin=0,irr=1; C₄²:lin=2,irr=⊤; Q₈: complex lin=irr=2, rational irr=4 | `0≤1`, `2≤⊤`, `2≤2`; finite-dimensionality prevents fake degree0. |
| 6.8 socle cyclic-conjugacy criterion | C₄: socle C₂ generated by one element, faithful irreducibles exist; C₄²: socle C₂², conjugacy singleton cannot generate it, none | Non-example excludes replacing the criterion by a nonzero socle. |
| 7.1 Gassmann counts and fixed points | S₃ order-two stabilizers: all three conjugate, coset character on orders1,2,3 is `(3,1,0)`, count of other conjugacy classes0 | Conjugate copies must not inflate `gassmannCount`. |
| 7.2 Fano-plane triple | GL₃(F₂) has order168; point/line stabilizers each order24,index7. Their fixed counts at element orders1,2,3,4,7 are `(7,3,1,1,0)` on both | Gives the intended positive triple; exhaustive degree≤11 route is missing, R04. |
| 7.2–7.6 small-degree control | G=C₃ regular: point stabilizer1, no other subgroup with order1, Gassmann count0. For G=1, same count0 | Valid boundary cases; does not certify all reference-group counts at 7 and8. |
| 7.3 common quotient | Γ=ℤ, H=K=2ℤ, N=4ℤ: translation by evenγ fixes2 cosets, oddγ fixes0, before and after quotient. With K=Γ the identity counts2 versus1 | Quotient preserves counts; arbitrary unequal indices do not become equivalent. |
| 7.4 Perlis both directions | L=ℚ(i), H=K: same fixed field and same coset counts. H=1,K=G: at split prime5 the degree-one coefficient is2 versus1; identity coset counts2 versus1 | Equality=true/true and inequality=false/false without a degenerate L-function surrogate. |
| 7.5 arithmetic invariants | Identity comparison F=F'=ℚ(i): degree2=2, discriminant−4=−4, signature(0,1)=(0,1), unit rank0=0, roots4=4, hR=1=1 | Checks normalization only; de Smit–Perlis nonidentity example not certified. |
| 8.1 index and division count | S₃ natural: transposition cycles(2,1),index3−2=1=(2−1),b=1. A₄ natural: double transpositions and 3-cycles both index2; two minimal divisions,b=2 | Fixed points must count in `fullCycleType`. |
| 8.1 regular actions | V₄ regular: each nonidentity has cycles(2,2),index2; three divisions,b=3. C₃ regular: index2,two nonidentity classes but one rational division,b=1 | Divisions rather than ordinary classes matter. |
| 8.2 lcm and concentrated subgroup | S₃: minimal transpositions order2,d=2,normal closureG,not concentrated. C₃≀C₂ on6: minimal index2,orders3,d=3,generated subgroup order9<18 | Exact minimal-index subgroup separates the examples. |
| 8.2 semiconcentrated implication | C₃≀C₂: normal closure of one block's 3-cycle lies in base order9,proper; S₃: normal closure of any transposition order6=G | Concentrated example is semiconcentrated; symmetric counterexample fails both. |
| 8.3 elusive definition and prime degree | C₂ regular: involution fixed points0; C₃ regular: order3,fixed0; S₃ degree3: 3-cycle fixed0. `1` on one point: no prime-order element, elusive=true | Prime-degree theorem excludes degree1. FKS parenthetical also needs degree>1. |
| 9.1 lattice, rank0 and indecomposability | Zero lattice has rank0 and is not indecomposable; trivial and sign C₂ lattices each rank1; their sum rank2 decomposes | Native indecomposability does not admit zero as a spurious summand. |
| 9.1 Jordan–Zassenhaus specialization | G=1: one lattice isomorphism class in each rank; C₂ rank1: exactly two actions, +1 and−1 | Finite counts1 and2; general proof input still missing, R06. |
| 9.2 Diederichsen–Reiner models | p=2,h=1: trivial/sign/regular ranks1,1,2, count3=2·1+1. p=3,h=1: ranks1,2,3,again3 | Correct small-prime controls; first Lean alternative fails to specify the action, R09. |
| 9.2 prime cutoff | p=23 is prime; `23≤19` is false. Reiner's general prime-order hypotheses still apply | Present theorem cannot test the general classification. |
| 9.3 Herbrand unit character | Real quadratic: rank1, nontrivial automorphism acts−1, character(1,−1)=(2,0)−(1,1). Imaginary quadratic: rank0, character(0,0)=(1,1)−(1,1) | Archimedean decomposition groups and subtraction of trivial character match. |
| 9.4 half-lattice ambient group | Rank3 L₀: `(½L₀)/L₀ ≅ F₂³`, cardinal8. A d-dimensional subgroup has order2^d:1,2,4,8 | Arithmetic restriction to unit indices1,2,4 requires its own theorem; ambient group alone does not prove it. |
| 9.4 possible unit-module patterns | Subspaces of F₂³ of dimensions0,1,2: counts1+7+7=15. Coordinate permutations have1+3+3=7 orbits (line/normal-vector weights1,2,3) | Combinatorial bounds agree. Identifying the arithmetic module types still requires the unit-index theorem. |
| 10.1 stable lattice | A=`[[0,2],[1/2,0]]`, A²=I. Orbit sum is `ℤe₁+(1/2)ℤe₂`; in basis `(e₁,e₂/2)`, A becomes `[[0,1],[1,0]]` | Rational denominators are absorbed; integral conjugate exists. |
| 10.1 rank0,1 | n=0: only identity group and zero lattice. n=1: finite rational multiplicative subgroup is 1 or{±1}, both stabilizeℤ | Empty matrices/lattice are admissible. |
| 10.2 reduction kernel | n=1,p=3: −1 reduces2≠1, so finite subgroup injects. p=2: −1 reduces1 but has order2 | Explicit negative control justifies p≥3. |
| 10.2 order divisibility and sharp bound | M(0)=1,M(1)=2,M(2)=24,M(3)=48,M(4)=5760. GL₁(F₃) order2; GL₂(F₃) order48; cyclic C₆ order6 divides24 and48 | Mod-3 bound is weaker than sharp Minkowski bound, not its replacement. |
| 10.3 Z/Q conjugacy in low rank | n=1: subgroups1,{±1}, two Z-classes=two Q-classes. In rank2, involutions diag(1,−1) and swap are rationally conjugate; the sums of their integral eigensublattices have indices1 and2 | Integral and rational conjugacy differ. Counts13/73 not independently enumerated. |
| 10.4 dimension-four checks | `710−227=483≥0`; `5760/1152=5`. The latter is the numerical divisibility Check, not a proof of either class count | Class-count source unavailable; remove certificate target, R12. |
| 10.5 character dictionary | C₃: faithful characters ζ₃ andζ₃² define the same order3 subgroup ofℂ× after group automorphism g↦g²; averaging a positive form over three elements remains positive | Quotient by group automorphisms is necessary. |
| 10.5 Jordan boundary and finite-modulo-scalars | n=0: B=1,index1,J(0)=1. n=1: every B≤F× abelian, choose A=B,index1=J(1), including infinite B=ℚ× | Scalar-image finiteness need not imply B finite; theorem covers it correctly. |
| 10.5 nonabelian lower bound | SL₂(5) has order120 and abelian normal subgroup at most its center order2: index≥60, so J(2)≥60 | Positive-dimensional deep bound is not a rank-one stand-in. |
| 10.5 characteristic guard | SL₂(F₅): center index60; SL₂(F₇): center index168. Formula p(p²−1)/2 gives60 and168 | Exhibits why characteristic zero cannot be dropped from the uniform statement. |
| 10.5 irreducible dimension bound | B=ℂ× in n=1: an irreducible finite-dimensional module has one eigenline,dimension1≤J(1)=1; B=1 likewise1≤1 | Algebraic closure and finite-dimensionality are in the Lean signature. |
| 10.5 Schur formula | n=1 RHS `(√8+1)²−(√8−1)²=4√8≈11.314`, J(1)=1≤RHS; n=0 RHS0 versusJ(0)=1 | Stated n≥1 guard excludes the false boundary case. |
| 10.5 Collins value | For n=71, S₇₂ standard degree71 has no nontrivial abelian normal subgroup; minimum index72!, matching the asserted value72! | Checks the lower-bound witness only; the upper bound/source remains uncertified. |

### Pinned library and ownership audit

Pins: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Object searches used `roadmaps grep/show`, main, the pins, local board packages and supplied open heads. No fully qualified declaration collision was found in readable files; unprovided heads remain uncertified.

These 16 pinned inputs were opened, with the relevant restriction checked:

| Declaration/object | File and line at the pin | What it supplies / restriction |
|---|---|---|
| Modular-lattice Jordan–Hölder instance | `Mathlib/Order/JordanHolder.lean:81` | Modular lattice instance; group quotient identification still needs the second isomorphism theorem. |
| `CompositionSeries.jordan_holder` | `Mathlib/Order/JordanHolder.lean:454` | Series with equal endpoints; not equality of arbitrary different-ended series. |
| Möbius recursion | `Mathlib/Combinatorics/Enumerative/IncidenceAlgebra.lean:490` | Locally finite interval recursion, with the correct orientation. |
| Möbius inversion | `Mathlib/Combinatorics/Enumerative/IncidenceAlgebra.lean:539` | Finite sums/inversion needed for Hall and the normal-subgroup count. |
| `commProb_def'` | `Mathlib/GroupTheory/CommutingProbability.lean:96` | Exactly classes/order; already proves the proposed §4.1 identity. |
| `IsCyclic.card_mulAut` | `Mathlib/GroupTheory/SpecificGroups/Cyclic.lean:710` | Cyclic automorphism count; already supplies the totient formula. |
| `isZGroup_iff_exists_mulEquiv` | `Mathlib/GroupTheory/SpecificGroups/ZGroup.lean:319` | Cyclic semidirect product with coprime parameters. |
| Schur–Zassenhaus complement existence | `Mathlib/GroupTheory/SchurZassenhaus.lean:277` | Normal Hall subgroup / coprime order-index input. |
| `isSolvable_iff_subgroup_quotient` | `Mathlib/GroupTheory/Solvable.lean:177` | Normal subgroup and quotient; supports extension closure of solvability. |
| `IsCyclotomicExtension.autEquivPow` | `Mathlib/NumberTheory/Cyclotomic/Gal.lean:77` | Cyclotomic hypotheses, including irreducibility; valid over ℚ in the proposed use. |
| Dirichlet unit rank | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:456` | Rank of units modulo torsion. The existing `unitLattice`, line173, is a logarithmic image, not the new abstract quotient. |
| Elementary groups | `TauCeti/GroupTheory/Elementary.lean:131`, `144`, `293` | Real definitions and cyclic implies elementary, including the trivial group. |
| Character Galois power law | `TauCeti/RepresentationTheory/CharacterTable/Galois.lean:96`, `163` | Representation and FDRep forms; finite-dimensional characteristic-zero setup and root/exponent conditions retained. |
| `FDRep.ker_eq_bot_iff` | `TauCeti/RepresentationTheory/CharacterTable/Kernel.lean:155` | Torsion-group hypothesis; finite groups satisfy it. |
| Nilpotent implies induced linear character | `TauCeti/RepresentationTheory/Induction/Monomial.lean:131` | Finite group, algebraically closed characteristic-zero field. |
| `TauCeti.schurMultiplier` | `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:148` | Cohomological multiplier `H²(G,k×)` in an additive category. It is not definitionally integral H₂; §4.4 needs the supplied comparison, not a carrier-name substitution. |

Resolved cross-roadmap contracts and their limits:

| Citation | Actual owner inspected | Resolution |
|---|---|---|
| Character fields/Galois action | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:762`, §4.4 | Exact overlap, R08. Layers 0–4 and 7 are real, but “A–D” is not an exact substitute for their numbered targets. |
| Gassmann equivalence and S₁₆ pair | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`, §§2.1–2.2 (lines365 and454) | The named mathematical targets exist as roadmap targets; absence at the library pin is not supplier drift. |
| Projective representations/Schur covers | Same roadmap §7 (line818); `TauCetiRoadmap/InductionRestrictionPartII/README.md`, RS.0 | Integral-homology/cohomology comparison and covers belong there; they are not a new generic construction owned by §4.4. |
| Transitive-group reference classification | `Completed/PolynomialGaloisGroups/README.md:35`, `57`, `1172`, `1385` | Only degree≤5 supplied; invented larger contracts in R04. |
| CFSG proposition | `TauCetiRoadmap/CFSGStatement/README.md`, Layer A | Actual named proposition is `ClassificationStatement`; the unqualified `CFSG` citation needs to identify this intended proposition. |
| Malle invariants | `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md`, §3.9 | The mathematics of index/a/b is present. Exact names `malleIndex`, `malleB` etc. are not all declarations there; cite the target contract, not invented pinned identifiers. |
| Splitting/Frobenius | `Completed/NumberFieldArithmetic/README.md:548`, `623`, `636`, `647` (§§1.4,2.1–2.3) | Supplies the finite-prime splitting interpretation used by Perlis. |
| Chebotarev | `Completed/Chebotarev/README.md` | The completed roadmap is the supplier; the outdated active-folder link should point to it. |
| Artin formalism and conductor–discriminant | `TauCetiRoadmap/ArtinRepresentations/README.md:751`, `780`, `894`, `996` (§§3.2,3.4,4.2,5.1), supplied open head | Actual supporting targets; use these sections instead of an unlocated “sibling”. Its scope deferral of group invariants is not itself a proof-dependency cycle. |
| Rational symmetric-group models | `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md`, conventions and Layer4 | Rational Specht models and absolute irreducibility support Schur index1 for symmetric groups. |
| Maximal cyclotomic order/local freeness/class group | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:15344`, `15687`, `16263` (§§7.40,7.54,7.77) | Real contracts, but not the missing general finiteness in R06. |
| Biquadratic fields | `Completed/Multiquadratic/README.md:84`, Layer0 | Fields/subfields supplied, not the asserted Kuroda formula. |
| Continuous automorphisms | `TauCetiRoadmap/ProfiniteArithmetic/README.md`, Layer2 | Owns the continuous outer-automorphism theory; this roadmap's discrete `Out` is a distinct construction. |
| Units | `TauCetiRoadmap/HeightsAndUnits/README.md` and the native Dirichlet theorem above | Unit/regulator context, not a substitute for the integral Galois module classification. |
| Jordan downstream contract | `TauCetiRoadmap/SatoTateGroups/README.md:1158–1166`, §7.1, supplied open head | Explicitly consumes this roadmap's §10.5 with the same characteristic-zero convention. It is not a supplier edge pointing upward. |

Group-invariant extensions can be owned here; the character action, covers, base Malle invariants and arithmetic suppliers must be imported. Scope deferrals are not proof dependencies.

### Seeded source audit

All 15 sampled targets were checked. No additional locator is flagged unverified. The sources service was used for all 28 works (including Fein–Kantor–Schacher): five texts obtained, three paywalled/uncertified, 20 unreadable. No unread text is marked verified.

| Seeded target | Text/locator examined | Outcome |
|---|---|---|
| 0.5 Jordan–Hölder | Kurzweil–Stellmacher, Chapter1 only | Paywalled/uncertified; no theorem/page given. Native lattice theorem checked separately, not a verification of the cited book. |
| 1.6 Almost simple | No source locator attached | Definition and A₅/S₅/SL₂(5) tests inspected; source support not verifiable. |
| 3.6 Divisions | `lmfdb` line90, `group.division` knowl | Supports conjugate coprime powers. Line92 supports rational-character constancy; not every counting corollary in this section. |
| 3.7 Cyclotomic orbits | No exact external locator; Mathlib cyclotomic declaration opened | Native Galois/units identification checked; quotient bridge tested at exponents1,3,5. No source theorem/page was supplied for the full bridge. |
| 4.2 Central-quotient commutator | Hall1940 whole-paper reference | Legal text not obtained; representative-independence and commutator sign calculated directly. |
| 5.1 Möbius functions | Native incidence-algebra declarations, lines490 and539 | Recursion/inversion support verified at pin. Hall vanishing theorem has no exact source locator. |
| 5.2 Eulerian formula | Hall1936, pp.134–151 only | Publisher returned403. Formula independently tested by direct tuple counts; paper not certified. |
| 5.3 Faithful-character inversion | Native character kernel and incidence-algebra APIs | Finite normal-lattice inversion checked mathematically and numerically. No external theorem/page supplied for the full statement. |
| 6.2 Character Galois action | Pinned Galois law; CharacterTheory §4.4 | Exact existing owner found. Brauer permutation/orbit-count assertion still lacks an exact external locator. |
| 6.4 Schur index | Isaacs Chapter10; no precise theorem/page | Full text unavailable. Q₈ and C₃ computations support the normalization but do not certify the chapter citation. |
| 6.5 Rational representations | Tau Ceti realization/character comparison route, no external locator | Schur multiplicity tested; no exact source passage certifiable. |
| 6.6 Rational groups by characters | No exact locator | Both-direction controls computed; signature proved statable, not proved true by elaboration. |
| 6.7 Monomial groups | Isaacs Chapters5–6; pinned nilpotent induction | Nilpotent special case verified at pin; general supersolvable/Taketa/Taunt locators remain uncertified. |
| 8.3 Elusive groups | `fks` lines88–96, Theorem1, printed p.41 | Prime-power derangement result verified for degree>1; proof explicitly invokes CFSG. It does not supply the claimed exhaustive degree≤11 classification. |
| 10.1 Stable lattices | `serre` lines187–192, §1.3.1, p.4 of arXiv:1011.0346v1 | Finite rational matrix group stabilizes the sum of translates of ℤⁿ. This verifies that construction, not the separate Jordan–Zassenhaus finiteness conclusion. |

Additional legal-source checks: `serre` lines85–120 give Theorem1, the prime-adic bound/attainment and values `M(1)=2`, `M(2)=24`, `M(3)=48`, `M(4)=5760`; lines146–154 give the torsion-free congruence-kernel lemma for modulus at least3. The version read is the 2010 arXiv reproduction of the 2007 chapter, and the page references here deliberately use that version. `reiner` lines131–142, printed p.145, give the general prime-order module invariants and `2h+1` indecomposables. `kubota` lines240–254 locate Satz1 on printed p.72, but the extracted formulas are too damaged to certify every stated unit-module normalization from them.

Legal copies used: [Serre's arXiv version](https://arxiv.org/abs/1011.0346), [Reiner's AMS article](https://www.ams.org/journals/proc/1957-008-01/S0002-9939-1957-0083493-6/S0002-9939-1957-0083493-6.pdf), [Fein–Kantor–Schacher author-hosted scan](https://pages.uoregon.edu/kantor/PAPERS/BrauerGroups.pdf), [LMFDB division definition](https://www.lmfdb.org/knowledge/show/group.division), and Kubota's publisher-open Cambridge scan. Source text remains in the source cache; this report contains no copied passage.

## Not verifiable

- **Paywalled/uncertified:** `kurzweil_stellmacher` (Springer DOI); `guralnick` (Elsevier DOI); `malle_2002` (Elsevier landing page). Their locators are retained without a claim to have read the texts, and they are not re-requested as missing.
- **No legal readable text returned:** `isaacs_ct` (bibliographic resolver; NAU institutional candidate failed TLS); `robinson`, `brown`, `curtis_reiner_1962`, `curtis_reiner_methods`, `diederichsen`, `karpilovsky`, `perlis` (bibliographic resolver); `aschbacher` (Cambridge book metadata only); `isaacs_fgt` (AMS ebook metadata only); `newman` (resolver returned a review, not the book); `johnson` (JSTOR metadata); `desmit_perlis` (AMS landing page); `hall_eulerian`, `hall_1937`, `malle_2004` (publisher403); `hall_isoclinism` (De Gruyter landing page, no readable full text); `hall_1928` (Crossref429/publisher403); `collins` (Crossref429); `lemmermeyer` (Crossref429/IM PAN landing page, attempted institutional copy404). The missing-reference record includes all 20 works, using stable keys and recording these attempts. It does not request parking or posting anything.
- The existing bibliography has no precise locators for much of the seeded sample. Reading an alternative native declaration or computing an example is not a substitute for verifying the claimed source at its locator.
- Kubota's source was obtained legally and Satz1 located, but its formula extraction is damaged. The numerical `15`/`7` unit-module-type assertion, its saturation assumptions and the exact imaginary/real unit-index normalizations have not been certified. The elementary half-lattice count in the table deliberately does not claim to settle them.
- The full order-96 presentations and commutator counts, complete small-transitive-group lists, `M₁₁` degree12, the nonisomorphic arithmetic-equivalence examples, and the exhaustive dimension2–4 matrix-class counts were not independently reconstructed. Their small/boundary controls are shown; their general certification requires the missing sources and contracts above.
- All provided readable sibling heads were included in the ownership search, along with main and local board packages. Search results concerning other open work without a supplied readable head were not used to manufacture findings. Ownership against those unprovided open pull requests is not certified.

## Source issues

- none
