# Review of Foams (pull request #1629 at 09cb10c)

**Verdict:** needs changes

## R01 (P1) — Several prerequisites are claimed as supplied but are absent at the pins

**Location:** `TauCetiRoadmap/Foams/README.md:256`, 258, 260, 264–268, 276, 493–497, 873 and 955. Claim: “Reuse the graded balanced tensor product” and “use native graded free/projective modules”.

**Witness:** At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the cited balanced-tensor, graded-free, Khovanov, explicit-mate and homogeneous-monoid modules do not exist; `GradedObject.monObjOfHomogeneous` is absent from both pinned libraries.

The following advertised interfaces cannot supply their stated contracts:

| Advertised Tau Ceti module/interface | Result at the pin; available replacement or obligation |
| --- | --- |
| `CategoryTheory.Monoidal.Rigid.Mate`, `Rigid.DualFunctor` | Neither file exists. PivotalSpherical's ordinary duality/mate targets are roadmap contracts, not these implemented modules. |
| `CategoryTheory.Monoidal.Opposite` | No such Tau Ceti file; the ordinary opposite construction is in Mathlib. |
| `CategoryTheory.GradedObject.MonObj`, `GradedObject.monObjOfHomogeneous` | Neither the file nor named constructor exists. State the missing construction with its tensor hypotheses. |
| `LinearAlgebra.TensorProduct.Balanced.Grading.Basic`, `Balanced.Coherence` | Neither file exists. Ordinary tensor-product results do not provide this graded balanced interface. |
| `Algebra.Category.GradedModuleCat.BimoduleTensor.Monoidal` | No such file. The available graded-module category does not supply this monoidal structure. |
| `Algebra.Category.GradedModuleCat.Free` | No such file. `Projective.lean:44` supplies projectivity from underlying module projectivity, not finite graded freeness. |
| `KnotTheory.Khovanov.Frobenius`, `QuantumGrading`, `CircleTensor` | None exists at this pin. KhovanovHomology K2 is the existing roadmap owner. |
| Both Pieri rules in `Schur/Pieri.lean` | The opened file supplies the complete-symmetric rule at lines 231 and 282; the advertised elementary-symmetric rule is not there. |

**Repair:** Cite KhovanovHomology K2 and PivotalSpherical's actual ordinary-duality sections as roadmap suppliers; cite Mathlib for the opposite. Make the missing general graded tensor/coherence, homogeneous packaging and graded-free infrastructure explicit Layer 0 targets, or precise declared contracts with an earlier owner. Cite the actual complete Pieri declaration and separately own or locate the elementary rule. Remove all claims that these absent APIs are implemented. The repair must work with the pinned libraries: for example, constructing the unsigned tensor of the regular graded module over ℤ[e₁] must have a named prerequisite, and applying K2's chosen coproduct must not require a nonexistent Tau Ceti import. There are no declared gaps covering these absences.

## R02 (P2) — State the integral graded-freeness headline in Suggested.lean

**Location:** `TauCetiRoadmap/Foams/README.md:871` and `TauCetiRoadmap/Foams/Suggested.lean:38`. Claim: “every graded retract of a finite sum of shifts of Λ_N … is finite graded free”.

**Witness:** The file contains no such theorem. A scratch signature using the existing `EquivariantRing.grading`, a homogeneous idempotent matrix and native `Module.Basis` elaborates at the pins, with only its intended `sorry` warning.

This is an essential theorem used to pass from retracts to actual planar decompositions, not a missing foam carrier. The module docstring does not list it either. One elaborated formulation, inside the existing namespace, is:

```lean
theorem graded_retract_basis_signature_probe (N m : ℕ) (s : Fin m → ℤ)
    (p : (Fin m → EquivariantRing N) →ₗ[EquivariantRing N]
      (Fin m → EquivariantRing N))
    (hp : p.comp p = p)
    (hhom : ∀ (d : ℤ) (v : Fin m → EquivariantRing N),
      (∀ j, v j ∈ EquivariantRing.grading N (d - s j)) →
      ∀ j, p v j ∈ EquivariantRing.grading N (d - s j)) :
    ∃ (n : ℕ)
      (b : Module.Basis (Fin n) (EquivariantRing N) (LinearMap.range p))
      (d : Fin n → ℤ),
      ∀ i j, (b i).val j ∈ EquivariantRing.grading N (d i - s j) := by
  sorry
```

**Repair:** Keep a suitably named version of this headline, with a mathematical docstring, and the few definitions it requires. Update the module introduction to describe an acceptance test and enumerate the other genuinely unstatable headlines and their missing carriers. The zero idempotent gives rank 0; the identity on Λ_N gives basis 1; `diag(1,0)` on Λ_N² gives homogeneous basis `(1,0)`. These instances fit the proposed signature without a field hypothesis, arbitrary stand-in predicate or sorry-defined data.

## R03 (P3) — Remove all four option overrides

**Location:** `TauCetiRoadmap/Foams/Suggested.lean:3`, 307, 436 and 441. Claim: the proposed acceptance file uses `set_option autoImplicit false` and three `set_option linter.checkUnivs false in` commands.

**Witness:** The supplied gate reports `set_option=4`; all four commands are present at those lines.

**Repair:** Delete the overrides. If any retained declaration needs adjustment, state its universes and binders under the defaults. The acceptance test must elaborate without an override; removing API/example material under R04 also removes the three subtype-only suppressions. Re-elaborate the resulting file and require only intended `sorry` warnings.

## R04 (P3) — Replace the prototype/API catalogue with headline statements

**Location:** `TauCetiRoadmap/Foams/Suggested.lean:6`, 625, 905–1099, 1467, 1497 and 1536. Claim: the file offers “suggested interfaces” and its only admitted theorem is the scalar sign specialization.

**Witness:** `circleTraceUnit_robertWagner` closes with the single tactic `simp [circleTraceUnit, Nat.choose_succ_succ, pow_add, mul_comm]`. The scratch file elaborated. `mem_radical` and `mem_actionKernel` are already proved by `Iff.rfl`; `stateSpaceMap_mk` by `rfl`.

**Repair:** Delete `circleTraceUnit_robertWagner` from `Suggested.lean`; keep its normalization identity in the README. Delete the API/boundary/example catalogue and definitions that no retained headline needs, including the theta/circle example block. Keep only headline statements, their few necessary simple definitions and the required module documentation. Do not repair padding by proving it in place. For a=0,1,2,3 the two sides of the admitted sign identity are respectively `1,−1,−1,1`; this supports keeping it as a README Check, not an acceptance theorem.

## R05 (P3) — Supply local locators and the source record

**Location:** `TauCetiRoadmap/Foams/README.md:804`, 843, 1399 and 1796. Claim: the sampled base and higher-label reductions cite theorem numbers, while KH3 has no source locator at its statement; the references generally omit pages/version information. The folder has no `sources.toml`.

**Witness:** Carpentier Lemma 2 is at `carpentier line 101` (v1, p.4); Wu's Theorem 2.4 at `wu-colored line 651` (v6, p.10). KH3's four ordinary maps occur at `bar-natan line 1258` (Definition 7.1/Proposition 7.2, printed p.1470).

**Repair:** Add these precise version/page locators locally, with the proof ranges where the proposed route uses them: Carpentier pp.4–7 and Wu pp.10–12. For KH3 retain the K2 ownership citation and cite Bar-Natan Definition 7.1/Proposition 7.2, p.1470, for the four maps; distinguish the new compiler comparison from those supplied maps. Record each work once in `sources.toml` using the source service's metadata, including the uncertified Baez–Neuchl DOI. For each remaining target add the exact locator or say explicitly that it is the construction proved here from named inputs. On `1,X`, the corrected KH3 citation gives the maps computed in the table below; it does not claim to provide the new compiler.

## R06 (P3) — Give definitions discriminating Checks and targets individual dependencies

