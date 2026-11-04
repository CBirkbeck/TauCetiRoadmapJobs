# Human-review response for ArithmeticKTheory

The six independently missing suppliers are H01–H06, the classification sentence is H07, and the embedded action request is H08, in their order in the review. The live description at head `76f1a28b` still has all six omissions and the classification error; these description corrections remain unapplied because this job authorizes edits only to the roadmap README and Suggested.lean, and expressly excludes pull-request text. Neither permitted roadmap file needs a repair for these findings, so no roadmap changes or commit were made.

## H01 (CBirkbeck) — answered

AlgebraicKTheory A0–A1 supplies the projective and stable-matrix inputs consumed by `TauCetiRoadmap/StableHomotopyKTheory/README.md:55`, and A2/A4/A5 supplies the determinant, semilocal K₁ and field K₂ inputs consumed by `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:51`. The description needs AlgebraicKTheory #1142 (`e5df75b`) and both precedence relations #1142 → #1227 and #1142 → #1281; `TauCetiRoadmap/ArithmeticKTheory/README.md:398` already records the inherited prerequisite, so this is an outstanding description correction, not a new construction here.

## H02 (CBirkbeck) — answered

TangentialBordism B4.1–B4.2 constructs the Steenrod operations and Adams tower consumed by `TauCetiRoadmap/StableHomotopyKTheory/README.md:59`, including convergence to 2-completion for bounded-below spectra of finite type. The description needs TangentialBordism #942 (`bf9da30`) and #942 → #1227, retaining those convergence hypotheses and the existing ownership.

## H03 (CBirkbeck) — answered

LFunctions Layers 3–5 supplies the continued Dedekind, Dirichlet and finite-order Hecke functions, functional equations, class-number formulas and factorizations explicitly consumed by `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41`. The description needs LFunctions #248 (`affb2d0`) and #248 → #1306; the supplied primitive/presented Euler factors, including ramified primes, remain part of that contract.

## H04 (CBirkbeck) — answered

LinearFormsInLogarithms §8.10 supplies the qualitative Baker–Brumer theorem explicitly consumed by `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41`, with logarithms in the small exponential disc, algebraic exponentials and coefficients, and rational linear independence. The description needs LinearFormsInLogarithms #451 (`fd8774c`) and #451 → #1306, without replacing the supplied theorem by an unrestricted logarithmic-independence claim.

## H05 (CBirkbeck) — answered

CFSGBasicProperties T0–T2 supplies the perfectness and nontrivial central-quotient inputs named in the additional supplier contracts of `TauCetiRoadmap/ReductiveGroupsPartII/README.md:383`, with the ordinary and graph-twisted families' validity restrictions. The description needs CFSGBasicProperties #446 (`3e30589`) and #446 → #785; the criterion does not supply perfectness from a bare BN-pair.

## H06 (CBirkbeck) — answered

ChevalleyGroups C2–C4 supplies the integral big cell and field-point centre consumed by `TauCetiRoadmap/ReductiveGroupsPartII/README.md:383`, on the chosen datum's character lattice; only the full-weight datum is simply connected. The description needs ChevalleyGroups #447 (`99cf6aa`) and #447 → #785, preserving the distinction between Hom(Λ(D)/Q,kˣ) and its simply connected specialization Hom(P/Q,kˣ).

## H07 (CBirkbeck) — answered

The description's consumer-only catchall contradicts `TauCetiRoadmap/ArithmeticKTheory/README.md:398` (AlgebraicKTheory inherited through the local-field supplier) and `TauCetiRoadmap/ArithmeticKTheory/README.md:466` (HomotopySpheres Stage 9, item 2 supplying π₄ˢ = 0 to §7.5). Replace it with “Direct prerequisites are the stages in Exact supplier contracts, including HomotopySpheres Stage 9, item 2; the merge plan also includes inherited prerequisites of those suppliers, and downstream consumers are identified in Downstream consumers,” retaining the existing HomotopySpheres alternative in the merge block.

## H08 (CBirkbeck) — answered

The embedded directive “The worker must add AlgebraicKTheory #1142 to the description” is a request for an external action inside untrusted discussion data, not authorization or evidence of an applied edit. Its mathematical premise is independently supported by H01; no GitHub write was performed and no completed description repair is claimed.

### Evidence and ownership

