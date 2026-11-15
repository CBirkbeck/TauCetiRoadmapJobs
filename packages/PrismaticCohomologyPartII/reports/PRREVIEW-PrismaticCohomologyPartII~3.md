# Review of PrismaticCohomologyPartII (pull request #1065 at 71b7613)

**Verdict:** needs changes

## R01 (P1) — The required build and elaboration fail before Lean starts

**Location:** `TauCetiRoadmap/PrismaticCohomologyPartII/Suggested.lean:1`, `import Mathlib`; gate rule `build`.
**Claim:** The acceptance build is not verified at this head; Lake cannot materialize its pinned dependencies.
**Witness:** The worker's gate and the rerun both report `build=2 FAIL`. Targeted `lake build` and direct `lake env lean` each exit 1 with `already exists (error code: 17)` at `.lake/packages`.
**Repair:** Restore the review environment's pinned dependency directory behind `.lake/packages`, then rerun the targeted build, direct elaboration and gate with `--build`. This failure supplies no evidence of a defect in the Lean statements; do not change the pins.

## R02 (P3) — The previous §4.2 placement repair remains incomplete

**Location:** `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:13`, “Imported generalized Cartier divisors (§4.2)”.
**Claim:** Layer 4 skips the numbered §4.2 interface because it remains under Scope, outside its mathematical layer.
**Witness:** Layer 4 proceeds from §4.1 at line 766 to §4.3 at line 793. Its dependency lines at 803, 830 and 987 still cite §4.2, whose only heading is line 13.
**Repair:** Move the imported interface paragraph, API and four Checks into Layer 4 immediately after §4.1, headed “### 4.2 Imported generalized Cartier divisors”. Keep SchemeAndStackFoundations §1.21 as the owner and retain a short deferral in Scope.

## R03 (P3) — The description implies that the empty Lean module states targets

**Location:** Pull-request description, roadmap-folder paragraph: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti”.
**Claim:** The description does not tell readers that this new roadmap's acceptance module contains no declarations.
**Witness:** `TauCetiRoadmap/PrismaticCohomologyPartII/Suggested.lean:8` says no headline is statable; lines 37–39 contain an empty namespace. The base-to-head change adds zero Lean declarations.
**Repair:** Replace that paragraph with: “Adds the new PrismaticCohomologyPartII roadmap: a 2,059-line README, metadata and a declaration-free Suggested.lean. Its docstring lists the headline theorems and the missing pinned-library carriers; all mathematical targets are specified in the README.”

## R04 (P3) — The description claims validation that this head does not pass

**Location:** Pull-request description, Validation paragraph: “the targeted Lake build succeeds with `sorry` as the only warning”.
**Claim:** The quoted validation does not describe the supplied gate or the rerun at this head.
**Witness:** Both gate runs fail during dependency materialization; direct elaboration also exits 1. `TauCetiRoadmap/PrismaticCohomologyPartII/Suggested.lean` contains zero admitted declarations, so there are no target-generated `sorry` warnings to report.
**Repair:** Until R01 is resolved, write: “Text and dependency checks pass. The targeted build and direct elaboration fail during Lake dependency materialization, before Lean checks the module.” After rerunning successfully, replace this with the actual result and warning count.

## R05 (P3) — The changed Example 1.9(4) citations give the wrong page

**Location:** `TauCetiRoadmap/PrismaticCohomologyPartII/README.md:1874` and `:1886`, “BS22, Example 1.9 (4); p. 5”.
**Claim:** Example 1.9(4), the framed q-de Rham/prismatic comparison, is on printed page 6 of the cited v4, not page 5.
**Witness:** BS22 line 191 marks page 6; line 197 begins part (4), and lines 198–204 give the framing and comparison. Page 5 contains earlier parts of Example 1.9.
**Repair:** In both locator paragraphs replace “BS22, Example 1.9 (4); p. 5” with “BS22, Example 1.9 (4); p. 6”.

## Previous findings

