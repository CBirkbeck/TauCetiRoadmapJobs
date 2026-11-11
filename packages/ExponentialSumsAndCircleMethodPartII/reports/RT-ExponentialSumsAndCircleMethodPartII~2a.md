# Red-team review of #2138 ExponentialSumsAndCircleMethodPartII at 08149d5 (pass a (codex))
**Verdict:** changes needed

Read-only review. No Lean command, checkout mutation, or external post was made.

## Earlier findings: verification at this head

| Earlier finding | Status | Repaired passage and witness |
|---\|---\|---|
| Round 1a F01: spreading/comparison cycle | Repaired | `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md:1202`: “No identification of the abutment with mapping cohomology is made in this target.” §10.2 separately proves the finite-field comparison before transport. For (k,d,n)=(3,2,40), j>156 gives i=j−160>−4, D=74; neither computation needs the transported comparison first. |
| Round 1a F02: first-page hypotheses | Repaired | README:546: “Neither n>2ᵏ(k−1), d≥k−1 nor an even order of ℓ modulo p is used”. Conventions and Layers 6–7 agree. At k=3,d=1,n=2,p=5, smooth affine cubic has middle rank 4, and m=1 contributes at a=5 with twist −1. |
| Round 1a F03: nondiscriminating Checks | Repaired | README:842: “at m=d+1 the proposed rank is −n”; §8.4 computes degrees 1+1=2; §10.6 computes −5>−2811 but −5≤−4. These detect the previously identified normalization/range mistakes. |
| Round 1b F01: absent Part I | Not repaired in package; settled naming decision | The title still says “part II”; no base is named. PORT records the fixed job name and the later PRREVIEW~2 accepts retaining it with the maintainer rename recorded in the PR description. This pass does not reopen the authorized naming decision as a mathematical ownership defect. |
| Round 1b F02: duplicated character-sheaf gap | Partly repaired; S01 remains in plan | README:57–59 now consumes FourierDeligneTransform §§2.2–2.5; §3.4a owns only the equivariant cancellation application. The obsolete gap is absent from this README. Supplier and plan verification follows below. |
| Round 1b F03: unowned Fourier transform | Partly repaired; S01 remains in plan | README §5.8 now explicitly uses FourierDeligneTransform §§2.8,5.3 and derives the one-variable application. No generic transform is rebuilt locally. |
| Round 1b F04: missing orthogonal dimension four | Repaired | README:819 includes “𝔰𝔬₄≅𝔰𝔭₂×𝔰𝔭₂”. The primitive formula gives 6 for (3,3), 21 for (4,3), so the exceptional rank 4 is excluded from the actual application. |

The named repair-note file `reports/.md` was absent; the available PORT and PRREVIEW reports supply the repair history. Same-round independent pass b has not been used to generate findings.

## S01 (P2) — Retire the ten supplier gaps replaced by the port

**Location:** `packages/ExponentialSumsAndCircleMethodPartII/design/plan.json:4932`, :4938, :4950–4997; for example the `symmetric-lattice-shrinking` entry still requests “prove N_(γ,a,c)≤Q^(ns+n max(⌊(a−c)/2⌋,0)) N_(γ,a−s,c+s)”.

**Claim:** These are still outstanding supplier requests in the intake's top-level `gaps` list. The current README contains only `sf-fibre-strata` and `lpv-universal-monodromy` contracts.

**Witness:** README §1.5 now owns the identical shrinking inequality; FourierDeligneTransform §§2.2–2.5, EtaleDualityAndPerverseSheaves §0.4 and AlgebraicTopologyPartII §§2.1,3.5,4.1–4.2,5.1,5.4 supply eight other requests. README §5.8 derives the remaining one-variable application.

**Exact repair:** In the top-level `gaps` array retain only `sf-fibre-strata` and `lpv-universal-monodromy`, unchanged. Delete entries with slugs `ecf-character-fourier`, `edc-top-components`, `ecf-one-variable-fourier`, `symmetric-lattice-shrinking`, `at2-arrangement-cohomology`, `at2-stable-diagonal`, `at2-tame-polynomial`, `at2-tame-bouquet`, `at2-double-loop-betti`, and `at2-fermat-loop-connectivity`. Change no other plan fields.

**Retest:** The README and plan then both have exactly two live contracts. For γ=0,q=5,n=a=c=s=1, the local §1.5 gives 5≤5·1 without asking a second owner to supply it.

The earlier PRREVIEW~1 “Declared gaps” paragraph noticed these ten stale entries but dismissed them as moot. That does not meet this brief's requirement to check the list read by intake: it expressly classifies a gap asking for an already supplied result as P2. The character-sheaf part is the unrepaired plan half of round 1b F02; its README repair is valid.

## S02 (P3) — Padé Checks still do not test the recurrence or uniqueness

**Location:** `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md:476–477,489–490`: “Actual denominator degree can be smaller than m”; “Uniqueness is asserted on the exact rank stratum and only in the stated m-range.”

**Claim:** These are Checks of §§4.4–4.5. They give neither an instance nor an expected value; changing the approximation exponent or deleting reduction leaves them unchanged.

**Witness:** L=3,m=1,b=(0,0,1) has Hankel rank 1, reduced pair (0,1), error T⁻³ and m′=0. The advertised exponent is −3; replacing it by −4 incorrectly rejects this exact-stratum point.

**Exact repair:** Replace §§4.4–4.5's Check lists with the following shared concrete tests (or put the list in §4.4 and explicitly refer to it from §4.5):

- “For L=3,m=1 over ℚ, b=(1,2,4) has H₁=[[1,2],[2,4]], rank 1; its unique reduced pair is (1,T−2), since 1/(T−2)=T⁻¹+2T⁻²+4T⁻³+O(T⁻⁴). The pair (2,2T−4) represents the same fraction but fails monicity.”
- “For L=3,m=1,b=(0,0,1), H₁=[[0,0],[0,1]] has rank 1. The reduced pair is (0,1), m′=0, and the error has exponent −3=−L−1+m−m′ with nonzero coefficient 1.”
- “For L=3,m=1,b=(0,1,0), H₁=[[0,1],[1,0]] has determinant −1 and rank 2. Denominator degree zero cannot absorb the T⁻² term; a monic linear denominator with numerator c would require b₁=c=0 and b₂=ca=1, impossible.”

**Retest:** The three ranks are 1,1,2; the error exponents are at most −4, exactly −3, and inadmissible respectively. These distinguish the actual-degree correction, the converse, and the normalization. Keep these in the README, not `Suggested.lean`.

## S03 (P3) — Several remaining Checks are instructions or repeat the claim