**Location:** `TauCetiRoadmap/Foams/README.md:376`, 480, 1016 and 1741. Claim: general labelling, grading and semistrict structures are specified in prose, followed by one global verification table.

**Witness:** There are no `*Needs:*` lines, no layer-ending Examples/Dependencies sections, and no three-Check lists attached to these definitions. The global row about Bar-Natan grading names an obligation rather than giving its computed maps.

**Repair:** Use the required roadmap headings and opening Summary; separate scope/ownership and exact supplier contracts. Give each definition its prose API and at least three computed, discriminating Checks; give each target the dependencies of its statement and proof route. For example, ordered labelling must test `1+2=3`, `0+0=0` with merge/split still distinguished, and the failure of exchanging noncommuting labels. Graded coefficients must test multiplication by e₁ moving degree 0 to 2, unsigned swap on two odd circle states, and specialization e₁↦1 failing to preserve degree. End each layer with its examples and dependencies. These tests separate the plausible wrong models while retaining the proposed generality.

## R07 (P3) — Cite suppliers at their maintained locations

**Location:** `TauCetiRoadmap/Foams/README.md:288`–290. Claim: the TemperleyLieb supplier is linked to a fixed commit; SurfaceTopology and PlanarTopology likewise use frozen contributor-fork links.

**Witness:** The gate reports `blob=1` at line 288. TemperleyLieb's Layers 2, 6 and 7 can instead be resolved in its main-branch roadmap; the frozen commit is unnecessary.

**Repair:** Replace the commit links with maintained roadmap/section references. Use the verified section names for the finite-map and planar-topology suppliers as well. The consumed presentations, ideals and envelopes still resolve at the maintained TemperleyLieb location; do not change their ownership or add a later supplier.

## R08 (P3) — Gate false positive on the public Neuchl URL

**Location:** `TauCetiRoadmap/Foams/README.md:1807`. Claim made by the gate: `private-paths=1` violates the machine-path rule.

**Witness:** The matched text is the public thesis URL on `math.ucr.edu`, not a machine path. The source service fetched that author-hosted thesis legally; `neuchl line 570` begins Definition 1.8.

**Repair:** No mathematical or citation edit is needed for this match. The operator should correct or explicitly waive this exact scanner false positive and rerun the gate; tooling was not edited during review. Replacing the legitimate citation merely to hide the URL would not fix a roadmap defect. This diagnostic is counted separately so every failing gate rule is accounted for; it is not an allegation that the author exposed a local path.

## Verified sound

The whole README and Lean file were read. This review makes no claim that finite checks prove the unformalized categorical results. It found no counterexample to the stated square/hexagon, trace or Khovanov conventions in the instances below. The verdict is blocked by R01 and R02; R03–R08 account for form, source and gate issues.

**Build and scope.** HEAD was checked as `09cb10cfe502738450f050c7c9ece41f08bb12bd`. The diff outside `TauCetiRoadmap/Foams` was empty. Original `lake env lean` elaboration succeeded with one `sorry` warning; the worker's targeted module build also passed. There is one `import Mathlib`, no imported roadmap, no sorry-defined data and no admitted examples. No source passages or executable algorithms were found in the roadmap. Finite reduction certificates here specify mathematical existence and termination, not software execution.

The worker gate is **FAIL**: `set_option=4 blob=1 private-paths=1`; every other reported counter, including build, depcheck, stray-files, outside-folder and sorry-data, is zero. R03, R07 and R08 account for the three failing rules. The independently run dependency check returned exactly:

