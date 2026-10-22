## H01 (CBirkbeck) — applied

The missing finite comparison is now the named target “Big Witt power-series comparison” in `TauCetiRoadmap/QWittVectors/README.md:193`, with its source, target, inverse-product formula and unique factorization at line 195. It holds for every commutative unital ring and N≥0, including the requested N≥1, with the nonunital interpretation through §1.3 at line 197 (Hesselholt v3 Proposition 1.14, Addendum 1.16 and Example 1.17, pp. 14–15; hesselholt lines 589, 644, 652).

## H02 (CBirkbeck) — applied

The missing inverse-limit comparison is now γ_∞ from full positive-index big Witt vectors to constant-one formal power series in `TauCetiRoadmap/QWittVectors/README.md:197`. Its product is defined by coefficient stabilization, and its finite reductions agree with γ_N; line 220 computes the reductions 1+t, 1+t+t² and 1+t+t²+t³ (hesselholt lines 583–628).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:199` now requires coefficient-map naturality, including identity and composite maps, for both finite and infinite comparisons. Line 219 tests ℤ→𝔽₂ on coordinates (1,1): 1+t+2t² maps to 1+t, agreeing with the comparison after coefficient reduction (hesselholt lines 598–600).

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:201` now identifies restriction from S_N to S_M with reduction modulo t^(M+1), for 0≤M≤N, including composition and compatibility with coefficient maps. Line 219 tests reduction of γ_2(1,1)=1+t+2t² to γ_1(1)=1+t (Hesselholt v3 Addendum 1.16 and Example 1.17, p. 15; hesselholt lines 644–655).

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:203` now gives the precise finite source S_L with L=⌊N/n⌋, proves substitution descends using n(L+1)>N, and states both the length m→mn and infinite Verschiebung compatibilities for n>0. Line 218 computes the N=4,n=2 image as 1+t²+2t⁴, the N=3,n=2 image as 1+t², and the empty-source case n>N as 1; n=0 is excluded because substitution sends the truncation relation to 1 over ℤ (hesselholt lines 292–298).

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:205` now sends each Teichmüller class to (1−at)⁻¹, finitely and infinitely, and fixes γ_1(a)=1+at modulo t². Line 217 distinguishes γ_2(τ(2))=1+2t+4t² from the linear series 1+2t, whose Witt coordinates are (2,−4) (hesselholt lines 338–341 and 598).

## H07 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:215` now computes γ_2((1,0)+(1,0))=γ_2(2,−1)=1+2t+3t²=(1−t)⁻² modulo t³. It distinguishes componentwise addition, which yields 1+2t+4t², and the non-inverted product, which yields 1−2t+t² (hesselholt lines 598–628).

## H08 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:216` now records that (0,1) over 𝔽₂ has ghosts (0,0) but comparison image 1+t²≠1 modulo t³. The proof route at line 209 therefore establishes integral identities over a torsion-free universal ring before specialization, rather than assuming ghost injectivity for R (hesselholt lines 615–628).

## H09 (CBirkbeck) — answered

The full comparison cannot be stated at the pins: `Mathlib/RingTheory/WittVector/Defs.lean:52` and `Mathlib/RingTheory/WittVector/Truncated.lean:62` provide p-typical carriers, while neither pinned library supplies the coordinate big Witt additive group. `TauCetiRoadmap/QWittVectors/Suggested.lean:12` now lists both comparisons as headlines, and lines 30–33 identify that missing carrier; no substitute theorem or carrier was introduced.

## H10 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md:9` now explicitly assigns the comparison to this roadmap's general big Witt library, with no new supplier dependency on KTheoryFiniteLocalFields and no ownership transfer. The readable KTheoryFiniteLocalFields head agrees in its Conventions and §5.16 on initial-segment truncations, substitution and Teichmüller classes; its indexed snapshot does not contain the reported §5.16a or bigWittPowerSeriesComparison, so no citation to that unverified locator was added.

---