**Location:** `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md:328,700,1168,1694–1695,1707–1709`: “Use compact-support cohomology on the algebraic side”; “The result is not asserted for m>d.”

**Claim:** These bullets test the component bound, affine rank, remainder, trace obstruction and conditional degeneration. They supply no discriminating instance. The round-one repair replaced three such bullets but left these others.

**Witness:** On A¹, H_c²=Q(−1) while H²=0. Replacing compact support by ordinary cohomology changes this value; the instruction at line1707 never computes it.

**Exact repair:**

- Replace §3.2's first Check with: “At n=40,k=3,d=2 there are 80 coefficient variables and six equations, so every component has dimension at least74. An additional isolated component would have dimension0<74 and is forbidden.”
- Replace §5.11's second Check with: “At m=d the quotient affine rank n(d−m) is0; at m=d+1 it would be−n, so no affine-space factor with that rank exists.”
- Delete §9.4's first Check, “Keep the remainder term 4(r+1)”; its next Check already computes 192 versus188 and tests precisely this issue.
- Replace §13.2's two Checks with: “For k=3,n=40,d=2, t=1, δ=3, D=74 and tδ=3>2=k−1.” and “j=1 satisfies 0≤1<8 and i=−1>−4; its factors have dimensions0 and at least1, so the pairing cannot be perfect.”
- Replace §13.3's three Checks with: “For A¹, H_c²=Q(−1) but H²=0; dropping compact supports changes the trace line.”; “The cubic Fermat fibre in three variables is a bouquet of eight S², so π₀Ω²X=ℤ⁸; in four variables it is a bouquet of sixteen S³ and π₀Ω²X=0.”; “For n=40,d=2, the stable configuration diagonal has dimensions1 and0 at j=0 and1, respectively, matching the connected double-loop space's rational Betti numbers1 and0.”

**Retest:** These tests give 74 versus0, rank0 versus−n, 192 versus188, a zero/nonzero pairing, and infinite versus one loop-space component. They distinguish the intended hypotheses and conventions. No Lean additions are requested.

## Earlier PR-review findings: verification at this head

| Earlier finding | Status | Repaired passage and witness |
|---\|---\|---|
| PRREVIEW~1 R01: missing topology headline | Repaired | Suggested.lean:217 now states `compactOpen_germ_obstruction`. Its first conjunct supplies a point and a surjection π₁→ℤ; its second excludes a homotopy equivalence. The escaping loop has winding −1, whereas π₁Ω²X=π₃X=0 for the forty-variable Fermat fibre. |
| PRREVIEW~1 R02: Part II without Part I | Settled outside package | Same naming disposition as round 1b F01 above; no mathematical base is silently assumed in the dependency graph. |
| PRREVIEW~1 R03: ceiling locator | Repaired | README:453 says “the printed floor ⌊kd/2⌋ has to be replaced by the ceiling”. BS20 line 1845 prints the floor. L=9 gives rank(H₄)=5 and a full H₅ stage. |
| PRREVIEW~1 R04: unrecorded Stacks chapter | Repaired | README:860 cites “Homology, §12.24 (012K), Lemma 12.24.13 (0BK5)”; sources.toml now records the Homology extraction as the additional text under the same STACKS key. Its finite-filtration convergence applies to the localization filtration. |
| PRREVIEW~1 R05: headings | Repaired | README:1546 now names “The compact-open germ space is not homotopy equivalent to Ω²X”; §§10.3 and 13.2 likewise name their mathematics. The finite/sharp-range distinction is preserved: for (3,2,40), the cutoffs are −4 and −8. |

## Verified sound

Read all 1728 README lines and all 225 Suggested.lean lines. The inventory has **94 numbered targets**, **16 Lean declarations (13 definitions/abbreviations and 3 theorems)**, and **266 Check bullets**. All 266 bullets were inspected; the computed tests below cover each of the 94 targets and each declaration, rather than counting nonnumerical reminders as successful tests. S02 and S03 record the remaining concrete test defects. No new false headline or padding theorem was found.

The three Lean headlines are §§8.9, 10.8 and 11.12. The additional deep results identified in the module docstring are §§0.2, 1.1, 3.6, 5.14, 6.5–6.6, 7.2–7.5, 8.6, 9.4, 10.2, 12.5, 13.2–13.3. Their unavailable geometric cumulative-degree, constructible/six-operation, compact-cohomology and collar-comparison carriers are named there. No weaker surrogate is substituted. The simple coefficient and germ definitions support exactly the three retained theorems. None of these three closes by unfolding or one pinned theorem: each needs respectively the polar/lattice estimate, the geometric cohomology argument, or end winding and the Fermat homotopy calculation.

The supplied `scratch/signatures.md` contains the elaborated types of all 16 declarations. I compared those types with the source and README. There is no section-variable block, no silently lost field/finite/algebraically-closed instance, and no implicit finiteness claim for `polarCount` outside its finite-field theorem. I did **not** run a new `#check` or Lean elaboration: the explicit read-only/no-Lean instruction controls this pass. There are three `sorry` theorem proofs, no sorry-defined data, no `set_option`, no `lemma`, and no non-Mathlib import. Natural subtraction in the headline exponents is nonnegative under their hypotheses; n>2^k(k−1) implies n>k in the dimension statement.

### Lean declaration/context ledger

In this table, `K:*` means an arbitrary `Type*`, with no universe restriction; all displayed instances are declaration binders. The declaration namespace is `TauCetiRoadmap.ExponentialSumsAndCircleMethodPartII`. “Retain” means the computed controls did not refute the declaration; it does not claim a formal proof.