```text
depcheck: 205 roadmaps, 1500 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Absence from the order was not treated as a defect. A coarse acyclic graph does not repair the nonexistent interfaces in R01 or replace the per-target dependencies requested in R06.

**Seeded source check.** No locator was marked unverified in the README. All 20 cited mathematical works were submitted to the sources service: 19 yielded legal texts; Baez–Neuchl yielded an uncertified DOI. No source manifest was edited. The three seeded targets were checked as follows:

| Target | Text and hypotheses actually read | Outcome |
| --- | --- | --- |
| The {1,2}-labelled base, README 804–841 | Carpentier v1, Lemma 2, p.4, `carpentier line 101`; proof pp.4–7, line 105 onward: connected planar four-valent graph with vertices, specified forbidden configurations, switch/lens reduction. | The roadmap correctly calls for a translation and categorical lifts. The source does not itself prove integral foam isomorphisms. Disconnected and vertex-free cases require the separate circle/component steps already requested. |
| Retracts and higher labels, README 843–867 | Wu v6, Theorem 2.4, p.10, `wu-colored line 651`; proof pp.11–12, lines 655–762: maximal-label/count induction and equations (2.3)–(2.6). | The source is about the MOY polynomial, not categorical freeness. The roadmap explicitly owns the lift, uses retracts and does not divide by quantum integers. |
| KH3, README 1399–1405 | Bar-Natan v2, Definition 7.1/Proposition 7.2, printed p.1470, `bar-natan line 1258`; KhovanovHomology K2; Goertz–Wedrich v2, Lemma 8 and Propositions 10–11, pp.3–4, `goertz-wedrich line 133` and line 154. | The four maps and identity-involution orientation forgetting agree. The broader coefficient statement uses K2 and base change; the ordinary source does not establish this roadmap's compiler. Add the missing local locator (R05). |

Supplementary passages opened include Wu's equivariant Theorem 2.10/Remark 2.11 (`wu-equiv line 447` and 469), Robert–Wagner Proposition 3.13/Lemma 3.21/Proposition 3.32 (`rw line 1013`, 1340, 1574), Gorsky–Wedrich Remark 4.21 (`gw line 1230`), Queffelec–Rose Proposition 5.1 (`qr-annular line 985`), Goertz–Marino–Wedrich Definition 3.12, Examples 4.30–4.33 and Theorem 4.35 (`gmw line 794`, 2015, 2094), and Neuchl Definition 1.8 (`neuchl line 570`). Wu's equivariant source works over complex coefficients; the README correctly labels the integral polynomial version as work here. The annular source does not by itself supply the integral equivariant expression witnesses, and the README explicitly retains that obligation.

**Adversarial values.** Unless stated otherwise coefficients are ℤ, evaluation rank N>0, and comparisons are in the exact convention of the README. “Pass” means the displayed instance agrees, not a proof of the general target. Rows marked “limited” test a necessary consequence only. The R01/R03/R05–R08 rows are factual counts rather than mathematical equalities. This table has 97 target/check rows. The subsequent Lean table gives a separate row for each of the 136 actual named declarations extracted by the signature check.

| Statement / location in README | Instances tried | Values on the two sides, or positive/negative models | Result; change |
| --- | --- | --- | --- |
| Closed-web incidence, 306 | Self-loop at x | One arc gives two ends at x; a lone loop has valence 2, not 3 | Pass; no change |
| Ordered small ends, 306 | Theta with small labels 1,2 | Ordered sum 1+2=3; swapping gives 2+1=3 over ℕ | Pass; add local Check |
| Merge/split data at zero, 306/376 | All-zero theta | Both equations 0+0=0; two vertices remain, with different roles | Pass; equation alone would not determine roles |
| Mirror and reversal, 306/376 | Noncommuting labels (12),(23) in S₃, using multiplicative notation | Products (123) and (132) differ; mirror needs commutativity, reverse can preserve order | Pass; local Check under R06 |
| Prefoam boundary/gluing, 316 | Two cylinders; two disks glued on circle | χ=0+0−0=0; χ=1+1−0=2 | Pass for Euler data; general gluing limited |
| Prefoam category, 349 | Identity cylinder, three cylinders | Gluing yields cylinder in both unit orders; χ=0 in both parenthesizations | Limited to identity case |
| Unoriented nilvalent domain, 359 | Klein bottle; Möbius band | Crosscap counts 2 (allowed) versus 1 (excluded) | Pass; not an unrestricted unoriented TQFT |
| Labelling/neutral decoration, 376 | Natural labels 0,1,2 and positive labels | 0+2=2; Dec(0)=R; ℕ+ has no zero | Pass; separate neutral-label structure necessary |
| Decoration linearization, 402 | Two decorations 1 and x in dual numbers | ε(1+x)=1=ε(1)+ε(x)=0+1 | Pass |
| gl(N) instances, 420 | N=0 coefficient ring, label 0 | Λ₀=ℤ; symmetric polynomials in zero variables=R | Pass; evaluation still requires N>0 |
| Perfect Frobenius input, 438 | Dual numbers; pairing 2xy on ℤ | Dual-number determinant −1 is a unit; 2xy has radical 0 but dual-map image 2ℤ | Pass; nondegeneracy alone excluded |
| Reconstructed coproduct, 438 | Basis 1,X, dual X,1 | Δ1=1⊗X+X⊗1; ΔX=X⊗X; counit composites send 1↦1,X↦X | Pass |
| Handle map, 438 | Dual numbers, characteristics 0 and 2 | h(1)=2X, h(X)=0; in characteristic 2 h=0 | Pass; no division by 2 |
| Ordered boundary/web syntax, 465 | Merge (1,2)→3; inadmissible 1+2→4 | Conservation 3=3 versus 3≠4 | Pass |
| Quantum multiplicities, 473 | n=0,1,2; q=1 and −1 | [0]=0,[1]=1,[2]=q⁻¹+q; values at 1:0,1,2; at −1:[2]=−2 | Pass; no division by [2] |
| Graded coefficient category, 480 | Λ₁=ℤ[e₁], regular module | e₁·1 has degree 2; degree-zero piece is ℤ, not a Λ₁-submodule | Pass; missing supplier R01 |
| Unsigned graded tensor, 493 | Odd elements X of two shifted circles | Swap(X⊗X)=+X⊗X; Koszul version would give −X⊗X over ℤ | Pass; reject signed wrong model |
| Shift/tensor comparison, 503 | Elements degrees 2,4; shifts 1,−2 | Shifted tensor degree 3+2=5; total tensor shifted by −1 has degree 6−1=5 | Pass |
| Graded scalar extension, 510 | e₁↦0 versus e₁↦1 into degree-zero ℤ | 0 lies in degree 2; 1 does not | Pass; second comparison only ungraded |
| Ordinary formal shifts, 516 | Original map degree 2, shifts a=0,b=−2 | New degree 0; old degree 0+0−(−2)=2 | Pass |
| RW evaluation domain, 533 | Label a=N+1, versus empty foam | Coloring counts 0 versus 1; evaluations 0 versus 1 | Pass; no rank bound in raw carrier |
| RW polynomiality/specialization, 533 | N=2, σ=1 top-decorated sphere, coincident pigments | Rational sum (X₁−X₂)/(X₁−X₂)=1 before specialization; termwise at equality would give 0/0 | Pass for cancellation example; integral theorem limited |
| RW monochrome surface parity, 550 | Sphere, torus, genus-two sheet | χ=2,0,−2; χ/2=1,0,−1 integral | Pass; general finite-record lemma limited |
| Weighted/linear Euler distinction, 573 | Label a sphere | χ_lin=2a versus degree contribution −2a(N−a) | Pass; distinct quantities |
| Unit normalization, 579 | Label a sphere/torus/genus two | Multipliers (−σ)^a,1,(−σ)^(−a); at σ=−1 all 1 | Pass; unit assumption needed |
| Top-sphere trace, 593 | a=0,1,2,3 | σ=1:1,1,−1,−1; σ=−1:1,−1,−1,1 | Pass; scalar Lean statement padding R04 |
| Bar-Natan closed evaluation, 603 | Undecorated sphere, torus, genus two | ε1=0, ε(2X)=2, ε0=0 | Pass |
| Unoriented evaluation, 606 | Klein bottle with identity involution | m(1⊗X+X⊗1)=2X, trace 2=torus value | Pass; Möbius band excluded |
| Frobenius grading, 613 | deg X=2,c=1 | Unshifted degrees 0,2; circle A{−1} degrees −1,1 | Pass |
| KH1, 628 | deg X=−2,c=−1; m and Δ | Circle degrees 1,−1; m(1⊗1):1−2=−1; Δ1:0−1=−1 | Pass |
| KH1 unit/counit, 628 | η1=1, εX=1 | Output−input degrees 1−0=1 and 0−(−1)=1 | Pass |
| KH1 reversal, 638 | Degree-2 vector shifted by 1 | Reversal degree −3; reversed vector shifted by −1 has degree −2−1=−3 | Pass |
| State radical and ideal, 658 | Unit object with End=ℤ, ev(n)=2n | Rad=0, state=ℤ, action kernel=0; with ev=0: Rad=ℤ,state=0,kernel=ℤ | Pass; no generic perfectness/monoidality claimed |
| Zero-label erasure, 683 | Repeated large annulus, zero small disk; N=3,a=1 | Undecorated value 3; scalar decoration 2 on zero facet gives 6 | Pass; erasure must retain scalar |
| Above-rank categorical vanishing, 690 | a=N+1 | Every closure evaluation 0; identity class 0; state module 0 | Pass; empty object has state Λ_N |
| Fixed-rotation planarity, 700 | Two theta rotations | V=2,E=3,F=3 gives χ=2; reversing one effective rotation gives F=1,χ=0 | Pass; abstract graph alone insufficient |
| Vertex-free planarity, 700 | Empty web, one circle | Components 0 and 1; each circle separates sphere into 2 faces, χ=2 | Pass; separate circle handling |
| Normalization transport, 736 | a=1 circle, σ=−1 versus 1 | Trace(X)=−1 versus +1; underlying rank 2 unchanged | Pass; ordinary comparison must not assert same-source trace preservation |
| Contextual local identities, 764 | Dual-number neck cut | Σ basis⊗dual =1⊗X+X⊗1=Δ1; closure gives 2 | Pass for nilvalent case; general foam identities limited |
| Circle/digon base case, 804 | N=1 and label 2 | Available 2-subsets=0; every term containing label 2 vanishes | Pass |
| Stable cyclic hexagon, 824 | N=4,q=1, exterior P_R | H_R+Q_01=48+96=144; H_L+Q_34=108+36=144 | Pass for color counts; inverse foam identities limited |
| Stable cyclic hexagon, 824 | N=4,q=1, exterior P_L | 108+36=144; 48+96=144 | Pass for color counts |
| Rank-3 hexagon, 834 | N=3,q=1, either exterior | H_R=24=H_L; coefficient [0]=0 | Pass for color counts |
| Rank-2 exception, 835 | N=2,q=1, exterior P_R | H_R=8,H_L=2; README does not assert their uncorrected equality | Pass; retain separate rank-2 route |
| First square decomposition, 838 | N=2,3,4,q=1, exterior P_R | 8=8+0·4; 36=27+1·9; 96=64+2·16 | Pass for color counts |
| Second square decomposition, 838 | Same ranks/exterior | 2=2+0·4; 12=3+1·9; 36=4+2·16 | Pass for color counts |
| Base local relations against arbitrary boundary pigments, 804–841 | All 4,890 assignments for N=1,2,3,4 | 0 failed applicable square/hexagon equalities; square tested N≥2, hexagon N≥3 | Pass at q=1 only; no categorical cancellation used |
| Stable switch gives retract, 843 | Isomorphism ℤ⊕ℤ→ℤ², first coordinate | Inclusion (1,0), projection (1,0); pi=1, ip=diag(1,0) | Pass; does not assert cancellation |
| Wu higher-label step, 846 | j=l=2,m=2,q=1, ranks Γ=Γ₂=1 | Γ₁ rank 4; Γ₀ rank 4+1=5; one summand has pi=1 | Pass for multiplicities; no inverse of 4 required |
| Identity resolution, 854 | W=ℤ² with coordinate basis/tests | a₁b₁+a₂b₂=diag(1,0)+diag(0,1)=I₂ | Pass; arbitrary filling (2,3) reconstructs (2,3) |
| I₁=I₂ after resolution, 862 | W=ℤ², matrix f≠0 with entry f₁₂=1 | Matrix-unit trace test and coordinate state test both detect 1 | Pass in split model; foam resolution still needed |
| Integral graded freeness, 871 | p=0,id,diag(1,0), N=0,1,2 | Image ranks 0,1,1; homogeneous bases empty,1,(1,0) | Pass; headline signature missing R02 |
| Decomposition matrices, 878 | p=diag(1,0), ι=(1,0)ᵀ,π=(1,0) | ιπ=p and πι=1 | Pass; general existence is the freeness theorem |
| Parameter/coefficient transport, 885 | Same matrices modulo 2 or over zero ring | πι=1 in either ring; over zero ring 1=0 and resulting module=0 | Pass; identities survive arbitrary base change |
| Full reconstruction, 897 | Sums of 1 and 2 empty webs | Hom(Λ,Λ²)=Λ²; Hom(Λ²,Λ²)=Mat₂(Λ) rank 4 | Pass in split model |
| Perfect outgoing pairing, 900 | Coordinate bases of Λ² | Gram I₂, inverse I₂, determinant 1 | Pass; differs from merely radical-free example 2xy |
| Strong tensor, 902 | Sums of ranks 2 and 3 | Basis pairs 6; tensor rank 2·3=6; unit rank 1 | Pass in split model |
| Graded equivalence, 906 | Λ{0}⊕Λ{2} | Both sides have two homogeneous generators of degrees 0,2 | Limited to split objects; essential surjectivity follows target freeness |
| Radical base change warning, 909 | Pairing 2xy on ℤ, reduce mod 2 | Before: rad=0,state=ℤ; after: pairing 0,rad=𝔽₂,state=0, while ℤ⊗𝔽₂=𝔽₂ | Pass negative control; blanket base-change theorem correctly avoided |
| Circle presentation, 919 | N=2,a=1,e₁=3,e₂=2 | x²=3x−2; multiplication matrix [[0,−2],[1,3]] | Pass |
| Circle Schur rank, 929 | (N,a)=(2,0),(2,1),(2,2),(2,3) | Ranks 1,2,1,0; binomial ranks 1,2,1, and above-rank vanishing | Pass |
| Circle trace/dual basis, 938–969 | N=2,a=1,e₁=3,σ=1 | B=[[0,1],[1,3]], D=[[-3,1],[1,0]], BD=I₂ | Pass; omitting −e₁ gives off-diagonal 3 |
| Circle sign specialization, 946 | N=2,a=1,σ=−1 | B=[[0,−1],[−1,−3]], dual (3−x,−1); product I₂ | Pass |
| Top label trace, 968 | a=N=2 | Algebra R, trace(1)=−σ²; at σ=1 gives −1, not +1 | Pass |
| Nilvalent circle decomposition, 971 | r=0,1,2, A=dual numbers | State ranks 1,2,4; dual pairings 1,B,B⊗B | Pass |
| Arbitrary coefficient characteristics, 438/992 | Dual numbers over 𝔽₃, ℤ/4ℤ, ℤ₂ and 𝔽₂ | Torus values 2,2,2,0; pairing determinant −1 remains a unit in each; h²=0 in each | Pass; no field or unramifiedness hypothesis needed |
| KH2 tensor comparison, 992 | r=0,1,2, coefficient change ℤ→𝔽₂ | Same ranks 1,2,4 and same 0/1 basis matrices; torus changes 2→0 | Pass; no flatness needed for explicit bases |
| Semistrict tensorator direction, 1016 | Independent scalar cells 2 and 3 | Two composites 2·3=6 and 3·2=6; tensorator identity in this particular model | Limited; does not force general tensorator to identity |
| Enrichment versus degree-zero maps, 1041 | Λ₁ as graded hom-object | Hom from unit in degree 0=ℤ; full ungraded hom=ℤ[e₁], containing e₁ | Pass; objectwise degree-zero check alone insufficient |
| Linear/graded higher operations, 1057 | Homogeneous scalars e₁,e₁² | Composition coefficient e₁³ on either side, degrees 2+4=6 | Pass in coefficient model |
| Higher formal shifts, 1084 | f{1}≫g{−2}, tensor analog | Both total shifts 1−2=−1, without sign | Limited to shift arithmetic |
| ShiftedHom convention, 1096 | Degree-2 map f→g | Maps to g{−2}=g⟦2⟧; degree-zero condition 0−(−2)=2 | Pass |
| Central coefficient action, 1101 | e₁ acting through two factors | (e₁m)⊗n=m⊗(e₁n), coefficient e₁ and degree 2 on both sides | Pass in balanced tensor model; R01 prerequisite |
| Reconstruction from shifts, 1112 | Degree-2 scalar e₁ | Hom²(f,f)=Hom(f,f{−2}); e₁ represented in both, not lost in ℤ-linear Hom⁰ | Pass in represented model |
| gl(N) closure shift, 1129 | N=2 merge 1+1, then split | Boundary weights 2 and 0; vertex weight 1; path weight 1+1−0=2 | Pass |
| Higher composition weights, 1129 | N=3 same path; N=4 merge 1+2 and split | Path weights 4 and 7; equal to half-sum of endpoint weights | Pass |
| Oversized boundary total functions, 1129 | N=1,label 2 identity; N=0,label 1 identity | Integer weights −2 and −1, not truncated to 0 | Pass; first has zero evaluated hom, second outside evaluation domain |
| Oriented/unoriented 2-categories, 1246 | Dual-number identity and handle | Identity action on 1,X; handle 1↦2X,X↦0 in both | Limited; higher coherence not calculated generally |
| Progressive full inclusion, 1264 | One N=1 label-1 identity web | Ambient end state R has rank 1, identity spans; above-rank label gives rank 0 | Pass small case; no definition by compiler image |
| Spatial duality, 1314 | Boundary (+a,−b), ordinary scalar composite | Dual (+b,−a), double dual original; reversed composite 3·2=6=2·3 | Limited to word/variance checks, not all spatial axioms |
| Elementary expression typing, 1361 | Merge 1+2→3; zip/unit | M:P→Q,S:Q→P; unit has id_P→M≫S, not id_Q | Pass types; explicit abstract foam models not present |
| KH3 generators, 1399 | Inputs 1,X and pairs 11,1X,X1,XX | η1=1; ε(1,X)=(0,1); m=(1,X,X,0); Δ(1,X)=(1⊗X+X⊗1,X⊗X) | Pass; add locator R05 |
| KH3 unaffected factors/composition, 1399 | m⊗id on 1⊗X⊗1; h on 1 | Both interpretations give X⊗1; mΔ(1)=2X | Pass |
| Merge/split shifted adjunction, 1407 | a=b=1 | Unit degree +1 with target shift −1 becomes 0; counit degree −1 with source shift −1 becomes 0 | Pass; unshifted degree-zero adjunction would fail |
| Decoration/composition, 1445 | x² in N=2,a=1,e₁=3,e₂=2 | Sequential x action and one x² action both send 1↦3x−2 | Pass |
| Direct compiler, 1460 | Identity, scalar decoration 2 followed by 3 | Values id and 6·id in both interpretation orders | Limited; arbitrary generator models absent |
| Compiler-kernel relation, 1492 | Linear map ℤ²→ℤ,(a,b)↦a+b | Kernel generated by (1,−1); quotient/image both ℤ; (1,0) and (0,1) both map 1 | Pass; no automatic surjectivity to a larger target |
| Progressive restriction, 1524 | Circle opening versus identity strand | Opening has a circular intermediate web and is excluded; strand identity allowed | Pass on syntax condition; no numerical dimension claim |
| Annular retract/spanning route, 1562 | V=ℤ, C⁰=ℤ², i=(1,0),p=(1,0) | pi=1; ip=diag(1,0)≠I₂; projected basis {1,0} spans V | Pass model; integral annular witness theorem limited |
| Progressive compiler quotient, 1597 | Surjective sum map ℤ²→ℤ | Quotient by ℤ(1,−1) has rank 1=image rank 1 | Pass algebraic consequence; general surjectivity unproved |
| Planar operations/canopolis, 1621 | Unary identity, two disk insertions | Identity cylinder χ=0; inserting three cylinders in either order χ=0 | Limited: does not verify all isotopies/coherence |
| Disk/2-category comparison, 1663 | Empty-boundary circle, dual numbers | Circle state rank 2; its endomorphism module rank 4 in either split presentation | Pass split model; comparison functor absent |
| KH4 formal relations, 1693 | Sphere, torus, four tubes on four unit inputs | 0,2; C₁₂+C₃₄=X₁+X₂+X₃+X₄=C₁₃+C₂₄ | Pass, including mod 2 |
| KH4 grading/substitution, 1693 | Identity strip r=1; two successive strips | χ−r=1−1=0; composited strip again 0, matching 0+0 | Pass |
| Missing-supplier claims, 256–268/955 | Listed modules at actual pins | Advertised present; absent files/names as R01, versus existing Basic/Shift/Projective | Fail; repair R01 |
| Lean acceptance coverage, 871 versus Suggested | Native homogeneous idempotent signature | Required freeness headline count 1; actual count 0; scratch elaboration errors 0 | Fail; repair R02 |
| Option gate, source/shape/link policies | Exact file text | 4 overrides; 0 Needs lines; 0 source manifests; 1 gated frozen link; public URL mistaken for 1 private path | R03, R05–R08 |

**Lean declaration instances.** Names below are in `TauCetiRoadmap.Foams`; line numbers refer to `TauCetiRoadmap/Foams/Suggested.lean`. These are computations from the definitions, not new admitted declarations. No change is proposed unless indicated. API correctness does not make an API declaration an acceptance headline (R04).

| Declaration (line) | Instance | Computed values | Result/change |
| --- | --- | --- | --- |
| `EdgeEnd` (81) | One loop | Two distinct ends source,target; cardinality 2 | Pass instance |
| `EdgeEnd.swap` (91) | Source and target | source↦target; target↦source | Pass instance |
| `EdgeEnd.swap_swap` (95) | Both ends | swap²(source)=source; swap²(target)=target | Pass instance |
| `VertexKind` (99) | Zero-label vertex | merge and split remain two distinct constructors | Pass instance |
| `VertexKind.swap` (105) | Merge and split | merge↦split; split↦merge | Pass instance |
| `VertexKind.largeEnd` (110) | Merge and split | Large ends source,target respectively | Pass instance |
| `VertexKind.smallEnd` (115) | Merge and split | Small ends target,source respectively | Pass instance |
| `VertexKind.largeEnd_swap` (119) | k=merge,split | Both sides target,source respectively | Pass instance |
| `VertexKind.smallEnd_swap` (122) | k=merge,split | Both sides source,target respectively | Pass instance |
| `endpoint` (126) | Arc v₀→v₁ | Endpoint(source)=v₀; endpoint(target)=v₁; loop gives x,x | Pass instance |
| `Incident` (131) | Self-loop at x | Incident set has 2 elements, not 1 | Pass instance |
| `endpoint_swap` (134) | v₀→v₁, each end | Reversed endpoints v₀,v₁ equal original v₀,v₁ | Pass instance |
| `incidentSwap` (140) | Loop at x | The 2 occurrences are exchanged; round trip fixes both | Pass instance |
| `incidentSwap_apply_coe` (147) | Loop source occurrence | Both sides (edge,target) | Pass instance |
| `incidentSwap_symm_apply_coe` (151) | Reversed loop target occurrence | Both sides (edge,source) | Pass instance |
| `perm_symm_apply_eq_of_card_eq_three` (157) | σ=(012), a=0 | σ⁻¹(0)=2=σ²(0); identity σ excluded | Pass instance |
| `ClosedWeb` (183) | Theta; isolated vertex | Theta valences 3,3 admitted; isolated valence 0 excluded | Pass instance |
| `ClosedWeb.NoLoops` (209) | Theta; web with loop | True for theta (all endpoints differ); false if source=target | Pass instance |
| `ClosedWeb.firstSmallEnd` (213) | Large position 2, κ=(012) | First small end κ(2)=0 | Pass instance |
| `ClosedWeb.secondSmallEnd` (217) | Same vertex | Second small end κ²(2)=1 | Pass instance |
| `ClosedWeb.cyclicNext_symm_apply` (223) | Same vertex, end 0 | κ⁻¹(0)=2=κ²(0) | Pass instance |
| `ClosedWeb.empty` (231) | Empty web | Vertex, arc, circle cardinalities 0,0,0 | Pass instance |
| `ClosedWeb.mirror` (247) | κ=(012) | Mirror κ⁻¹=(021); endpoints unchanged | Pass instance |
| `ClosedWeb.mirror_mirror` (256) | κ=(012) | Double inversion (012)=(012) | Pass instance |
| `ClosedWeb.reverse` (262) | Arc 0→1 | Reversal has source 1,target 0; merge↔split | Pass instance |
| `LabeledClosedWeb` (299) | Small labels 1,2,large 3 | 3=1+2; large 4 fails 4≠3 | Pass instance |
| `NonnegativeWeb` (310) | Zero theta | All three labels 0 allowed; equation 0=0 | Pass instance |
| `LabeledClosedWeb.label_firstSmallEnd_add_label_secondSmallEnd` (318) | Small 1,2,large 3 | Both sides 1+2=3 | Pass instance |
| `LabeledClosedWeb.flux` (329) | Merge 1+2→3 | Incoming sum 3=outgoing sum 3; zero case 0=0 | Pass instance |
| `LabeledClosedWeb.mirror` (372) | ℕ labels 1,2; noncommuting labels | 2+1=3 over ℕ; S₃ products (132)≠(123), so commutativity restriction matters | Pass instance |
| `LabeledClosedWeb.mirror_mirror` (383) | Theta 1,2,3 | Double mirror restores order (1,2) and labels (1,2,3) | Pass instance |
| `LabeledClosedWeb.reverse` (390) | Ordered word labels a,b,ab | Reversal preserves equation ab=ab; no ba substitution | Pass instance |
| `LabeledClosedWeb.IsPositive` (411) | Circle 0; circle 1; empty | False; true; true respectively | Pass instance |
| `LabeledClosedWeb.LabelsAtMost` (414) | Circle 2, bounds 1,2 | False; true respectively | Pass instance |
| `LabeledClosedWeb.labelsAtMost_mono` (416) | Circle 2, bounds 2≤3 | 2≤2 and 2≤3 both true | Pass instance |
| `LabeledClosedWeb.not_labelsAtMost_of_overlarge` (420) | Circle 3, N=2 | Witness 3>2; bound predicate false | Pass instance |
| `LabeledClosedWeb.isPositive_mirror` (425) | Circle 0 and 1 | Mirror positivity false↔false; true↔true | Pass instance |
| `LabeledClosedWeb.labelsAtMost_mirror` (428) | Circle 2, N=1,2 | Mirror boundedness false↔false; true↔true | Pass instance |
| `LabeledClosedWeb.isPositive_reverse` (431) | Circle 0 and 1 | Reversal positivity false↔false; true↔true | Pass instance |
| `PositiveWeb` (439) | Circle 0 versus 1 | 0 excluded; 1 included; empty included vacuously | Pass instance |
| `BoundedPositiveWeb` (443) | Circle 2, N=1,2 | Bounded-positive carrier rejects first and admits second | Pass instance |
| `PositiveWeb.toNonnegative` (449) | Positive circle 2 | Underlying label stays 2 | Pass instance |
| `PositiveWeb.toNonnegative_injective` (451) | Positive circles 1 and 2 | Underlying labels 1≠2, so they are not identified | Pass instance |
| `PositiveWeb.exists_toNonnegative_iff` (455) | Nonnegative circles 0 and 1 | Existence false↔positivity false; true↔true | Pass instance |
| `PositiveWeb.mirror` (463) | Positive theta 1,1,2 | Mirror labels remain positive 1,1,2 | Pass instance |
| `PositiveWeb.equivPNat` (469) | Positive circle 2 | PNat label 2 maps back to Nat 2; zero has no preimage | Pass instance |
| `BoundedPositiveWeb.forgetBound` (486) | Circle 2 bounded by 2 | Forgetting bound retains label 2 and positivity | Pass instance |
| `BoundedPositiveWeb.forgetBound_injective` (488) | Bounded circles 1 and 2 | Underlying labels still 1≠2 | Pass instance |
| `BoundedPositiveWeb.increaseBound` (492) | Circle 2, bound 2→3 | Bound changes 2≤2 to 2≤3; label remains 2 | Pass instance |
| `BoundedPositiveWeb.forget_increaseBound` (496) | Same circle | Both forgotten webs have identical label 2 | Pass instance |
| `NilvalentLabelingDatum` (507) | Single-label datum with A=dual numbers | One label; decoration rank 2; no addition required | Pass instance |
| `LabelingDatum` (519) | Natural-label datum | 1+2=3 determines decoration arities 1,2,3; no neutral label assumed | Pass instance |
| `LabelingDatum.NeutralLabel` (527) | Neutral natural label; positive naturals | 0+n=n and Dec(0)=R; no label 0 in ℕ+ | Pass instance |
| `LabelingDatum.glNonnegative` (536) | Labels 0,1 | Dec(0)=R; Dec(1)=R[x] | Pass instance |
| `LabelingDatum.glPositive` (543) | Labels 1,2 | Positive labels give R[x] and symmetric R[x₁,x₂]; 0 excluded | Pass instance |
| `symmetricSubalgebra_fin_zero` (549) | No variables | Symmetric subalgebra equals constants R; permutation group has 1 element | Pass instance |
| `LabelingDatum.NeutralLabel.glNonnegative` (558) | Neutral label 0 | Chosen zero=0; R≃Dec(0) sends 1↦1 | Pass instance |
| `NilvalentLabelingDatum.barNatan` (569) | A=R[X]/X² | Unique label; decoration 1,X, product X²=0 | Pass instance |
| `EquivariantRing` (579) | N=0,1,2 | Rings ℤ,ℤ[e₁],ℤ[e₁,e₂] | Pass instance |
| `EquivariantRing.grading` (590) | N=2, monomials e₁,e₂,e₁² | Weights 2,4,4; constant 1 weight 0 | Pass instance |
| `EquivariantRing.toSymmetric` (599) | N=2 | e₁↦X₁+X₂; e₂↦X₁X₂ | Pass instance |
| `EquivariantRing.toSymmetric_X` (603) | N=2, i=0,1 | Images X₁+X₂=e₁(X); X₁X₂=e₂(X) | Pass instance |
| `Normalization.circleTraceUnit` (621) | a=0,1,2,3 | Values 1,σ,−σ²,−σ³ | Pass instance |
| `Normalization.circleTraceUnit_robertWagner` (625) | σ=−1,a=0,1,2,3 | Both sides 1,−1,−1,1; single simp succeeds (R04) | Pass; delete padding (R04) |
| `Normalization.circleTraceUnit_positive` (630) | σ=1,a=0,1,2,3 | Both sides 1,1,−1,−1 | Pass instance |
| `PigmentRing` (638) | N=0,2 | ℤ; ℤ[X₁,X₂] | Pass instance |
| `PigmentRing.grading` (649) | N=2 | Each X has degree 2; X₁X₂ degree 4 | Pass instance |
| `EquivariantRing.toPigment` (658) | N=2 | e₂↦X₁X₂, degree 4 on both sides | Pass instance |
| `isWeightedHomogeneous_aeval` (663) | φ=e₁²,g₁=X₁+X₂ | Image X₁²+2X₁X₂+X₂², every monomial weight 4; zero remains homogeneous | Pass instance |
| `isWeightedHomogeneous_esymm` (678) | N=2,n=0,1,2,3 | Polynomials 1,X₁+X₂,X₁X₂,0; weights 0,2,4,6 (zero allowed) | Pass instance |
| `EquivariantRing.toPigment_mem_grading` (694) | N=2,x=e₂,d=4 | e₂ belongs to degree 4; image X₁X₂ belongs to degree 4 | Pass instance |
| `BoundarySign` (714) | One boundary point | Two signs +,− | Pass instance |
| `BoundarySign.flip` (720) | Both signs | +↦−; −↦+ | Pass instance |
| `BoundarySign.flip_flip` (724) | Both signs | flip²(+)=+; flip²(−)=− | Pass instance |
| `BoundaryWord` (731) | Words empty,(+1,−2) | Lengths 0 and 2; order retained | Pass instance |
| `BoundaryWord.toList_empty` (746) | Empty word | Underlying list []=[] | Pass instance |
| `BoundaryWord.toList_append` (748) | s=[+1],t=[−2] | Both lists [+1,−2] | Pass instance |
| `BoundaryWord.dual` (753) | [+1,−2] | Dual [+2,−1] | Pass instance |
| `BoundaryWord.dual_dual` (756) | [+1,−2] | Double dual [+1,−2] | Pass instance |
| `BoundaryWord.dual_append` (760) | s=[+1],t=[−2] | Both dual concatenations [+2,−1] | Pass instance |
| `BoundaryWord.weight` (766) | N=3,[+1,−2]; N=1,[+2] | Weights 2+2=4; −2 (integer subtraction) | Pass instance |
| `BoundaryWord.weight_empty` (769) | N=0,1,2, empty | Weight 0=0 in all cases | Pass instance |
| `BoundaryWord.weight_append` (771) | N=3,s=[+1],t=[−2] | 4=2+2 | Pass instance |
| `BoundaryWord.weight_dual` (775) | N=3,[+1,−2] | Dual weight 4=original 4 | Pass instance |
| `GeneratingWeb` (791) | Merge 1,2; cup 1 | Sources/targets (+1,+2)→(+3), and empty→oppositely signed pair | Pass instance |
| `BasicWeb` (802) | N=2,merge1,1 with one passing1 | Weight contributions 1+1=2; boundary weights 3 and 1 | Pass instance |
| `BoundaryWord.instQuiver` (809) | s=(+1,+1),t=(+2) | Merge basic web is an arrow; reversed split has opposite source/target | Pass instance |
| `WebWord` (816) | Empty path; merge then split | Lengths 0 and 2; endpoints both (+1,+1) for composite | Pass instance |
| `GeneratingWeb.weight` (823) | N=2 merge1,1; cup1 | Weights 1 and 1; N=4 merge1,2 weight5 | Pass instance |
| `GeneratingWeb.two_mul_weight_eq_add` (831) | N=2 merge1,1 | 2·1=2+0; cup1:2·1=0+2 | Pass instance |
| `BasicWeb.weight` (837) | N=2 merge1,1 and one passing1 | Weight 1+0+1=2 | Pass instance |
| `BasicWeb.two_mul_weight_eq_add` (840) | Same basic web | 2·2=3+1 | Pass instance |
| `weightedEulerChar` (854) | N=2 identity at (+1,+1); merge/split | Weights 2; 1+1−0=2 | Pass instance |
| `two_mul_weightedEulerChar_eq_add` (861) | Same two paths | 2·2=2+2 for each | Pass instance |
| `weightedEulerChar_comp` (872) | N=2 merge followed by split | Composite weight2=1+1−0 | Pass instance |
| `weightedEulerChar_eq_of_parallel` (886) | Identity and merge/split at (+1,+1) | Both weights 2; no claim about equal morphisms | Pass instance |
| `Examples.empty` (905) | Empty example | Vertex,arc,circle cardinalities 0,0,0 | Pass instance |
| `Examples.positiveEmpty` (910) | Positive empty example | 0 positivity obligations; underlying counts 0,0,0 | Pass instance |
| `Examples.circle` (914) | Circle a=0,1,3 | 0 vertices,0 arcs,1 circle; labels 0,1,3 | Pass instance |
| `Examples.positiveCircle` (930) | a=1 versus a=0 | 1>0 supplies subtype; 0>0 cannot | Pass instance |
| `Examples.overlargeCircle` (938) | N=0,1,2 | Labels 1,2,3 respectively, all positive | Pass instance |
| `Examples.overlargeCircle_not_bounded` (940) | N=0,1,2 | 1≤0,2≤1,3≤2 all false | Pass instance |
| `Examples.thetaSource` (947) | Edges 0,1,2 | Sources 0,0,1 | Pass instance |
| `Examples.thetaTarget` (948) | Edges 0,1,2 | Targets 1,1,0 | Pass instance |
| `Examples.thetaEnd` (950) | x=0,edges0,1,2 | Ends source,source,target | Pass instance |
| `Examples.thetaIncident` (953) | Each theta vertex | Three incidents map bijectively to 0,1,2 | Pass instance |
| `Examples.rotateThree` (965) | Inputs 0,1,2 | Rotation outputs1,2,0; inverse2,0,1 | Pass instance |
| `Examples.thetaNext` (971) | Normal and reversed κ at x | Cycles (012) and (021); inverse composition identity | Pass instance |
| `Examples.thetaLabel` (976) | a=1,b=2 | Edge labels1,2,3; a=b=0 gives0,0,0 | Pass instance |
| `Examples.theta` (983) | a=1,b=2 | V=2,E=3, labels1,2,3; conservation3=3 | Pass instance |
| `Examples.positiveTheta` (1013) | a=b=1; a=0 | Positive labels1,1,2 admitted; zero-small case excluded | Pass instance |
| `Examples.theta112` (1023) | Theta112 | Labels1,1,2, vertex valences3,3 | Pass instance |
| `Examples.theta112Opposite` (1025) | Opposite cyclic data | Labels1,1,2 unchanged; effective face counts distinguish3 versus1 | Pass instance |
| `Examples.boundedTheta112` (1028) | Theta112,N=2 | Maximum label2≤2; at N=1 inequality fails | Pass instance |
| `Examples.zeroTheta` (1034) | Zero theta | V=2,E=3, all labels0; not equal to empty record | Pass instance |
| `SemistrictMonoidalBicategoryStruct` (1121) | Terminal strict bicategory | One object/arrow/cell: tensorator source=target=identity; noninvertible comparison excluded | Limited model; see source limitation |
| `SemistrictMonoidalBicategory` (1179) | Terminal strict bicategory | All specified coherence composites equal its unique identity; insufficient to distinguish nontrivial tensorator coherence | Limited model; see source limitation |
| `SemistrictMonoidalBicategory.tensorLeftPseudofunctor` (1352) | Terminal model, tensor left by unit | Objects/arrows/cells each mapped to themselves; identity/composition constraints id=id | Limited model; see source limitation |
| `SemistrictMonoidalBicategory.tensorRightPseudofunctor` (1366) | Terminal model, tensor right by unit | Objects/arrows/cells each mapped to themselves; constraints id=id | Limited model; see source limitation |
| `ClosedEvaluation` (1445) | Unit end ringℤ, ev(n)=2n or0 | ev(1)=2 or0 allowed; definition deliberately not a ring hom | Pass instance |
| `ClosedEvaluation.radical` (1458) | Same model | ev=2· gives rad0; ev=0 gives radℤ | Pass instance |
| `ClosedEvaluation.mem_radical` (1467) | ev=2·, x=0,1 | Membership true,false; tests 2xg=0 for all g true,false | Pass instance |
| `ClosedEvaluation.radical_eq_iInf_ker` (1473) | ev=2·; test g=1 | ker(×2)=0; intersection of all ker(×2g)=0=rad | Pass instance |
| `ClosedEvaluation.stateSpace` (1481) | ev=2· and ev=0 | State quotients ℤ/0=ℤ and ℤ/ℤ=0 | Pass instance |
| `ClosedEvaluation.radical_le_comap_rightComp` (1485) | ev=2·, f=3 | Image of radical0 is0, contained in radical0; ev=0 sends ℤ into ℤ | Pass instance |
| `ClosedEvaluation.stateSpaceMap` (1492) | ev=2·, f=3,x=2 | State map sends [2]↦[6] | Pass instance |
| `ClosedEvaluation.stateSpaceMap_mk` (1497) | Same example | Both sides [6] | Pass instance |
| `ClosedEvaluation.stateSpaceMap_id` (1504) | ev=2·,x=2 | Both identity maps send [2]↦[2] | Pass instance |
| `ClosedEvaluation.stateSpaceMap_comp` (1510) | ev=2·, f=2,g=3,x=1 | Both sides send [1]↦[6] | Pass instance |
| `ClosedEvaluation.stateSpaceFunctor` (1517) | Same category/evaluation | Object stateℤ; morphism3 maps to ×3; 2 then3 maps to ×6 | Pass instance |
| `ClosedEvaluation.actionKernel` (1527) | ev=2·; ev=0 | Action kernels0 andℤ respectively | Pass instance |
| `ClosedEvaluation.mem_actionKernel` (1536) | ev=2·,f=0,1 | Both conditions true,false; a=b=1 detects2 for f=1 | Pass instance |
| `ClosedEvaluation.comp_mem_actionKernel_left` (1542) | ev=2·, f=0,g=3 | Composite0 and evaluation2a·0·b=0 | Pass instance |
| `ClosedEvaluation.comp_mem_actionKernel_right` (1549) | ev=2·, f=0,g=3 | Composite0 and evaluation2a·0·b=0 | Pass instance |
| `ClosedEvaluation.mem_actionKernel_iff_stateSpaceMap_eq_zero` (1556) | ev=2·,f=0,1; ev=0,f=1 | Kernel/action-zero pairs (true,true),(false,false),(true,true) | Pass instance |
| `ClosedEvaluation.actionKernel_tensorUnit_eq_radical` (1570) | ev=2· then ev=0 at unit | I₂=rad=0, then I₂=rad=ℤ | Pass instance |

**Signature and padding probes.** A scratch copy appended `#check @name` for each of the 136 real named declarations in the worker's 138-entry list. The entries `because` and `,` came from prose at lines 526 and 730 and are not declarations. The scratch elaboration succeeded. All 18 suspected lost-binder signatures retain the needed instances: two tensor pseudofunctors retain the bicategory/strict/semistrict structures, and sixteen universal-construction declarations retain category, preadditive, linear and monoidal instances through their types. No lost hypothesis is reported. No source file was changed. The sole original `sorry` was replaced by the one-tactic proof in R04; the added freeness signature in R02 also elaborated. Thus the single remaining scratch warning is the deliberately admitted freeness probe, not an error in the original file.