**Source and ownership audit.** The comparison uses the existing certified source key hesselholt, arXiv v3, Proposition 1.14 (pp. 14–15), Addendum 1.16 and Example 1.17 (p. 15); hesselholt lines 589–655. The coordinate formulas for V and τ are hesselholt lines 292–298 and 338–341, and the integral specialization argument is hesselholt lines 615–628. No additional cited work or source key was needed, and no source text was copied.

Ownership was searched by object on main at a07e202, the indexed open roadmap heads, the board packages and all thirteen supplied sibling checkouts. The relevant overlap is KTheoryFiniteLocalFields' power-series presentation and K-theoretic application; the coordinate ring on every divisor-closed truncation set remains QWittVectors §1.3, so its coordinate comparison belongs here. The board design for GeneralAlgebraicKTheoryPartII specifies a Witt action on nil-groups and consumes its Witt carrier; it does not construct this comparison. The supplied sibling checkouts contain no competing big Witt comparison. No declaration name or supplier was added, no ownership was moved, and the dependency direction is unchanged.

The existing cross-roadmap citations were resolved against main or the indexed heads, and the new §1.4a consumes only §§1.3–1.4 and the pinned Polynomial/PowerSeries carriers. At the pins, `Mathlib/RingTheory/PowerSeries/Basic.lean:56` defines the series carrier and line 139 its constant-coefficient ring map; `Mathlib/RingTheory/PowerSeries/Inverse.lean:109` gives the unit criterion. These provide series and units but no coordinate big Witt group or comparison. The repository's citation resolver did not inspect external library names, so these library claims were checked directly at Mathlib 6b7abb3 and Tau Ceti a91d3aa.

**Elaborated signatures.** A single scratch module imported the acceptance test and elaborated `#check @name` for all four declarations. The truncation-set fields still require positivity and divisor closure; ghostPolynomial retains CommRing R; ghost_image retains CommRing R, S, the prime Frobenius lifts and their congruence hypothesis, with coordinate equations restricted to S; framedGamma_existsUnique retains both commutative-ring instances, both algebra structures, IsScalarTower and Algebra.Etale, as well as r and i. They agree with README §§1.1, 1.2 and 8.1, and no binder or declaration signature changed.

