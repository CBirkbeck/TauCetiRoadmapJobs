# Design repair: CohomologyComparisonsPartII

## F01 (P2) — applied differently

Administrative `base-ownership` → existing mathematical contracts for 2.1/5.1/5.2/5.3 and `rigid-syntomic-etale-period` for 7.4/7.5. The redundant gap is deleted; both period APIs remain. The new gap also supplies the horizontal-log period: 4.2/4.5 assume canonical log, so the suggested reuse fails. Evidence: BesserI line 1209–1216; AM line 1302–1334. README and plan incidence data agree.

## F02 (P3) — applied

Arithmetic-pair-only completion → undivided and divided derived completions, and rationalizations, for every log-syntomic X/W(k) of 3.2. `completedReduction` and `rationalFiber` retain the NN arithmetic-pair domain. Section 7.4 names this carrier. A trivial-log point Check computes both completed towers. Evidence: EN line 196–218; NN line 1299–1337; AM line 1314–1326.

## F03 (P3) — applied differently

Unspecified period API → enumerated operators, comparison embeddings, Fontaine–Messing coefficient sequences, CN Artin–Schreier sequences and bounded PD Poincaré map. Section 4.1 loses its unused prerequisite. Operators are assigned to their proper rings. The suggested PD locator is corrected: CN line 968–980 gives Lemma 2.23; CN line 1169–1185 and CN line 1234–1239 give Lemma 2.37 and its hypotheses.

## F04 (P3) — applied

Described monoidal/opposite carriers → pinned `TauCeti.ExactStructure.IsMonoidal` and `TauCeti.ExactStructure.op`, cited with their files and binders. Section 1.3 adds `FilFMIC.exactStructure_isMonoidal`; `exact-yoneda` uses the native predicate, symmetry and R-bilinearity. Both files were fetched through the sources service and certified. Evidence: TauCetiExactMonoidal line 48–57; TauCetiExactOpposite line 150–155 and TauCetiExactOpposite line 201–203.

## F05 (P3) — applied

Lean workflow policy and extraction-cache explanation → deleted. The implementation-time base instruction disappears with its redundant gap; Scope and ownership states that the base’s comparisons are imported. The mathematical references, theorem/page locators and supplier obligations remain. README contains none of the three identified workflow passages.

## F06 (P3) — applied

Odd-prime-only collision wording → every prime. “Second differential” → the positive second component d(a)=(0,2a), with acyclicity justified by 2∈Q×. “Need not be invertible” → non-bijectivity for every m>1 with p∤m. Each Check agrees with the plan. Evidence: AM line 255–258; HK line 730–739; collision fibre x²=0 at t=0.

## Checks and outcomes