**Headline inventory and statability.** The README's end results are integral equivariant evaluation; planar identity resolutions and decomposition into shifted empty webs; integral graded freeness supporting that decomposition; perfect reconstruction, strong tensor comparison and coefficient change; circle Frobenius identification; oriented/unoriented nilvalent decompositions; enriched semistrict foam 2-categories and formal shifts; spatial duality; compiler/contextual relations; progressive spanning; canopolis comparison; and KH1–KH4. The integral graded-freeness statement is statable now (R02). The other foam/state/compiler/canopolis statements require their actual carriers and maps; the module introduction correctly identifies many of those absences and does not replace them with free predicates. Its replacement under R02 must enumerate the remaining headlines explicitly. The present generic `ClosedEvaluation` API is not a substitute for a theorem about the specified foam evaluations. The raw-web and semistrict records are genuine data with laws, but neither is a headline theorem and neither is needed to state the freeness result.

**Pinned-library audit.** Mathlib was inspected at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches covered graded modules, tensor/balanced products, shifts, duality/mates, Frobenius pairings, symmetric/Schur polynomials, finite maps, Khovanov carriers and the claimed constructors. The following are concrete declarations opened, rather than inferences from documentation on a newer version:

| Repository-relative source at pin | Declaration/data and actual scope |
| --- | --- |
| `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` | `LinearMap.IsPerfPair` requires both induced maps to be bijective. It is stronger than radical zero over ℤ; `of_injective` at 136 has finite-dimensional field hypotheses. |
| `Mathlib/RingTheory/Coalgebra/IsFrobenius.lean:111` | `Coalgebra.IsFrobenius`; finite/projective consequences at 159/165, and `compr₂_mul_counit_bijective` at 189. This does not assert a chosen homogeneous free basis. |
| `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | `Module.Basis` is native and works over the coefficient ring and image submodule in R02. |
| `Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:340` | `MvPolynomial.esymmAlgEquiv` supplies the native symmetric-polynomial algebra equivalence used in the real-body coefficient definition. |
| `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89` | `CategoryTheory.Bicategory.Adjunction` has unit/counit and both triangle laws (95/97); composition is at 161. It is the correct type of merge–split adjunction. |
| `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean:60` | Graded module objects and compatible scalar action; degree-preserving `Hom` at 81, `ofHom` at 97. No general graded tensor structure is supplied by this record. |
| `TauCeti/Algebra/Category/GradedModuleCat/Projective.lean:44` | `projective_of_module_projective`, not a graded-free classification. |
| `TauCeti/Algebra/Module/GradedModule/Nakayama.lean:76` | `eq_top_of_piece_le_sup_positive_smul_top`, with the bounded-below/positive-degree conditions; `subsingleton_of_positive_smul_top_eq_top` at 114. This is useful for the planned integral basis lift. |
| `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Basic.lean:174` | `TauCeti.diagramSchurPoly`; coefficient formula at 190, coefficient change at 223, zero criterion at 304 (with nontrivial coefficients). |
| `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/Pieri.lean:231` | `hsymm_mul_diagramSchurPoly`; `hsymm_mul_schurPoly` at 282. Do not cite an absent elementary rule as an implemented declaration. |
| `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/JacobiTrudi.lean:260` | `diagramSchurPoly_eq_det_hsymmInt`, the existing determinant identity. |
| `TauCeti/Combinatorics/RibbonGraph/Basic.lean:119` | Face permutation `(rotW * rotB)⁻¹`; face count at 225 and Euler characteristic at 234. Its bipartite representation still needs the roadmap's web-data conversion. |
| `TauCeti/CategoryTheory/Monoidal/Rigid/Functor.lean:75` | `CategoryTheory.Functor.mapExactPairing`, transporting pairings along a strong monoidal functor. It does not supply the nonexistent explicit `Mate` module. |
| `TauCeti/LinearAlgebra/TensorProduct/Basic.lean:50` | `LinearMap.tensorComponent` and its pure-tensor calculation at 60. Ordinary commutative tensor algebra does not imply the claimed general graded balanced monoidal package. |

Existing native pairings, adjunctions, module quotients, free-module/linear-map and symmetric-function machinery should be consumed. The missing part is the foam-specific construction and, where genuinely absent, the explicitly assigned general interface. In particular the proposed unsigned formal-shift category differs from the existing differential graded shift closure by its lack of Koszul signs; that distinction is stated in the README.

**Cross-roadmap ownership and order.** The required roadmap search tools were used by object, including semistrict/Gray structures, canopolis, finite maps, balanced tensor, graded bimodules, homogeneous free modules, formal shifts and Frobenius traces. The search included main and the indexed open heads; the board package index contained no competing foam/Gray-monoid package. The exact namespace search returned only Foams. This is not a re-plan of KhovanovHomology: the latter owns the ordinary algebra/formal surface theory, while Foams owns evaluated higher structures and their comparisons. No conflicting owner of this foam scope or the unsigned higher shift construction was found. Ownership against open pull requests whose files were not supplied was not independently checked beyond the search index; no extra checkout or dependency was invented.

| Citation in Foams | Resolved supplier content and ownership |
| --- | --- |
| KhovanovHomology K1–K2, K3 closed evaluation | `TauCetiRoadmap/KhovanovHomology/README.md:131`–139 has shared finite-map boundary work; K2 at 169–246 owns the chosen rank-two Frobenius maps, quantum degrees and formal S/T/4Tu surfaces. K3 at 320–341 specifies surface evaluation with genus/handle formulas. Foams' KH1–KH4 compare with these; they do not own a second formal surface category. |
| PivotalSpherical | `TauCetiRoadmap/PivotalSpherical/README.md:171`–210 separates ordinary duality interfaces from missing pairing/mate work. Its ordinary pivotal/spherical direction supplies no Gray-category spatiality theorem. The roadmap citation is legitimate; the asserted implemented module in R01 is not. |
| TemperleyLieb Layers 2,6,7 | `TauCetiRoadmap/TemperleyLieb/README.md:334`, 681 and 768 provide ordinary presentation, tensor-ideal and envelope/quotient work. These are the correct kinds of suppliers; no positivity/fusion theorem is being imported. Main was used, not a progress revision. |
| RepresentationTheory/SchurWeyl Layer 7 | `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:323`–350 covers Schur/symmetric-function identities. The nested roadmap exists; failure to resolve the nested name with a tool alone was not treated as absence. Main was read. |
| SurfaceTopology Layer 2 | Its maintained roadmap text was resolved with the roadmap tool: finite combinatorial maps, permutation triples, GMap conversion and Euler comparison. Foams owns the conversion of its incidence/rotation data; no realized embedding theorem is needed to decide its combinatorial criterion. |
| PlanarTopology Layers 6–7 | Its maintained roadmap text was resolved with the roadmap tool: Euler/orientation and planar/Schoenflies/tame finite-arc isotopy interfaces. Foams must still construct the actual disk operations and their action. This citation is not proof that a canopolis already exists. |

All six supplier citations were resolved; three main-roadmap shapes (KhovanovHomology, PivotalSpherical and TemperleyLieb) were read. No supplier was moved, no dependency file changed, and no UPWARD/CYCLE defect was inferred from an unlisted roadmap. The README's prose direction—Layer 0 coefficient foundations before Layer 2, generic Layer 3 before Layer 4, duality before compiler comparisons, KH1→KH2→KH3→KH4—does not itself create a cycle. Missing precise prerequisite ownership is confined to R01 and missing per-target dependency lists to R06.

## Not verifiable

- **Baez–Neuchl, Lemma 4**, DOI `10.1006/aima.1996.0052`: the source service found the paywalled publisher record and returned `uncertified`. No bypass was attempted. Neuchl's legally fetched thesis, Definition 1.8, and Goertz–Marino–Wedrich were read as related presentations, but this does not certify every numbered equation against the cited original Lemma 4. The settled uncertified source is not a new missing-text request.
- The source texts substantiate the sampled combinatorial reduction and ordinary Frobenius formulas. They do not certify this roadmap's new integral categorical hexagon inverses, integral annular witnesses, or the translation to every progressive elementary expression. Those remain explicitly assigned mathematical targets. The table records q=1 coloring counts and split-module consequences, not proofs of foam identities at general q or higher coherence.
- Diagram-only details in Carpentier's local moves and a complete equation-by-equation comparison of the long semistrict structure with the original Baez–Neuchl convention were not certified from the available text extraction. No source error is alleged from OCR or unread diagrams. The terminal bicategory tests in the Lean table cannot distinguish an inverse tensorator convention.
- The linked external trace-interface pull request is not a pinned library API. The pinned `Coalgebra.IsFrobenius` and `LinearMap.IsPerfPair` definitions were inspected; the general comparison remains a target here. Its existence in a future library was not assumed.

## Source issues

- none
