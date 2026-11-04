# Review of ChromaticHomotopyTheory (pull request #1643 at d7a196c)

**Verdict:** needs changes

## R01 (P1) — The dimension criterion uses the wrong periodicity

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:909`: “K(n)_1(X)=0 and K(n)_0(X) of finite dimension d”.

**Claim:** These two groups determine dualizability and dimension d of the associated K(n)-local E_n-module. The roadmap's K(n) has period 2(pⁿ−1), whereas the cited criterion uses a separately chosen **2-periodic** Morava K-theory.

**Witness:** At p=2, n=2, X=S², unreduced K(2)₀(X)=𝔽₂ and K(2)₁(X)=0. But E₂⊗Σ∞_+S²≃E₂⊕Σ²E₂ has dimension 2, not 1. See csy line 3627 and line 3639.

**Repair:** State the criterion using a separately named 2-periodic residue theory for the chosen E_n, with its residue field specified. Alternatively require vanishing in all odd degrees and use the total graded rank over the periodic coefficient field, not dim K(n)₀. Keep the roadmap's existing K(n) convention elsewhere. For S² the corrected rank is 2 and the module dimension is 2. Include this negative control; it also fails as written at p=3, n=1.

## R02 (P1) — The valuation quotient drops the Honda residue field

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:987`, also lines 989, 991 and 1001: “E⁰(BC_p)/(p,u₁,…,u_(h−1),g_h(z))=𝔽_p[[u_h]][z]/(g(z))”.

**Claim:** The chosen height-(h+1) Honda theory over 𝔽_(p^(h+1)) has the displayed quotient and residue field 𝔽_p.

**Witness:** At p=2, h=1, π₀E=W(𝔽₄)[[u₁]], so reduction modulo 2 is 𝔽₄[[u₁]]. The resulting DVR has four residue elements; the stated ring has two. Compare hahn line 116 with line 338.

**Repair:** Put k=𝔽_(p^(h+1)) and retain k throughout the quotient, Weierstrass polynomial, coefficient extraction and Checks. This preserves the intended Morava theory. At p=2, h=1 the corrected DVR has residue k=𝔽₄, rank 2 over k[[u₁]], val(z)=1/2 and val(P(u₁))=1/2. The source has the same notation slip; reproducing it does not make the identification true.

## R03 (P1) — Two roadmaps own the same chromatic constructions

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:465` and line 493, with the scope claim at line 7 and the analogous targets in Layers 3–6 and 8–13.

**Claim:** This folder constructs the finite telescopic and Bousfield–Kuhn functors and much of the chromatic groundwork as its own library.

**Witness:** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:821` and `:845` construct those same functors at every prime and height, including coherent finite-source comparisons and uniqueness. That earlier roadmap explicitly owns its §§4.1–4.34 at line 7.

This is not just similar terminology. Resolved overlaps include:

| Here | Existing owner in GeneralAlgebraicKTheoryPartII |
| --- | --- |
| §§3.1–3.3 | §§4.2–4.4: periodic groups, telescope criteria, ring acyclicity |
| §§4.1–4.5 | §§4.5–4.9: all-spectra finite localization, kernels, comparison, fracture, bottom comparison |
| §§5.1–5.3 | §§4.10–4.12: finite telescopic functors, Bousfield–Kuhn, detection |
| §§6.2–6.4 | §§4.14–4.16: fiberwise comparison, connective vanishing, preservation |
| §§8.1–8.4 and Part II separation | §§4.18–4.21: locality, restricted comparison, telescope separation, BP support |
| §§9.1–9.4 | §§4.22–4.25: local norms, transfer splitting, Tate vanishing, blueshift |
| §§10.1–10.4 | §§4.26–4.29: power operations, Hahn, height, converse |
| §12.2; §§13.2–13.5 | §§4.30–4.33: modular comparisons, Thom families and their acyclicity, James application |

Its exact contracts also assign all-height Morava realization, elliptic affineness, relative Thom colimits and multiplicative refinements to EllipticCohomology (`GeneralAlgebraicKTheoryPartII/README.md:214`–232). Those conflict with ownership here in §§7.1–7.2, 12.1 and 13.1. Named declared contracts count as ownership even before their suppliers implement them.

**Repair:** Import the common constructions by these exact owner sections, and retain only explicitly distinguished extensions. For example, delete the duplicate Bousfield–Kuhn construction and consume §4.11; the test Φ_nΩ∞T(n)≃L_T(n)T(n)≠0 is unchanged, as is finite-source uniqueness. Coordinate any desired ownership transfer with the existing owner; merely calling it a downstream consumer here does not transfer its targets. Re-run the dependency check after the ownership reconciliation. This finding concerns the supplied open head, not the previously settled objection about a cycle through the separate Part II extension. The remaining independent extensions make a repair possible.

## R04 (P1) — The Segal theorem is cited from a section that does not supply it

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:129`, repeated at lines 21, 877, 889 and 937: “§2.3’s Segal comparison”.

**Claim:** RefinedTraceMethods §2.3 supplies S^tC_p≃S_p^∧.

**Witness:** `TauCetiRoadmap/RefinedTraceMethods/README.md:557` is the Postnikov/Tate-fixpoint section. The sphere Segal theorem is instead in `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:336`, §2.7, with its sphere specialization at line 338.

**Repair:** Repoint the contract and every use to StableHomotopyKTheoryPartII §2.7. The sphere satisfies its bounded-below, degreewise mod-p finite-type hypotheses; its conclusion gives π₀=ℤ_p and vanishing negative homotopy, exactly the requested witness. Mere Tate p-completeness in the cited RefinedTraceMethods section cannot substitute for this comparison: for Hℤ its degree-zero Tate group is ℤ/p, not ℤ_p.

## R05 (P2) — Higher norms require weak ambidexterity before they can be constructed

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:893`: “Construct the canonical Hopkins–Lurie norm … inductively in m”.