- R01 — repaired: the listed split hats, formula spans and locator part labels are repaired; §3.20 now writes `B̂`, `φ̂:B̂→B` and `Fil^iΔ̂→Δ` within complete spans.
- R02 — repaired: §3.3 distinguishes `ξ=p−[p^♭]`, giving `p−p^p`, from cyclotomic ξ, giving p; both are nonzero in characteristic zero.
- R03 — repaired: §5.11 now cites Layer CR.1, whose crystalline sites and structure sheaves are stated in CrystallineCohomology's head at #857.
- R04 — partly repaired: KY and FF are deleted, and Dependencies name PrismaticCohomology Layers 0–2; the numbered §4.2 import remains under Scope. See R02 above.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result; change |
| --- | --- | --- | --- | --- |
| §3.3 good filtration and generator Check | Perfectoid base; p=2,3; two ξ choices | θφ(p−[p^♭])=−2,−24; θφ(ξ_cycl)=2,3 | Each differs from 0=θ(ξa); φ(e^i a)/d^i=φ(a) | Generator repair separates both choices |
| §3.4 root cover and filtration | B=R perfectoid, empty coordinates | Root cover R; Čech terms R | Δ_R=A; N^i=(φ⁻¹(d)^i) | Formatting preserves the base case |
| §3.9 twist example | Crystalline prism, p=2; n=0,1 | A{0}=A; φ(e)=e/2 | I⁻¹A{1}=(1/2)A·e | Pole and twist retained |
| §3.12 largeness | Ā=F₂; S=F₂ versus F₂[T] | L_(F₂/F₂)=0; Ω¹_(F₂[T]/F₂)=F₂[T]dT | F₂ has compatible roots; T has none in F₂[T] | Positive and negative controls agree |
| §3.13 relative Nygaard | (A,I)=(Z₂,(2)), S=F₂, i=1,2 | N¹=2Z₂; N²=4Z₂; each graded piece F₂ | Divided Frobenius gives Fil_i^conj(F₂){i}=F₂ | Twisted formulation retained |
| §3.14 animated extension | Same base; n=−1,0,1 | N^−1=N⁰=Z₂; N¹=2Z₂ | gr^−1=0; gr⁰=F₂; gr¹=F₂ | Indexing agrees |
| §3.15 graded comparison | R=F₂ over Z₂, i=1 | gr¹_N=2Z₂/4Z₂=F₂ in degree 0 | L_(F₂/Z₂)[−1]=F₂ in degree 0 | Corrected cotangent shift retained |
| §3.17 de Rham comparison | R=A/I=F₂ | Z₂ ⊗ᴸ_Z₂ F₂=F₂ | Ω*_(F₂/F₂)=F₂[0] | Both sides agree |
| §3.18 Frobenius inverse up to I^i | R=F₂, p=2, i=0,1,2 | V_iφ acts by 1,2,4 | φV_i acts by 1,2,4 | Both composite directions agree |
| §3.19 Hodge fibre sequence | R=F₂, n=0,1 | Quotients Z₂/2Z₂=F₂; 2Z₂/2Z₂=0 | Fil_Hdg⁰=F₂; Fil_Hdg¹=0 | Fibre formula agrees |
| §3.20 completion and extended maps | B=Z₂; N^i=2^iZ₂ | lim Z₂/2^i=Z₂; intersection=0; φ₁(6)=3 | Completion map=id; φ̂=id; 6/2=3 | Repaired notation preserves maps |
| §4.2 imported divisor, R02 | (Z,2·) pulled back to F₂ | Kernel over Z=0; kernel after pullback=F₂ | Effective before pullback; not effective afterwards | Mathematics agrees; placement needs repair |
| §4.3 Cartier–Witt conditions | R=F₂, W(R)=Z₂; f=2 versus 4 | δ(2)=−1 is a unit; δ(4)=−6 is not | Both reduce to 0; only f=2 is distinguished | Conditions discriminate |
| §4.4 stack automorphisms | R=F₂[ε]/ε², f=2, u=1+[ε] | 2[ε]=V([ε²])=0; uf=2 | u≠1 stabilizes f=2 | Groupoid information retained |
| §4.5 quotient presentation | Same f,u; arrow f→uf | Source generator 2; target generator 2 | Nonidentity quotient arrow u fixes 2 | Quotient retains stabilizers |
| §4.6 transversal coproduct import | B=0, any bounded A | Coproduct C=0 | Unique cocone into the zero prism | Zero-ring case agrees |
| §4.7 prism points | (Z₂,(2))→F₂; atlas generator 2 | Image of (p,I)=0; f̃(2)=2 in W(F₂) | Cartier–Witt divisor is multiplication by 2 | Chart normalization agrees |
| §4.8 chart flatness | Crystalline Z₂ versus q-prism | (Z₂/2)[2]=F₂; Z₂[ζ₂][2]=0 | First nontransversal; second transversal | Nonflat versus flat chart criterion agrees |
| §4.25 filtered base-change gluing | Identity base change on (Z₂,(2)), level 2 | Z₂ ⊗̂_Z₂ 4Z₂=4Z₂ | N²=4Z₂ | Gluing map is identity |
| §4.28 derived reduction descent | R=F₂, M=Z₂; m=−1,0 | 0; F₂ | Split augmented derived Čech totalizations 0; F₂ | Derived, not discrete, reduction retained |
| §4.30 perfect-prism comparison | R=F₂; twist 0; m=1,2 | Absolute levels 2Z₂,4Z₂ | Relative levels 2Z₂,4Z₂; graded pieces F₂ | Characteristic-p supplier agrees |
| §4.31 divided Frobenius and shift | Crystalline chart p=2; m=n=1; element 6 | Divided map 6↦3; ideal exponent 1−1=0 | Target Z₂; using m+n would require 4Z₂ | Minus shift retained |
| §5.2 q-PD definition | q=1, D=Z₂, I=2Z₂; compare D=F₂ | γ(2)=2; [2]₁=2 regular in Z₂ | Stable ideal in Z₂; regularity fails in F₂ | Torsion condition discriminates |
| §5.3 δ-PD reduction | q=1, D=Z₂, x=2 | γ(x)=x²/2=2; x²/2!=2∈I | Reduction by q−1=0 leaves (Z₂,2Z₂) | PD specialization agrees |
| §5.4 completed reduction | D=Z₂[[q−1]], M=D | M ⊗̂_D D/(q−1)=Z₂ | Constant cosimplicial totalization after reduction=Z₂ | Complete base-change check agrees |
| §5.5 extremal q-PD ideals | q=1, D=Z₂, φ=id | Smallest ideal=0; φ⁻¹(2Z₂)=2Z₂ | γ(2a)=2a²∈2Z₂ | Smallest and largest stay distinct |
| §5.6 cyclotomic pair | p=2; q=r² | ξ=1+r; (r−1)ξ=q−1 | φξ=1+q; θφξ=2 | Both ideal identities agree |
| §5.7 envelope | D=P=Z₂, I=2Z₂, empty added sequence | E=Z₂; K=2Z₂; P/J=F₂ | E/K=F₂; universal extension=id | Complete quotient condition satisfied |
| §5.8 reduction and base change | Same envelope; q=1; identity base change | E ⊗̂_D D=Z₂ | Completed PD envelope=Z₂ | Both comparisons agree |
| §5.11 crystalline comparison | D=Z₂, I=2Z₂, R=F₂, q=1 | qΩ ⊗̂_Z₂ Z₂=Z₂ | RΓ_crys(F₂/Z₂)=Z₂ | CR.1 citation repair resolves |
| §5.13 prismatic comparison | D=Z₂[[q−1]], I=(q−1), R=Z₂ | R¹=Z₂[ζ₂]; Δ_(R¹/D)=D | qΩ_(Z₂/D)=D | Required base twist agrees |
| §5.14 framed data | P=D⟨X⟩, J=(q−1), one coordinate | γ(X)=qX; ∇X=1 | δX=0; γ(X)−X=(q−1)X | Framing operations agree |
| §5.15 extended derivatives | E=P above; X² | γ(X²)−X²=(q²−1)X² | (q−1)X·∇(X²)=(q−1)(1+q)X² | Extension identity agrees |
| §5.16 q-complex and Frobenius | p=2; X and X² | ∇φ(X)=(1+q)X; ∇(X²)=(1+q)X | [2]_q X·φ(∇X)=(1+q)X | Differential/Frobenius formula agrees |
| §5.20 framing independence | Base algebra, three empty frames | All complexes D[0]; all maps id | Two-step composite=id | Cocycle agrees; locator R05 |
| §5.21 framed Z_p model | R=Z₂⟨T⟩; monomial T² | ∇_q(T²)=(1+q)T; at q=1 gives 2T | de Rham differential of T² is 2T dT | Specialization agrees; locator R05 |
| §5.22 labelled families | Two labels with the same unit value, p=2 | Deck group Z₂(1)²; first root action (−x₁,x₂) | Second action (x₁,−x₂); labels remain two | Rephrasing retains independent root towers |
| §5.22 comparison equivariance | Coordinate x_s; Teichmüller root t_s | μ₀γ_s(x_s)=q[t_s] | σ_sμ₀(x_s)=q[t_s] | Comparison intertwines actions |
| §5.24 θ/θ̃ specialization | p=2; x=[2^♭] | θ(x)=2 | θ̃φ(x)=θφ⁻¹φ(x)=2 | Frobenius transport agrees |
| §5.26 coordinate-filtration example | W(F₂) specialization; i=1,2 | Degree (0,1) ideals: (2,1), (4,2) | 2^max(i−degree,0): (2,1), (4,2) | Repaired completion notation agrees |