**Adversarial mathematics pass.** Each row concerns a definition, identity, convention or proof step added by the repair, or one of the four retained acceptance-test declarations. Series coefficients are listed from degree zero; congruences are in the indicated truncated series ring.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| S_N and its shifted truncation | N=0,1,2,3; N=4,n=2 | S_N=∅,{1},{1,2},{1,2,3}; S_4/2={1,2}=S_2 | Positive indices and divisor closure agree | Defined S_N separately from Div(N) |
| U_N is the constant-one subgroup of units | R=ℤ,N=2,a=2; wrong ambient unit −1 | (1−2t)(1+2t+4t²)=1 modulo t³; constant coefficients 1 versus −1 | The required inverse exists; −1 is excluded | Defined the target subgroup and justified inversion |
| Finite product and triangular coordinates | N=1,2,3, x=(a,b,c) | γ_1=a↦(1,a); γ_2=(1,a,a²+b); γ_3=(1,a,a²+b,a³+ab+c) | Coefficient d has leading coordinate a_d with coefficient 1 | Stated the integral product and factorization |
| Finite additive group law | x=(a,b), y=(c,d) | Witt sum=(a+c,b+d−ac); both series have t² coefficient a²+ac+c²+b+d | Agrees without integer division in R | Added the group isomorphism |
| Addition at a third index | x=(1,1,1),y=(2,−1,3) over ℤ | Sum=(3,−2,−2); γ(sum)=(1,3,7,19)=γ(x)γ(y) | Agrees beyond the length-two witness | Retained all initial-segment lengths |
| Uniqueness and inverse coordinate recovery | R=ℤ,N=2,f=1+2t; x=(1,1) | γ_2(2,−4)=(1,2,0); γ_2(−1,−2)=(1,−1,−1), and (1,1,2)(1,−1,−1)=(1,0,0) | Factorization recovers coordinates and additive inverses | Included unique factorization rather than a mere homomorphism |
| Initial segment versus divisor truncation | N=3,x=(0,1,0) over ℤ | γ_3(x)=1+t² modulo t⁴; omitting index 2 gives 1 | The distinction is detected | Explicit S_N convention |
| Infinite product and finite reductions | a_1=1, all other a_d=0 | γ_∞=Σ t^j; reductions N=0,1,2,3 are 1;1+t;1+t+t²;1+t+t²+t³ | Compatible finite coefficients determine the series | Added inverse-limit comparison and witness |
| Coefficient stabilization | Coefficient degree 2, factor of index 3 | (1−at)⁻¹ has coefficients (1,a,a²); multiplication by (1−bt³)⁻¹ leaves those three coefficients unchanged | Factors above the degree cannot change it | Defined the infinite product by stabilization |
| Nonunital unitization kernel | R=ℤ with zero multiplication, represented by ε²=0 | (1+εt+2εt²)(1+3εt+4εt²)=1+4εt+6εt²; augmentation of each is 1 | Matches coordinate sum (4,6); ordinary integer multiplication would give t² coefficient 9 instead of 6 | Applied §1.3 to constant-one series in ℤ⋉R |
| Coefficient-map naturality | ℤ→𝔽₂, x=(1,1),N=2 | (1,1,2) reduces to (1,1,0)=γ_2(1,1) over 𝔽₂ | Both routes agree | Added finite and infinite naturality |
| Identity and composite coefficient maps | ℤ→ℤ/4→𝔽₂, x=(2,1),N=2 | Identity retains (1,2,5); successive reductions give (1,2,1) then (1,0,1), equal to direct reduction | Both compositions agree | Included identity and composition laws |
| Restriction and reduction | x=(1,1,1), N=3→2→1 | Series (1,1,2,3)→(1,1,2)→(1,1), equal to γ_1(1) | Successive and direct reduction agree | Added the restriction square and composition |
| Coefficient/restriction square | x=(1,1),N=2→1,ℤ→𝔽₂ | (1,1,2)→(1,1,0)→(1,1); restriction first also gives (1,1) | Both square paths agree | Included commuting coefficient maps |
| Finite V_n versus substitution | N=4,n=2,x=(1,1) | V_2x=(0,1,0,1); both series coefficient lists=(1,0,1,0,2) | Agrees | Specified source length ⌊N/n⌋ |
| Finite substitution at a nonmultiple bound | N=3,n=2,x=(1) | V_2x=(0,1,0); both images=(1,0,1,0); 2(1+1)=4>3 | Quotient substitution descends | Gave the exact well-definedness inequality |
| Substitution boundary and junk index | N=2,n=3; N=0,n=1; n=0 over ℤ | Empty-source images are (1,0,0) and (1); at n=0, t³ maps to 1≠0 | Positive n works; zero does not define the quotient map | Included empty-source checks and n>0 |
| Length m→mn compatibility | m=2,n=3,x=(1,1) | V_3x=(0,0,1,0,0,1); both images=(1,0,0,1,0,0,2) | Agrees | Included the consumer's particular lengths |
| Identity and infinite Verschiebung | n=1; n=2,a_1=1,other coordinates 0 | At n=1 γ_2(1,1)=(1,1,2) on both sides; at n=2 both infinite images=1+t²+t⁴+t⁶+⋯ | Agrees with finite reductions | Included the full-vector compatibility |
| Teichmüller and sign normalization | a=2 over ℤ; N=1,2 and infinite | Images=1+2t;1+2t+4t²;1+2t+4t²+8t³+⋯ | Reciprocal sign is fixed; 1+2t alone fails at N=2 | Added the τ formula and length-one witness |
| Integral sign Check | (1,0)+(1,0) over ℤ,N=2 | γ(2,−1)=(1,2,3)=γ(1,0)²; wrong componentwise sum gives (1,2,4); non-inverted product gives (1,−2,1) | Both plausible wrong models are excluded | Added line 215 |
| Ghost-kernel Check | x=(0,1) over 𝔽₂,N=2 | (w_1,w_2)=(0,0); γ(x)=(1,0,1)≠(1,0,0)=γ(0) | Ghosts do not determine the comparison over R | Added line 216 |
| Universal-ring proof step | x=(1,1) over ℤ | γ=1+t+2t²+O(t³); tγ′/γ=t+3t²+O(t³), matching ghosts (1,3) | Logarithmic derivative agrees before specialization | Explicit torsion-free universal-ring route |
| Nilpotent and mixed-characteristic coefficients | R=ℤ[ε]/ε²,x=(ε,0); R=ℤ/4,x=(2,1); R=𝔽₃,x=(1,1) | Images=1+εt;1+2t+t²;1+t+2t²; each factor inverse multiplies back to 1 at the truncation | No reducedness, characteristic-zero or good-prime restriction arises | Preserved every commutative coefficient ring |
| Empty truncation and zero ring | N=0; R=0 at any N | Empty product=1; for R=0, 1=0 and both groups have cardinality 1 | The endpoint cases agree | Included the degenerate Checks |
| Retained BigWitt.TruncationSet | Div(6), ∅, subset {2} | Div(6)={1,2,3,6}; divisors 1,2 of 2 both occur in Div(6), but 1∉{2}; ∅ has zero membership obligations | Positive divisor closure matches README | Signature unchanged |
| Retained BigWitt.ghostPolynomial | n=0,1,2,6 | w_0=0 from the empty divisor sum; w_1=x_1; w_2=x_1²+2x_2; at all-one coordinates w_6=1+2+3+6=12 | Positive-index uses and the unused total-function value agree | Signature unchanged |
| Retained BigWitt.ghost_image | B=ℤ,φ_2=id,S={1,2}; b=(1,3),(0,1); S=∅ | For b=(1,3), x=(1,1) gives both sides and 3−1=2∈2ℤ; b=(0,1) requires 2x_2=1 and has difference 1∉2ℤ; empty S gives true↔true | Both directions and the empty case agree | No lost congruence binder |
| Retained QWitt.framedGamma_existsUnique | Rank 1 polynomial frame; rank 0; characteristic 2 | γ(T²)=(1+2h+h²)T²; inverse coordinate multiplier 1−h+h² gives product 1 modulo h³; at 2 the value is (1+h²)T²; rank 0 has no i | Coordinates, inverse convention and the empty coordinate family agree | Algebra, scalar-tower and étale binders retained |

The finite additive identity was also evaluated for all 820 pairs with coordinates in {−1,0,1} at lengths 0–3, and finite Verschiebung/substitution for those coordinates through N=6 and n=1–7; both sides agreed in every case. These computations test the conventions; Hesselholt's universal integral argument supplies the general mathematical justification.

**Verification outcomes.**

Commit: `0e4e64e` — `QWittVectors: review repairs (add coordinate and power series comparison)`. Only `TauCetiRoadmap/QWittVectors/README.md` and `TauCetiRoadmap/QWittVectors/Suggested.lean` changed; the worktree is clean and nothing was pushed.

Build command: `lake build TauCetiRoadmap.QWittVectors.Suggested` (exit 0). Exact outcome:

```text
⚠ [8976/8976] Built TauCetiRoadmap.QWittVectors.Suggested (2.3s)
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:74:8: declaration uses `sorry`
warning: TauCetiRoadmap/QWittVectors/Suggested.lean:94:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

Scratch signature elaboration: exit 0; all four declarations checked, with no dropped hypotheses.

Dependency direction check (exit 0), exact output:

```text
depcheck: 14 roadmaps, 102 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

Gate (exit 0), exact summary line:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