**Claim:** For any presentable stable category and any map with truncated π-finite fibers, the norm can be built by inverting the diagonal norm. No invertibility hypothesis precedes this construction.

**Witness:** In Sp take q:B²C_p→*. Its diagonal has fiber BC_p. On trivial H𝔽_p coefficients the BC_p norm induces 0:𝔽_p→𝔽_p on π₀, so it has no inverse. See csy line 1634–1642.

**Repair:** Define weak m-ambidexterity first, requiring the diagonal to be (m−1)-ambidextrous, and construct the canonical norm only on that domain. Then define m-ambidexterity by invertibility of this norm. On the witness, q is excluded from the construction in Sp; in Sp_T(n) the subsequent semiadditivity theorem supplies the missing condition. The existing H𝔽_p Check at line 917 already computes the obstruction and should be connected explicitly to the definition.

## R06 (P2) — The weak-ring supplier gap and the local proof assign two owners

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:899` and `packages/ChromaticHomotopyTheory/design/plan.json:4542`.

**Claim:** The plan requests `gap:weak-ring-finite-postnikov` from BordismFormalGroups F6.5, independently of this roadmap's telescopic Tate results. The README instead builds that same criterion in §9.6 using §9.3. Its exact supplier contracts do not contain this gap slug at all.

**Witness:** The plan's needs sentence contains the same three equivalent vanishing conditions as README line 899; README line 913 proves them locally, and line 929 lists §9.3 as an input.

**Repair:** Choose one ownership contract. If §9.6 remains the owner, remove this redundant request from the plan's gaps list and record the ownership consistently, subject to R03. If BordismFormalGroups remains the owner, state the exact same slug and needs sentence under its supplier subsection and consume the theorem rather than re-plan its proof. For R=Hℚ, n=0 all three tests remain zero; for R=H𝔽_p the H𝔽_p endpoint remains nonzero. Neither repair may omit that endpoint or introduce the prohibited supplier cycle.

## R07 (P3) — Replace obsolete KII locators and put extension contracts where intake reads them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:41`–45: “KII.5’s chromatic purity theorem” and the two additional Part II contracts.

**Claim:** The named results are located in KII.5–KII.6, and the two BHLS gap contracts are declared only in Scope and ownership.

**Witness:** The supplied `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md` has the high-height trace at line 1536 (§5.2), purity at 1598 (§5.5), and redshift at 1733 (§6.5), not KII-labelled headings.

**Repair:** Cite §§5.2 and 5.5 for the existing theorems, and keep the stronger fixed-point/BP-model demands explicitly as gaps. Put both `What GeneralAlgebraicKTheoryPartII must provide (gap:…): …` declarations under Exact supplier contracts, scoped to Part II, and align the gap section locators. At n=2 the repaired references give T(2)-purity using T(1)∨T(2); they do not turn the BP-specific redshift demand into an already supplied general E∞ theorem.

## Verified sound

The following records finite adversarial tests and resolved evidence, not proofs of the admitted future mathematics. Rows marked R01–R06 are failures, not claims of soundness. Every numbered target, the supplied foundational objects, all 15 seeded targets, and the separate Part II headline are represented. The table contains 95 adversarial rows. Subclaims with distinct conventions or failure modes have separate rows.

### Gate, scope, Lean and headlines

The checked head is `d7a196cbcca76f3c99ed0e43aa6b336c3502137f`. The diff outside this roadmap folder is empty. The worker's gate reports:

```text
gate ChromaticHomotopyTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the requested dependency check; its output was:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This verifies the extracted graph, not the correctness of citations or ownership; R03–R04 and R06 remain material despite that result. I read the `Needs` lines and layer dependency lists, including the separation of Part II from Layers 0–13. I did not re-raise the previously settled Part II cycle finding.

`lake env lean` on `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean` exited 0 without diagnostics. It has one `import Mathlib`, one module docstring, the required namespace and **zero declarations**. Consequently the elaborated-signature inventory and one-tactic-padding inventory both have zero entries: there are no section binders to lose, no sorry data, no stand-ins, and no theorems to probe. No declaration changed. A vacuous test file would be a defect if a headline were statable; the spectral carriers below really are absent at these pins.

The README's headline inventory agrees with the docstring's 26 entries: ring acyclicity; finite localization and kernels; fracture; finite and global Bousfield–Kuhn; suspension–loop detection; generalized Serre theory; fiberwise homology; finite nullification/connective vanishing/preservation; marked Morava realization/actions; finite-height locality; restricted telescope comparison; height-one equality; BP support; transfer/Tate vanishing; raw blueshift; nonzero KU Tate; higher semiadditivity/weak-ring criterion/sharp bound; power operations/Hahn/height; Tate converse; real Bott inversion; elliptic affineness; modular chromatic comparison; full-level Galois/supersingular comparison; completed Hopkins–Mahowald Thom equivalences; filtered Thom acyclicity; James acyclicity. The separate higher-height separation headline is explicitly assigned to Part II. None can be replaced by a formal-group coefficient identity without changing its assertion.

Mathlib was inspected at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches included spectra/prespectra, Morava theories, Bousfield localization, homotopy fibers, Thom spectra and Eilenberg–Steenrod theories. Opened declarations include:

| Pinned file and line | What it supplies, and its limit |
| --- | --- |
| `Mathlib/RingTheory/FormalGroup/Basic.lean:56` | `FormalGroup`: a power series, constant/linear coefficient laws and associativity; commutativity is separate at line 74. Unit identities are derived, not a spectral structure. |
| Same file, lines 126, 145, 161, 184 | `FormalGroup.Point`, additive/multiplicative formal laws, `FormalGroup.map`; points require the substitution predicate. |
| `Mathlib/CategoryTheory/Localization/Bousfield.lean:55` | `CategoryTheory.ObjectProperty.isLocal`: bijectivity of precomposition in an ordinary category; no spectral reflector or mapping-spectrum equivalence. |
| `Mathlib/RingTheory/Flat/Localization.lean:37` | `IsLocalization.flat`; localization is flat (indeed in the broader commutative-semiring setting). |
| `Mathlib/RingTheory/Flat/Basic.lean:323` | `Module.Flat.lTensor_exact` with its module/flatness/exactness assumptions. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` | `WeierstrassCurve.formalGroup`; its reindexing comparison and scalar-map compatibility are at lines 69 and 75. It is an algebraic formal law, not Otop. |
| `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36` | `TopPair.HomologyPretheory`: functors, isomorphism and boundary data; homotopy invariance is a separate predicate at line 144, not a field supplying spectral excision. |
| `TauCeti/AlgebraicTopology/Singular/HomologyPretheory.lean:73` | The singular homology pretheory, not a general spectrum-valued homology or a spectral suspension–loop adjunction. |

The README keeps the native formal law and the finite stable, nilpotence and Bott suppliers rather than reimplementing them in Lean. No executable algorithm, copied source passage, restricted-prime shortcut, `set_option`, sorry data or duplicate Lean declaration was found in this folder. Layers have Examples and Dependencies, definitions have API prose and at least three listed Checks. The substantive failures in those definitions/Checks are recorded above.

### Seeded source sample

I read the legally cached text at the following locators, checking the version's theorem numbering, page, hypotheses and conclusion. There are 15 sampled targets; ABS remains the settled exception described below. No additional README locator was labelled unverified; ABS was explicitly labelled uncertified.

| Target | Source text opened | Outcome and limits |
| --- | --- | --- |
| 4.4 | lmmt line 339 and line 344, Lemmas 2.7–2.8, p.8 | The acyclicity hypothesis and orientation of the homotopy pullback agree. |
| 5.1 | kuhn-guide line 393, Lemma 3.1, pp.9–11; line 655, Theorem 5.2, p.15; line 710, Lemma 5.4, pp.16–17 | Periodic prespectrum, powers, finite-source comparison and rigidification are present; stable equivalence is not merely equality of π₀. |
| 5.2 | kuhn-guide line 113, Theorem 1.1, pp.3–4; line 737 through Definition 5.6, pp.17–18 | Local-valued functor and finite-source compatibilities support the stated uniqueness. See the independent ownership defect R03. |
| 5.3 | lmmt line 361, Proposition 2.9 and Remark 2.10, p.9 | Positive-height detection, the connective height-zero qualification and failure of preservation agree. |
| 6.4 | lmmt line 403, Proposition 2.11(iii), p.10; line 406, Remark 2.12 | A sufficiently connective finite-local equivalence is preserved; the improved bound has its separate semiadditivity input. |
| 7.1 | goerss line 670, Theorem 3.6, pp.238–239; behrens line 1252, Theorem 1.7.6, p.34 | Marked realization over perfect residue fields and universal deformation data are essential. |
| 7.2 | goerss line 670; behrens line 1016 and line 1252 | Coherent automorphism action and the semilinear/Galois distinction support the target; coefficient action alone would not determine it. |
| 8.1 | lmmt line 904, proof of Corollary 4.21, p.22; behrens line 1048, Proposition 1.6.8, p.29 | The oriented height criterion supplies locality. The extension to a homotopy-unital action is an explicit retract argument here; Behrens' locally Landweber formulation alone is not that extension. |
| 8.2 | lmmt line 920, same proof, p.22; behrens line 1063, p.29 | Comparison is on L_n-local inputs. It is not the telescope conjecture on arbitrary spectra. |
| 8.3 | miller line 272, Theorem 4.11/Corollary 4.12, pp.294–295; mahowald line 627, Theorem 6.3, p.382; mahowald-addendum line 73 and line 87, pp.118–119 | Odd-primary calculation and the corrected 2-primary proof are distinguished. The original Mahowald proof must not be used without its addendum. |
| 9.4 | cmnn line 99, introduction p.3; line 919, proof of Theorem 4.10, p.21; lmmt Remark 3.9, pp.15–16 | These passages explicitly use raw finite-local Tate blueshift; not raw Tate vanishing or exact height loss. |
| 9.6 | csy line 1632, Definitions 3.1.5/3.1.10 pp.33–34; line 3445, Theorem 4.3.10 pp.68–69; line 3639, Lemma 5.1.7 p.73; line 3655 p.74; line 3882 p.79; line 3930 p.80; line 3970 p.81; line 4036 p.83; lmmt line 406 | Main semiadditivity, finite-Postnikov and sharp-bound statements are supported. R01 and R05 identify two hypotheses/conventions lost in transcribing the supporting machinery. |
| 11.1 | lmmt line 876–879, Corollary 4.19 proof, p.21 | The proof explicitly states ko→KO and A→A[β⁻¹] are T(n)-equivalences for n≥1. This is not the corollary's K-theory assertion, which has n≥2. ABS is uncertified. |
| 13.4 | lmmt line 848, Lemma 4.15, p.21; line 867, Corollary 4.17 proof; akq line 632, Proposition 2.22, p.15 | Mod-p y(m) vanishing is explicit; the integral z(m) proof is explicit at 2. LMMT mentions odd-primary versions without spelling out their construction; see Not verifiable. |
| 13.5 | lmmt line 823, Corollary 4.14 proof, p.20 | James splitting is the input; smashing the reduced wedge with E proves the general E-acyclicity implication. Connectedness and starting the wedge at r=1 are necessary. |