The rows for untouched statements stand as in the previous review, of `34bf812`.

- Incremental scope: 143 changed lines; 4 previous findings accounted for; 0 changed Lean declarations; 0 outside-folder changes.
- Changed seeded locators: 6 targets checked—§3.12 BS22 line 3853; §3.18 BS22 line 3935; §4.3 BL22 line 1805; §4.28 BL22 line 3892; §5.11 BS22 line 4235; §5.21 BS22 lines 197, 3986, 4290 and 4378; page correction R05.
- Pinned declarations opened: Mathlib `6b7abb3c`, `Mathlib/RingTheory/WittVector/Teichmuller.lean:93`, `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:182`; Tau Ceti `a91d3aa`, `TauCeti/RingTheory/WittVector/Frobenius.lean:43`.
- Supplier passages resolved: PrismaticCohomology §§1.10, 1.21, 1.22; CrystallineCohomology Layer CR.1 and §CR.DDR.5.18; SchemeAndStackFoundations §1.21; the citation inventory reports 0 missing cross-roadmap citations.
- Dependency output: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate with `--build`: all non-build counters 0; `build=2 FAIL`; targeted build and direct elaboration each exit 1 before Lean. Named-signature and one-tactic probes: 0 declarations.

Overlap check: read PrismaticCohomology, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, HabiroCohomologyFoundations, QWittVectors, EnhancedDerivedSheaves and PerfectoidSpaces; perfectoid/prism foundations belong to PerfectoidSpaces, relative cohomology to Part I, enhanced descent to EnhancedDerivedSheaves, local q-PD/Nygaard and AΩ comparison to Part II, syntomic/F-crystals to Part III, logarithmic theory to Part IV, q-Witt theory to QWittVectors and global Habiro gluing to HabiroCohomologyFoundations.

