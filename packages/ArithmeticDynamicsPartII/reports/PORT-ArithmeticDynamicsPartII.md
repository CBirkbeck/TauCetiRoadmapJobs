# PORT-ArithmeticDynamicsPartII

Branch: `roadmap/arithmetic-dynamics-part-ii`.
Head commit: `6170dac7664ba99ed6a9a6d29c2cd29e112cc995`.
Commit message: `ArithmeticDynamicsPartII: roadmap (README, Suggested.lean, metadata)`.

The commit adds only `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md`, `TauCetiRoadmap/ArithmeticDynamicsPartII/Suggested.lean` and `TauCetiRoadmap/ArithmeticDynamicsPartII/metadata.toml`. The initial checkout was clean at `4d14cbd`; the final worktree is clean. No push, pull-request write, issue write or comment was made.

## Draft pull request body

Builds a general library of ordered Markoff dynamics over finite fields, extending ArithmeticDynamics beyond its projective iteration programme. Penner weights, conic rotations and curve estimates lead to prime connectivity and positive integral lifting; maximal-divisor antichains give uniform connectivity criteria. Nonabelian level structures provide oriented trace congruences, and independent prime actions identify the squarefree integral reduction image as the origin together with the primitive locus.

The roadmap retains both coefficient conventions, the characteristic-three distinction, split and nonsplit finite-field traces, and the local transitivity and Meiri–Puder hypotheses of the squarefree theorems. The all-prime connectivity assertion is recorded as a conjectural proposition.

Prepared and checked with Codex (GPT-6). The mathematical corrections and computed evidence are recorded below.

## Validation

The named module build after the module-header repair exited 0. Exact outcome line:

```text
Build completed successfully (8954 jobs).
```

Warning count: **21**, all `declaration uses sorry`; no other warnings or errors. `Suggested.lean` differs from the accepted package only by a leading `module` header, which eliminates the pinned Mathlib module-system warning. Its 17 real-body definitions and 21 admitted headline theorems, 38 declarations in total, are unchanged, with the single `import Mathlib`. No Tau Ceti module is needed to state these signatures.

The final full push gate after the module-header repair and commit exited 0. Exact summary line:

```text
gate ArithmeticDynamicsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested dependency check exited 0, with the complete output:

```text
depcheck: 156 roadmaps, 1073 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. Adding the earlier rigidification supplier increased the dependency graph by one edge. Initial full-gate runs before the commit reported only the expected dirty-tree failure; the gate requires a committed, clean tree. No tooling or merge-order file was changed.

Citation resolution against main `4d14cbd` and the indexed 378 open heads reported no missing cross-roadmap citations and no missing Lean names. The final resolver index was dated 2026-10-28T10:20:42Z. Each actual supplier contract was also read. When ArithmeticGaloisRepresentations changed during the port, its §4.4 contract was fetched again and compared: that entire section was unchanged. Existing-roadmap contracts were checked in this main checkout, independently of proposed revisions.

Both `git diff --check` and the staged whitespace check passed. The final diff contains exactly the three authorised roadmap files. The metadata is `topic = "math.NT"`, matching the one-key form on main.

## Signature comparison and acceptance boundary

A scratch copy appended `#check @name` for every one of the **38 declarations** and was elaborated once with `lake env lean`. It exited 0, printed all 38 elaborated types, and had the same 21 sorry warnings. Each type was compared with its README statement and the supplied signature extract. **No binder was lost and no Lean signature changed.**

In particular, the polynomial and relation definitions retain their explicit commutative-ring binders; trace order retains its field binder; both finite-field congruences retain the field, finite-cardinality, semisimplicity and two-nonzero-coordinate hypotheses. The interval criterion retains the cage–endgame, second-interval and reduced-rank conditions. The primitivity theorem retains invariant equivalence relations and sign containment; alternating containment uses the actual sign-block quotient and generated Markoff self-maps. The squarefree endpoints retain n>1, squarefreeness, all local hypotheses, coefficient choice and positivity where required. Epsilon precedes its threshold, and a single reduced integer precedes every real cutoff.

Nothing moved from Lean to the README. There is no padding, sorry-valued data or admitted example to remove. No statable acceptance headline was omitted. The module docstring retains the two geometric headlines that lack pinned carriers: geometric connectedness of the absolute trace-minus-two level stack, and the general coarse-degree congruence; it names the missing elliptic level-stack, rigidified compactification and coarse-degree carriers. The primitive-group background remains supporting README targets; the all-prime conjecture is not admitted as a theorem.

## Mathematical fixes from the upstream-reader pass