The source checks also examined hahn §§2–4 for R02, the weak-ring proof and infinity endpoint in csy pp.73–84, and the supplied primary correction to mahowald. References use the cached preprint versions named in the README rather than silently mixing published pagination.

### Adversarial values

Notation in this table: K_* denotes the roadmap's graded theory unless explicitly called 2-periodic; a space homology group is unreduced unless marked reduced. “Pass” means the displayed instance agrees, not that testing proves the theorem. “Owner” means the values are consistent but R03 still prevents duplicate construction. Maps are given in source→target order.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Suspension and grading | ΣHℤ; transposition of S¹∧S¹ | π₁ΣHℤ=ℤ=π₀Hℤ; transposition has degree −1, not +1 | Pass; keep homological sign |
| Zero object, cofiber and unit | id:S→S; zero ring | cofib(id)=0; π₀0 has 1=0 | Pass; no nonzero assumption on all rings |
| T(0) convention | p=2, X=H𝔽₃ | S[1/2]⊗X=X≠0; Hℚ⊗X=0 | Pass; distinguish all-spectra and p-local bottoms |
| Covers/truncations | X=K(A,2), r=3 | X⟨3⟩=*; τ≤2X=X and π₂=A | Pass |
| Unreduced versus reduced | X=* and S⁰ | Σ∞*=0, Σ∞_+*=S; reduced Σ∞S⁰=S | Pass; no accidental sphere summand |
| Finite duality | P=S⊕ΣS; arbitrary E | DP=S⊕Σ⁻¹S; DP⊗E=E⊕Σ⁻¹E=F(P,E) | Pass; finite duality gap still declared |
| Filtered compactness | wedge of r spheres as r increases | maps from S give colim ℤʳ=⊕ℕℤ=π₀(∨ℕS) | Pass; finite source matters |
| Integer localization | ℤ, ℤ/p, ℤ/q with q≠p | tensor ℤ[1/p] gives ℤ[1/p],0,ℤ/q; exactness agrees | Pass |
| Algebraic formal laws | additive/multiplicative in char 2,3 | additive [p]=0; multiplicative [2]=X², [3]=X³ | Pass; detects height ∞ versus 1 |
| Formal points and nilpotents | ε²=0 over 𝔽₂ | additive ε+ε=0; multiplicative ε+ε+ε²=0; unit 1 is not a nilpotent formal parameter | Pass on legitimate formal inputs |
| BP degrees | p=2,3 | degree v₁=2,4; BP_(3),2=0 while MU_(3),2=ℤ_(3) | Pass; BP is not MU |
| Morava coefficient heights | n=1,2 at p=2 | periods 2,6; K(1)₂=𝔽₂ but K(2)₂=0 | Pass; essential to R01 |
| Finite type | S_(p), S/p, 0 | types 0,1,∞; type(S/p∧S/p)=max(1,1)=1 | Pass |
| Nilpotence endpoint | R=H𝔽_p | finite-height K(j)⊗R=0 for all finite j; H𝔽_p⊗R≠0 | Pass; infinity detector cannot be removed |
| Periodic telescope powers | v, v² | colim along v equals even cofinal subsystem along v²; periodic nonzero identity class survives in both | Pass |
| 3.1 periodic groups | finite Postnikov K(A,r) | sufficiently high suspended maps vanish; periodic colimit=0 on both sides | Owner |
| 3.1 nonabelian endpoints | BS₃×K(C_q,2)→BS₃, q≠p | fiber π₂=C_q; π₁ endpoints=S₃; C_q⊗ℤ[1/p]=C_q≠0 | Pass; height-zero fiber condition rejects it |
| 3.2 cover invariance | K(A,r) and its (r+1)-cover | periodic groups=0 for both, although π_r changes A→0 | Owner |
| 3.2 support/height zero | T(n), n>0; Hℤ | K(n)⊗T(n)≠0, other finite detectors vanish; positive T(n)⊗Hℤ=0 | Owner |
| 3.3 ring acyclicity | R=H𝔽_p, n>0 | T(n)⊗R=0=K(n)⊗R | Owner; infinity remains nonzero |
| 3.3 unital telescope model | endomorphisms of U∨U | matrix units e₁₂e₂₁=e₁₁, e₂₁e₁₂=e₂₂≠e₁₁ | Pass; commutativity cannot be assumed |
| 4.1 bottom localization | p=2, H𝔽₃ | all-spectra L₀ gives H𝔽₃; p-local rational bottom gives 0 | Owner; retain two conventions |
| 4.2 finite kernel | p=2, S/2 and S/3 at bottom | S[1/2]∧S/2=0; S[1/2]∧S/3=S/3≠0 | Owner; cannot use the p-local kernel globally |
| 4.3 comparison on p-local objects | Hℤ_(p), S/p | both bottom reflectors give Hℚ and 0 respectively | Owner |
| 4.4 fracture | E=0,F=S; E=S,F=0 | square vertices (X,0,X,0), respectively (X,X,0,0); homotopy pullback=X in both | Owner; orientations agree |
| 4.5 bottom finite comparison | X=Hℤ | positive-height T(1) part=0; both finite bottom comparison values Hℤ[1/p] | Owner |
| 5.1 finite telescopic functor | finite Postnikov X; X=Ω∞v⁻¹Σ∞V | first value=0; second contains nonzero [id] in periodic mapping group | Owner; zero functor excluded |
| 5.1 negative degrees/powers | same telescope; v² | π₋kdΦ_vX≅π₀Φ_vX≠0; even cofinal subsystem gives same group | Owner; connective substitute excluded |
| 5.2 Bousfield–Kuhn | Hℤ; T(n); Σ⁻¹Hℚ | first localized value 0; second nonzero; Ω∞Σ⁻¹Hℚ=* but L_HℚΣ⁻¹Hℚ≠0 | Owner; no unrestricted height-zero analogue |
| 5.3 detection versus preservation | Hℤ→0, n>0 | source T(n)-localization=0; Σ∞Ω∞Hℤ is a nonzero wedge of sphere summands after T(n) | Owner; only detection is unrestricted |
| 6.1 Serre monodromy | mapping torus of degree −1 on S¹, ordinary ℤ coefficients | T−1=−2: kernel 0, cokernel ℤ/2; total H₁=ℤ⊕ℤ/2, H₂=0; constant coefficients would give ℤ²,ℤ | Pass; twisted coefficients necessary |
| 6.1 filtration/convergence | point base; trivial S² base | first graded=E; second graded E and Σ²E, giving the same two summands in total | Pass; no coefficient connectivity required for finite filtration |
| 6.2 fiberwise comparison | identity base; two points→* | fiber unit E→E is id; for two points the map E⊕E→E is fold with fiber E | Owner; arbitrary fibers are not automatically acyclic |
| 6.3 nullification | V; rational K(ℚ,2), V finite p-torsion | N_VV=*; N_VK(ℚ,2)=K(ℚ,2); reduced periodic values 0 in both test cases | Pass; nullification is not constant |
| 6.3 relative height-zero condition | BS₃×K(C_q,2)→BS₃ | relative π₂=C_q survives p-inversion for q≠p; base π₁=S₃ is retained | Owner; condition is on the fiber |
| 6.4 connective preservation | identity; n=1, K(C_p,2)→* | identity remains id; reduced T(1) value of K(C_p,2)=0 on source and target | Owner; sharp bound supplied in 9.6 |
| 7.1 marked deformation | heights 1,2,3 | parameter counts h−1=0,1,2; at height 2 maps u₁↦0 and u₁↦ε to k[ε]/ε² are distinct | Pass; marking retains deformation |
| 7.1 degree of periodicity | u in degree −2 | u^(1−pⁱ) has degree 2(pⁱ−1)=degree v_i | Pass; inverse convention would negate degree |
| 7.2 semilinear actions | Honda h=3; height-one inversion | Frobenius on 𝔽_(p³) has order 3, not identity; (−1)² acts as 1 | Pass; coefficient field action retained |
| 8.1 geometric height | multiplicative law over 𝔽_p; additive law | (p,v₁) generates unit ideal for multiplicative; all v_i=0 for additive, so no finite bound | Owner; height hypothesis discriminates |
| 8.1 weak action/retract | M=0; unit action on E | M→E⊗M→M is 0=id₀; on E it is id_E, whereas zero action on nonzero E gives 0≠id | Pass on the extension |
| 8.2 restricted comparison | X=L_(n−1)S; X=K(n) | T(n) and K(n) localizations both 0 in first case; both fix the K(n)-local second case | Owner; arbitrary spectra not covered |
| 8.3 height-one equality | KU_(p), p=2,3 | both height-one localizations have π₀=ℤ_p; π₀KU_(p)=ℤ_(p), so comparison is not identity on the input | Owner; all primes retained |
| 8.4 BP truncation support | BP⟨0⟩=Hℤ_(p) | rational detector Hℚ≠0; every positive K(i) detector 0; p-inversion gives Hℚ | Owner |
| 8.4 inversion boundary | connective BP⟨1⟩→E(1) | negative-degree connective groups 0; inverted v₁ gives nonzero negative multiples of 2(p−1) | Owner; inversion really changes spectrum |
| 9.1 local norm | G=1; G=S₃ on Hℚ | norm id with cofiber0; rational norm ×6 with inverse ×1/6 and cofiber0 | Owner; nonabelian test included |
| 9.2 transfer criterion | Hℚ, C₂,C₃ | transfer followed by rational section is 2·1/2=1 and 3·1/3=1 | Owner; not augmentation section |
| 9.3 telescopic Tate | G=1; trivial C_p on KU_p^∧ | raw Tate0 for G=1; for C_p raw π₀=ℚ_p(ζ_p)≠0 but T(1)-local value0 | Owner; raw and localized Tate separated |
| 9.4 raw blueshift | n=1, KU_p^∧; X=0 or Hℚ | output p-inverted field, fixed by bottom localization; zero/rational Tate outputs0 | Owner; no exact-height claim |
| 9.5 Euler inversion | p=2,3 | after dividing by z: z+2 and z²+3z+3; invert z to obtain ℚ₂ and ℚ₃(ζ₃) respectively | Pass; completion comparison is a separate proof target |
| 9.5 sphere versus Hℤ | S; Hℤ, C₂ | sphere Tate π₀=ℤ₂ by Segal; Hℤ Tate π₀=ℤ/2 | R04; use the actual Segal owner |
| 9.6 norm domain | Sp, B²C_p→*, constant H𝔽_p | diagonal BC_p norm π₀ is p=0 on 𝔽_p; demanded inverse does not exist | R05; weak ambidexterity first |
| 9.6 finite semiadditivity boundary | p=2, H𝔽₃ in Sp_S[1/2], G=C₃ | norm ×3=0 on 𝔽₃, while rational norm ×3 has inverse1/3 | Pass; global T(0) is not rational |
| 9.6 dimension criterion | p=2,n=2,X=S² | ordinary K₀ dimension1,K₁=0; E-module dimension2; 2-periodic K₀ dimension2 | R01; change residue theory |
| 9.6 Ravenel–Wilson ranks | n=k=2; k>n | p^binom(2,2)=p versus wrong p⁴; for k>n rank1, reduced rank0 | Pass; rank includes basepoint |
| 9.6 connectivity of π-finite fibers | n=1, BC_p and B²C_p | K(1) ranks p and1; reduced ranks p−1≠0 and0 | Pass; n-connectivity cannot be weakened |
| 9.6 weak-ring iff | n=0,R=Hℚ; R=H𝔽_p | first ring: all three obstructions0; second: infinity detector and reduced H_(n+1) are nonzero | R06 ownership; mathematics retains infinity |
| 9.6 sharp m | n=1,m=2 versus1 | B²C_p reduced T(1)=0; BC_p reduced K(1) rank p−1≠0, hence reduced T(1)≠0 | Pass; m cannot be1 |
| 9.6 integral Tate example | Hℤ,C₂ | π_even Tate=ℤ/2; π_odd=0; after inverting2 both0 | Pass; Hℤ is not finite-local |
| 10.1 absolute D_p unit | H𝔽_p, honest versus zero θ | P(1)=1 for honest operation; zero θ gives0≠1 | Owner; unit square discriminates |
| 10.1 relative D_p unit | p=2, multiply θ_E by1+z | restriction z=0 gives1 and same product; new P(1)=1+z≠1 | Pass; relative definition lacks absolute unit square |
| 10.1 zero relative algebra | R=0 | π₀R=0, P(0)=0=1 | Pass; do not exclude zero ring implicitly |
| 10.1 p-series divisibility | p=2,h=2 | mod(2,u₁), [2](z) begins u₂z⁴; dividing by z⁴ gives leading u₂; before killing u₁ a z² term prevents division | Pass; range and ideal matter |
| 10.1 valuation coefficient ring | p=2,h=1 | actual quotient residue𝔽₄ has4 elements; stated residue𝔽₂ has2 | R02; retain k |
| 10.1 valuation normalization | p=2,3,h=1 | deg g=2,6; val z=1/2,1/6; val P(u₁)=1/2,1/3 | Pass after R02's field repair |
| 10.1 Euler product and unit rescaling | p=2; u′=wu, w unit | val(ϕ(u)/u)=−1/2; rescaling adds val(P(w)/w)=0; replacing ϕ(u) by u gives0 | Pass; wrong formula stops descent |
| 10.1 coefficient descent | x=u_h^r, r>0 | val x=r; val P(x)=r/p^h<r; unit x gives val0 on both sides | Pass after R02; strict inequality only positive valuation |
| 10.2 upward acyclicity | H𝔽_p; bare K(r),r≥1 | H𝔽_p has all finite detectors0; K(r−1)⊗K(r)=0 but K(r)⊗K(r)≠0 | Owner; K(r) cannot have the stated D_p structure |
| 10.3 height values | 0,H𝔽_p,Hℚ,KU_(p) | thresholds −1,−1,0,1 respectively | Owner; zero and ordinary mod-p spectra distinguished from rational |
| 10.3 direction under unital maps | Hℚ→0 | height goes0→−1; reversing the inequality would fail | Pass |
| 10.4 Tate height converse | KU_p^∧ at n=1,2 | T(2)⊗KU=0 while T(1)⊗KU≠0; raw Tate rational with T(1) value0 | Owner; lower-height converse not raw vanishing |
| 11.1 real Bott coefficients | complexification of α²=4β | (2b²)²=4b⁴=4·b⁴; false α²=β would give4=1 | Pass; coefficient source uncertified |
| 11.1 inversion range | ko,KO rational degree−8 | π₋₈ko⊗ℚ=0; π₋₈KO⊗ℚ=ℚ; positive-height comparison is an equivalence | Pass; n≥1 necessary |
| 12.1 affineness/tensor | V=0,S,S⊕ΣS | Γ(Otop⊗V)=0,A,A⊕ΣA, matching A⊗V in each case | Pass; ownership contract conflict R03 |
| 12.2 discriminant degree | Δ weight12, δ=Δ²⁴ | weight288, homotopy degree576; at2 Δ⁸ degree192, at3 Δ³ degree72 | Owner; not inversion of an unproved integral Δ class |
| 12.2 chromatic bound | local elliptic heights1,2 | K(i) local-chart smash0 for i>2; ordinary height1 chart has K(2) smash0 | Owner; no exclusion of2 or3 |
| 12.3 Galois comparison | trivial torsor for C₂ and S₃ | B=A² or A⁶; B⊗_AB=A⁴ or A³⁶=∏_G B | Pass; nonabelian group included |
| 12.3 faithfulness | B=0 over nonzero A | B⊗_AA=0 but A≠0 | Pass; faithfulness is a separate condition |
| 12.3 small/full levels | N=1,2,3,5 | GL₂(ℤ/1)=1; orders6,48,480 at2,3,5; level2 retains automorphism−1 acting trivially on2-torsion | Pass; small levels must remain stacks |
| 12.3 right basis action | row (P,Q), g=[[1,1],[0,1]] | (P,Q)g=(P,P+Q); transposed convention instead gives(P+Q,Q); determinant1 fixes pairing | Pass; use supplier's right action |
| 12.4 supersingular groups | p=2,3 over quadratic fields | full semilinear orders24·2=48 and12·2=24 | Pass; dropping Galois halves the group |
| 13.1 units and lines | H𝔽₂,Hℤ,zero ring | unit groups1,C₂,1; Ω∞H𝔽₂ has2 components, so all components are not units | Pass; owner reconciliation R03 |
| 13.1 Thom colimit | trivial line over point or two points | colimits R and R⊕R, not0 or R | Pass; basepoint/unit retained |
| 13.2 Hopkins–Mahowald | p=2,3; mod-p Thom ring | π₀ target𝔽₂,𝔽₃; integral connected-cover version π₀ℤ₂,ℤ₃ | Owner; integral and mod-p maps differ |
| 13.2 completion before cover | ℤ_p→ℤ_p versus ℤ→ℤ_p | first kernel/cokernel0; second kernel0,cokernelℤ_p/ℤ≠0 | Pass; uncompleted map cannot replace completed one |
| 13.3 James indices | p=2,3; m=0,1,2 | p^m−1 gives(0,1,3) and(0,2,8); J₀=* and y_p(0)=S_p^∧ | Owner; integral family starts at stated positive m |
| 13.3 low Thom coefficients | y_p(0), y_p(1), z_p(1) | π₀ respectivelyℤ_p,𝔽_p,ℤ_p | Owner; cannot identify all families |
| 13.4 acyclicity ranges | y_p(1), z_p(1) | rational y_p(1)=0; z_p(1) rational π₀=ℚ_p≠0; integral positive range 1≤i<1 is empty | Owner; integral claim must exclude height0 |
| 13.4 Adams slope boundary | p=2,3;i=1 | 2(p^i−1)=2,4 positive; i=0 gives0 | Pass; positive-height vanishing-line step not a rational argument |
| 13.5 stable James splitting | W=*,S² | reduced spectra0 and ∨_(r≥1)S^(2r); degree0 absent, degree2 first nonzero | Owner; r=0 would add unwanted S |
| 13.5 acyclicity and connectedness | E=Hℚ,W=BC_p; W=S⁰ | first reduced rational smash0 on all powers; disconnected James monoidπ₀=ℕ versus loopsπ₀=ℤ | Owner; connectedness cannot be dropped |
| Part II purity/trace indexing | n=2,h=1 | localized pair T(1)∨T(2); required trace height h+1=2; connective BP fixed points may have π₋₁≠0 | R07 locators; fixed-point gap is stronger than connective trace |
| Part II fp-type | height1 model ku_p^∧ modulo(p,v₁⁴), p=2 | homotopy𝔽₂ in degrees0,2,4,6 and0 outside; finite interval, so sufficiently iterated positive-degree self-map is0 | Pass for the boundedness mechanism |
| Part II separation | n≥2 BHLS witness; zero candidate | required pair(L_T(n)X,L_K(n)X) has comparison not equivalent; zero candidate gives(0,0) and cannot witness separation | Source-backed existence, not an explicit coefficient computation; owner R03 |

