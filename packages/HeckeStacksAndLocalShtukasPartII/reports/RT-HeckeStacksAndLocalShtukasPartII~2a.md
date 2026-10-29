<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6484273271 -->
Red team round 2 pass a (codex) of 41e8611

Verdict: needs_changes

1. **F01** (P1) A straight representative is not the supplied P-fundamental input

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:1181–1185`: “for the straight representative minimal on both sides whose Levi is the Newton centralizer”.

   **Claim:** BunGAndNewtonStrata §1.10 and gap:straight-finite-parabolic supply the representative needed by the local-product comparison in §4.3.

   **Witness:** mv20 lines 306–309 invoke a separate theorem to make the straight representative P-fundamental; lines 350–362 require this property. BunGAndNewtonStrata §1.10 supplies straight-class classification; the gap only supplies Coxeter-parabolic minimality.

   The missing input is preservation/contraction of the Iwahori root subgroups by the twisted representative, not minimality in a finite Coxeter parabolic. No cited supplier or local target states it. This is the remaining part of r1b F04: adding the name of the straight representative did not add this theorem.

   **Exact repair text:** “Before the Newton-cell comparison, prove that each [b] has a representative ẏ with y σ-straight and a semistandard parabolic P=MN, M=Cent_G(ν_y), such that φ=Ad(ẏ)∘σ preserves I_M, contracts I_N and φ⁻¹ contracts I_̅N. Require φ(I_M)=I_M. Here contraction includes φ(I_N)⊆I_N, φ⁻¹(I_̅N)⊆I_̅N and eventual containment of their iterates in every congruence subgroup. Prove dim(I_̅N/φ⁻¹(I_̅N))=ℓ(y)=〈2ρ,ν_b〉. Use this target, together with straight-class classification, in the finite-surjective local-product construction.” Cite mv20 lines 306–309 and 350–375, including its separate fundamental-alcove input. Own this ADLV-specific representative comparison here, or declare its precise contract with the earlier reductive-group supplier in both gap locations.

   **Repair test:** For split GL₂ and y=diag(t,1), Ad(y) sends an upper-root coefficient u to tu and Ad(y)⁻¹ sends a lower-root coefficient v to tv. Both iterates tend into every congruence subgroup; the opposite-root quotient has dimension 1=ℓ(y)=〈2ρ,(1,0)〉. The straight length identity alone does not specify these subgroup maps.

2. **F02** (P1) The Levi obstruction consumes its later geometric prerequisite

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:1587–1588`: “Apply the P-alcove Hodge–Newton reduction”; and :1692: “*Needs:* §7.2”.

   **Claim:** §7.2 can deduce the Levi-class obstruction before the P-alcove twisted-product/image comparison of §7.5, which itself depends on §7.2.

   **Witness:** ghn15 lines 409–422 state the twisted-product surjectivity; the obstruction uses its consequence that a group point yields a matching Levi class. That geometric theorem is the target at README:1663–1669, later than its consumer.

   **Exact repair text:** “Place the twisted-product surjectivity, strict-case injectivity, and extraction of a matching Levi σ-class immediately after the P-alcove definition, before the Levi obstruction. Their inputs are the P-alcove root conditions, root-group filtrations and Lang theory; they do not require the obstruction. Deduce the obstruction from this comparison and the integral κ calculation. The later all-class ADLV image-cover statement may then use both results.” Update section references and the Needs lines accordingly; a citation to ghn15 is a source, not an independently supplied roadmap target.

   **Repair test:** In GL₂ with M=T and a nonbasic class of slopes (1,0), extraction gives the two possible torus classes (1,0),(0,1); the required Levi κ=(1,0) selects the first. This produces the obstruction after the comparison, without assuming the obstruction to obtain that comparison.