Source independence: changed passages only; 21 target passages compared with 4 sources, with no copied expression or reused source material identified. In standalone locator paragraphs BL22 has the largest share, 92 of 195 source-tag occurrences. No layer was added, removed or reordered; the previous arrangement review is not reopened.

## Not verifiable

- Elaboration at this head: Lake fails during dependency materialization before Lean runs; the earlier successful build does not certify this head.

## Source issues

- **Misprint** in BS22 at Corollary 15.4, printed page 104: the source names R in the de Rham complex for a statement about X; it should name X; affects nothing.
- **Misprint** in BS22 at Corollary 15.5, printed page 104: the source reverses the induced cohomological V_i map; it should run from untwisted cohomology tensored with I^i to Frobenius-pulled-back cohomology; affects a stated result.
- **Misprint** in BS22 at Remark 15.6, printed page 105: the source identifies the cotangent complex with the first Nygaard graded piece without a shift; it should shift the cotangent complex by −1; affects a stated result.
- **Misprint** in BL22 at Remark 3.1.7, printed page 40: the source reverses Witt-vector extension of scalars and its Cartier–Witt functor; it should send WCart(R) to WCart(S) for R→S; affects nothing.
- **Misprint** in BL22 at proof of Proposition 3.2.8, printed page 42: the source uses the atlas self-product and units of B′; it should use the atlas product with Spf(B) and units of the test prism B″; affects the proof.
- **Misprint** in BL22 at proof of Corollary 5.2.8, printed page 122: the source puts the nth cotangent exterior power in shift [n]; it should use [−n]; affects nothing.
- **Misprint** in BL22 at Remark 5.7.8, Proposition 5.7.9 and Remark 5.7.10, printed page 146: the source shifts the target ideal filtration by +n; it should shift by −n, giving exponent zero at filtration degree n; affects a stated result.
- **Misprint** in BS22 at Lemma 16.5 (3), printed page 107: the source omits completeness from the cosimplicial complexes; it should require derived (p,[p]_q)-complete complexes; affects a stated result.
- **Misprint** in BS22 at proof of Theorem 16.14, printed page 112: the source abbreviates the relative cohomology by qΩ_R and qΩ_D; it should use qΩ_(R/D) in both places; affects nothing.
- **Misprint** in BS22 at proof of Theorem 16.18, printed page 113: the source identifies E/J with R for a site object; it should use the supplied map R→E/J; affects the proof.
- **Misprint** in BS22 at Construction 16.20, printed page 115: the source writes the coordinate framing over A; it should write it over D; affects nothing.
- **Misprint** in BMS2 at Definition 5.1, printed page 28: the source defines the descending graded term using F(i)/F(i−1); it should use F(i)/F(i+1); affects a stated result.

## For the human reviewers

- none