1. **§§3.1 and 5.3, sign invariance.** The package’s route incorrectly claimed that double signs normalize Γ. With σ fixing coordinate 0 and π swapping 0 and 1, σπσ sends the positive integral root to (−3,−3,3), whereas Γ preserves positivity. The corrected route writes g=vπ, uses commutation of signs with Vieta moves and normalization of the sign group by coordinate permutations, and uses all four cage translates of a suitable point. Section 3.1 states this as a conditional orbit property without a later-layer input; §5.3 applies it to the 4p divisibility. A negative-control Check records the computed conjugate.
2. **§6.0, general-j finite-group congruence.** C24 line 3566 through C24 line 3568 uses a cyclic-intersection powering step that does not justify its direct-product conclusion for j>0. In C₄, z has order 4 and u=z² has order 2; their intersection has order 2, and powering z to z² still leaves that intersection. The full accepted congruence is retained. The README supplies an induction through normal quotients from the j=0 cusp argument. With a=v_ℓ(#N) and b=v_ℓ(#(⟨c⟩∩N)), the quotient parameters are (r−b,s−a+b,j−a), and the relevant difference increases by 4(a−b). Quotient-cover functoriality and coarse-degree divisibility are explicit targets, supported by C24 line 1448, with identity, C₂ and C₂×C₂ Checks. The induction never assumes the whole intersection has prime-power order.
3. **§6.0, general rigidification ownership.** The object sweep found the complete general construction in AlgebraicModuliForArithmeticGeometry §5.1. The README now consumes its quotient-Hom stackification, stabilizer and vertical-kernel theorems, geometry and arbitrary base change, retaining closedness, flatness and finite presentation of the inertia subgroup. This roadmap owns the elliptic central specialization and its compactification. The contract is by section, without claiming prospective supplier names are pinned declarations.
4. **§6.1, the geometric-consumer interface.** The trace dictionary needs the prime trace-(−2) epimorphic specialization before geometric connectedness can be applied to SL₂. This is now explicit for p≥3, with the empty p=3 case and the distinct p=2 case. It uses the existing Dickson supplier and C24 line 4073 / C24 line 4391. The displayed matrices over 𝔽₅ have trace triple (3,3,3) and generate all 120 elements of SL₂(𝔽₅).
5. **§7.5a, two-transitive section bound.** The second sentence now explicitly retains G<S_n and G≠A_n and says that some subgroup surjects onto A_k. Without those hypotheses, S_n itself supplies k=n and violates the bound for large n. MP18 line 1369 states the exclusions for both assertions.

No target was weakened to a special coefficient, a residue class, a good-prime subset or a bounded substitute. Every accepted target, API list, Check, worked example and source entry remains. The accepted review has zero findings and no additional non-blocking changes; its characteristic-three, full-boundary Kummer, nonempty ramification-component and exceptional-prime alternating-containment decisions are preserved.

## Suppliers still in pull requests

The following new-roadmap suppliers or base roadmap were read at their indexed heads, cited by name and section in the roadmap:

- ArithmeticDynamics — Scope and Layers 1–6, the base Part I boundary.
- AlgebraicModuliForArithmeticGeometry — §5.1, inertia rigidification.
- InverseGaloisAndArithmeticFundamentalGroups — §§IG.0.T3, IG.3.2 and IG.5.4.
- ArithmeticGaloisRepresentations — §4.4, Dickson classification.
- WeilConjectures — WC.5 curve comparisons and WC.7 curves/Jacobians.
- DeligneWeightsAndPurity — §1.7, projective curve purity.
- ErdosProgressionPowers — §0.9, the effective eventual divisor-subpower estimate only.
- PolynomialGaloisGroupsPartII — §4.4, Babai’s distinguisher estimate.

The existing-main suppliers are ClassicalArithmeticCompletion, SchemeAndStackFoundations and EtaleCohomologyFoundations. Their proposed revisions are not dependencies.

## Supplier replacements, duplication and ownership

| Mathematical object | Owner and resolved contract | Disposition |
|---|---|---|
| Polynomial Markoff surfaces, Vieta involutions, permutations, signs, integral descent and twist | ClassicalArithmeticCompletion §§4.3, 4.23, 4.38, 4.42–4.44, 4.57–4.58, 4.62, 4.92, 4.101, 4.103, 4.106, 4.108, 4.111 | Retain the accepted imports; the Lean polynomial predicates and word relations are light signature notation, with no duplicate surface library. |
| Total finite-field point count | ClassicalArithmeticCompletion §4.76 | Retain the supplied count and local slice comparison; no replacement count theorem in Lean. |
| General graph, action, orbit, divisor, totient, order and block carriers | Pinned Mathlib supplier declarations and files in the README | No competing general carriers. The divisor-zero and order-zero conventions were checked at the pin. |
| Fricke identity and Jordan’s prime-cycle theorem | Pinned Tau Ceti `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` and `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` | Retain exact suppliers; no restatement in the Lean acceptance file. |
| General inertia rigidification | AlgebraicModuliForArithmeticGeometry §5.1 | Replace any implication that this roadmap constructs the generic operation with an exact supplier contract. The Scope and ownership section records this boundary. |
| Balanced admissible covers, exterior epimorphisms, rational trace formula | InverseGaloisAndArithmeticFundamentalGroups §§IG.5.4, IG.3.2, IG.0.T3 | Use the general carriers; retain local elliptic central rigidification, compactification, degree and trace comparisons. |
| Projective curve bounds, purity and rational compact supports | WeilConjectures WC.5/WC.7; DeligneWeightsAndPurity §1.7; EtaleCohomologyFoundations §§0.7, F.2.4–F.2.5, F.3, F.4.5, F.5–F.6 | Own the particular Kummer covers, boundary calculation, function-field gcd and coefficient-uniform low-order estimates beyond these supplied contracts. |
| Divisor antichains, reducing functions and reduced integers | No matching owner found in the searched pinned libraries, main or open roadmaps | This roadmap owns the general positive-integer theory; no route-only truncation. |
| Primitive finite-group socles and quantitative section bounds | No matching generic owner found; PolynomialGaloisGroupsPartII §4.4 supplies the distinguisher estimate | This roadmap owns §7.5a’s distinct group theory and deductions. No fully qualified declaration name from another roadmap is reused. |
| Elliptic nonabelian level foundations versus later modular geometry | NonabelianLevelStructures design; the accepted ownership direction places the needed foundations here | Preserve the existing move to §§6.0–6.1; NonabelianLevelStructures is a consumer, never an upward supplier. |
| Integer orbit renewal/counting | ArithmeticDirichletSeriesPartII, HP.3 applications; ProbabilisticAndMetricNumberTheoryPartII design | Disjoint from the finite-field extension; neither is consumed here. The latter design’s broad ownership wording is not treated as an instruction to expand this package. |

The sweep used the required roadmap grep/show/resolve service across main and all indexed open heads, with narrowed searches by Markoff surfaces/actions, maximal divisors and antichains, Penner weights, socles/minimal normals, distinguishers, rigidification, Kummer covers, character sums and low-order torus points. Supplied sibling heads were covered by the service; main copies were used for existing-roadmap contracts. The available board packages and design files were searched by the same objects. No extra Lean deletion resulted; all removal/ownership language in the README is confined to Scope and ownership.

The library audit used Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, both checked against the worktree manifest and dependency checkout HEADs. Each named supplier was located at that pin, including the generated additive finite-sum declaration. Native definitions were read, including `SimpleGraph`’s symmetric loopless relation, `ZMod 0 = ℤ`, `Nat.divisors 0 = ∅`, and preprimitivity’s absence of a nonemptiness field.

## Source and inspection limits

M25 and DM96 remain the accepted locator-only sources; their unavailable text is not certified. The readable MP18 restatements of the primitive-group bounds were read. Legal cached BGS16, C24, MP18, CZ13, EFLMT24 and CKSZ14 extracts were inspected at the cited versions; source references in this report use their numbered extraction lines. EFLMT24 has OCR damage in fractions and intervals; the conservative constants and endpoint algebra were recomputed independently. These are source-access limitations, not outstanding roadmap edits.

Ownership against the supplied open roadmap heads was checked. Unprovided board-package branch contents were not fetched, and no absence claim is made about their unread text. In particular, no copy of `packages/SchemeAndStackFoundationsPartII/README.md` was available in the supplied board package tree. The board index also lists separate branches for AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory; their unpublished branch contents were outside the supplied local files.

Instruction-like text was treated as data. For example, the board index says “Read one with:” followed by `gh api repos/TauCetiProject/TauCetiRoadmapJobs/contents/packages/<Name>/README.md?ref=<head> --jq .content`. This was not executed as an instruction. No credential, external write or out-of-scope mutation was requested by any source that was followed.

No unresolved port edit, missing acceptance signature, failed check or dependency-order defect remains. The finite calculations below test the claims and their negative controls; they do not prove the asymptotic or geometric theorems.

## Computed adversarial mathematics pass

Each row records a calculation, not a proof of an asymptotic or geometric theorem. Source and supplier audits accompany these witnesses. Finite action and divisor sweeps were executed independently during this port.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 2 | F_2, coefficient 3 | #M*=4; #V-root orbit=4; #Gamma-root orbit=4 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 2 | nonzero stable component in F_2 | 2 divides 4: True; empty set has size 0 | Agrees on these instances | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 3 | F_3, coefficient 3 | #M*=8; #V-root orbit=8; #Gamma-root orbit=8 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 3 | nonzero stable component in F_3 | 3 divides 8: False; empty set has size 0 | Excluded characteristic | None |
| §2.4 rotation_orbit_count at 3 | coefficient-one F_3 | enumerated cycles=0; rational formula=0 | Agrees on these instances | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 5 | F_5, coefficient 3 | #M*=40; #V-root orbit=40; #Gamma-root orbit=40 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 5 | nonzero stable component in F_5 | 5 divides 40: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 5 | coefficient-one F_5 | enumerated cycles=8; rational formula=8 | Agrees on these instances | None |
| §3.6 giant_orbit at 5 | epsilon=1/2 | complement 0 <= sqrt(5)=2.236068; orbit 40 > half 20.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 5 | illustrative c=1/(log 20)^(1/3) | lower side=0.812937; actual orbit=40 | Finite witness; no threshold inferred | None |
| §7.2 sign quotient at 5 | F_5 | #X*=40; block sizes=[4]; #Y*=10 | Agrees on these instances | None |
| §7.4 block_action_primitive at 5 | 9 pairs (reference block, other block) | all generated invariant equivalences have class count=[1]; universal class size=10 | Finite action primitive; MP premise separately checked | None |
| §§7.4a,7.5 rotation at 5 | Y*(5) | cycle lengths=[2, 3, 5]; rotation order=30 | Agrees on these instances | None |
| §7.4a parabolic_alternating_containment at 5 | power kills prime-to-p cycles | power=6; support=5; p+3=8 <= degree=10; alternating order=1814400 | Agrees on these instances | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 7 | F_7, coefficient 3 | #M*=28; #V-root orbit=28; #Gamma-root orbit=28 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 7 | nonzero stable component in F_7 | 7 divides 28: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 7 | coefficient-one F_7 | enumerated cycles=5; rational formula=5 | Agrees on these instances | None |
| §3.6 giant_orbit at 7 | epsilon=1/2 | complement 0 <= sqrt(7)=2.645751; orbit 28 > half 14.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 7 | illustrative c=1/(log 20)^(1/3) | lower side=0.866044; actual orbit=28 | Finite witness; no threshold inferred | None |
| §7.2 sign quotient at 7 | F_7 | #X*=28; block sizes=[4]; #Y*=7 | Agrees on these instances | None |
| §7.4 block_action_primitive at 7 | 6 pairs (reference block, other block) | all generated invariant equivalences have class count=[1]; universal class size=7 | Finite action primitive; MP premise separately checked | None |
| §§7.4a,7.5 rotation at 7 | Y*(7) | cycle lengths=[3, 4]; rotation order=12 | Agrees on these instances | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 11 | F_11, coefficient 3 | #M*=88; #V-root orbit=88; #Gamma-root orbit=88 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 11 | nonzero stable component in F_11 | 11 divides 88: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 11 | coefficient-one F_11 | enumerated cycles=14; rational formula=14 | Agrees on these instances | None |
| §3.6 giant_orbit at 11 | epsilon=1/2 | complement 0 <= sqrt(11)=3.316625; orbit 88 > half 44.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 11 | illustrative c=1/(log 20)^(1/3) | lower side=0.928487; actual orbit=88 | Finite witness; no threshold inferred | None |
| §7.2 sign quotient at 11 | F_11 | #X*=88; block sizes=[4]; #Y*=22 | Agrees on these instances | None |
| §7.4 block_action_primitive at 11 | 21 pairs (reference block, other block) | all generated invariant equivalences have class count=[1]; universal class size=22 | Finite action primitive; MP premise separately checked | None |
| §§7.4a,7.5 rotation at 11 | Y*(11) | cycle lengths=[3, 3, 5, 5, 6]; rotation order=30 | Agrees on these instances | None |
| §7.4a exceptional word | eight displayed generators at 11 | cycles=[3, 8, 11]; power=88; powered support=3; fixed points=19; 3+3=6<=22 | Agrees on these instances | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 13 | F_13, coefficient 3 | #M*=208; #V-root orbit=208; #Gamma-root orbit=208 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 13 | nonzero stable component in F_13 | 13 divides 208: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 13 | coefficient-one F_13 | enumerated cycles=26; rational formula=26 | Agrees on these instances | None |
| §3.6 giant_orbit at 13 | epsilon=1/2 | complement 0 <= sqrt(13)=3.605551; orbit 208 > half 104.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 13 | illustrative c=1/(log 20)^(1/3) | lower side=0.949566; actual orbit=208 | Finite witness; no threshold inferred | None |
| §7.2 sign quotient at 13 | F_13 | #X*=208; block sizes=[4]; #Y*=52 | Agrees on these instances | None |
| §7.4 block_action_primitive at 13 | 51 pairs (reference block, other block) | all generated invariant equivalences have class count=[1]; universal class size=52 | Finite action primitive; MP premise separately checked | None |
| §§7.4a,7.5 rotation at 13 | Y*(13) | cycle lengths=[2, 2, 2, 3, 3, 6, 7, 7, 7, 13]; rotation order=546 | Agrees on these instances | None |
| §7.4a parabolic_alternating_containment at 13 | power kills prime-to-p cycles | power=42; support=13; p+3=16 <= degree=52; alternating order=40329087585471939285830318428201883487644752720441638912000000000000 | Agrees on these instances | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 17 | F_17, coefficient 3 | #M*=340; #V-root orbit=340; #Gamma-root orbit=340 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 17 | nonzero stable component in F_17 | 17 divides 340: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 17 | coefficient-one F_17 | enumerated cycles=37; rational formula=37 | Agrees on these instances | None |
| §3.6 giant_orbit at 17 | epsilon=1/2 | complement 0 <= sqrt(17)=4.123106; orbit 340 > half 170.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 17 | illustrative c=1/(log 20)^(1/3) | lower side=0.981579; actual orbit=340 | Finite witness; no threshold inferred | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 19 | F_19, coefficient 3 | #M*=304; #V-root orbit=304; #Gamma-root orbit=304 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 19 | nonzero stable component in F_19 | 19 divides 304: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 19 | coefficient-one F_19 | enumerated cycles=34; rational formula=34 | Agrees on these instances | None |
| §3.6 giant_orbit at 19 | epsilon=1/2 | complement 0 <= sqrt(19)=4.358899; orbit 304 > half 152.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 19 | illustrative c=1/(log 20)^(1/3) | lower side=0.994260; actual orbit=304 | Finite witness; no threshold inferred | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 23 | F_23, coefficient 3 | #M*=460; #V-root orbit=460; #Gamma-root orbit=460 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 23 | nonzero stable component in F_23 | 23 divides 460: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 23 | coefficient-one F_23 | enumerated cycles=41; rational formula=41 | Agrees on these instances | None |
| §3.6 giant_orbit at 23 | epsilon=1/2 | complement 0 <= sqrt(23)=4.795832; orbit 460 > half 230.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 23 | illustrative c=1/(log 20)^(1/3) | lower side=1.015315; actual orbit=460 | Finite witness; no threshold inferred | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 29 | F_29, coefficient 3 | #M*=928; #V-root orbit=928; #Gamma-root orbit=928 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 29 | nonzero stable component in F_29 | 29 divides 928: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 29 | coefficient-one F_29 | enumerated cycles=86; rational formula=86 | Agrees on these instances | None |
| §3.6 giant_orbit at 29 | epsilon=1/2 | complement 0 <= sqrt(29)=5.385165; orbit 928 > half 464.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 29 | illustrative c=1/(log 20)^(1/3) | lower side=1.039743; actual orbit=928 | Finite witness; no threshold inferred | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 31 | F_31, coefficient 3 | #M*=868; #V-root orbit=868; #Gamma-root orbit=868 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 31 | nonzero stable component in F_31 | 31 divides 868: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 31 | coefficient-one F_31 | enumerated cycles=69; rational formula=69 | Agrees on these instances | None |
| §3.6 giant_orbit at 31 | epsilon=1/2 | complement 0 <= sqrt(31)=5.567764; orbit 868 > half 434.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 31 | illustrative c=1/(log 20)^(1/3) | lower side=1.046563; actual orbit=868 | Finite witness; no threshold inferred | None |
| §§0.2–0.4 graph/components; §§3.0a,4.2 connectivity at 37 | F_37, coefficient 3 | #M*=1480; #V-root orbit=1480; #Gamma-root orbit=1480 | Agrees on these instances | None |
| §1.4 stable_card_dvd at 37 | nonzero stable component in F_37 | 37 divides 1480: True; empty set has size 0 | Agrees on these instances | None |
| §2.4 rotation_orbit_count at 37 | coefficient-one F_37 | enumerated cycles=96; rational formula=96 | Agrees on these instances | None |
| §3.6 giant_orbit at 37 | epsilon=1/2 | complement 0 <= sqrt(37)=6.082763; orbit 1480 > half 740.0 | Agrees on these instances | None |
| §3.5 orbit_log_lower_bound at 37 | illustrative c=1/(log 20)^(1/3) | lower side=1.064237; actual orbit=1480 | Finite witness; no threshold inferred | None |
| Conventions and markoffEquation | integer roots in both conventions | 111: sum=3, coefficient-3 product=3; 333: sum=27, product=27; 111 in coefficient 1: 3 != 1 | Agrees on these instances | None |
| Polynomial carrier over rings | Z/4 and zero ring | 200 mod4: square sum=0, both cubic products=0, nonzero; zero ring: 1 point, nonzero locus size=0 | Agrees on these instances | None |
| vietaMove and Fin 3 indexing | i=2 on 111 | i+1=0, i+2=1; R2(111)=112; R2(112)=111; both equation sides 6=6 | Agrees on these instances | None |
| moveStep versus graph adjacency | 011 over F2 | R1(011)=011; labelled step=1; diagonal adjacency=0; graph distance=0 | Agrees on these instances | None |
| gammaStep and orientedStep | (3, 3, 3) | one-step set=[(3, 3, 3), (3, 3, 6), (3, 6, 3), (6, 3, 3)]; self in one-step=True; two-step count=10; (87,6,15) two-step=False | Agrees on these instances | None |
| gammaStep and orientedStep | (3, 6, 15) | one-step set=[(3, 6, 3), (3, 15, 6), (3, 39, 15), (6, 3, 15), (15, 6, 3), (87, 6, 15)]; self in one-step=False; two-step count=18; (87,6,15) two-step=False | Agrees on these instances | None |
| §0.1 permutation normalizes V | sigma=(01), root, coefficient3 | sigma R0 sigma^-1(111)=121=R1(111) | Agrees on these instances | None |
| Conventions twist and equivariance | 111->112 and coefficient-one images | 3*111=333:27=27; 3*112=336:54=54; twist mod3=000; M*(F3)=8, X*(F3)=0 | Agrees on these instances | None |
| §1.1 weight definition: regular branch | rational root | weights=(1/3,1/3,1/3); sum=1; each denominator=3 | Agrees on these instances | None |
| §1.1 weight definition: singular branch | 012 over F5 | weights=(0,3,3); sum=1 mod5; changed-coordinate denominator=1, other two raw denominators=0 | Agrees on these instances | None |
| §1.1 weight permutation API | swap coordinates0,1 of 012 in F5 | 102 has weights=(3,0,3); permuted original weights=(3,0,3) | Agrees on these instances | None |
| §1.2 complementarity | 012->112 and fixed622 over F7 | changed weight 0+1=1; fixed622 weight=4 and 4+4=1 mod7; rational root has sum1 | Agrees on these instances | None |
| §1.1 carrier exclusion | origin and two-zero triples over fields | origin raw 0/0=0 would sum0!=1; 100 has square sum1!=0, excluded | Agrees on these instances | None |
| §1.3 involution balance | empty; singleton; two-cycle | sums 0=0/2; 1/2=1/2; 1/3+2/3=1=2/2 | Agrees on these instances | None |
| §§2.1,6.2 companion order | F5 traces 0,2,-2 | orders=[4, 5, 10]; eigenvalue orders at ±2=1,2 | Agrees on these instances | None |
| §§2.2–2.3 conic classification | F_5 | nonzero slice sizes={0: 8, 1: 6, 2: 10, 3: 10, 4: 6}; total=40 | Agrees on these instances | None |
| §§2.2–2.3 conic classification | F_7 | nonzero slice sizes={0: 0, 1: 6, 2: 0, 3: 8, 4: 8, 5: 0, 6: 6}; total=28 | Agrees on these instances | None |
| §§2.2–2.3 conic classification | F_13 | nonzero slice sizes={0: 24, 1: 12, 2: 26, 3: 14, 4: 12, 5: 14, 6: 14, 7: 14, 8: 14, 9: 12, 10: 14, 11: 26, 12: 12}; total=208 | Agrees on these instances | None |
| §2.2 split parametrization | p=11,a=3,lambda=9,kappa=4,t=1 | lambda+inverse=9+5=3; point=(3,5,7); sum squares=83=6 mod11; product=105=6 mod11 | Agrees on these instances | None |
| divisorPhi and prime API | n=0 | positive divisors=[]; sum=0 | Agrees on these instances | None |
| divisorPhi and prime API | n=1 | positive divisors=[1]; sum=1 | Agrees on these instances | None |
| divisorPhi and prime API | n=2 | positive divisors=[1, 2]; sum=3/2 | Agrees on these instances | None |
| divisorPhi and prime API | n=4 | positive divisors=[1, 2, 4]; sum=2 | Agrees on these instances | None |
| divisorPhi and prime API | n=6 | positive divisors=[1, 2, 3, 6]; sum=5/2 | Agrees on these instances | None |
| §3.0 character/Kummer estimates | excluded affine points=[0], values=[1, 2, 3, 4] | sum=0; cover points=4; base points=4; difference=0 | Agrees on these instances | None |
| §3.0 character/Kummer estimates | excluded affine points=[0, 1], values=[2, 1, 2] | sum=-1; cover points=2; base points=3; difference=-1 | Agrees on these instances | None |
| §3.0 character/Kummer estimates | excluded affine points=[0, 1], values=[2, 2, 1] | sum=-1; cover points=2; base points=3; difference=-1 | Agrees on these instances | None |
| §3.0 character/Kummer estimates | excluded affine points=[0], values=[1, 4, 4, 1] | sum=4; cover points=8; base points=4; difference=4 | Agrees on these instances | None |
| §3.0 boundary inclusion | P1 minus1, f=X, F5 | S size3; U points2,3,4; sum=-1; cover2-base3=-1; 1<=sqrt5; old s2 bound0 fails | Agrees on these instances | None |
| §3.0 Kummer degree and involution | f=X over F5, fibres at1,2 | fibre at1={1,4}, size2=1+chi(1); at2=empty,size0=1+chi(2); negation swaps1,4 | Agrees on these instances | None |
| §3.0 elliptic unramified Kummer control | y^2=x^3-x over F5; f=x | E has8 points; remove (0,0),infinity leaves6; sum=-2; g=gf=1,r=0; H1 anti dimension0, boundary2, total2; 2<=2sqrt5 | Agrees on these instances | None |
| §3.0 Riemann-Hurwitz and dimension | g0,r2,s2 and g1,r0,s2 | -2=2*(-2)+2; gf0; anti dimension0; second:0=2*0+0; gf1; total anti compact dimension2 | Agrees on these instances | None |
| §3.0 gcd and torus intersection | x+y=1,F5,m=n=4 | 3 torus points; degrees1,1; chi1; bound max(3*32^(1/3),192/5)=38.4; diagonal4 points has x/y=1, excluded | Agrees on these instances | None |
| §3.0 arithmetic low-order and elimination | d1 on x+y=1,F5; T<2 | 0 low-order points <=11+1=12; C*T^A at T=z^(delta/2A) equals C*z^(delta/2)<=z^delta for z>=C^(2/delta) | Agrees on these instances | None |
| §3.0 totient comparison | n=0 | phi=0; tau=0; quotient=0 | Positive-domain result; zero is excluded | None |
| §3.0 totient comparison | n=1 | phi=1; tau=1; quotient=1 | Agrees on these instances | None |
| §3.0 totient comparison | n=2 | phi=1; tau=2; quotient=2 | Agrees on these instances | None |
| §3.0 totient comparison | n=12 | phi=4; tau=6; quotient=3 | Agrees on these instances | None |
| §3.1 IsCagePoint | F13:018,906,203 | trace orders 018=[4, 6, 7]; 906=[12, 4, 14]; 203 includes trace2 | Agrees on these instances | None |
| §3.1 cage nonemptiness/sign witnesses | p5 primitive root2; p13 primitive root2 | traces0 and9; orders4=p-1 and12=p-1; slice sizes8 and12; sign of9 is4 with same order12 | Agrees on these instances | None |
| §3.2 incidence discriminant | F5,(a,b)=(1,1),(1,2),(2,1),(0,0) | discriminants3,4,4,0; actual nonzero intersections0,2,2,0; generic1+chi=0,2,2,1, last excluded | Agrees on these instances | None |
| §3.3 primitive trace pairing | F7 primitive roots3,5 | inverse pair3,5 both trace1; 2 eigenvalue choices give1 trace; main term needs factor1/2 | Agrees on these instances | None |
| §3.4 middle-game exponents | epsilon=1/4,delta=1/10 | -epsilon/3=-1/12<0; -1/2+delta=-2/5<0; both normalized errors decrease | Agrees on these instances | None |
| §3.5 no_finite_orbit | empty S and singleton333; real cube222 | empty size0; singleton move333->633 not in S; cube sum12,product8, inequality8<=8 but Markoff8!=12 | Agrees on these instances | None |
| §3.5 norm route | L=2 and p=5,20 bound | N<=L^3=8; phi(N)<=8; ∣alpha^sigma∣<=12+8=20; log5/log20=0.537244; nonzero norm divisible5 has absolute value>=5 | Agrees on these instances | None |
| §3.7 sparse_exceptional_primes | T37,epsilon1/2 | tested disconnected-prime count0; bound sqrt37=6.082763; coefficient1 empty at3 and coefficient3 connected at3 | Agrees on these instances | None |
| §4.0 affine surjectivity predicate | A1 at5; x^2+1 at5 | A1 has5 residues each lifted0..4; second has2 residues2,3 and0 integer roots | Agrees on these instances | None |
| §4.2 complement divisibility | p5,complement<5 | multiples of5 in{0,1,2,3,4}={0}; sqrt5<5 | Agrees on these instances | None |
| §§4.2–4.3 positive lifting | integral root word R0,R1,R2 | 111->211->251->(2,5,29); equation sides3=3,6=6,30=30,870=870; all coordinates>0 | Agrees on these instances | None |
| §4.3 prime_affine_lifting | coefficient1 at2 and3 | 633 satisfies54=54 and reduces011 mod2; 333 satisfies27=27 and reduces000 mod3; zero triple lifts000 | Agrees on these instances | None |
| §4.3 coefficient-dependent origin exclusion | roots mod3 and5 | 111 mod3!=000; 333 mod3=000; 333 mod5!=000; gcd111=1, gcd333=3 | Agrees on these instances | None |
| §4.4 all-prime conjectural proposition | p2,3,5 | coefficient3 component sizes4,8,40; including origin at5 gives components40 and1; no universal proof inferred | Agrees on these instances | None |
| §5.1 genus/degree/boundary | alpha1,beta3,F5 | alpha*beta=3!=0,1; genus1, boundary4, chi=4; degrees2,2; t,d powers2t,2d; alpha=beta1 factors into two components | Agrees on these instances | None |
| §5.2 maximalDivisors definition and cutoff API | n12,x0 | M=[]; size=0 | Agrees on these instances | None |
| §5.2 maximalDivisors definition and cutoff API | n12,x1 | M=[1]; size=1 | Agrees on these instances | None |
| §5.2 maximalDivisors definition and cutoff API | n12,x3 | M=[2, 3]; size=2 | Agrees on these instances | None |
| §5.2 maximalDivisors definition and cutoff API | n12,x6 | M=[4, 6]; size=2 | Agrees on these instances | None |
| §5.2 maximalDivisors definition and cutoff API | n12,x12 | M=[12]; size=1 | Agrees on these instances | None |
| §5.2 antichain and domination API | n12,x6 | M={4,6}; neither4 divides6 nor6 divides4; divisor1 divides4, divisor2 divides4 or6, divisor3 divides6 | Agrees on these instances | None |
| §5.3 cageEndgameCondition | p5,c333; p13,c333 | orbit sizes40 and208; complements0 and0; 20 divides0,52 divides0; 018 at13 is outside cage yet inside orbit | Agrees on these instances | None |
| §5.3 sign-orbit freeness | p5 root and p2 root | sign block333 at5 has4 points; at2 all signs coincide, block1; p5 wrong four-point C leaves36, not divisible20 | Agrees on these instances | None |
| §5.3 sign invariance route | integer sigma fixes0,pi swaps01,c=(3,6,15) | sigma*pi*c=(6,-3,-15)=pi*sigma_prime*c; sigma*pi*sigma(333)=(-3,-3,3), outside positive Gamma orbit | Route repaired | Use V times coordinate permutation; add Check |
| §5.4 endgameBound | p5,s4 | phi=2,tau=3; cutoff=48.0*sqrt5; positive and >=16sqrt5 | Agrees on these instances | None |
| §5.4 endgameBound | p5,s6 | phi=2,tau=4; cutoff=96.0*sqrt5; positive and >=16sqrt5 | Agrees on these instances | None |
| §5.3 small-prime endgame clause | 5<=p<=251 | max at251: p+1=252 <=16sqrt251=253.488; K>=16sqrtp; at5 orders<=6 versus Kminus=107.331 | Agrees on these instances | None |
| §5.4 order obstruction denominator/branches | p5,d1,M2 | M=1+1=2; p/(24M)=5/48<=1; first upper108*2^3=864; cubic coefficient108, linear24 | Agrees on these instances | None |
| §5.5 reducing-map definition/identity/composition | D1 identity twice | f1=1; value inequality1<=1; quotient ratio1<=min(1,1); composite1->1 | Agrees on these instances | None |
| §5.5 prime-power and wrong-direction Checks | D25->D9,5^i->3^i; D3->D5 | images1,3,9<=1,5,25; quotient ratios9/25,3/5,1; wrong map has5>3 | Agrees on these instances | None |
| §5.5 coprime product terminal quotient | (A1,B1)=(1,1),(A2,B2)=(3,5) | product minFac ratio3/5; separate-minima ratio1; 3/5!=1; discard terminal pair | Agrees on these instances | None |
| §5.5 reducing implies m<=n | 5->3 and1->1 | 3<=5;1<=1; reversed5<=3 fails | Agrees on these instances | None |
| §5.6 padding antichains | D5->D3 and D25->D9 | least padding6 and36; all cutoff max(cardM5-cardM6)=0 and max(cardM25-cardM36)=0 | Agrees on these instances | None |
| §5.7 IsMaxDivReduced and exponent API | n0 | factorization={}; reduced=False; at27 3^2=9>=5; at384,768 two-power128<200,256>=200 | Agrees on these instances | None |
| §5.7 IsMaxDivReduced and exponent API | n1 | factorization={}; reduced=True; at27 3^2=9>=5; at384,768 two-power128<200,256>=200 | Agrees on these instances | None |
| §5.7 IsMaxDivReduced and exponent API | n3 | factorization={3: 1}; reduced=True; at27 3^2=9>=5; at384,768 two-power128<200,256>=200 | Agrees on these instances | None |
| §5.7 IsMaxDivReduced and exponent API | n27 | factorization={3: 3}; reduced=False; at27 3^2=9>=5; at384,768 two-power128<200,256>=200 | Agrees on these instances | None |
| §5.7 IsMaxDivReduced and exponent API | n384 | factorization={2: 7, 3: 1}; reduced=True; at27 3^2=9>=5; at384,768 two-power128<200,256>=200 | Agrees on these instances | None |
| §5.7 IsMaxDivReduced and exponent API | n768 | factorization={2: 8, 3: 1}; reduced=False; at27 3^2=9>=5; at384,768 two-power128<200,256>=200 | Agrees on these instances | None |
| §5.7 logarithmic equivalence and adjoining prime | n3->15 | floor2/3=0 < log3/log3=1; missing5 added: exponents(1,0)->(1,1); 2^0=1<8*7^2=392 | Agrees on these instances | None |
| §5.8 reduced_domination | all n2..64, all divisor-transition cutoffs | 63 witnesses; failures0; chosen n2,12,27,64: [(2, 2), (12, 12), (27, 30), (64, 64)]; bounds n<=m<=4n-6 | Agrees on these instances | None |
| §5.9 divisorRank polynomial/reversal/total | n1 | coefficients=[1]; reverse=[1]; sum=1=tau=1; Omega=0; out-of-range coefficient0 | Agrees on these instances | None |
| §5.10 central_rank_bound | n1 | normalized sides C*2^Omega=1, tau*choose=1; maximum antichain over cutoffs=1<=central=1 | Agrees on these instances | None |
| §5.9 divisorRank polynomial/reversal/total | n8 | coefficients=[1, 1, 1, 1]; reverse=[1, 1, 1, 1]; sum=4=tau=4; Omega=3; out-of-range coefficient0 | Agrees on these instances | None |
| §5.10 central_rank_bound | n8 | normalized sides C*2^Omega=8, tau*choose=12; maximum antichain over cutoffs=1<=central=1 | Agrees on these instances | None |
| §5.9 divisorRank polynomial/reversal/total | n12 | coefficients=[1, 2, 2, 1]; reverse=[1, 2, 2, 1]; sum=6=tau=6; Omega=3; out-of-range coefficient0 | Agrees on these instances | None |
| §5.10 central_rank_bound | n12 | normalized sides C*2^Omega=16, tau*choose=18; maximum antichain over cutoffs=2<=central=2 | Agrees on these instances | None |
| §5.9 divisorRank polynomial/reversal/total | n30 | coefficients=[1, 3, 3, 1]; reverse=[1, 3, 3, 1]; sum=8=tau=8; Omega=3; out-of-range coefficient0 | Agrees on these instances | None |
| §5.10 central_rank_bound | n30 | normalized sides C*2^Omega=24, tau*choose=24; maximum antichain over cutoffs=3<=central=3 | Agrees on these instances | None |
| §5.10 universal-cutoff finite sweep | n1..128; x=-1,0 and every divisor threshold | 128 normalized comparisons plus all cutoff comparisons; failures0; at12,x6:2<=2 and16<=18 | Agrees on these instances | None |
| §5.10 restricted rank interval and off-central exclusion | n12,x3,interval[1,1]; n4,rank0 | M3(12)={2,3}; both rank1,C1=2; n4 rank0 proportion1/3>1/4 squarefree, excluded | Agrees on these instances | None |
| §5.13 uniform_connectivity_interval constants/endpoints | p5; symbolic M<=2C | representative intervals[4,10],[6,18]; upper4p-2=18; 108*(2C)^3=864C^3;1458*(2C)^8=373248C^8; fourfold1492992C^8 | Agrees on these instances | None |
| §5.13 strict/non-strict contradiction | C1, n+2=1492992 | required n+2>=1492992; obstruction n+2<1492992; equality excludes it; p5,d1 second interval5/48<=1<=48sqrt5 is nonempty | Agrees on these instances | None |
| §5.14 uniform threshold | n=1492992^2;p+1<=2p | 1492992*sqrt(n)=n; raising384(p+1)^(3/16)<sqrtp to16 gives384^16*(p+1)^3<p^8; p^5>8*384^16 suffices | Agrees on these instances | None |
| §§6.2–6.4 semisimple_orbit_congruence and valuation_orbit_congruence | F_3, every semisimple non-dihedral oriented orbit | (trace,order,m,modulus,orbit size)=[(0, 4, 4, 1, 16)]; all divisibility remainders0 | Agrees on these instances | None |
| §6.5 oriented_card_dvd | p3 | nonzero trace(-2) orbit sizes=[]; each divisible by3; p3 has0 instances | Agrees on these instances | None |
| §§6.2–6.4 semisimple_orbit_congruence and valuation_orbit_congruence | F_5, every semisimple non-dihedral oriented orbit | (trace,order,m,modulus,orbit size)=[(0, 4, 4, 1, 16), (1, 6, 6, 3, 36)]; all divisibility remainders0 | Agrees on these instances | None |
| §6.5 oriented_card_dvd | p5 | nonzero trace(-2) orbit sizes=[40]; each divisible by5; p3 has0 instances | Agrees on these instances | None |
| §§6.2–6.4 semisimple_orbit_congruence and valuation_orbit_congruence | F_7, every semisimple non-dihedral oriented orbit | (trace,order,m,modulus,orbit size)=[(3, 8, 8, 2, 64), (1, 6, 6, 3, 36), (4, 8, 8, 2, 64), (0, 4, 8, 1, 16), (6, 3, 6, 3, 72)]; all divisibility remainders0 | Agrees on these instances | None |
| §6.5 oriented_card_dvd | p7 | nonzero trace(-2) orbit sizes=[28]; each divisible by7; p3 has0 instances | Agrees on these instances | None |
| §§6.2–6.4 semisimple_orbit_congruence and valuation_orbit_congruence | F_4, every semisimple non-dihedral oriented orbit | (trace,order,m,modulus,orbit size)=[(2, 5, 5, 5, 10), (3, 5, 5, 5, 10), (1, 3, 3, 3, 18)]; all divisibility remainders0 | Agrees on these instances | None |
| §§6.2–6.4 semisimple_orbit_congruence and valuation_orbit_congruence | F_8, every semisimple non-dihedral oriented orbit | (trace,order,m,modulus,orbit size)=[(7, 7, 7, 7, 70), (1, 3, 9, 1, 54), (5, 7, 7, 7, 70), (3, 7, 7, 7, 70), (4, 9, 9, 9, 54), (6, 9, 9, 9, 54), (2, 9, 9, 9, 54)]; all divisibility remainders0 | Agrees on these instances | None |
| §§6.2–6.4 semisimple_orbit_congruence and valuation_orbit_congruence | F_9, every semisimple non-dihedral oriented orbit | (trace,order,m,modulus,orbit size)=[(0, 4, 8, 1, 96), (5, 10, 10, 5, 60), (8, 10, 10, 5, 40), (7, 5, 10, 5, 40), (4, 5, 10, 5, 40), (6, 8, 8, 2, 64), (0, 4, 8, 1, 16), (3, 8, 8, 2, 64), (8, 10, 10, 5, 60), (5, 10, 10, 5, 40)]; all divisibility remainders0 | Agrees on these instances | None |
| §6.2 characteristic-two split convention | F4,a^2+a+1=0 | trace a companion order5, nonsplit m5; discriminant a^2 is square; trace0 unipotent order2; scalar identity order1 | Agrees on these instances | None |
| §6.2 inverse/sign eigenvalue convention | F7 traces1 and6 | inverse roots3,5 each order6; roots2,4 each order3; sign changes order6->3, inversion preserves order | Agrees on these instances | None |
| §6.1 Fricke identity and commutator convention | unipotent pair and identity pair | 4+4+9-12-2=3; 4+4+4-8-2=2; identity pair excluded t=2 | Agrees on these instances | None |
| §6.1 non-dihedral criterion | diag(2,4),B=[[0,6],[1,0]] over F7 | trace triple600; commutator trace36-2=34=6 mod7!=2; exactly1 nonzero coordinate; excluded | Agrees on these instances | None |
| §6.1 right precomposition versus left action | free basis a,b; swap alpha and beta:b->ab | right rule (a,b)->(b,a)->(b,ba); reversed order gives(ab,a); both exponent columns differ; inversion converts right to left | Agrees on these instances | None |
| §6.0 level and markings | H1, identity cover | exterior epi count1; cover/full marking degree1; ramification degree0; ordc1; no nonempty ramification component | Agrees on these instances | None |
| §6.0 nonreduced base change | H1 over k[eps]/eps^2 | base nilpotent eps!=0,eps^2=0; full marking rank1, nonreduced; ramification empty, rank0, reduced | Agrees on these instances | None |
| §6.0 balanced nodal compactification | e2,xy=0, x=xi^2,y=eta^2 | generic cover rank2; node fibre basis1,xi,eta has length3; finite quotient retained, flatness not asserted | Agrees on these instances | None |
| §6.0 cotangent-degree congruence | SL2(F5),c noncentral trace-2 | e10,d1,m divides24; coarse degree40 or80; 12e=120 divides24*1*40=960 and1920 | Agrees on these instances | None |
| §6.0 centralizer quotient | SL2(F5) trace-2; SL2(F4) nonsplit | centralizer10/inertia10=1; centralizer5/inertia5=1; even vertical1, exponent divides12 | Agrees on these instances | None |
| §6.0 non-dihedral hypothesis | D10 inside SL2(F4) | commutator/inertia order5; coarse degree3; forces5 dividesm, but5 does not divide12; dihedral excluded | Agrees on these instances | None |
| §6.0 quotient-cover map identity | N1 | map degree1; component degreeD=1*D; generator pair unchanged | Agrees on these instances | None |
| §6.0 quotient-cover map to trivial group | H=C2,N=H | exterior pairs(1,0),(0,1),(1,1):3; target1; coarse degrees3=3*1; -I acts trivially | Agrees on these instances | None |
| §6.0 quotient-cover degree divisibility | H=C2xC2,N order2 | ordered bases=3*2=6; quotient generating pairs=3; fibre2; 6=2*3; -I acts trivially | Agrees on these instances | None |
| §6.0 general finite-group congruence | H1,r=s=j=0; SL2(F5),ell5,r1,s0,j0 | divisor1 divides1; divisor5 divides40 or80 | Agrees on these instances | None |
| §6.0 j0 cusp direct-product argument | commuting disjoint C4 and C4 | subgroup order4*4=16; valuation4=2k atell2,k2; gives2k<=v(∣H∣) | Agrees on these instances | None |
| §6.0 general-j quotient induction | r5,s1,j1,a1,b1 and b0 | original difference1; transformed(4,1,0) difference1 and(5,0,0) difference5; exponents1,3>=1 | Route repaired | Retain general-j theorem via quotient induction |
| §6.0 source powering negative control | C4,z generator,u=z^2,k2,j1 | intersection order2; powered z^2 still intersects u in2 points; proposed direct product C4xC2 would have8 points versus actual4 | Source proof step fails abstract cyclic test | Use j0 plus quotient induction |
| §6.6 oriented_transitivity and geometric range | p2,3,5 | oriented orbit sizes4,empty,40; reversing swap fixes root at2 and5; SL2 epimorphic trace-2 moduli empty at2,3; geometry assumesp>=5 | Agrees on these instances | None |
| §7.1 primitivePoint | n65 roots and mixed triples | 111 coefficient3 reductions111,111; 404040 reductions000,111; twist555555 coefficient1 reductions000,333; mixed globally nonzero | Agrees on these instances | None |
| §7.1 CRT and twist API | n5,65 | primitive sizes40 and40*208=8320; 3 inverse mod65=22; 3*40 mod65=55; every prime factor>=5 | Agrees on these instances | None |
| §7.2 signStep closure | F5 root333 | sign step fixing0 gives322; composing fixing0 then1 gives223; 233 has odd sign product, excluded; repeated step returns333 | Agrees on these instances | None |
| §7.3 mpCondition | p5,13,7,11 | first two residue branch true; p7 order<=8 gives square<=64<8192; p11 roots5,9 order5 gives25<12288 | Agrees on these instances | None |
| §7.3 inverse root/squared inequality | T^2-3T+1 | root product1; order inverse=order; square threshold32^2*(p+1)=1024*(p+1) | Agrees on these instances | None |
| §7.4a Jordan negative control | AGL1(F5) | order20<60=∣A5∣; degree5<5+3=8; a translation moves5 points; degree hypothesis excludes it | Agrees on these instances | None |
| §7.5a socle affine alternative | AGL1(F5),natural S3 | socles C5,C3 orders5,3; transitive degrees5,3; S3 hasorder6, socle index2; nonabelian group need not have nonabelian socle | Agrees on these instances | None |
| §7.5a minimal-normal product/centralizer | A5xA5 on A5 by left/right multiplication | degree60; regular factorsorders60,60 commute; intersection1 sinceZ(A5)=1; socleorder3600 | Agrees on these instances | None |
| §7.5a unique nonabelian factor centralizer | natural A5 on5 points | socleA5 order60; permutation centralizerorder1; normal subgroup image inS2,S3 must be1 | Agrees on these instances | None |
| §7.5a no index2 or3 | A5 and C2 | A5 order60, simple images inS2/S3 haveorders dividing2/6 and60 hence trivial; C2 has trivial subgroupindex2, excluded | Agrees on these instances | None |
| §7.5a affine exclusion at7 | rotation cycles3,4 | fourth power has support3,fixed4; nonidentity affine map in prime degree7 fixes<=1; excludes affine alternative | Agrees on these instances | None |
| §7.5a primitive order bound | regular C5 degree5 | ∣G∣=5; logarithmic bound4sqrt5(log5)^2=23.168262; log∣G∣=1.609; 5<exp(bound) | Agrees on these instances | None |
| §7.5a two-transitive section bound hypotheses | S_n,A_n excluded; Q5=S10 hasdegree10 | S_n contains A_n section with k=n; at n65536, k65536>6log65536=66.542129; proper/nonalternating premises exclude it; 10<65536 | Explicit hypotheses restored | Repeat G<S_n and G!=A_n in second sentence |
| §7.5 equal-order exceptional factors | p11,q5 | p^2-1=120=q*(q^2-1); rotationorders30,30; ∣A22∣=562000363888803840000 !=1814400=∣A10∣ | Agrees on these instances | None |
| §7.5 finite coincidence | prime q<203897, q=1mod4 | integer-square/prime test finds only(p,q)=(11,5); 121-1=120=5*24 | Agrees on these instances | None |
| §7.5 distinct rotation kernel | p5,q13 | rotationorders30 and546; 30th power identity at5, nonidentity at13 since546 does not divide30 | Agrees on these instances | None |
| §7.6 solvable sign quotient | S4 on one sign block | derived chainorders24->12->4->1; composition primes2,3; block-pair520 times16 signs=8320 | Agrees on these instances | None |
| §7.6 elliptic-coordinate threshold | p127 | (127-11sqrt127)/4=0.7590739086422289 >0; at121 expression0, strict threshold required | Agrees on these instances | None |
| §§7.6–7.7 squarefree_transitivity | n65 | single Vieta-root orbit=8320; product local primitive counts=8320; all reductions nonzero | Agrees on these instances | None |
| §7.7 squarefree_positive_lifting | n65, both coefficients | positive roots111 and333; root-word moves retain positive integral coordinates; primitive set size8320 in both conventions | Agrees on these instances | None |
| §§7.6–7.7 squarefree_transitivity | n770 | single Vieta-root orbit=394240; product local primitive counts=394240; all reductions nonzero | Agrees on these instances | None |
| §7.8 squarefree_integral_image both directions | n65 | primitive8320 plusorigin1 gives8321; full41*209=8569; mixed40+208=248; 8569-8321=248 | Agrees on these instances | None |
| §7.8 coprimality necessity | positive(2,5,29) and mixed404040 mod65 | pairwise gcds1,1,1; mixed requires all three divisible5, so excluded; signed variants preserve gcds | Agrees on these instances | None |
| Squarefree junk moduli and total functions | n0,1,4; out-of-range rank | n>1 false at0,1; squarefree4 false; divisor0 empty; rank4(8)=0; phi0=0; all endpoint hypotheses exclude junk | Agrees on these instances | None |
| §6.0 supplied rigidification, identity inertia | H=1 | Z(H) size1; quotient automorphism groups unchanged; coarse degree1=1 | Agrees on these instances | Use AlgebraicModuliForArithmeticGeometry §5.1 |
| §6.0 supplied rigidification, central kernel | smooth connected C2-cover | vertical automorphism group C2 size2; quotient C2/C2 size1; cover class retained | Agrees on these instances | Use the supplier’s sheaf quotient and vertical-kernel theorem |
| §6.0 supplied rigidification, residual center | B(C4) quotient by C2 control | C4/C2 has2 automorphisms; quotient by full C4 has1; partial and full central quotient differ | Agrees on these instances | General construction belongs to supplier |
| §6.0 sheaf versus sections convention | squaring Gm over R | -1 is a quotient-sheaf section; no real square root; sectionwise square image omits-1 | Agrees on these instances | Retain fppf quotient hypothesis |
| §3.2 nonempty-slice incidence diameter | p5,7,13; all directions and nonempty slices | diameters2,2,2; disconnected pairs in same direction have2-step paths | Agrees on these instances | None |
| §5.6 padding map cutoff sweep | D5->D3 padded6; D25->D9 padded36 | maximum source-minus-target cardinality0 and0 at all divisor-transition cutoffs | Agrees on these instances | None |
| §7.4a even-permutation acceptance condition | identity permutation and parabolic cycle powers | identity realised by empty word; powers6 and42 have support5 and13 and signs+1,+1 | Agrees on these instances | No arbitrary-function substitute |
| §7.5a socle defining laws | S3,C5,A5 | minimal-normal counts1,1,1; socle orders3,5,60; characteristic-simple types C3,C5,A5 | Agrees on these instances | None |
| §6.4 truncated valuation control | q9,n10,ell5; q5,n4,ell3 | r1,s0 gives divisor5 and orbit40 or60; r0,s1 gives natural difference0, divisor1 | Agrees on these instances | None |
| §6.6 orientation index argument | reversing swap fixing333 at5 | full orbit40; hypothetical split20+20; swap fixes1 root and so cannot interchange two orbits | Agrees on these instances | None |
| §0.1 sign/permutation source normalization | supplier coordinate rule at sigma=(01) | P_sigma R0(111)=211 swapped=121=R1 P_sigma(111); cyclic i2 wraps to0,1 | Agrees on these instances | Source conventions agree |
| §7.6 finite elliptic-coordinate targets | p19,23,31,43,47,59,67,71,79,83,103,107 | [(19, (6, 6, 8), 20, 20), (23, (3, 3, 3), 24, 24), (31, (4, 4, 7), 32, 32), (43, (3, 3, 3), 44, 44), (47, (3, 3, 3), 16, 16), (59, (6, 6, 14), 20, 20), (67, (3, 3, 3), 68, 68), (71, (5, 11, 21), 72, 72), (79, (4, 4, 44), 80, 80), (83, (3, 3, 3), 84, 84), (103, (3, 3, 3), 104, 104), (107, (3, 3, 3), 36, 36)]; p127 character bound0.759074>0 | Agrees on these nonzero instances | None |
| §6.1 prime Markoff epimorphic specialization | p5,A=[[0,1],[4,3]],B=[[2,1],[1,1]] | dets1,1; AB=[[1,1],[1,2]]; traces333; equation27=27; generated subgroup120=5*(25-1); p2 has4 Markoff points but0 trace-zero epimorphic pairs | Agrees on these instances | Make the geometric-consumer interface explicit |


Pull request: #1686 (roadmap/arithmetic-dynamics-part-ii at 6170dac)