| Declaration / README section | Variables and instances actually retained | Computed positive and negative/boundary controls | Result / change |
|---\|---\|---\|---|
| mappingPolynomial / 3.1 | K:* [Field K], n,d:ℕ, x:Fin n→K, j:Fin n | d=2 gives x_jT²+a₁jT+a₀j; d=0 gives x_j; x_j=0 removes only that leading coefficient | Retain |
| mappingEquation / 3.1 | K:* [Field K], n,d,f,x | f=0 gives 0; f=1 gives 1; f=Y_j gives the preceding coordinate polynomial | Retain |
| mappingIdeal / 3.1 | K:* [Field K], n,d,f,x | f=0 gives (0); f=1 gives (1); d=0 gives ideal generated by f(x). A leading nonzero coefficient makes (1), so it is not discarded | Retain |
| residuePhase / 3.4 | K:* [Field K], n,k,d,f,x,b,a | d=1,k=3,f=Y₁³−Y₂³+1,x=(1,1): b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c). At a=c=0 value b₁; b=0 or kd=0 gives 0 | Retain; zero-based r is README r+1 |
| hankelMatrix / 4.1 | K:* only; L,m:ℕ, b:Fin L→K | L=3,m=1,b=(1,2,4) gives [[1,2],[2,4]]; L=9,m=4,b₅=1 gives 5×5 anti-identity; m≥L gives zero rows | Retain; no field needed for construction |
| polarCount / 8.8 | K:* [Field K], n,k,d,f,x,b | Over F₅, n=1,k=3,d=2,b₄=1 gives 225; b=0 gives 625. k=1 counts the single empty increment tuple iff phase is constant; zero-dimensional coefficient space gives 1 | Retain; Nat.card on infinite carriers is not used as a finite point count |
| minor_arc_polar_count / 8.9 | K:* [Field K] [Finite K]; n,k,d,m,f,x,b; hk,hd,hchar,hdegree,hinfty over AlgebraicClosure K,hm,hupper,hrank | F₅,n=1,k=3,d=m=2,f=Y³: all 15000 rank>2 vectors among 15625 frequencies satisfy count≤250; maximum 225. b=0 gives 625>250 but rank=0. In F₃ the analogous scalar count is 81>54, but 3<ringChar fails | Retain; characteristic and rank hypotheses discriminate |
| mapping_geometrically_irreducible / 10.8 | K:* [Field K] [IsAlgClosed K]; n,k,d,f,x; all ten geometric/numerical hypotheses explicit | Fermat k=3,n=40,d=2: tδ=3>2,D=74. n=32 gives tδ=2, excluded strictly. f=1 or x=0 cannot satisfy hypotheses. Prime radical excludes the empty quotient; nonreduced ideals are allowed | Retain; signed and natural dimension both 74 |
| finitePoint / 11.1 | T:ℂ | T=0 gives [0:1], T=1 gives [1:1]; second coordinate 1 ensures nonzero vector | Retain |
| pointNearInfinity / 11.1 | z:ℂ | z=0 gives [1:0]; z=2 gives [1:2]=[1/2:1]; first coordinate 1 ensures nonzero vector | Retain |
| PrescribedGerm / 11.1 | n,d:ℕ,Y⊂Pⁿ(ℂ),x:Fin n→ℂ,F:C(P¹,Y) | At d=2,x₁=1, w₀=z² accepted; 2z²−z²=z² is not O(z³), and z³−z² is not O(z³). A lift rescaling must be 1+O(z), so it cannot repair either. d=0 has limit [1:x], not boundary [0:x], and is unused by the headline | Retain; continuity and x≠0,d≥1 supply the stated infinity value in the intended instance |
| Hco / 11.2 | n,d,Y,x as above; subtype topology | Reference map belongs; escaping loop has pointwise phase 1 on a tail but deviation 2 at its moving parameter. Ambient projective continuity still holds | Retain; uniform-germ topology would reject this family |
| fermatCubic / 11.6 | No parameters | (1,0,…)=point because sum=1; 0 fails because sum=0; (T²,ζT²,1,…) has sum=T⁶−T⁶+1=1 | Retain |
| fermatCubicClosure / 11.6 | No parameters; projective representative | [1:1:0:…] gives 1=1; [0:1:ζ:…] gives 0=0 iff ζ³=−1. Scaling representative by λ multiplies both sides by λ³ | Retain; representative-independent |
| fermatLeadingVector / 11.6 | ζ:ℂ | Coordinates 0 and 1 are 1,ζ, all others 0; vector never zero; leading cubic value 1+ζ³, zero for ζ³=−1 and 2 for ζ=1 | Retain |
| compactOpen_germ_obstruction / 11.12 | ζ,hζ:ζ³=−1,x₀:fermatCubic | End winding of reference/escaping/double escaping loop is 0/−1/−2, hence onto ℤ; π₁Ω²X=π₃X=0 for every x₀. ζ=1 puts the limiting point outside closure, so nonempty germ space would fail | Retain; first conjunct rules out empty-space vacuity |

### README target ledger

Every row refers to `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md`, by its stable target number. Nonapplicable generic stress cases are not counted as tests: q=1 and the zero ring are not finite fields; projective zero vectors are explicitly excluded; inseparability is retained in the geometric dimension inputs but excluded when a smoothness/Jacobian hypothesis requires it. Empty products and schemes, p=2,3, nonreduced schemes, boundary indices and convention changes are tested where they actually enter the signature.