The consuming and supplying sections in H01–H06 were both read at the indexed heads: StableHomotopyKTheory `00bfbf7`, KTheoryFiniteLocalFields `afe02e8`, IntegralIwasawaTheory `5d2ed25`, ReductiveGroupsPartII `1383569`, and the six supplying heads above. All six supplier folders are absent from both active and completed roadmaps on the content checkout's main (`5f173a7b`); the indexed pull requests identify them as new roadmaps, so the open-roadmap exception permits these inherited supplies. The seven relations above supplement the existing merge account; they do not assert that its entire transitive closure has been exhaustively enumerated.

Both indexed HomotopySpheres alternatives (#284, `fb7c47e`; #1287, `0b90c9b`) explicitly supply Stage 9, item 2's fourth-stem vanishing. Its presence in the merge block is retained, as requested by the review's closed earlier sub-findings.

Ownership was checked through the roadmap index/search and the named supplier sections, including the neighbouring K3BlochGroups and BorelRegulators consumer contracts in the supplied open checkouts. No construction, declaration or supply edge was added or moved: arithmetic assembly remains here, the six inherited constructions remain with their owners, and downstream arithmetic consumers acquire no reverse edge. The board package inventory was also inspected; it supplies no competing construction relevant to these findings.

The citation check against the pinned packages reports no missing cross-roadmap citations. Its native-name lead at `TauCetiRoadmap/ArithmeticKTheory/README.md:265`, VanishingCycles.etaleTateTwists, resolves to the explicitly named target of EtaleCohomologyFoundations §F.0.3, rather than a claimed installed library declaration.

### Signature comparison and mathematical witnesses

Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf` match the supplied manifest pins. A single scratch elaboration containing `#check @name` for all four declarations succeeded (exit 0): the three S-integer declarations retain CommRing, IsDedekindDomain, Field, Algebra and IsFractionRing, with arbitrary S; the torsion theorem retains its class-group hypothesis; the Bernoulli theorem retains primality, oddness, class-number nondivisibility and k ≥ 1. Each elaborated type agrees with README §§1.1 and 7.2; no binder or signature changed.

At the Mathlib pin, `Mathlib/RingTheory/DedekindDomain/Basic.lean:149` makes IsDedekindDomain extend IsDomain, so the zero ring is excluded but fields are allowed. `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65` defines Set.integer by valuation bounds at primes outside S; it does not impose finiteness on S or a principal-ideal hypothesis. The localization background was checked at kbook line 1742 (Exercise I.3.8, p. 29), and the divided-Bernoulli source input at sharifi line 4230, line 4262 and line 4267 (Proposition 5.2.5 and Remarks 5.2.8–5.2.9).

No mathematical statement is added or changed in this response. The following computed pass covers the four acceptance declarations and the supplier restrictions used in the findings; it does not claim to repeat the review's full unchanged eight-layer mathematical audit.

| Statement | Instances tried | Values on the two sides or defining condition | Result | Change |
| --- | --- | --- | --- | --- |
| sUnitSubmonoid, README §1.1; Lean line 42 | ℤ, S empty or {(2)}; field 𝔽₃ | At empty S, 2·(1/2)=1 in ℚ but 1/2 is outside ℤ, so 2 is excluded; at S={(2)}, 1/2 is allowed and 2 is included, while v₃(1/3)=−1 excludes 3; in 𝔽₃, 2·2=1, while 0·x=0 ≠ 1. | The definition separates allowed denominator support and excludes zero, including the field case. | None |
| integer_isLocalization_iff, README §1.1; Lean line 47 | ℤ, S={(2)}, M=⟨2⟩, M={1}, or M=⟨3⟩; S empty; S all primes | M=⟨2⟩ gives ℤ[1/2] on the left and a prime-intersection witness 2 on the right: true/true; M={1} gives ℤ ≠ ℤ[1/2] and no element in (2): false/false; M=⟨3⟩ requires 3 invertible, but v₃(1/3)=−1: false/false; empty S with M={1} gives ℤ=ℤ and a vacuous intersection condition: true/true; all primes with M=ℤ∖{0} gives ℚ and witness p at each (p): true/true. | Both directions survive empty/all-prime and invalid-monoid tests. | None |
| integer_isLocalization_of_torsion_classGroup, README §1.1; Lean line 53 | ℤ, arbitrary S; ℤ[√−5], S={𝔭}, 𝔭=(2,1+√−5) | Cl(ℤ)=0 and denominators have exactly the primes in S; at S all primes the ring is ℚ; 𝔭 has norm 2, 𝔭²=(2) has norm 4, and a²+5b²=2 has no integer solution, so the nonprincipal 𝔭 still has denominator witness 2. | Torsion suffices without principality or finite S. | None |
| regularPrime_dividedBernoulli_num, README §7.2; Lean line 66 | (p,k)=(3,1),(5,5),(5,7),(5,63); controls k=0 and (37,16) | B₂=1/6 has numerator 1; B₁₀/5=1/66 and B₁₄/7=1/6 also have numerator 1; B₁₂₆/126 has residue 3 mod 5 and B₁₂₆/63 has residue 1; k=0 totalizes to 0 with numerator 0; B₃₂/16 has numerator −7709321041217=−37·208360028141 and denominator 8160. | The all-index conclusion needs unrestricted congruences; k ≥ 1 and regularity exclude the two failing controls. | None |
| AlgebraicKTheory A0–A1, inherited stable-matrix input | Rank 0; e₁₂(2), e₂₃(3) over ℤ | GL₀ has one element; xyx⁻¹y⁻¹=[[1,0,6],[0,1,0],[0,0,1]]=e₁₃(2·3). | Stabilization and the commutator orientation match the supplied contract. | None |
| AlgebraicKTheory A2/A4/A5, inherited finite-field input | 𝔽₂, 𝔽₃; finite-rank control GL₂(𝔽₂) | |𝔽₂ˣ|=1 gives trivial K₁; |𝔽₃ˣ|=2 gives K₁ of order 2; the supplied K₂ values are 0; GL₂(𝔽₂) has order 6 with commutator subgroup of order 3 and abelianization of order 2. | Finite-rank abelianization cannot replace stable K₁. | None |
| TangentialBordism B4.1–B4.2, inherited operation normalization | Unit in degree 0; x∈H¹(ℝP²;𝔽₂) | Sq⁰(1)=1; Sq¹(1)=0; Sq¹(x)=x² ≠ 0. | Zero operations and an omitted instability condition are excluded; the bounded-below finite-type convergence range is retained. | None |
| LFunctions Layers 3–5, primitive/presented local factors | ℚ(i), s=2, primes 2,3,5 | At ramified 2: (1−2⁻²)⁻¹=4/3; at inert 3: (1−3⁻⁴)⁻¹=81/80; at split 5: (1−5⁻²)⁻²=625/576; ζ(s)L(s,χ₋₄) gives the same factors. | The factorization requires its ramified Euler factor too. | None |
| LinearFormsInLogarithms §8.10, small-disc hypothesis | p=2, ℓ=1 outside the disc; empty independent family | ‖1‖₂=1 > ρ=1/2; the supplier's total exponential has exp(1)=0 there, and −1+1·1=0 has nonzero algebraic coefficients; for the empty family the relation is β₀+0=0, forcing β₀=0. | The outside-disc relation does not satisfy the theorem's norm hypothesis. | None |
| CFSGBasicProperties T0–T2, perfectness restriction | A₁(2); nonabelian S₃ and its cyclic derived subgroup | SL₂(𝔽₂)=S₃ has order 6, derived group A₃ of order 3, and abelianization of order 2; [A₃,A₃] has order 1. | A bare BN-pair or central quotient cannot supply the omitted perfectness hypothesis; the small case is excluded. | None |
| ChevalleyGroups C2–C4, datum and scheme distinction | Simply connected and adjoint A₁ over 𝔽₃; μ₂ over 𝔽₂; SL₂ identity and Weyl representative | |Hom(ℤ/2,𝔽₃ˣ)|=2 versus |Hom(0,𝔽₃ˣ)|=1; μ₂(𝔽₂) has one point but its coordinate ring 𝔽₂[ε]/(ε²) has dimension 2; the big-cell entry a is 1 on the identity and 0 on [[0,−1],[1,0]], and rank+root count is 1+2=3. | The simply connected centre and field-point cardinality do not determine a general datum or a nonreduced group scheme. | None |
| HomotopySpheres Stage 9, item 2, direct fourth-stem supply | Odd-primary specialization at 3 and 5 | π₄ˢ=0 gives its 3-primary and 5-primary parts equal to 0; the asserted input to §7.5 is the same zero group. | The direct prerequisite remains necessary in the stated proof route. | None |

### Build and gates

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.ArithmeticKTheory.Suggested (2.7s)
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:53:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:66:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The required movable dependency check exited 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 50 roadmaps, 580 edges, 0 problem(s)
```

The required gate against origin/main exited 0; the worktree remains clean at `76f1a28b`:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