3. **F03** (P2) The scope still excludes a comparison used in §4.3

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:33–36`: “formal-completion and local-model comparisons” and “None of these excluded items is a dimension-theorem input here.”

   **Claim:** Formal-completion comparisons are excluded from the roadmap's dimension inputs.

   **Witness:** README:1151–1153 explicitly constructs the finite-surjective comparison of completed local Newton-stratum models with an ADLV product. mv20 lines 358–375 use precisely this completion comparison to obtain dimensions.

   **Exact repair text:** “The completed local Newton-cell/ADLV product comparison of §4.3 is an owned dimension input. The exclusions concern integral local-shtuka deformation spaces and their formal-completion/local-model comparisons, together with generic/special-fibre specialization.” Keep the remaining exclusions. This completes r1a F09's scope repair.

   **Repair test:** For GL₂, w=s t^(1,0), the ordinary stratum has normalized dimension 2 and ADLV dimension 1; its extra local-product factor has dimension 1. The repaired scope permits this required comparison while excluding integral shtuka deformation models.

4. **F04** (P3) Chain-space Checks repeat the formula instead of testing it

   **Location:** `packages/HeckeStacksAndLocalShtukasPartII/README.md:1460–1462`: “its bound carries 1/2”; “its bound has no factor 1/2”.

   **Claim:** These serve as discriminating Checks for the five chain spaces and their maps.

   **Witness:** Both bullets repeat the ordinary/Demazure bounds already specified. They compute no fibre, length or map. The final bullet likewise says removing σ is wrong without an instance distinguishing the two chains.

   **Exact repair text:** Replace the Checks in §6.2 by these three concrete tests:

   - “For split A₁, x=y=s and λ=2ω∨, the factor B=t^ω∨s has length 0. The redundant intermediate flag is uniquely determined; ℓA=ℓB=ℓa=0 and ℓw₁=ℓ(x′y′t^γ)=2, giving N₁=N₂=0.”
   - “For the unitary A₂ example of §5.2, A=s₁, B=t^ω₁∨s₁, x′y′=s₂, γ=ω₁∨, a=s₂. Their lengths are 1,1,1,2,1 respectively (the fourth is ℓt^γ); ℓw₁=2 and ℓ(s₂t^γ)=3. Thus N₁=(1+2−3)/2=0 and N₂=1+1−1=1. Putting a half in N₂ incorrectly gives 1/2.”
   - “In that unitary A₂ example, σ exchanges s₁,s₂ and ω₁∨,ω₂∨. The terminal chain has steps (s₁,t^ω₂∨), while deleting σ gives (s₂,t^ω₁∨). These are distinct relative-position labels; only the stated Frobenius comparison identifies the two moduli.”

   **Repair test:** The original and terminal virtual dimensions are 3 and 2; their difference is 1=N₁+N₂, whereas the half-normalized wrong answer is 1/2. The distinct A₂ labels also detect a missing Frobenius twist. This changes README Checks only, not Suggested.lean.

## Earlier findings: verification at this head

All locations in this table are in `packages/HeckeStacksAndLocalShtukasPartII/README.md` unless a file is named. The repair report marks all sixteen findings applied (one differently); it marks none not actionable. The older settled RootSystemsPartII ownership decision is not re-raised.

| Earlier finding | Status; repaired passage | Recomputed witness |
|---|---|---|
| r1a F01 | Repaired. :745–750: “every extended semi-module for μ has finite V”; “attached to the normalized semi-module of type μ attains equality”. Suggested.lean:118 and :128 state both theorems. | (h,m,μ)=(2,1,(0,1)): 2·0=0. (3,4,(0,0,4)): 2·3=6. The two elaborated theorem signatures retain m,h,μ; no geometric stand-in occurs. |
| r1a F02 | Repaired. :710–715: “For every extended semi-module”; “there is a nonempty open U”; “every extended semi-module for μ occurs”. | B={−3,1,5}, V={(5,6),(5,7),(5,10)} gives U=A³, nonempty, dimension 3. |
| r1a F03 | Repaired as a stated target. :819–824: “without assuming either side nonempty”; “Such a label exists if and only if κ_G(w)=κ_G(b)”. | SL₂, b=1: label equation 0=0, dimension 2 transfers. G_m,b=ϖ,w=1: equation 0=1 fails despite adjoint point. The all-characteristic geometric/lifting proof remains future work, not certified by the restricted erratum. |
| r1a F04 | Repaired. :155: “irreducible components are permuted transitively”; “reduction … to one component with σ^d”. Same wording in the plan gap. | Res quadratic PGL₂: σ swaps two A₁ factors; J={s₀,s₀}, W_J=C₂×C₂, c=(s₀,1), ℓc=1. |
| r1a F05 | Repaired. :199 and :894–896 define Σ(μ) and “maximal elements … for the integral M-coroot order”. Same plan gap. | GL₂/T, μ=(1,−1): Σ={(1,−1),0,(−1,1)}; all are T-maximal; at 0, d=1. For M=G, only μ is maximal and d=0. |
| r1a F06 | Repaired. :585–587 adds three concrete A₁ advantage tests. | w=s₀s₁s₀,v=s₁,u=s₁s₀: basic dimensions 2,1,−∞; translation-class dimensions 1,−∞,0. Required positive differences both 1. |
| r1a F07 | Repaired. :77: “μ=ν=(1,0) … reversed sign gives … 1”. | Correct pairing 〈ρ,μ−ν〉=0; reversed pairing 〈ρ,μ+ν〉=1. The basic example still gives 0 for either Newton sign. |
| r1a F08 | Repaired. :429: “infinite when r>0 and a single point when r=0”. | ℤ⁰ has one point; ℤ has infinitely many; both dimensions 0. |
| r1a F09 | Partly repaired. :28–29 explicitly includes κ-labelled and P-alcove comparisons. The blanket exclusion at :33–36 survives. | GL₂ components 0 and 2 map to the same adjoint component as permitted; the completed Newton-cell product remains excluded despite its dimension contribution 1. See S03. |
| r1b F01 | Repaired differently, correctly. Suggested.lean:128 states existence, not equality for every cyclic object. :750 explicitly limits attainment. | Cyclic type (0,2,0,3), h=4,m=5: 2\|V\|=6<8. Increasing type (0,0,2,3): 2\|V\|=8. The proposed universal-cyclic equality would be false. |
| r1b F02 | Repaired. :222: “generic … algebra … stated with bernstein-presentation”. | SR.1.5's generic paragraph supplies ℤ[v,v⁻¹]; U_s²=(v²−1)U_s+v² becomes T_s²=(v−v⁻¹)T_s+1. A numerical specialization requires the supplier's chosen invertible square root. |
| r1b F03 | Repaired. :119–124 names apartment, echelonnage-root-system, affine-roots-and-filtrations, algebraic-fundamental-group and kottwitz-homomorphism; :344 adds the reduced-root target. | These anchors exist on main in RG2.1; the transported GL₂ translation has κ=1 rather than −1. |
| r1b F04 | Partly repaired. :1181 and :1187 split the Needs lines and add straight-weyl-classification. | mv20 lines 306–309 require a second theorem upgrading straightness to P-fundamentality, absent from the two added contracts. See S01. |
| r1b F05 | Repaired. :58 and :285 say “minimal in W₀·t^λy”. | A₁, λ=2ω∨, y=s: lengths 1 for t^λs and 2 for st^λs; this fixes the left-multiplication quotient explicitly. |
| r1b F06 | Repaired. :1865 and sources.toml:260 say “Corollary 2.7, PDF p. 6”. | ham17 line 260 lies after the page-6 marker at line 240, not page 5. |
| r1b F07 | Repaired. sources.toml:157 includes “§0.4”, “§0.5”. | Both previously absent section entries now occur once in he21's cited_for list. |

## Verified sound

Read all 1,865 README lines and all 137 Suggested.lean lines. The statement inventory is 47 numbered README targets and 7 Lean declarations (4 definitions, 1 structure, 2 theorems). The earlier-finding inventory has 16 entries: 14 repaired, 2 partly repaired. The tables below record computations, not proofs of the future geometric constructions.

### Acceptance-test inventory and elaborated contexts

Compared all seven types in the supplied elaborated-signature record with the actual file and README. No section binder is lost. No Lean command or build was run in this read-only pass. All definitions have real bodies on native carriers. The only admissions are the two headline theorems. There is one import, `Mathlib`, one module docstring, the required namespace, and no option overrides, axioms, admitted data, admitted examples or `lemma` declarations. Neither theorem is a one-tactic consequence of a definition or of a located pinned theorem.

For the following computations, B denotes the residue basis and V the chart index set. The numerical right side is R=Σ(2i+1−h)μᵢ−(h−1), in ℤ. The index i is zero-based. Infinite sums and cardinalities are not silently treated as finite: finiteness is part of the theorem conclusions.

| Declaration; line; README section | Complete variable/instance context | Instances and computed values | Result/change |
|---|---|---|---|
| residueBasis; 60; §2.1 | Explicit h:ℕ, A:Set ℤ; no instances | h=2,A=ℕ gives B={0,1}, sum=1; A=1+ℕ gives {1,2}, sum=3; h=0 gives A∖A=∅. | Real set difference; normalization distinguishes the shifted wrong component: 2 versus 6. |
| semiModuleJump; 65; §2.2 | Explicit m,h:ℕ,A:Set ℤ,a:ℤ; no instances | m=1,h=2,A=ℕ: a=0 gives sup{0}=0, a=1 gives sup{0,1}=1; a=−2 gives sup∅=0. With m=h=0,A=ℕ,a=0, the set is unbounded and natural sSup has junk value 0. | Theorems require h>0; on A, closure under +m and boundedness below supply nonempty bounded sets. Off-A junk values are never used as finite φ values. |
| ExtendedSemiModule; 75; §2.2 | Explicit m,h:ℕ, μ:Fin h→ℕ; Type; no implicit field/domain/topology hypotheses | h=2,m=1,A=ℕ,φ(a)=⌊(a+1)/2⌋ on A and ⊥ outside: normalization 2·1=2; h=0 would force A=range(∅)=∅ against nonempty. φ identically 0 on A fails φ(a)+1≤φ(a+h): 1≤0. | The data tie φ and the sequences to A. Empty carrier, trivial φ and arbitrary sequence enumeration are excluded. |
| chartIndices; 106; §2.4 | Section {m h:ℕ}{μ:Fin h→ℕ}, explicit E:ExtendedSemiModule m h μ; all retained | h=3,m=4,B={−3,1,5}: V={(5,6),(5,7),(5,10)}, size 3. h=2,m=1 gives ∅, size 0. In the first example φ(5)=4,φ(6)=3,φ(2)=⊥; thus (5,6) satisfies both strict inequalities. | Correct order of the two φ comparisons; no missing structure instance. |
| IsCyclic; 111; §2.2 | Same section variables, explicit E; all retained | Cyclic B={−3,1,5} has φ(5)=jump(5)=4. Noncyclic h=5,m=4,B={−2,−1,2,5,6},φ(−1)=0 has jump(−1)=1; V has size 4. | The predicate accepts and rejects actual extended semi-modules; no free Prop field. |
| chartIndices_bound; 118; §2.5 | {m h:ℕ}{μ:Fin h→ℕ}; explicit 0<m,0<h,Coprime m h,Monotone μ,Σμ=m,E; no instances | (h,m,μ)=(1,1,(1)): 0≤0; (2,1,(0,1)): 0≤0; (3,4,(0,0,4)): 6≤6. For (4,5,(0,0,2,3)), the cyclic object of unsorted type (0,2,0,3) has 6≤8. | General bound, including non-attainment; actual V finite. h=0 and gcd(2,2)=2 are excluded explicitly. |
| exists_isCyclic_chartIndices_eq; 128; §2.5 | Same numerical hypotheses; existential E occurs after μ and those hypotheses; no E assumption | h=4,m=5,μ=(0,0,2,3), B={−4,1,3,6}: V={(3,4),(3,5),(3,6),(3,9)}, so 2·4=8. h=3,m=4 gives 2·3=6; h=1 gives 0=0. | Existence and attainment, not the false assertion that every cyclic object attains. |

The headline list at README:238–246 is covered as follows: §§1.1–1.3 (minimal classes, reduction, degree comparison), §§2.3–2.5 (charts and superbasic dimension), §§3.1,3.4,3.6,3.8–3.9 (Lang, Levi, norm, spherical dimensions and upper bound), §§4.1–4.7 (nonemptiness, generic Newton dimensions and cordiality), §§6.1–6.4 (correspondences and reduction), §§7.2,7.4–7.6 (obstruction, basic seed and image comparison), and §§8.1–8.4 (final criteria and specializations). Suggested.lean:11–47 names these unavailable geometric headlines and their missing carriers. The combinatorial bound and attainment are the statable deep part, and both are present. Searches by chart, affine-flag, affine-Deligne–Lusztig and twisted-cocenter objects at the supplied pins found no existing replacement for these constructions. Native schemes and Witt isocrystals alone do not define the required moduli. The roadmap index found no occurrence of its four specialized Lean names in another Suggested.lean.

### Computed README statement ledger

The context of every row includes the local-field assumptions at README:42–70: q=p^f, p prime, f≥1; connected reductive G; connected σ-stable I; arithmetic σ; split-rank defect; integral κ; dimensions in ℚ∪{−∞}. Thus q=1 is excluded, p=2,3 are allowed, and a zero coefficient ring is not a local field. Perfect test algebras exclude nonreduced dual numbers; classical test schemes do not. Geometric points of Spec(0) form the empty set, while its sheaf value is the unique empty family. Arbitrary non-quasi-separated spaces are not bounded pfp models. These distinctions apply throughout, rather than changing the meanings of dimension or Frobenius between rows.

| Target; README line | Instances tried and values on the two sides | Result/change |
|---|---|---|
| §0.1 point condition; 250 | Trivial group: one coset and r=1. Abelian group with σ=id: r_b(g)=b for every g. S₃, b=(12),g=(123): g⁻¹bg=(13). For I=⟨(12)⟩, replacing g by gi changes r to i⁻¹rσ(i), hence the same I-double coset, although I is not normal. | Correct left-coset descent; group quotient structure is unnecessary. |
| §0.2 virtual dimension; 281 | Split A₁,w=s t^(nα∨),b=1: ℓw=2n+1,ℓη=1,ν=0,def=0, so d=n+1 (n=1 gives 2). Twisted A₂,σ(s₁)=s₂,x=s₁,y=s₂: η=σ⁻¹(y)x=1 has length 0; untwisted yx has length 2. | Correct half and inverse σ. |
| §0.3 shrunken chambers; 314 | A₁ base (−1,0) is rejected; (0,1) and (−2,−1) accepted. A₂,λ=6ω₁∨=4α₁∨+2α₂∨ has λ−2ρ∨=2α₁∨≥0 but α₂(λ)=0, so a large dominant parameter alone does not imply shrunkenness. | Strip widths, chamber walls and large-translation hypothesis remain separate. |
| §0.4 exact/bounded loci; 347 | G_m,b=ϖ,μ=0: both κ values 1 and 0 differ, locus empty, dim=−∞ rather than numerical 0. GL₂,b=1,μ=(1,−1): identity has position 0, belongs to ≤μ but not exact μ. Over k[ε]/ε², g=1+εt⁻¹E₁₂ has r=1−εt⁻¹E₁₂; all reduced fibres are trivial but this is not an integral positive-loop element. | Exact and closed bounded pullbacks are different; geometric-point testing alone loses infinitesimal information. |
| §0.5 realization/dimension; 394 | A¹ and its perfection both have dimension 1; adjoining Aⁿ adds n. A split rank-r torus has discrete labels ℤʳ, dimension 0: one label for r=0, infinitely many for r=1. GL₂ rank-one flag over a fixed hyperspecial point: Frobenius-fixed flags number q+1 and have dimension 0; their complement in P¹ has dimension 1. | Dimensions survive perfection; no false preservation under forgetting Iwahori level. |
| §0.6 framing/κ; 446 | b′=h bσ(h)⁻¹ and g′=hg give (g′)⁻¹b′σ(g′)=g⁻¹bσ(g). S₃,h=(123),b=(12) gives b′=(23). G_m,b=ϖ,w=1 gives κ 1≠0 and ∅. | Direction of framing map and necessary κ obstruction correct. |
| §1.1 minimum-class theorem; 490 | A₁ finite s,b=1: ν=0,ℓ=1,dimension=1. GL₂,t^(1,0),ordinary b: ℓ=1,〈2ρ,ν〉=1,dimension=0. Torus same κ gives discrete dimension 0; wrong κ gives ∅. | Length-minus-Newton formula and iff distinguish finite from straight minima. |
| §1.2 reduction; 512 | A₁,w=s₀s₁s₀: u=s₁s₀,v=s₁. At b=1, dimensions of branches are −∞,1, giving max(−∞,1)+1=2. At translation b, branch values 0,−∞ give 1. Length-preserving twisted rotation has zero dimension shift. | Both branches needed; −∞ conventions consistent. |
| §1.3 degree formula; 536 | Same A₁ recursion has T_w≡zT_u+T_v. Basic class: degree 0,ℓv=1 gives (3+1+0)/2=2. Translation class: degree 1,ℓu=2,Newton pairing 2 gives (3+2+1)/2−2=1. Zero polynomial contributes −∞. | Degree is in z=v−v⁻¹, not in q; sign and factor 1/2 agree. |
| §1.4 advantage; 559 | Previous two classes: w versus v gives 2−1=1 at basic b; w versus u gives 1−0=1 at translation b. Reversed v versus w fails at translation b because v is empty while w is not. Identity comparison gives difference 0. | Correct quantifier over nonempty target loci; difference of two empty dimensions never formed. |
| §2.1 semi-module/type; 606 | h=2,m=1,A=ℕ: B={0,1},sum=1=h(h−1)/2. Shift A by 1: sum=3, not normalized. h=3,m=4,B={−3,1,5}: residues 0,1,2 and sum=3. Empty A fails nonemptiness. | Normalization, stable additions and integral residue representatives discriminated. |
| §2.2 extended semi-module; 637 | Cyclic h=3,m=4 has φ=jump. For h=5,m=4,B={−2,−1,2,5,6}, lowering φ(−1) from jump 1 to 0 produces the stated noncyclic example. Constant finite φ would require 1≤0 after +h. | Equality on tails is weaker than global cyclicity; trivial wrong φ is rejected. |
| §2.3 lattice strata; 670 | Leading indices ℕ in h=2 have determinant component 0; shifting by 1 gives component 1. The normalized h=3 example has B sum 3, component 0, despite minimum −3. Two residues cannot account for all three basis directions. | Component sign, normalization and full residue coverage agree with the stratification. |
| §2.4 chart dimensions; 707 | B={−3,1,5}: V={(5,6),(5,7),(5,10)}, so affine chart dimension 3. h=2,m=1: V=∅, chart A⁰ is a point, not empty. The noncyclic h=5,m=4 example has four indices, dimension 4. | General nonempty-open parametrization retained; cyclic specialization is not the entire theorem. |
| §2.5 superbasic dimension; 733 | h=2,m=1,μ=(0,1): pairing 1/2 minus defect contribution 1/2=0. h=3,m=4,μ=(0,0,4): pairing 4 minus (3−1)/2=3. h=4,m=5,μ=(0,0,2,3): pairing 11/2 minus 3/2=4; an unsorted-type cyclic chart has dimension 3<4. | Bound and existence of an attaining chart both needed; repaired Lean states both. |
| §3.1 unipotent Lang; 782 | GL₂ upper N and slopes (a,b): shift min(a−b,0). For a−b=2 it is 0; for −2 it is −2, equal to 〈ρ,ν_M−ν_G〉. N=1 gives 0. In GL₃, [1+E₁₂,1+E₂₃]=1+E₁₃ also in characteristic 2. The additive map u↦u²−u has kernel {0,1}, derivative −1=1. | Filtration is necessary; whole N cannot be replaced by its additive Lie algebra. |
| §3.2 adjoint transfer; 814 | G_m→1 with b=ϖ,w=1: source empty, target point, compatible component-label equation 0=1 impossible. For SL₂→PGL₂,b=1, admissible even component gives both dimensions 2 in the A₁ example. | Component labels prevent the false unlabelled comparison; global extension remains an owned theorem. |
| §3.3 superbasic factors; 860 | GL₂ basic slope 1/2: gcd(1,2)=1,def=1,projected κ=1 mod 2; J_b/Z has split rank 0. Slope 1 (m=2,h=2) has gcd 2, is not superbasic. Ordinary slopes (1,0) give J_b/Z of split rank 1. | Superbasic versus merely basic and anisotropic versus split cases separated. |
| §3.4 Levi dimension; 884 | M=G: d=0,correction=0. GL₂,M=T,μ=(1,−1),μ_M=0: d=1 and bound 〈ρ,μ〉=1. For μ=(1,0),ν_M=(0,1),ν_G=(1,0),μ_M=(0,1): d=0,〈ρ,ν_M−ν_G〉=−1 and 〈2ρ_N,ν_M〉=−1, so the fibre dimension is 0−1−(−1)=0. At μ_M=(2,−1), the intersection is empty. | Keep all μ_M and Newton terms; replacing ν_M by ν_G before evaluation loses a contribution −1. |
| §3.5 iterated loci; 926 | One leg returns the original equation. Torus, two bounds μ₁,μ₂: endpoint valuation is μ₁+μ₂, intermediate label uniquely forced, fibre dimension 0. d=0 is outside the explicit d≥1 hypothesis; the empty formal sum would be 0 but is not an asserted locus here. | Ordered chains, not an untwisted product of bounded loci. |
| §3.6 norm; 963 | Degree 3, b₀=1,b₁=U=[[1,1],[0,1]],b₂=V=[[1,0],[1,1]], coefficients Frobenius-fixed: Nm=UV=[[2,1],[1,1]], reversed order VU=[[1,1],[1,2]]. Distinct also modulo 2. Res GL₂ basic slope 1/2 has defect 1 on both sides, not 3. | Negative embedding cycle and ordered product correct. |
| §3.7 endpoint convolution; 989 | Two minuscule GL₂ bounds (1,0): top endpoint (2,0) fibre a point, bound 0; lower endpoint (1,1) fibre P¹, dimension 1=〈ρ,(2,0)−(1,1)〉. One leg gives dimension 0. | Endpoint stratification essential; a uniform zero-dimensional claim would fail. |
| §3.8 spherical dimensions; 1012 | GL₂ minuscule basic: 1/2−1/2=0; ordinary μ=ν=(1,0): 0; b=1,μ=(1,−1): 1. For b=1,μ=(1,0), κ mismatch gives ∅ despite numerical 1/2. | Equality restricted to nonempty loci; iterated sum convention matches §3.7. |
| §3.9 virtual upper bound; 1040 | A₁,s t^(nα∨),b=1: dim=d=n+1. GL₂ ordinary translation: dim=d=0. Empty locus gives −∞≤finite d. | Bound does not assert nonemptiness and is independent of the final lower bound. |
| §4.1 spherical nonemptiness; 1082 | GL₂ μ=(1,0): basic (1/2,1/2) satisfies κ=1 and Newton bound, dimension 0. Slopes (2,−1) have κ=1 but violate dominance; b=1 has acceptable Newton but κ=0. Both rejected. | Both directions need both invariants. |
| §4.2 greatest Newton class; 1106 | A split translation has greatest class equal to its own slopes. A length-zero τ has a singleton interval. In split SL₃,w=t^(2θ∨)w₀=s₀s₁s₂s₁s₀, the Bruhat-subword Newton points are 0,(1/2,1/2,−1),(1,−1/2,−1/2),θ∨=(1,0,−1); greatest is θ∨. | Genuine greatest element, not just an arbitrary maximal class. |
| §4.3 cell comparison; 1138 | GL₂,w=s t^(1,0),ℓ=2: basic ADLV dimension 1 plus Newton term 0 gives normalized cell dimension 1; ordinary ADLV dimension 1 plus Newton term 1 gives 2. At congruence levels 1,2 with dimensions 4,8, quotient dimensions are 5,9 and 6,10 respectively. | Normalization independent of level; generic formula 2−1=1. Missing P-fundamental input S01 and scope S03 remain. |
| §4.4 cordial definition; 1189 | Identity: 0=0; split translation of length 1: 1=1; finite simple reflection: 1−1=0. Negative control SL₃,w=t^(2θ∨)w₀ above: ℓw−ℓη=5−3=2, while 〈2ρ,ν_generic〉−def=4−0=4. Its generic dimension is 5−4=1, below virtual (5+3)/2−2=2. | Definition rejects a concrete noncordial element; testing only b=1 would not distinguish generic cordiality. |
| §4.5 mutual advantage; 1219 | w=v gives identical nonempty sets and dimension difference 0 for every b. A₁,w=s₀s₁s₀,v=s₁ has a basic difference 1 but at translation b dimensions 1 and −∞, so mutual advantage fails. | One-sided advantage cannot be substituted for the mutual hypothesis. |
| §4.6 saturation/dimensions; 1238 | GL₂,w=s t^(1,0): κ=1 interval consists of basic and ordinary classes. Chain length (1+1−0)/2=1. Both ADLV dimensions 1, but normalized Newton strata dimensions 1 and 2, codimension 1. Torus fixed κ interval has one class. | Dimension, codimension and defect conventions agree; geometric closure claim stays in equal characteristic. |
| §4.7 x t^λ cordial; 1253 | GL₂,x=s,λ=(1,0): ℓw=2,ℓη=1,ν_generic=(1,0),def=0, so 2−1=1. λ=0,x=s: finite cell has basic generic class and 1−1=0. Identity lies in its Bruhat closure but not in the open s-cell. | Closure argument does not insert a missing point into an open cell. |
| §5.1 double-flat; 1296 | A₁,y=1: λ♭♭=λ; λ=2ω∨,y=s: λ♭♭=0; λ=ω∨,y=s: λ♭♭=ω∨, not 0, because the integral coset is odd. Twisted A₂,J={s₁},λ=ρ∨: η_J=ω₁∨, not ω₂∨; λ♭♭=ω₁∨. | Integral dominant subtraction cannot be replaced by rational clipping or an untracked original lattice. |
| §5.2 factorization; 1337 | A₁,x=y=s,λ=2ω∨: J={s},J′=∅,x′=z=y′=1,β=γ=2ω∨,w₁=s t^ω has length 2,w₂=t^ωs length 0,w=t^(−2ω) length 2,a=1. Twisted A₂,x=y=s₁,λ=ρ∨: J′={s₁},x′=s₂,z=s₁,y′=1,β=γ=ω₁∨; ℓw=4 and a=s₂*s₂=s₂. | Parabolic directions and noncommuting Demazure product match the supplied convention. |
| §6.1 endpoint correspondences; 1389 | r_b(bσg)=σ(r_b(g)); u=1 collapses the extra flag. For u=v=s, ordinary endpoint 1 has A¹ fibre dimension 1=(1+1−0)/2; Demazure endpoint s has G_m fibre dimension 1=1+1−1. For s₁,s₂ in A₂, s₁s₂≠s₂s₁. | Endpoint twisting and multiplication order both necessary. |
| §6.2 chain comparisons; 1429 | A₁ factorization above has a length-zero factor and N₁=N₂=0. Twisted A₂ example: ℓA=1,ℓB=1,ℓw₁=2,ℓ(x′y′t^γ)=3,ℓa=1; N₁=(1+2−3)/2=0,N₂=1+1−1=1. | Ordinary and Demazure fibre losses differ; these values supply the missing discriminating Checks in S04. |
| §6.3 chain inequalities; 1482 | Twisted A₂ preceding example gives dim Z₁≥dim terminal+0 and dim Z₂≥dim Z₁+1. The finite-type model test Y×A¹→Y gives 2≥1+1 when Y=A¹; empty fibres are excluded by surjectivity. | Generic-point bounds use finite-dimensional bounded models; not a maximum over all points of an arbitrary ind-space. |
| §6.4 reduction; 1508 | Twisted A₂ example: original ℓw=4,ℓη=2 gives basic virtual dimension 3. Terminal s₂t^ω₁ has length 3,η length 1,virtual dimension 2; N₁+N₂=1 gives 3=2+1. A₁ trivial loss gives 2=2+0. | Fibre ledger accounts for the virtual-dimension difference. |
| §7.1 P-alcove; 1548 | A₂,x=s₁,y=s₂,λ=2α₁∨+2α₂∨: conjugating by x produces translation coefficients (2,2), whereas using y produces (0,−2), although the finite part is s₂s₁. J=all simples gives no outside roots; J=∅ gives the torus root conditions. | Conjugator and root inequalities cannot be swapped. |
| §7.2 Levi obstruction; 1577 | GL₂ nonbasic slopes (1,0) give torus lifts (1,0),(0,1); their Levi κ values differ although both have group κ=1. Matching κ_M=(1,0) selects the first. | Correct all-class statement, but extraction uses the later target: S02. |
| §7.3 proper support; 1600 | Split A₁,t^(nα∨),n>0,b=1: empty finite support and strict Newton gap imply emptiness. For b=t^(nα∨), gap is 0 and the locus has dimension 0. | Strict gap is essential; the second case is not a counterexample to the stated theorem. |
| §7.4 basic seed; 1621 | γ=0,a=s in A₁: finite DL dimension 1, also q=2. A₂,a=s₁s₂,γ=0: dimension 2, although an α₂ strip stays (−1,0). A₁,a=s₁,γ=α∨: T_(s₁s₀s₁)≡zT_translation+T_s₀; basic coefficient 1 gives dimension 2. | Basic seed does not require shrunkenness; positivity refers to ℕ[z]. |
| §7.5 Levi image comparison; 1658 | In G_m over q=2, ζ³=1,ζ≠1: twisted equivalence (1,1)∼(ζ,ζ) gives the same image 1; forgetting the twist gives image ζ²≠1. J=all simples gives the identity comparison. | Action and all-class union correct; reorder its geometric prerequisite as S02. |
| §7.6 seed to class; 1694 | GL₂,λ=(1,0),κ=1: basic and ordinary classes form the interval, and both loci for s t^λ have dimension 1. The class κ=0 is outside the interval despite Newton 0. | Saturation is within an integral κ-fibre. |
| §8.1 shrunken criterion; 1733 | A₁,s t^(nα∨),n≥1: full support {s},κ matches,b=1 gives nonempty. Pure t^(nα∨) has empty support and gives empty. | Both directions verified on opposite support outcomes. |
| §8.2 shrunken dimension; 1754 | A₁,n=1 gives 2=(3+1)/2; n=2 gives 3=(5+1)/2. Twisted A₂,x=y=s₁,λ=ρ∨,ν=0 gives 3=(4+2)/2; the double-flat average is ρ∨/2, so the strict lower range includes ν=0. | Integer result despite rational intermediates. |
| §8.3 basic specialization; 1776 | A₂,w₀,λ=0,b=1: strict Newton gap fails but the finite DL dimension is 3=(3+3)/2. For Res quadratic PGL₂,λ=(α∨,0): average (α∨/2,α∨/2) has positive coordinates on both components; λ itself does not. | Removing the strict-gap hypothesis for basic b and using the based average are necessary. |
| §8.4 large translation; 1790 | A₁,λ=α∨=2ρ∨ and x=s,y=1: dimension 2. A₂,λ=6ω₁∨ meets λ≥2ρ∨ but has α₂(λ)=0, so shrunkenness must still be assumed independently. | The specialization keeps that separate hypothesis. |

### Supplier, ownership and convention audit

Checked the cited contracts in nine roadmap families, counting RootSystems and RootSystemsPartII separately and including the base HeckeStacksAndLocalShtukas. Existing-roadmap references were checked on main; new suppliers were read through the roadmap index at their current heads. RootSystems on main is under `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`. RootSystemsPartII's accepted board design supplies the named integral-order contract; its agreed affine extensions remain declared gaps. No revision of an existing roadmap was used as an extra dependency.

| Supplier / owner | Resolved location and scope | Discriminating value / conclusion |
|---|---|---|
| ReductiveGroupsPartII | `TauCetiRoadmap/ReductiveGroupsPartII/README.md`:852,1852,1999,2185,2448,2706,4289,4532,5203,5222,5535,5656,5713,5730,5748,5817,5994,6104,6127; the RG2.0.4, RG2.1, RG2.3, RG2.4 targets named in the contract | Same diag(ϖ,1) is labelled (1,0) here and (−1,0) by RG2.4; κ=1 in both. Inversion would give κ=−1. Connected parahorics and nontrivial local valuations retained. |
| RootSystems; RootSystemsPartII | Main RootSystems Layers 3,4,6; board `packages/RootSystemsPartII/design/README.md`, RS2.1 integral-order | A₁ integral coroot cone contains 2 but not 1. A₂,w=w₀,y=s₁s₂: inversion cancellation gives 1=3−2. Pinned subadditivity does not already supply that equality. |
| BunGAndNewtonStrata | `TauCetiRoadmap/BunGAndNewtonStrata/README.md`, §§0.5–0.6,1.7–1.8,1.10–1.11,1.13–1.15,1.21,1.27,1.30,1.43,1.45 | GL₂ slope 1/2 has defect 1; restriction of scalars preserves 1. §1.43 explicitly has p-adic scope; the package acknowledges it. §1.10 lacks P-fundamentality (S01). |
| GeometricSatakeAndFusion | `TauCetiRoadmap/GeometricSatakeAndFusion/README.md`, GS0 named perfect/Schubert/parahoric/incidence/fibre targets; GS1 semi-infinite-affineness; GS2 convolution-diagram and rational-special-fibre-convolution | s,s gives ordinary and Demazure fibre dimensions 1,1; GL₂ two-minuscule convolution gives 0 at (2,0),1 at (1,1). GS1's split semi-infinite assertion is not silently used for the missing nonsplit Levi theorem: the latter is gap:levi-intersection-dimension. |
| SchemeAndStackFoundations | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md`:755–788,848,1475–1534,1565–1683 and Layer 1 | A²→A¹ has dimension difference 1; perfection of A¹ has dimension 1; dual numbers perfect to a reduced point. Pfp means qcqs plus local finite presentation up to perfection, not arbitrary topology. |
| TraceFormula | CohomologicalPointCounting family, TraceFormula Layer 11 and its EllAdicRealization coefficient bridge | On H²_c(A¹), geometric trace q, arithmetic trace q⁻¹; at q=2 these are 2 and 1/2. Finite-type, separation, constructibility and ℓ≠p remain explicit. |
| SmoothRepresentationsOfLocalGroups | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, SR.1.5 iwahori-matsumoto and bernstein-presentation, including the generic-integral paragraph | Dividing U_s²=(v²−1)U_s+v² by v² gives T_s²=(v−v⁻¹)T_s+1. The generic Laurent parameter avoids requiring a numerical square root in arbitrary coefficients. The twisted extension is a declared gap. |
| HeckeStacksAndLocalShtukas | `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md`, HS0–HS4 and scope | The base owns diamond/tower/Hecke-cohomology comparisons. Here the new object is a classical or perfect Frobenius-graph locus, not a second diamond tower. No duplicate declaration was found. |