### Supplier and duplication audit

I searched objects across main, the supplied open roadmap files via `roadmaps grep`/`roadmaps show`, and board packages. I compared the actual declarations/targets, not just matching names. The open-work audit was performed; it was not omitted. R03 is the material ownership conflict. There are no fully qualified declarations in this Suggested.lean that could collide with another Lean file.

The following supplier resolutions record the mathematical interfaces consumed. Line references are to the repository files; fetched display headers are not counted.

| Supplier | Resolved interface and evidence |
| --- | --- |
| GeneralizedCohomology | G2.10 (`README.md:533`) gives arbitrary-map mapping-path fibers; G3.7 (`:773`) finite-source continuity; G3.9 (`:878`) integer localization/completion; G5.1 (`:1512`) finite integral duality; G5.4 (`:1559`) actual coefficient spectra. The explicitly p-local compact-generation/duality extension remains a declared gap. |
| BordismFormalGroups | F1/F2/F3/F5 give formal law, orientations, BP coefficients, invariant ideals and deformation; F6.1–F6.4 give spectral localization, nilpotence/type/periodicity, finite localization and smashing. F6.5 gives coherent diagrams, Kan extensions, finite-group norms and Tate modules, plus the K(n)-completion and Landweber locality statements (`README.md:2528`, `:2555`). It does not supply the unconditionally defined higher norm of R05. |
| EnhancedDerivedSheaves | E0.4 (`README.md:211`) and E0.5 (`:242`) distinguish stable/space-indexed constructions from ordinary categories; E5:abstract.4 (`:1512`) stable monoidal structures; E5:presentability.1 (`:1597`) compact generation. Spectral quasicoherent modules on the elliptic stack are explicitly an additional gap. |
| StableHomotopyKTheory | §§2.4–2.7 (`README.md:572` onward) boundary/transport and π₁ action; §3.18 (`:1209`) convergent space towers; §3.21 (`:1246`) twisted obstruction comparison; §§7.21–7.27 (`:2593` onward), particularly §7.24 (`:2660`) exhaustive bounded-below homological convergence. These are distinct from a cohomological complete-tower lim¹ hypothesis. |
| AlgebraicTopology | Stages 4–5 supply CW, cofibration and ordinary twisted Serre inputs; Stage 8 supplies relative NDR-pair homotopy and Eilenberg–Mac Lane representability. The README correctly routes arbitrary-map fibers through GeneralizedCohomology instead of silently removing the pair hypotheses. |
| HomotopySpheres | Supplied head §3A (`README.md:661`), §3B (`:817`) James words/quotients and connected equivalence, §4B (`:1341`) Bott. The natural reduced stable splitting is still explicitly requested, rather than inferred from the word quotients alone. |
| TopologicalKTheory | T7 (`README.md:1148`), coefficient relations at `:1245` and complexification at `:1263` agree with α²=4β, c(α)=2b², c(β)=b⁴ after changing names/degree convention. |
| EllipticCohomology | E2 item2 (`README.md:557`) realizes marked heights1,2, with semilinear action; E3/E4 give Otop and Δ²⁴ inversion; E5 (`:1527`) units and the special loop-Thom comparison (`:1732`); E6 (`:1807`) level stacks and sheaves. General relative refinements and higher-height extensions conflict with GeneralAlgebraicKTheoryPartII's named contracts as described in R03. |
| ModularCurves | §§3D,4B,4C,5B,7E,7F resolve to the prime-to-level comparison, Weierstrass descent, ordered level3 torsor, full bases/right action, height strata and Serre–Tate deformation. Small-level stack representability is not claimed from its N≥3 scheme theorem. |
| AInfCohomology | §AI.7.2, spectral Tate diagonal (`README.md:3849`) has the lax symmetric monoidal transformation and sphere normalization used for the Frobenius; it is not an assertion that the raw Tate spectrum vanishes. |
| RefinedTraceMethods | §§2.6,2.9,2.10,4.9,4.11,6.8 resolve THH/TC/categorical K/trace and K(1)-localization. Its §2.3 supplies Tate bounds, not Segal: R04. |
| GeneralAlgebraicKTheoryPartII | Actual §§5.2/5.5/6.5 resolve high trace/purity/redshift; the stronger BHLS demands remain declared gaps. Its chromatic §§4.1–4.34 are existing planned work: R03 and R07. |