| Target | Instances and computed values | Result / change |
|---\|---\|---|
| 0.1 Affine intersections | Two coordinate planes in A³ intersect in a line: 1=2+2−3. The cone uv=0 intersected with diagonal u=v has dimension 0=1+1−2. Disjoint parallel lines have empty intersection and supply no component | Retain |
| 0.2 Finite Cartesian grid | S={0,1}: a line plus a disjoint grid point has 3 points≤2+1≤2·2. A reduced double point has one point and reduced degree 1. Parabola y=x² cut by y=0 has reduced affine section degree 1<2 | Retain; cumulative, not top-dimensional, degree matters |
| 0.3 Fibre strata | xy=0→A¹_x: on x≠0 fibre dimension 0 and preimage dimension 1=1+0; over x=0 fibre dimension 1 and preimage dimension 1=0+1. Outside image fibre dimension −∞ | Retain conditional on declared gap |
| 1.1 Polynomial box | F₂[T],h=2 has four polynomials; two free coordinates give 16=2^(2·2). h=0 contains only 0. A zero-dimensional reduced point has count≤degree | Retain |
| 1.2 Lattice adjoint | Identity basis has dual identity; rank-one basis T has dual T⁻¹ and dot product 1. Rank zero has one vector and empty determinant 1 | Retain |
| 1.3 Orthogonal minima/count | Λ=diag(T⁻²,T)O², threshold q¹: factors q³ and 1, count q³. Basis (1,T),(0,1) has norms q,1 but standard lattice minima 1,1, so arbitrary basis norms fail. Rank zero count=empty product=1 | Retain |
| 1.4 Adjoint minima | Minima (q⁻²,q) become (q⁻¹,q²); reversed products are both 1. Unreversed first product q⁻³≠1 | Retain |
| 1.5 Symmetric shrinking | γ=0,q=5,n=a=c=s=1: N=5,N'=1,bound=5. γ=T⁻²,a=4,c=s=1: counts q³ and q, ratio q² equals factor q². γ=T⁻¹,a=c=1: strict norm condition leaves only 0; non-strict would admit q vectors | Retain; S01 removes duplicate request |
| 2.1 Coefficient prime | p=5,ℓ=19: order 2 even; bound B=20 can use ℓ=29, again order 2. p=2 has trivial multiplicative group/order 1 and is excluded | Retain |
| 2.2 Residue prime | ℓ=2,p=13: order 12; ℓ=3,p=5: order 4; excluding 5 permits p=17, order 16 (3⁸=−1 mod17) | Retain |
| 3.1 Mapping scheme | d=2,x=(1,0): tuple (T²+aT+b,cT+e). f=0 gives all coefficients, f=1 gives empty scheme. A zero-ring test algebra has one tuple; square-zero ε satisfies ε²=0 and is retained by coefficient equations | Retain; entire coefficient ideal required |
| 3.2 Dimension lower bound | n=40,d=2,k=3 gives 80 variables and 6 equations, every component dimension≥74 | Retain |
| 3.3 Projective closure | Smooth plane cubic meets infinity in three simple points; its closure is a smooth irreducible curve. Parallel affine lines have leading form with a repeated factor and fail smooth boundary. Characteristic 3 Fermat cubic has zero gradient and is excluded | Retain |
| 3.4 Residue | f=Y₁³−Y₂³+1,d=1,x=(1,1): b₁(a³−c³+1)+3b₂(a²−c²)+3b₃(a−c); a=c=0 gives b₁, so the constant coefficient is not lost | Retain |
| 3.4a Additive cancellation | Nonzero linear phase on A¹ has total complex 0; constant phase has H_c²=E(−1). For translation phase t·v, noninvertible t=0 leaves that degree-2 line, so invertibility cannot be dropped | Retain |
| 3.5 Exponential complex | b=0,n=2,d=1 gives E[−4](−2), trace q²; a nonzero linear phase gives 0 | Retain |
| 3.6 Fourier orthogonality | Zero coefficient map A^N→A^L: both sides after the prescribed shift have E[−2N](−N). A constant nonzero coefficient gives empty zero fibre and zero Fourier integral | Retain |
| 4.1 Rank arcs | L=3,m=0 forces all b=0; L=9,m=4,b₅=1 gives rank5>4; m=L has no rows and full locus | Retain |
| 4.2 Nesting | (1,2,4): rankH₀=1>0,rankH₁=1≤1; zero vector lies in both. A₋₁ has no point | Retain |
| 4.3 Full range | L=9: H₄ anti-identity has determinant +1, rank5; H₅ has four rows≤5. L=0 gives a single zero-dimensional point | Retain; repaired source attribution |
| 4.4 Padé equivalence | L=3,m=1: (1,2,4) has reduced (1,T−2), error≤T⁻⁴; (0,0,1) has (0,1), error exactly T⁻³; (0,1,0) has rank2 and no allowed pair | Mathematics retained; S02 replaces Checks |
| 4.5 Reduced uniqueness | Same three examples; scaling (1,T−2) to (2,2T−4) preserves fraction but destroys monicity; (0,1) has actual degree0<1 and nonzero leading error coefficient1 | Mathematics retained; S02 |
| 4.6 Good arc | m=0 pair(0,1); m=1 pair(c,T−a), c≠0, gives b_r=ca^(r−1). (T−a,(T−a)(T−b)) cancels and has denominator degree1 rather than2 | Retain |
| 4.7 Pair chart/dimension | m=1 open parameters (a,c), c≠0, give dimension2; lower denominator boundary L=3 consists (0,0,b₃), dimension1≤2. m=0 dimension0 | Retain |
| 5.1 Lower denominator cancellation | k=3,d=m=1,b=(0,0,1),f=Y₁³−Y₂³+1 gives phase3(a−c), so total complex0 when p>3. Exact denominator case m'=m does not have this cancellation | Retain |
| 5.2 Remainder fibration | Divide xT²+a₁T+a₀ by T−b: quotient xT+(a₁+xb), remainder xb²+a₁b+a₀. Free quotient rank n(d−m); at m=d it is0 | Retain |
| 5.3 Residue-class complex | h₂=T−a gives phase h f(r), h≠0. At m=0 numerator0/denominator1 and empty residue coordinates give E | Retain |
| 5.4 Shift/twist | One free affine coefficient gives E[−2](−1), trace q; zero free coefficients give E and trace1 | Retain |
| 5.5 CRT | Denominators T,T−1, numerators1,1: combined numerator2T−1, and (2T−1)/(T(T−1))=1/T+1/(T−1). Equal denominators have resultant0 and are excluded | Retain |
| 5.6 Repeated denominator | At (T−a)² the gradient branch gives a nonzero linear translation character. For Fermat critical point0 off X, f(0)=−1, the numerator phase is −λ and its affine integral is0 | Retain; both branches needed |
| 5.7 Trace fibre | X=A^r: degree2r trace E(−r)→E(−r) is identity, fibre0. Two copies: trace(a,b)=a+b, fibre retains rank1 in degree2r | Retain |
| 5.8 One parameter | g=a gives zero for every h≠0; g=0 gives nonzero H_c⁴=E(−2); g=a^p−a at h=1 gives H_c²=E(−1). g=a² gives rank-one nonconstant quadratic-character transform, whose total compact cohomology on G_m vanishes | Retain; strict degree condition discriminates |
| 5.9 Linear denominator | Cubic Fermat in A³ has middle rank8 in degree2, hence fibre rank8 in degree4 with outer twist−1. T and T−1 give identical fibres after translation | Retain |
| 5.10 Configuration descent | m=0 gives E; m=1 has trivial permutation group. m=2,ℓ=2 averaging coefficient1/2 exists in Q₂, unlike F₂ | Retain |
| 5.11 Stratum complex | m=0 gives E[−2nd](−nd). m=d removes the quotient factor but keeps outer [−2d](−d) | Retain |
| 5.12 Middle concentration | Smooth affine plane cubic: genus1 and 3 boundary points give dimH_c¹=2+3−1=4, dimH_c²=1, H_c⁰=0; trace fibre has only degree1 | Retain |
| 5.13 Signed tensor | dimV=2: W₀=E,dimW₁=2; m=2 gives dim1 for n even (exterior), dim3 for n odd (symmetric). Omitting sign exchanges these values | Retain |
| 5.14 Stratum cohomology | m=0 requires a=2nd; n=2,d=m=1,a=5 gives configuration degree5+1−4=2 and twist−1 | Retain |
| 6.1 Universal pairs | Fermat vector(1,ζ,0,…) has leading value1+ζ^k=0; zero vector excluded. Multiplying vector by2 gives a different marked vector, despite same projective point | Retain |
| 6.2 Universal support | Plane cubic example has ranks4,1 in degrees1,2 and zero elsewhere; these match n−1 and2(n−1) | Retain |
| 6.3 Primitive extension | Split cubic surface over F₂₅ has count801; primitive trace=801−1−25−625=150=6·25. Cubic affine threefold middle rank16 splits into boundary rank6 and projective rank10 | Retain; twist must retain weight2 boundary |
| 6.4 Fundamental-group pullback | n=2 boundary of binary cubic is three points, punctured cone three disjoint G_m; n=3 smooth plane cubic boundary is connected. Thus low-dimensional fibre connectedness cannot be assumed | Retain at stated n≥3 |
| 6.5 Minus-one monodromy | Primitive ranks at (k,N)=(3,3),(4,3) are6,21. Exceptional orthogonal ranks3,4,5 do not occur. Jordan matrix [[−1,1],[0,−1]] has only eigenvalue−1 but square [[1,−2],[0,1]]≠I | Retain; no claim the extension acts by scalar−I |
| 6.6 Relative formula | m=d gives quotient rank0; m=d+1 gives −n, outside domain. Base-point fibre recovers §5.14 | Retain |
| 7.1 Localization filtration | Closed point in A¹: boundary H_c⁰(point)=E→H_c¹(G_m)=E is an isomorphism, d₁ has total degree+1; remaining H_c²=E(−1) is ambient A¹ cohomology | Retain; signs/index not a zero-differential assertion |
| 7.2 Unshifted page | Zero column sole degree2nd. n=2,d=m=1,s=4 gives total5 and configuration degree2 | Retain |
| 7.3 Relative page | Pullback to one base point gives preceding degrees; m=0 local system rank1 with trivial geometric monodromy | Retain |
| 7.4 Odd differentials | k=3,n=5,d=1,p=7,ℓ=2: ord₇(2)=3 odd, yet column parities force odd-r maps0. Even r has equal parity and is not forced0 | Retain; coefficient-conjugation condition is not leaked here |
| 7.5 Normalized page | n=40,d=2,k=3,D=74: zero column total0, twist−74. m=1 configuration degree s+40 and total degree1+s | Retain |
| 8.1 Difference locus | k=1 constant gives point dim0; nonconstant linear gives empty dim−∞. G=a₁²,k=2,p≠2 gives y₁=0,dimN−1; same G,k=3 gives all pairs,dim2N | Retain; fixed order essential |
| 8.2 Cohomological degree | Constant on A^N has degree2N; nonzero linear phase has −∞; H^p−H has2N despite nonconstancy | Retain |
| 8.3 Sign conjugation | p=5,ℓ=2: 2²=−1 gives inversion; p=7,ℓ=2: subgroup{1,2,4} lacks−1, so excluded | Retain |
| 8.4 Tensor/difference | Quadratic over F₅: cd(a²)=cd(−a²)=1; sum degree2. Difference −2ay−y² is a nondegenerate two-variable quadratic and also has degree2. An acyclic factor gives −∞ on both sides | Retain |
| 8.5 Closed-point detection | SpecF_(q²) has no F_q points, two F_(q²) points; looking only at rational points misses nonempty support | Retain |
| 8.6 Weyl bound | Constant has cd2N and full difference dimension; quadratic with k=2,N=1 gives dd0 and bound1=cd; treating it with k=3 gives dd2 and bound2≥cd1 | Retain |
| 8.7 Polar forms | Scalar cubic has Ψ(u,v)=6uv, diagonal6u²=2!·3u²; zero locus two axes, dim1,cumulative degree2. In characteristic3, Ψ=0 and dimension jumps to2 | Retain; p>k essential |
| 8.8 Shrinking count | α=0 gives Q^(dn(k−1)). Scalar cubic d=2,α=T⁻⁴ gives N=Q²(2Q−1); after s=1 count=2Q−1, ratioQ² | Retain |
| 8.9 Uniform polar bound | Exhaustive F₅ scalar cubic d=m=2: 15625 frequency vectors, 15000 outside A₂; maximum225≤2·5³=250. Zero frequency has625 and fails rank exclusion | Retain |
| 8.10 Count to dimension | A^e over F_(q^r) has q^(re), exponent e. SpecF_(q²) alternates0,2 and cannot obey a negative-exponent bound for all r. Double point counts1 and has dimension0; empty counts0 and dimension−∞ | Retain |
| 9.1 Differencing dimension | Scalar cubic example has union of two linear branches dimension3=4−1, agreeing with dn(k−1)−n⌊m/(k−1)⌋ | Retain |
| 9.2 Stalk support | Same k=3,n=1,d=m=2 bound is4−1/2=3.5, so integer degree4 vanishes. Full Hankel stage leaves empty complement | Retain |
| 9.3 Minor strata | L=9,d=3 uses m=3,4 before A₅ is full; stopping at floor(9/2)−1=3 misses m=4. L=12,d=4 uses4,5 before A₆ full | Retain |
| 9.4 Conservative vanishing | k=3,d=4,n=24,t=2,δ=1: stratum m=5 has remainder1 and bound192; conservative cutoff192, printed sharp cutoff188. Degree190 is not established | Retain |
| 9.5 Sharp proposition | Same parameters: a=188 excluded,190 included only with hypothesis; conservative statement begins a>192 | Retain as explicit unproved proposition |
| 10.1 Spreading | k3,d2,n40: finite j>156 corresponds to i>−4 without identifying abutments first. y⁵−y in char5 has derivative−1; in char0 derivative5y⁴−1 has four roots, so an Artin–Schreier cover is not transported to char0 | Retain; transport abstract finite diagram instead |
| 10.2 Conservative comparison | tδ=3,k3 gives cutoff−4; i=0,−1 included, i=−4 excluded; D74 gives H_c^148 and H_c^147 | Retain |
| 10.3 Conditional sharp comparison | Same data: sharp cutoff−8, conservative−4; i=−6 requires SharpMinorArcBound | Retain |
| 10.4 Support region | n40,m1 has s=−38,total−37; m2 has s=−77,−76,total−75,−74; zero column only total0 | Retain |
| 10.5 Vanishing bands | n40,d2,i=−1 lies in no support interval, so H_c^147=0; total0 has dimension1 | Retain |
| 10.6 Near-top degeneration | n40 threshold1−2·38·37=−2811; i=−5 is above it but below conservative comparison cutoff−4, so only major-arc abutment is identified there | Retain |
| 10.7 Component criterion | Line plus isolated point has rank1 H_c² but an extra dimension0 component; violates every-component≥D=1. A double line has one component,dim1 and rank1 H_c² despite nilpotents | Retain; no reducedness conclusion |
| 10.8 Irreducibility | k3,n40,d2:80 variables minus6 equations=74, tδ3>2. n32 gives equality2=2 and is excluded. n0,1,2 fail numerical range | Retain |
| 10.9 Small degree | k3,n3,d1 gives D0; f=Y₁²Y₂+Y₂³+Y₃³+1 has g₂=0,g₃³=−1,g₁=T+a, a one-dimensional family, matching lower bound D−d+k−1=1 | Retain; example outside irreducibility range |
| 10.10 Degeneration proposition | n40,d2,i0: only m0 term, dimension1. m>d≥2 has lowest possible negative total at most−m(n−3)≤−111, outside conjectural i>−8. Odd differential vanishing alone leaves d₂ possible | Retain as conjecture |
| 11.1 Prescribed germ | Reference lift has coordinates1,ζ,z^d and homogenizing z^d; at d2 errors0. Normal2z² gives errorz², notO(z³); normalz³ gives error−z²+z³, notO(z³) | Retain |
| 11.2 Compact-open topology | Fixed loop parameter gives phase1 eventually; moving s=3r/2 gives phase−1 and normalized deviation2. Projective distance nevertheless tends0 uniformly | Retain |
| 11.3 Polynomial inclusion | Coefficients bounded by C give normalized lower-coefficient errorO(C\|z\|); leading-vector loss x=0 changes degree and is excluded | Retain |
| 11.4 Shrinking phase | r=1/4, s=0,3/8,1 gives lifted phases0,1/2,1 and circle values1,−1,1 | Retain |
| 11.5 Nonuniform germ | For fixed s>0 choose r<s/2: phase1. For every r>0 choose s=3r/2: phase−1. Sup deviation is2, never tending0 | Retain |
| 11.6 Fermat reference | (T^d,ζT^d,1,0,…): sum of k-th powers T^(dk)−T^(dk)+1=1. Removing third coordinate leaves0≠1 | Retain |
| 11.7 Escaping loop | a_s=σ_sT^d has magnitude\|T\|^d; after division by a_s, tail coordinates(1,ζ,1/a_s,…) converge uniformly to boundary point; each individual map has exact reference germ eventually | Retain |
| 11.8 Common chart | Reference leading coordinate1 bounds that projective chart away from0 for compact parameter family on a tail. Its normal coordinate1/a_s remains nonzero although normalized ratioσ_s⁻¹ takes−1 | Retain; chart control is weaker than normalized-germ control |
| 11.9 End winding | Constant0; escape−1 because inverse phase; concatenation of two escapes−2; escape followed by reverse0 | Retain |
| 11.10 Independence | Two radii above common R₀ joined radially without zero, winding difference0. A disc of loops would force boundary winding0, excluding the escape loop of value−1 | Retain |
| 11.11 Infinite-order loop | Image of its r-th power is−r, so powers with r≠0 are nontrivial and image equals ℤ | Retain |
| 11.12 Homotopy obstruction | Fermat fibre is bouquet of2⁴⁰ spheres S³⁹; π₂=π₃=0, giving connected simply-connected Ω²X, while π₁(Hco) has quotientℤ | Retain |
| 12.1 Weighted collars | u=az,w=1+bz has seminorms‖a‖,\|b\|. w=1.1 gives0.1/\|z\|→∞ despite half-disc membership; w=−1 has deviation2>1/2 | Retain |
| 12.2 Straightening | t0 original; t1,χ1 gives(0,1); χ0 leaves original. Bracket norm>1/2 because deviation<1/2. Nonstandard transition annulus may move | Retain; not claimed a deformation retraction fixing every inner-standard map |
| 12.3 Extension space | X=point gives point on both sides. Constant loop in S² gives π₀Ext=π₂S²=ℤ=π₀Ω²S². Degree1 loop in S¹ has no extension, so fails chosen-extension hypothesis | Retain |
| 12.4 StrongGermData | Bounded \|b\|≤B permits ε<1/(2B), and bounded a,b give bounded seminorms. Escaping family has deviation2 at all tail scales, hence cannot be compact-continuous in this topology | Retain as supplied data, not an existence theorem |
| 12.5 Conditional comparison | X=point has Ext=Ω²X=point; supplied H≃Ext composes with §12.3. Fermat Hco has nonzero π₁ whereas Ω²X has0, so cannot supply these data | Retain conditional; no inference that the data exist |
| 13.1 Trace conjecture | Fermat D74,tδ3: j0 pairing of trace lines has dimension1×1; j8 excluded; j1 has algebraic factor0 and compact-open factor nonzero | Retain as topology-dependent conjecture |
| 13.2 Compact-open failure | j1<8 and i−1>−4: H_c^147=0 while winding gives H¹(Hco,Q)≠0; zero×nonzero pairing is not perfect | Retain |
| 13.3 Conditional degeneration | Same example j<8≤d(n−3)=74. At j0 diagonal and abutment dimensions1; at j1 stronger Ω² model has H¹=0 and configuration sum0. Compact-open H¹≠0 cannot be substituted | Retain conditional |