Pinned-library checks used Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, as recorded by the supplied manifest. In particular:

- `Mathlib/GroupTheory/DoubleCoset.lean`:29–55 defines the product of arbitrary sets with a singleton; no subgroup axiom is part of that definition. The subgroup invariance theorem has the extra hypotheses it needs. `Mathlib/GroupTheory/Coset/Defs.lean`:60–76 supplies the nonnormal left-coset relation x⁻¹y∈I.
- `TauCeti/GroupTheory/DoubleCoset/Basic.lean`:92–106 requires membership of the multiplier in the left subgroup; it requires no normality. `TauCeti/GroupTheory/Coxeter/Parabolic.lean`:101,233,280–281,330–331 supplies the parabolic and right-coset minimal factorization, with additive length, without finite parabolic hypotheses.
- `TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean`:36–57 and `Length.lean`:80–99,143–179 retain the finite-root, characteristic-zero, domain, reduced and crystallographic hypotheses where used. The cancellation gap is not merely the existing subadditivity theorem.
- `Mathlib/Data/Set/Card.lean`:613 defines ncard by ENat.toNat; infinite sets therefore have value 0. The geometric chart theorem explicitly asserts finiteness. `Mathlib/Algebra/BigOperators/Finprod.lean`:99 supplies the finite-support sum convention; the residue basis is proved finite from h>0 and the semi-module conditions before using it as a normalization.