Of the six plan gaps, the p-local finite-duality, spectral-ringed-sites and stable-James contracts have matching README slugs and identifiable hypotheses. The two BHLS contracts have matching slugs and precise additional model/trace requirements but need the intake location and locators repaired (R07). The weak-ring gap conflicts with local ownership and lacks its README supplier declaration (R06). No gap has supplier `none`. Declared gaps were not treated as failures merely because the supplier has not implemented them.

## Not verifiable

- **abs**, Theorems 6.9 and 11.5, pp.15–16,28–29, remains the explicitly settled locator-only, uncertified source. I did not request it again. I checked the Bott normalization against the named supplier targets and the elementary complexification calculation, and checked the positive-height ko-algebra input in lmmt line 878; that does not certify the inaccessible ABS text.
- **Odd-primary integral James-filtered Thom family:** lmmt line 867 explicitly mentions integral variants but does not spell them out; akq Proposition 2.22, line 632, supplies the p=2 calculation. The roadmap makes the all-prime construction and its Margolis/Adams argument local targets. The existing sources do not certify that entire new odd-primary proof as already present. Its low-stage/range tests are recorded above; no restricted-prime repair is proposed.
- The stress tests do not certify the new coherent constructions, the all-prime BHLS model supplied by a declared contract, or every step of the all-height H∞ orientation construction. These are future theorem/proof obligations, not formal proofs supplied by the empty Lean acceptance file. No unavailable text beyond the settled ABS item was discovered among the seeded locators, and no new source request was made.

## Source issues

- **Misprint** in hahn at Definition 4.1 and Proposition 4.3, printed p.8: the source says the Honda coefficient quotient has base field 𝔽_p; it should be 𝔽_(p^(h+1)) for the Honda theory chosen in §2; affects a stated result.
- **Error** in mahowald at Theorem 1.1(c), printed p.366, and proof of Theorem 6.3, p.382: the source says only Adams-filtration-zero classes survive beyond the first bo-filtration; it should allow filtration one and account for the W_s contribution in the periodicity proof; affects the proof; corrected in print at mahowald-addendum §1, p.118, and §2, pp.118–119.
- **Misprint** in kuhn-guide at Lemma 3.1(g), printed p.10: the source says the input sequential diagram consists of spectra; it should consist of pointed spaces, the domain of Φ_v; affects a stated result.
- **Misprint** in csy at proof of Corollary 5.3.2, printed p.80: the source says the functor from T(n)-local to K(n)-local spectra is L_T(n); it should be L_K(n); affects the proof.