- **Dependency gate:** exit 0. Exact output:

  ```text
  candidate: CohomologyComparisonsPartII is not in the merge order yet; checked as if placed after CohomologyComparisons (the intake inserts it when its design is accepted)
  depcheck: 3 roadmaps, 12 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. No merge-order file was edited.
- **README/plan consistency:** passed. Seven layers, 33 targets, 121 API items, 106 Checks and 31 gaps. Every target/API/Check name occurs in the README. Every gap’s supplier, needs and section match its README paragraph; every `neededBy` equals the targets listing its prerequisite. All target dependencies point backward. Every target retains its locator and at least three Checks. All layers retain Examples and Dependencies.
- **Source manifest:** parsed successfully as TOML with schema `tauceti-roadmap-sources/v1`; every source has bibliographic fields, locator, citation uses and status. The two new pinned files are certified open-repository sources with service-recorded URLs and hashes. The first monoidal fetch lacked an explicit host licence class; retrying with `open-repository` succeeded, and the resolved request was cleared. No missing text remains. BesserII’s existing uncertified status was respected; no producer target uses it.
- **Pinned declarations:** the pins agree with the content manifest. Read the native exact, exact-functor, monoidal and opposite declarations at the Tau Ceti pin. Their additive-category binders are retained; `IsMonoidal` additionally needs the monoidal and monoidal-preadditive instances. Read the pinned Mathlib cone, isocrystal, Ext and de Rham period-ring carriers. Abelian Ext still requires an abelian category and does not supply exact-category Yoneda theory (MathlibExt line 53–61; TauCetiExtReview line 54).
- **Sibling ownership:** read RigidAnalyticGeometry, GrothendieckEulerForms and EnhancedDerivedSheaves on main. GrothendieckEulerForms Layer 5 supplies abelian Ext-Euler theory, leaving `exact-yoneda` a genuine Part II gap. Read the open new-folder roadmaps ErdosProgressionPowers and ArithmeticDynamics at their reported heads. Searches across main, Completed and both open-roadmap texts found no matching log/rigid syntomic or Fil-F-MIC construction that discharges the repaired contracts.
- **Lean agreement/elaboration:** no `Suggested.lean` exists in this design. No Lean file was created or edited, and no Lean command was run. The new API specializes the unconstructed FilFMIC category; the new Check uses unconstructed syntomic carriers. Neither is an easy signature on existing carriers alone.
- **Whitespace and scope:** `git diff --check` passed. Only the three permitted package files and this required report were changed. No commit, push or GitHub write was made.

## Adversarial mathematics pass

Each target row covers its definition, theorem and named API; the checks use the target’s actual hypotheses. These are mathematical computations and source checks, not an independent acceptance review.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: bases and Frobenius | π²=p at p=2,3; unramified W(k); zero chart | F_V(π) has valuation 1 but π^p has valuation p, so the strong modulo-p condition fails in the ramified example; classical layers remain available | None |
| Conventions: fibre and Tate signs | Q —2→ Q; O(1)⊗O(−1); dlog t | d(a)=(0,2a); twists cancel; Frobenius on H¹(G_m) is p | F06 clarifies the differential |
| Conventions: HK and residue | φ=diag(1,p), Ne1=e0; boundary 0,∞ | Nφ=pφN; exp(log(u)N)e1=e1+log(u)e0; residues (1,−1) sum to zero | None |
| 1.1 FilFMIC | zero, unit, Φe=te, generic-only Spec(K) | Zero/unit satisfy the axioms; te is not horizontal; rigid realization on a generic-only component loses the nonzero algebraic datum | None |
| 1.2 tensor/Tate/pullback | zero factor; opposite twists; identity pullback | Filtration jumps and Frobenius exponents add; identities and dual evaluation agree | None |
| 1.3 exact structure and cups | split extension; zero coefficient; non-strict identity B→A | Split classes vanish; the filtered identity with unequal F⁰ is not admissible; locally split graded pieces make tensor biexact | F04 supplies the native monoidal specialization and opposite carrier |
| 1.4 connection fibre | O(0), O(1), zero, multiplication 2 | At F_p the first has H⁰=H¹=Q_p; O(1) contributes Q_p in degree 1; multiplication 2 has zero kernel/cokernel | F06 |
| 1.5 extension evaluation | degree 0; split class; Φe=e−h | Identity evaluates to 1; split class to 0; the nonsplit representative is (0,h), fixing 1−Φ | None |
| 1.6 unique lift and projections | O(1); Φe=e+ah; F⁰H≠0 | R=−ah; without F⁰H=0 lifts differ by filtered sections, so uniqueness is not exported | None |
| 2.1 specialization | Spec(V), empty X, Spec(K) | sp is id_K, zero, and K→0 respectively; it is not generally an equivalence | F01 retains only the identified rigid-realization contract |
| 2.2 rigid fibre | Z_p point, r=0 and r>0; empty special fibre | At r=0 H⁰=H¹=Q_p; at r>0 H⁰=0,H¹=Q_p; an empty special fibre leaves the filtered de Rham term | None |
| 2.3 exact sequence and single fibre | K=K0; zero map; G_m weight 1 | Eliminating a=sp(b) does not invert sp; (1−φ/p)dlog t=0 | None |
| 3.1 divisible PD coefficients | r=0; p=2,r=1; division modulo p | Weight zero gives O_cr; the PD equality at r=1 is distinct from the exact-period range; py=0 does not determine y modulo p | None |
| 3.2 integral fibres | zero map A[0]→B[0]; weight 0; empty X | H⁰=A,H¹=B; divided and undivided agree at weight 0; empty realization is zero | None |
| 3.3 transition maps/products | r=0; multiplication p on Z/p²; odd degrees at p=2 | Both composites are p^r; killed kernel/cokernel is not an integral equivalence; no multiplicativity of τ is inferred | None |
| 3.4 presentations/completion | horizontal trivial-log point; r=0; tail tower ⊕_(j≥n)F_p | Both point towers complete to [Z_p —0→ Z_p]; the tail tower has lim=0 and lim¹=(∏F_p)/(⊕F_p)≠0 | F02 extends the carrier and adds the point Check; NN comparisons stay restricted |
| 4.1 lattices | r=0; p=2,r=2; r=p−1 | L_EN=(1/8)Z_2(2), L_CN=(1/4)Z_2(2); inclusion has coordinate 2 and is zero modulo 2; endpoint choices differ by p | F03 removes the unused period-ring premise |
| 4.2 period maps | r=0; cup unit; nonproper X | The maps agree at weight zero; unit maps to 1; closed nearby-cycle cohomology is not identified with generic cohomology | F01 does not reuse these canonical-log maps on a horizontal-log pair |
| 4.3 small weights | p=2,r=0; p=3,r=1; t dlog t | Exact range has the stated endpoints; inverse Cartier gives [t^(p−1)dt]≠0 whereas [dt]=0; no undivided exactness follows from ωτ=p^r | None |
| 4.4 all-weight bound | ramified xy=π^h; p=2,r=1; degrees above r | The ramified constant is independent of n and X; the roots-of-unity statement retains the p=2 dimension term; no above-range claim | F03 preserves the separate CN error bounds |
| 4.5 gluing | empty closed part; identity j′; weight 0 | Gluing gives open direct image, the lattice itself for identity j′, and the shared unit | None |
| 5.1 HK adapter | rank one N=0; two-dimensional Nφ=pφN; k[t]/t^m | Uniformizer change has positive sign; t is absent from the image of t↦t^p when m>1, and a nonzero nilpotent power lies in its kernel | F06 sharpens non-bijectivity; F01 uses the proper-HK contract |
| 5.2 total fibre | r=0; the two-dimensional datum; zero datum | Lower map is 1−pφ; N(1−φ/p^r)=(1−φ/p^(r−1))N; the two differentials compose to zero | F01 uses arithmetic-pair deformation rather than an administrative premise |
| 5.3 h-adapter | identity refinement; p=2; r=0 | Refinement acts as identity; rational weights include all r≥0; only τ≤0 is compared at r=0 | F01 keeps rational-descent as the exact base contract |
| 6.1 relative datum | identity family; empty U; P¹_S | H⁰=O for identity, all zero for empty U; P¹ has ranks 1,0,1 with H²=O(−1) | None |
| 6.2 promotion | c=0; bad graded piece; U=D(pt−1) | Zero comparison and non-locally-free graded pieces fail; rigid coherence does not imply finiteness of Q_p[t,(pt−1)⁻¹] | None |
| 6.3 compactification | A¹×G_m; empty horizontal boundary; x=0,x=t | Constant compactification satisfies the conditions; empty divisors are allowed; the collision fibre is x²=0 at every prime | F06 removes p odd |
| 6.4 geometric settings | genus g=0 and arbitrary g; G_m; p=2 | Proper-curve ranks 1,2g,1; G_m has H¹=O(−1); all-prime statements retain the strong AM base hypothesis | None |
| 6.5 affine acyclicity | A¹, G_m, elliptic curve | Dagger H¹ is 0 and K dlog t respectively; H¹(E^an,O)=K rejects a non-affine extension | None |
| 6.6 residues | split 0,∞; quadratic boundary over Z_2; empty D | Residues are (1,−1); quadratic trace-zero coefficient has Frobenius −2; proper empty-boundary H² survives outside the affine hypothesis | None |
| 6.7 geometric projections | n=0; split extension; G_m,n=1 | Weight is n+1; split components vanish; G_m(2)=O(1) has F⁰=0 and residue twist 1 | None |
| 7.1 compatible lifts | σ(t)=t^p at 0 and Teichmüller a; σ(t)=t^p+p | P_0=0, P_a=[a]; for the latter lift the root of 0 is p modulo p² for every prime | None |
| 7.2 detection | zero-rank M; constant 1; finite residue F_p | Rank zero is included; 1 survives evaluation on a nonempty special fibre; t^p−t rejects finite-residue detection | None |
| 7.3 specialization | identity point; split extension; t=p with σ(t)=t^p | Identities and split classes specialize correctly; p^p≠p excludes the incompatible point | None |
| 7.4 horizontal log/rigid comparison | point,r=0; G_m; horizontal versus vertical point,r=1 | Horizontal H¹=Q_p, while the canonical-vertical C_st point has H¹=Q_p²; period maps need their distinct source-domain contract | F01 supplies the period gap; F02 supplies the horizontal completed carrier |
| 7.5 absolute extension value | curve,n=1,r=2; split class; missing filtered vanishing | F²Ω•=0 for a curve; connecting representative is (0,b); split value is zero; without the second vanishing surjectivity can fail | F01 makes the period premise explicit |
| Supplier interfaces and ownership | identity scalar extension; zero objects; r=0; p=2; canonical versus horizontal log | No supplier has been asserted to contain an unavailable section; all missing mathematics has a named supplier gap; CN approximate sequences remain approximate | F01/F03/F04 clarify the interfaces |

## Maintainer notes

`base-ownership` is deleted because each former consumer has an identifiable mathematical prerequisite: `rigid-realizations` (2.1), `hyodo-kato-proper` (5.1), `arithmetic-pair-deformation` (5.2), `rational-descent` (5.3), and `rigid-log-crystalline` plus `rigid-syntomic-etale-period` (7.4). No accepted supplier section was invented. Delivering these missing supplier results is outside this package; their gaps remain explicit.

The new CohomologyComparisons obligation includes both the general smooth quasi-projective rigid period and the horizontal-log period/comparison square of AM Lemma 3.10. This avoids changing the domain of 4.2 or 4.5 and avoids identifying horizontal and canonical vertical log structures. PadicPeriodRings’ sharpened obligation retains all primes, distinct EN/CN lattices and the CN error bounds. No supplier was moved later and no theorem was transferred to a later consumer.

No existing theorem/API name was deleted or renamed. Added names are `FilFMIC.exactStructure_isMonoidal` and the Check `LogSyntomic.presentationsAndCompletion_horizontalPoint`. The absolute period APIs cited by regulator consumers remain. The independent review following this repair is still required.