Ownership searches used the roadmap service by object, across main and indexed open heads, and local searches of board packages and the supplied sibling checkouts. Searches included affine Deligne–Lusztig loci, semi-modules, cordiality, Newton cells, P-fundamental alcoves, affine cocenters and the seven specialized Lean names. The matches distinguish GS ambient carriers/fibre bounds, BunG invariants, SR algebra, and the base diamond/cohomology direction from the new ADLV pullbacks and dimension comparisons. No additional earlier owner was located for the owned ADLV results. The missing P-fundamental contract is reported rather than inferred from these adjacent constructions. No fully qualified Lean-name collision was found.

### Declared gaps

All thirteen plan slugs occur in the README's exact supplier contracts with the same supplier and needs. None has supplier `none`. Each names a definite extension, including its scope or standing datum; these are conditional contracts, not findings for being unimplemented. They do not duplicate the pinned results inspected here. The six affine/root gaps retain the settled RootSystemsPartII routing.

| Gap | Boundary computation / scope check |
|---|---|
| unipotent-linearization | GL₃ upper unipotent group has nonzero E₁₃ commutator; graded root-height quotients are additive, even at p=2. Whole-group additivity would fail. |
| demazure-product | s*s=s, ℓ=1=1+0, while ss=1. For u=τ,v=s with τ swapping two affine nodes, the support is {τ(s)}, not {s}. |
| twisted-redmin | A₁,s₀s₁s₀→s₁ changes lengths 3→1; s₀ and s₁ cannot be joined by a length-nonincreasing simple move, so strong conjugacy is a distinct conclusion. |
| straight-finite-parabolic | Finite reflection s=u·1 has Newton 0 and length 1, while x=1 is straight with length 0. This does not assert root-subgroup contraction (S01). |
| finite-coxeter-basic-class | τ=1, inputs s₁ and t^α∨s₁=s₀ reach different simple minima. A transitive two-component datum has one σ-orbit of corresponding finite nodes; c=(s₀,1) has length 1. Dependence of (J,c) and the component-orbit extension are explicit. |
| parabolic-root-length | A₁,w=y=s gives 0=1−1; w=1,y=s fails the sign hypothesis and would demand 1=−1. Rank zero gives 0=0. |
| dominant-subtraction | In A₁, (2ω∨)−_dom(2ω∨)=0; ω∨−_dom(2ω∨)=ω∨, since 0 has the wrong integral coroot coset. |
| superbasic-classification | GL₂ slopes (1/2,1/2) give anisotropic J/Z and defect 1; slopes (1,0) give a split torus quotient of rank 1. The classification clause is expressly unramified. |
| newton-poset-length | GL₂,κ=1,basic→ordinary gives (1+1−0)/2=1; an equal pair gives 0. Different κ classes are not comparable. |
| newton-cell-strong-purity | GL₂ basic stratum has codimension 1 in the two-stratum cell. Empty intersections remain permitted; the assertion is on Noetherian models in equal characteristic. |
| newton-cell-greatest | Translation cell greatest class is its translation class; closure adds lower cells without creating a greater class. Full κ is retained. |
| levi-intersection-dimension | GL₂/T,μ=(1,−1),μ_M=0: d=1 and upper bound 1. Every element of Σ is T-maximal; for M=G only μ is maximal and d=0. |
| twisted-affine-cocenter | T_s²=zT_s+1 has nonnegative coefficients; degree(z)=1 and degree(0)=−∞. Twisted commutator with 1 is T_s−T_σ(s), unlike the ordinary commutator 0. |