### Suppliers, ownership and direction

Checked the **12 distinct roadmap owner/reference groups** below against main or the supplied/current open-head text, including their coefficient, finiteness and dimension restrictions. Repeated citations to the same section are counted once in this number. The two surviving declared gaps have named earlier suppliers, precise application hypotheses in §§0.3 and 6.5, and matching slugs in the plan. They remain assumptions on future supplier work, not missing-input findings.

| Owner and checked location | Contract comparison / ownership witness |
|---\|---|
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§0.7–0.9 (lines 923,967,1026), §5.12 (7745) | Dimension, approximation and projective Bézout are present. The finite locally closed fibre stratification adapter uses the declared extension. Affine reduced section degree is bounded, not equated to the original projective degree. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, F.0–F.6, particularly F.2.4:592 and F.4.5:1041 | Separated finite-type compact supports, finite-E realization and finite diagrams supply the intended carriers. The package does not infer finite-E coefficients from finite torsion without realization. |
| `TauCetiRoadmap/FourierDeligneTransform/README.md`, §§2.2:246,2.4:272,2.5:283,2.8:333,3.4:397,5.3:541 | Character tensor/base-change laws, nontrivial-line acyclicity, degree-e rank e−1, vector-bundle inversion and naive Fourier sheaves are supplied. Rank-one phase conventions agree on geometric Frobenius trace ψ(Tr x). The package owns its equivariant application and one-variable deduction, not a second transform. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md`, §0.4 top-degree target (near line629), §0.6, §§3.2–3.8,4.1,4.3,4.6–4.7 | Top components allow singular and nonreduced schemes; rational realization supplies E. Smooth duality is not applied to the whole potentially singular mapping scheme. The primitive rank and boundary term retain their different weights. |
| `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`, IG.5.1,IG.5.7,IG.0.T4 | Ordered roots use a free permutation torsor even in characteristic dividing m!, and m=0 gives a point. Full-monodromy criterion has smooth surjective geometrically connected fibres/dense open normal target. Point counts use all finite extensions. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md`, §§8.1,8.8 | Upper complex weights preserved by Rf_!; point eigenvalue1 and affine-line H_c² eigenvalueQ match the convention. This is not a purity claim about every compact-support group. |
| `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md`, §5.4, Uniform algebraic point counts | Geometric irreducibility and fixed presentation are required in the q^e+O(q^(e−1/2)) estimate. The arbitrary finite-grid cumulative-degree inequality is a different result owned locally. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`, §§5.1,5.8,5.10 | Pencil image comparison and symplectic/orthogonal alternatives exist; finite orthogonal alternative is not silently discarded. `lpv-universal-monodromy` asks exactly for the outstanding exclusion, with cubic surface exception. |
| `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`, §§2.1:458,3.5:581,4.1:621,4.2:644,5.1:759,5.4:813 | These now supply all six obsolete AT2 gaps. Configuration m=0 is separate, sign is n−1, diagonal range j≤d(n−3), full Ω² formula n≥4, Fermat simple connectivity n≥5. |
| `TauCetiRoadmap/AlgebraicTopology/README.md`, Stages4,6,8 | CW boundary pair, cohomology/universal coefficients and higher homotopy are imported. The package does not require the entire germ space to be path connected to apply Hurewicz on a component. |
| `TauCetiRoadmap/DGFloer/README.md`, Layer1 item1; Layer2 items2–3 | Degree-one Hurewicz and compact Hausdorff cofibration restriction fibrations are present on main. Nonabelian check: S₃ abelianization C₂, whereas its commutator subgroup C₃ is killed; this is not π₁=H₁ without abelianization. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md`, §§6.21:12091,6.44:12668 | Shifted leading determinants and an infinite eventual-vanishing criterion do not already supply the finite rectangular Padé rank statement. The ownership distinction in the package is justified. |

Object searches used `roadmaps grep` over the index and main, supplemented by the supplied checkouts and board plans: Hankel/Padé, polynomial lattices and shrinking, cumulative/grid degree, polar counts, character/Fourier transforms, prescribed germs and compact-open winding. No second fully qualified Lean declaration was found; the namespace and three theorem-name search returned only this package. The absent function-field lattice subsection in GeometryOfNumbersAndQuadraticArithmeticPartII is no longer consumed by the README; local §§1.2–1.5 own this work, which is another reason to retire its stale gap. The closest-roadmap scope comparison included ArithmeticStatisticsPartVIII: its local densities, Hurwitz stability and trace statistics do not own these mapping schemes or the polar count. The other closest owners are AlgebraicTopologyPartII, DeligneWeightsAndPurity and LefschetzPencilsAndVanishingCycles, whose imported contracts are recorded above. The supplied overlap scan has no shared-folder edit, dropped cited ID or revision-only numbering.

Pinned native declarations were checked by object and signature, including `MvPolynomial.eval₂Hom`, `pderiv`, `homogeneousComponent`, `Matrix.rank`, `LaurentSeries`, `RatFunc.inftyValuation`, `fwdDiff`, the componentwise height bound, primes in progressions and quadratic reciprocity; compact-open currying, closed-point detection, projectivization, big-O, fundamental groups, generalized loops and homotopy equivalences. Specific convention witnesses:

- `Mathlib/Algebra/Group/ForwardDiff.lean:40` defines the value at n as f(n+h)−f(n). Thus k−1 differences acquire only the global factor (−1)^(k−1) relative to the README, leaving the constancy locus unchanged.
- `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:185` has the minimal-prime/Noetherian hypotheses, not a naked dimension theorem for arbitrary schemes.
- `Mathlib/Topology/JacobsonSpace.lean:105` detects a nonempty locally closed subset in a Jacobson space; it does not prove constructibility of cohomological support.
- `Mathlib/Topology/Algebra/Projectivization.lean:44` uses the quotient topology on nonzero vectors; `Mathlib/LinearAlgebra/Projectivization/Basic.lean:91` supplies a representative, not a normalized affine coordinate. Homogeneity makes the Fermat predicate invariant.
- `Mathlib/Topology/Homotopy/HomotopyGroup.lean:98` defines the generalized loop carrier by maps of a cube fixed on its boundary. With index Fin2 this is Ω², not a free-loop space.
- `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:334,431` supplies the oriented group equivalence and sends the positive exponential loop to1; the reciprocal normal phase therefore has value−1.

Mechanical dependency output (read-only invocation on the reviewed README):

```text
depcheck: 235 roadmaps, 2134 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The requested diff-stat excluding `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII` is empty. The review made no change to the checkout, merge order, plan, sources manifest or libraries.

### Source-locator ledger

There are **50 distinct explicitly source-prefixed line anchors** in the README: 47 BS20, one BV15, one LR14v2 and one STACKS; adjacent unprefixed “line N” continuations are additional locators, not counted twice here. The target table and the following source groups record the correspondence checked. Original germ/collar constructions are correctly distinguished from results asserted in the source: their repeated BS20 §7 locator supplies the setting, not a proof of the new obstruction. Three Stacks stable tags (05F9,012K,0BK5) were resolved in the recorded chapters. Lee's separate thesis locator is waived and not counted as text verified.

| Source and locators checked | Targets / verification boundary |
|---\|---|
| BS20 lines4,38,94,164,209; published pp.893–899 | Mapping presentation, first page, support/irreducibility and conjecture. The roadmap weakens the unconditional numerical range for the retained remainder and keeps small-d counterexamples. |
| BS20 lines250,363,453,469,540,585,619,637; pp.900–907 | Phase/Fourier shift, Hankel arcs and Padé, prime choice, spreading. The floor in the later proof is explicitly corrected rather than attributed to Lemma2.4. |
| BS20 lines679,772,804,845,911,947,1022; pp.908–916 | Good denominator charts, cancellation, remainders, CRT and repeated-root cancellation. The affine direct-image shift has the corrected negative sign. |
| BS20 lines1090,1155,1161,1195,1234; pp.917–920 | Trace fibre, one-variable argument, configuration descent, middle cohomology and signed stratum formula; finite-E realization is supplied separately. |
| BS20 lines1315,1356,1369,1395,1437; pp.922–925 | Relative cohomology and monodromy. Primitive rank formula excludes all three small orthogonal dimensions3,4,5; finite orthogonal case remains an explicit supplier extension. |
| BS20 lines1518,1562,1596,1633,1732,1745,1753,1815; pp.927–934 | Fixed-order differences, cohomological degree, Weyl bound, polar dimension and support. Lower-degree specializations retain k. |
| BS20 lines1845,1863–1887; p.934 | Correct endpoint ceil(kd/2)−1 and missing remainder term; (k,d,n,m)=(3,4,24,5) gives192 rather than188. |
| BS20 lines1950,1981,2009,2014,2055,2091; pp.936–939 | Polar-count arithmetic, symmetric shrinking, dual minima and diagonal dimension. The c−s typo is corrected to c+s. The local orthogonal-basis proof supplies the needed lattice argument without waiting for Lee. |
| BS20 lines2142,2174–2194,2381–2432; pp.940–946 | Germ/conjectural pairing and conditional degeneration. The compact-open interpretation has the independently calculated end-winding obstruction; the roadmap does not claim the source's homotopy proof is valid for that topology. |
| BV15 line530, Lemma2.8, preprint pp.12–13 | Polynomial-vector degree/dimension bound, independent of the defining coefficient heights. General arbitrary grids and explicit cumulative constants are local deductions, not attributed verbatim. |
| LR14v2 lines124,144,231, Theorems1.1,2.1 and Proposition2.3, pp.3–6 | Degree/point-count slicing argument. The roadmap uses ≤ for affine section degree and retains cumulative geometric components. Source mistakes below do not propagate into its proof. |
| STACKS line4237, More on Morphisms 05F9; Homology012K,0BK5 | Locally constructible fibre dimensions and convergence for a finite filtration. Finite type over a field makes the local constructibility usable on Noetherian finite-type bases; empty fibres are handled separately by the declared contract. |

## Not verifiable

- LEE13, Lemma3.3.5: text was not read. Its manifest entry is waived; no new reference request was made. The roadmap gives a local strict-ball count proof and cites the thesis only as the provenance of the source's quoted formula.
- Completion of `sf-fibre-strata` and `lpv-universal-monodromy`: these are declared future supplier contracts, not claimed implemented theorems. Conditional acceptance would still depend on them after S01.
- No Lean build or independent elaboration was run. Signature verification uses the supplied elaborated-signature artifact and direct inspection of the pinned definitions.
- This is a statement/proof-plan review, not a certification of every source proof or every sibling roadmap. Source text was checked through the legal cached extractions; typographic inequality signs that those extractions flatten are not treated as independent misprints. The three theorem bodies remain `sorry`.
- The missing `reports/.md` repair-note path was replaced by the available PORT and PRREVIEW repair history. The independent same-round pass was not used.

## Source issues

- **Misprint** in BS20 at Lemma3.4 proof, printed p.913 (BS20 line924): the source says affine compact direct image has positive shift 2n(d−m); it should be negative shift −2n(d−m); affects the proof.
- **Misprint** in BS20 at Lemma3.7 proof, printed pp.917–918 (BS20 lines1154,1158): the source says the remaining parameters end at a_(n−1); it should be a₂ through a_n, namely n−1 parameters; affects the proof.
- **Misprint** in BS20 at Lemma4.3 proof, printed p.924 (BS20 line1435): the source says orthogonal/symplectic rank pairs are (2,3) and (4,5); it should be (3,2) and (5,4); affects the proof.
- **Gap** in BS20 at Lemma4.3 proof, printed p.924 (BS20 lines1429–1436): the source says only exceptional isomorphisms of whole orthogonal and symplectic Lie algebras need consideration; it should be common simple quotients, also covering so₄≅sp₂⊕sp₂; affects the proof.
- **Error** in BS20 at proof of Proposition2.6, printed p.934 (BS20 line1845): the source says the last minor-arc index is floor(kd/2)−1; it should be ceil(kd/2)−1; affects the proof.
- **Gap** in BS20 at proof of Proposition2.6, printed p.934 (BS20 lines1863–1887): the source says the displayed floor estimate establishes the sharp cutoff; it should be retain 4(r+1), with m=(k−1)t+r, or prove a sharper estimate; affects the proof.
- **Misprint** in BS20 at Lemma6.4 proof, printed p.938 (BS20 line2064): the source says the smaller-ball count uses c−s; it should be c+s, consistently with the following displayed product; affects the proof.
- **Gap** in BS20 at Lemma7.2 proof, printed pp.940–941 (BS20 lines2181–2194): the source says fixed pointwise leading germs permit a continuous family straightening; it should be specify a topology controlling normalized collars uniformly; compact-open topology has the winding obstruction; affects a stated result.
- **Error** in BS20 at equation(7.3), printed p.943 (BS20 lines2332–2339): the source says the entire bivariate Euler product consists of one fixed weighted diagonal; it should be extract that diagonal before specializing the variables; affects the proof.
- **Error** in BS20 at Lemma7.6, printed p.944 (BS20 lines2354–2358): the source says n>2 suffices for the full double-loop Betti formula; it should be n≥4 for the connected full double-loop space; n=3 can have infinitely many components; affects a stated result.
- **Misprint** in BS20 at the argument before Theorem7.7, printed p.945 (BS20 lines2417,2420): the source says ordinary cohomology of the algebraic mapping scheme computes the abutment dimension; it should be compactly supported cohomology in both occurrences; affects the proof.
- **Error** in LR14v2 at Lemma2.6, printed p.5 (LR14v2 line228): the source says every nonempty affine hyperplane section retains the original degree; it should be at most that degree for the reduced affine section; affects the proof.
- **Misprint** in LR14v2 at proof of Proposition2.3(a), printed p.5 (LR14v2 lines248–251): the source says all geometric points are covered by coordinate slices indexed by F_q; it should be only the F_q-grid points are so covered; affects the proof.
- **Error** in LR14v2 at proof of Proposition2.3(b), printed p.6 (LR14v2 line277): the source says the projective hyperplane count is qπ_(n−1); it should be π_n=qπ_(n−1)+1; affects the proof.
- **Misprint** in BS20 at Proposition5.5 proof, printed p.931 (BS20 line1681): the source says every specialized difference has degree k−1; it should be degree at most k−1, retaining the fixed differencing order; at y=0 the difference is zero; affects the proof.
- **Misprint** in LR14v2 at Lemma2.4 proof, printed p.5 (LR14v2 line218): the source says the substituted homogeneous equations use coordinates starting at T₁; it should be include T₀ in both the polynomial arguments and the linear substitution; affects the proof.