The required dependency command produced exactly:

```text
depcheck: 186 roadmaps, 1215 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no moved line. S02 is the finer target-level proof dependency, not a contradiction of this roadmap-level output. The read-only diff stat contains ten changed files, all under `packages/HeckeStacksAndLocalShtukasPartII/` (3,359 insertions, 63 deletions). No other package edit is part of this head. No algorithmic milestone, pull-request number, `set_option` or `lemma` declaration was found in the README/Suggested.lean pair. This review changed only its report and scratch notes.

### Source-locator and Check counts

The following is a 91-item inventory of named locators compared with the supplied legal text, across all 15 manifest works. Repeated appearances of a locator in the README count once. Section-level proof passages and source-issue checks below are additional reads. “Verified locator” means that the statement and surrounding hypotheses were located and compared; it does not certify the source's entire proof or a proposed all-characteristic extension.

| Source | Named locators in this inventory | Text witness |
|---|---|---|
| he15 (4) | Theorems 2.23,2.27,2.30,2.31 | he15 lines 1373–1395,1480–1502,1525–1565 |
| gh10 (4) | Lemma 2.5.1, Proposition 2.5.2, Corollary 2.5.3, Lemma 2.6.1 | gh10 lines 219–242,300–325,410–430 |
| ghn15 (5) | Theorem B, Theorem 3.3.1, Proposition 3.5.1, Lemma 3.6.3, Proposition 3.6.5 | ghn15 lines 119–122,409–422,505–525,543–581 |
| ghnerr (2) | Propositions 0.0.1,0.0.2 | ghnerr lines 16–29,56–70 |
| ghkr06 (5) | Proposition 5.3.1, Proposition 5.3.2/equation (5.3.4), Lemma 5.4.3, Proposition 5.6.1, Theorem 5.8.1 | ghkr06 lines 835–843,895–938,1223–1230,1360–1426,1446–1455 |
| vie06 (7) | Definition 3.1, Lemma 3.3, Definition 3.4, Example 3.5, Theorem 4.3, Proposition 5.2, Theorem 5.3 | vie06 lines 132–151,152–225,266–269,382–459 |
| ckv15 (1) | Lemma 3.1.1 | ckv15 lines 931–947 |
| hn14 (5) | Proposition 2.7, Theorem 2.9, Corollary 2.10, Theorems 5.3,6.7 | hn14 lines 398–478,1068–1085,1242–1255 |
| he21 (14) | Theorem 2.1, Theorem 3.2, Proposition 3.3, Theorems 4.1,4.2,4.4, Proposition 5.1, Corollaries 5.3,5.4, Theorem 5.5, Proposition 5.6, Theorems 6.1,6.3, Corollary 6.4 | he21 lines 145–555; §§5.4,6.2–6.5 read with their proof data |
| zhu17 (11) | Theorem 0.5, Lemma 1.22, Proposition 2.3, Theorem 3.1, Proposition 3.3, Lemmas 3.5,3.7, Definition A.13, Proposition A.15, Corollary A.16, §A.3.4 | zhu17 lines 297–299,1005–1017,1168–1185,2105–2297,2721–2786,3094–3113 |
| he14 (12) | Theorems 2.1,2.2,2.3,4.8,6.1, Corollary 6.2, Theorems 7.1,10.3, Corollary 10.4, Propositions 11.6,11.7, Theorem 12.1 | he14 lines 290–375,610–618,777–830,877–895,1126–1157,1244–1331 |
| mv20 (11) | Definition 3.1, Lemma 3.2, Definition 3.3, Corollary 3.6, Definition 3.7, Theorem 3.10, Corollaries 3.11,3.12, Definition 3.14, Theorem 3.16, Corollary 3.17 | mv20 lines 247–470; Remark 1.3 at lines 152–162 separately limits characteristic transfer |
| vie14 (2) | Proposition 5.5, Corollary 5.6 | vie14 lines 705–778 |
| ham15 (6) | Theorem 1.1, Definition 2.5, Lemma 2.6, Definition 2.7, Lemma 2.8, Proposition 2.9 | ham15 lines 48–51,80–265 |
| ham17 (2) | Definition 2.1(3), Corollary 2.7 | ham17 lines 176–184,240–261 |

All 169 README Check bullets were read and compared with their section's statement. Numerical and structural test values are recorded in the 47-row target ledger, seven-row declaration ledger, and supplier/gap tables; repeated examples are consolidated there. The non-discriminating chain-space bullets are S04. The repaired advantage, Newton-sign, rank-zero torus and M-maximality Checks now distinguish the earlier wrong alternatives. The Check audit count is 169, with three §6.2 bullets rejected as uncomputed or restated tests in S04; the remaining checks were compared against the computations and structural distinctions above. No new Suggested.lean padding was found.

## Not verifiable

- No fresh Lean elaboration was run: the task prohibits builds. All seven supplied elaborated signatures were compared, but this is not an independent rerun of that elaboration.
- The geometric proofs remain targets. In particular, the all-characteristic component transfer in §3.2 is stated as a new obligation; the good-characteristic erratum alone does not prove it. This review does not certify the future construction, nor infer a false statement merely from the cost of proving the extension.
- Acceptance remains conditional on the thirteen declared supplier gaps. Their absence from today's supplier implementations is not a defect. Their slugs, owners, hypotheses and boundary values were checked.
- Source text is available for all fifteen cited works, so no new missing-reference request is needed. The source-locator inventory concerns these texts; it does not independently fetch every work cited inside their proofs. The missing use of a separate fundamental-alcove theorem in mv20 is identified in S01 instead of treating a bibliographic reference as a supplied prerequisite.
- The he21 extraction contains substantial OCR corruption, and several sources lose overbars or inequality glyphs. Ambiguous glyphs alone were not promoted to mathematical errors. In particular, apparent missing closure bars in vie14/mv20 and strict inequality glyphs in he14 were not treated as source defects.
- Ownership was searched in the readable main tree, board packages, indexed open heads and supplied sibling folders, rather than auditing every line of every unrelated roadmap. No claim is made about unpublished work or unprovided private checkouts.

## Source issues

- **Error** in ghn15 at Proposition 2.2.1, PDF pp. 6–7 (ghnerr lines 14–29): the source says the adjoint flag map is globally an immersion with injective component labels; it should be componentwise, with global immersion requiring injective labels; affects a stated result; corrected in print at ghnerr Proposition 0.0.1, p. 1.
- **Error** in ghn15 at Proposition 3.5.1, PDF p. 13 (ghn15 lines 505–525; ghnerr lines 56–70): the source says one group σ-class contains at most one Levi σ-class; it should be restricted to basic group classes; affects a stated result; corrected in print at ghnerr Proposition 0.0.2, p. 2.
- **Error** in gh10 at Lemma 2.5.1, PDF p. 6 (gh10 lines 219–223): the source says support of the extended-affine Demazure product is the untwisted union; it should be supp(x)∪τ(supp(y)) for factors xτ,yυ; affects a stated result.
- **Misprint** in ham15 at Theorem 1.1, PDF p. 2 (ham15 lines 48–51): the source says ρ is half the sum of all absolute roots; it should be half the sum of positive absolute roots; affects a stated result.
- **Misprint** in ham15 at proof of Proposition 2.9, PDF p. 6 (ham15 lines 222–224): the source says the first two fibre calculations subtract 〈ρ,ν−ν_dom〉; it should add that pairing, consistently with Lemma 2.4 and the final line; affects the proof.
- **Misprint** in ham15 at proof of Proposition 2.9, PDF p. 6 (ham15 lines 228–234): the source says the total dimension is the supremum of the Levi-stratum dimensions; it should take dimensions of their β-preimages before applying part (3); affects the proof.
- **Error** in zhu17 at Theorems 0.5 and 3.1, printed pp. 410,456 (zhu17 lines 297–299,2109–2137): the source says the finite spherical dimension formula holds without an explicit nonemptiness condition; it should require the exact or bounded locus under consideration to be nonempty; affects a stated result.
- **Gap** in zhu17 at §3.1.2, printed pp. 456–457 (zhu17 lines 2169–2179): the source says a whole unipotent-radical/Lie-algebra identification lets the linear argument apply; it should specify the equivariant additive successive quotients actually used by GHKR; affects the proof.
- **Misprint** in zhu17 at proof of Proposition 3.3 before Lemma 3.5, printed pp. 458–459 (zhu17 lines 2226–2257): the source says τ_i=σ^iτ₀ while using b₀σ(b₁)⋯ as the norm; it should use τ_i=σ^(−i)τ₀ for that ordered formula; affects the proof.
- **Gap** in zhu17 at proof of Proposition 3.3, printed pp. 459–460 (zhu17 lines 2286–2294): the source says the exact-λ fibre bound applies over the closed ≤λ endpoint locus; it should stratify that locus by exact endpoints and apply each bound separately; affects the proof.
- **Misprint** in he14 at the definition preceding Theorem 10.3, printed p. 396 (he14 lines 1126–1127): the source says η_δ(x)=δ⁻¹(y)x after defining the affine element w̃=xt^μy; it should evaluate η_δ on w̃; affects a stated result.
- **Misprint** in he14 at proof of Theorem 10.3, printed p. 396 (he14 lines 1132–1140): the source says choose a reduced word for δ⁻¹(y), then uses its prefixes as prefixes of y; it should choose the reduced word for y in that calculation; affects the proof.
- **Misprint** in he14 at Theorem 11.4, printed p. 398 (he14 lines 1211–1215,1322): the source says n counts δ-orbits of affine simple reflections; it should count δ-orbits of finite simple reflections, as the proof of Theorem 12.1 does; affects a stated result.
- **Misprint** in he14 at Proposition 11.6, printed p. 399 (he14 line 1245): the source says the support hypothesis is on an unbound v; it should be on x; affects a stated result.
- **Misprint** in he14 at proof of Proposition 11.6, printed p. 399 (he14 line 1260): the source says ordinary support of x′ equals J after proving the twisted-support equality; it should retain σ-saturated support; affects the proof.
- **Misprint** in he14 at proof of Proposition 11.6, printed p. 399 (he14 line 1263): the source says a minimal left-coset representative has a descent inside that parabolic; it should choose the descent outside the parabolic subset; affects the proof.
- **Misprint** in he14 at proof of Proposition 11.6, printed p. 400 (he14 line 1281): the source says the final right reflection is s_i; it should be s_δ(i), as in the preceding reduction; affects the proof.
- **Error** in he14 at Proposition 11.7, printed p. 400 (he14 lines 1289–1293): the source says one fixed pair (J,c) works for every (μ,w); it should permit (J,c) to depend on (μ,w); affects a stated result.
- **Misprint** in he21 at §§6.2 and 6.5, printed pp. 13–14 (he21 lines 503,506,542): the source says the P-alcove conjugator is σ⁻¹(y); it should be x for the normal form w=xt^λy; affects the proof.
- **Gap** in he21 at §6.3, printed p. 14 (he21 line 518): the source says the shrunken basic nonemptiness theorem applies to the auxiliary a t^γ; it should establish a basic seed without assuming that auxiliary alcove is shrunken; affects the proof.
- **Misprint** in he15 at proof of Theorem 2.30, PDF p. 38 (he15 lines 1542–1544): the source says η is evaluated on w in the decomposition wγ=xt^λy; it should be evaluated on wγ; affects a stated result.
- **Misprint** in ham17 at proof preceding Corollary 2.7, PDF p. 6 (ham17 line 242): the source says the final projection of the GL_n Newton vector is pr_β; it should be pr_i, matching the chosen GL_n breakpoint; affects the proof.
- **Misprint** in vie06 at proof of Theorem 4.3, Claim 2, PDF p. 7 (vie06 line 322): the source says the assertion at a−h is equivalent to the assertion at h; it should compare a−h with a; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "41e861129dd3fb136025967fd8b779fb365b4400", "job": "RT-HeckeStacksAndLocalShtukasPartII~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
