# Review of DeformationAndDerivedPatchingAlgebraPartII (pull request #872 at ec57b2b)

**Verdict:** needs changes

## R01 (P2) — Reuse the existing graded-module sheaf

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:99–106,1458–1495`. The scope says “The sheaf of a graded module on `Proj` is owned by K3.3.”

**Claim:** K3.3 constructs a new generic sheaf from an ℕ-graded algebra and a ℤ-graded module, and the scope transfers the polynomial-ring chart and exactness statements from GroebnerGeometry G4 to this construction.

**Witness:** `TauCetiRoadmap/AdicSpacesPartIII/README.md:3950–3958` on main already constructs `AlgebraicGeometry.gradedTwist G ℳ n` on precisely these gradings; take `n = 0`. `TauCetiRoadmap/GroebnerGeometry/README.md:370–375` already owns polynomial-ring charts and exactness.

Finiteness and degree-one generation in AdicSpacesPartIII begin at line 3959 for the eventual-sections theorem, not for the preceding sheaf definition. Its shift is also `M(n)_d = M_{d+n}`. Thus this is the same object, not merely a construction for a narrower grading convention. Both suppliers are existing roadmaps on main. Their work cannot be reassigned by this roadmap's scope paragraph.

**Repair:** Import the generic sheaf at twist zero from AdicSpacesPartIII §F0.9 and the existing polynomial-ring API from GroebnerGeometry G4, with exact contracts. Delete the second sheaf construction and the ownership transfer. Keep genuinely additional general-ring API, tail invariance and Rees-module comparisons on the supplied carrier. Update the module docstring's ownership description too; this does not require importing a roadmap into Lean.

**Repair test:** For `S = k[t]`, `N = S`, both constructions give `O_(Spec k)`; for `N = k` concentrated in degree zero, both give zero; for `S = k[X₀,X₁]`, `N = S(-1)`, both have local generators `1/Xᵢ` and transition `X₁/X₀`. Using the supplied carrier preserves all three values, while removing the second owner.

## R02 (P3) — Write undeclared API targets as prose

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:1372–1384`, for example “`mem_reesModule_iff`: membership is coefficientwise membership in `IⁿM`.” The same issue occurs in the named estimates at lines 1166–1224 and the sheaf API at 1472–1483.

**Claim:** The backticked names label this roadmap's own API declarations, but they are absent from its acceptance test.

**Witness:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/Suggested.lean` has no `mem_reesModule_iff`, `reesModule.map` or `kawasaki_colon_E`; its 29 declarations are the 9 headlines and their supporting definitions/instances.

**Repair:** Remove invented declaration labels from API bullets and describe those targets in prose. Retain backticked names for actual headline/supporting declarations and for resolved suppliers. Do not add these API lemmas to `Suggested.lean` to satisfy the names. On the cited membership bullet, “Membership is coefficientwise membership in `IⁿM`” retains the precise claim and its four existing Checks without asserting a nonexistent declaration. The gate passed; this is an independently observed house-style defect, not a reported gate failure.

## R03 (P3) — Add the source manifest

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:2173–2211` lists the references, but the roadmap folder contains only `README.md`, `Suggested.lean` and `metadata.toml`.

**Claim:** The cited works have no `sources.toml` records carrying versions, locators and legal retrieval/status information.

**Witness:** The three-file folder listing and the references distinguish the 1999 Kawasaki preprint from its 2002 publication, but no manifest records their relationship or retrieval status.

**Repair:** Add the required `tauceti-roadmap-sources/v1` manifest, one key per work, with precise cited-for locators and service provenance/status. Use one entry for the Kawasaki preprint/publication with both identifiers and a numbering note. Do not mark journal-index HTML as the article text. Record unreadable texts honestly as described below. Test the manifest by resolving the sampled estimate E to the 1999 preprint's Theorem 3.6, equation (3.6.5), p. 6, without silently substituting unverified published pagination.

## Verified sound

This is a review of the entire 2,211-line README and 308-line Lean file, not just the seeded sample. No previous review was supplied. I read the normative README and CONTRIBUTING, checked the complete diff, the worker's gate, each supplier contract and `Needs` line, and the pinned definitions and source passages recorded below. Only the roadmap's three files differ from the base; no outside-folder change was found. No repository file was changed by this review.

There are **3 findings, 1 blocking**. I found no counterexample to the nine headline signatures. The numerical and algebraic checks below are witnesses, not a substitute for proofs. The unreadable primary colon-estimate text limits source certification as stated under Not verifiable.

The worker's gate at this head reports every check passing, including the targeted build. I also ran the prescribed direct Lean elaboration successfully: exactly nine `sorry` warnings and no other warning/error. The dependency check returned:

```text
depcheck: 158 roadmaps, 1089 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No declared supplier gaps exist. No route-specific restriction, computational algorithm, copied passage in the accessible source comparisons, sorry'd data, `set_option`, forbidden import or arbitrary `Prop` stand-in was found. The zero-module convention and unrestricted residue characteristics are retained.

### Seeded source sample

Source identifiers below identify legal cached texts. `cesnavicius` is arXiv:1810.04493v2, whose pagination the README explicitly chooses. `kawasaki1996` is the RIMS institutional PDF. `hjls` is the Purdue author preprint. `stacks` is the Stacks Project; chapter names distinguish its separate cached extractions. Source lines are extraction line numbers, not machine paths. No README locator was explicitly marked unverified.

| Sampled target | Locator and text read | Result, including scope |
| --- | --- | --- |
| Local cohomology along a ring map, K0.1 | `stacks` line 634, Dualizing Complexes, Lemma 47.9.2, tag 0BJB, p. 14 | Restriction of scalars and extended ideal agree. The source allows a finitely generated support ideal over arbitrary rings; the roadmap's Noetherian setting correctly connects this to the pinned Ext-colimit definition. No flatness or finite-module assumption is needed. |
| Prefix quotients, K0.3 | `cesnavicius` line 370, Definition 3.1, p. 9; line 389, Remark 3.2, p. 10 | Quotients by generated ideals are the objects used there. Empty, concatenated and permuted quotient equivalences are elementary module-quotient consequences, not separate numbered source theorems. |
| Existence/completion of secant parameter lists | `cesnavicius` line 389, Remark 3.2, p. 10; `stacks` line 6696, Algebra, Proposition 10.60.9, tag 00KQ, pp. 142–143 | Nonzero finite module over a Noetherian local ring, passing to the annihilator quotient. The induction uses genuine dimension drop and Nakayama. |
| CM-secant sequences | `cesnavicius` line 378, Definition 3.1(ii), p. 10 | Terminal Cohen–Macaulayness and membership in each preceding quotient's annihilator product are both present; intermediate quotients need not be CM. |
| Annihilator product/non-CM locus | `cesnavicius` lines 436–472, Lemma 3.6, pp. 11–12 | Dualizing complex and equidimensional support are present. The arbitrary-support defect formula is separately stated at line 473, Remark 3.7, p. 12. |
| Reversed prefixes after auxiliary quotients | `cesnavicius` lines 502–529, Proposition 3.11(i) and proof, pp. 12–13; `kawasaki1996` lines 105–143, Theorem 2.6/Lemma 2.7, pp. 42–43 | Direction, auxiliary quotient and type `d−1` agree. The 1999 Proposition 3.5 locator itself could not be read. |
| Kawasaki estimate E | The cited 1999 Theorem 3.6, (E_ij), (3.6.5), p. 6 | **Not source-certified.** The author DVI was not readable through the service, and publisher attempts returned journal-index HTML. The three explicit ideal computations below agree with the target. |
| Regularity of last auxiliary element | `cesnavicius` lines 514–520, Proposition 3.11(iii), p. 13 | The README correctly uses the last auxiliary element and all positive powers. It repairs the missing prime on the source's symbol. The primary induction remains uncertified. |
| Rees module | `cesnavicius` lines 543–554, §3.13, pp. 13–14 | The direct sum of images `IⁿM` is supported; it is not the tensor product with the Rees algebra. The coefficientwise module construction spells this out. |
| Dimension of a Rees algebra | `stacks` lines 12713–12734, Algebra, Lemma 10.113.1, tag 02IJ | This supplies the height inequality used in the written proof, not a verbatim Rees-dimension theorem. Finite type/domain hypotheses are retained; the minimal-prime reduction gives the stated inequality. Equality is not asserted for the zero ideal. |
| Two-generator chart | `cesnavicius` lines 611–630, proof of Theorem 3.14, p. 15; `stacks` lines 7797–7813, Algebra, Lemma 10.70.6, p. 167 | Denominator `b` gives relation `bT−a`, followed by power-torsion removal. Closed-fibre maximal ideals use a monic lift of an irreducible polynomial, not necessarily a linear polynomial. |
| Annihilation claim | `cesnavicius` line 638 and lines 660–696, Claim 3.14.5, pp. 16–17 | Both generators annihilate H¹. The proof uses the actual intermediate Rees sheaf, tail deletion, exactness and the torsion condition. |
| Vanishing claim | `cesnavicius` lines 639,697–722, Claim 3.14.6, pp. 16–17 | The bound is `j < s−2`. The README makes both outer-induction inputs explicit, including all positive-power quotient models. |
| Relation kills H¹ | `cesnavicius` lines 640–650, (3.14.7)–(3.14.10), p. 16 | Flat polynomial base change transports annihilation. The README consistently uses `bT−a`; the source's later swapped expression is harmless for annihilation but mismatched to its exact sequence. |
| Depth at closed points | `cesnavicius` lines 591–610,635–658, proof of Theorem 3.14, pp. 15–16 | The point lies over the closed point and the induction is simultaneous in modules. Both conditions occur in the roadmap and the Lean signature. |

The other opened source arguments include normalized local duality (`stacks` lines 1555–1576, Dualizing Complexes, 47.18.3–47.18.4), catenarity/dimension functions (lines 1478–1503, 47.17.3–47.17.4), composite supports (lines 695–710, 47.9.6), Proj sheafification (`stacks` lines 480–520,563–581, Constructions, 27.8.4/27.8.7), and Huckaba's example (`hjls` lines 449–460, Example 3.6, p. 13). These support the stated generality; ownership is the separate issue R01.

### Computed adversarial pass

In the table, `k` is any field (including F₂ and F₃), `D = k[[t]]`, `E = k((t))/D`, `P_d = k[[x₁,…,x_d]]`, and `Q = k[[x,y]]/(x²,xy)`. Unmentioned modules are the displayed ring. Dimensions use `dim(0 module) = ⊥`; zero-module depth is ∞. “Retain” means these instances require no change. Rows mentioning R01/R02 specify the change supported by the computation. No computation was treated as a proof of an unbounded statement.

| Statement/convention | Instances | Computed values on the two sides, or positive/negative models | Result/change |
| --- | --- | --- | --- |
| Local conventions; zero ring/module | Zero module; field; D | `dim 0 = ⊥`, `depth 0 = ∞`; `dim k = depth k = 0`; `dim D = depth D = 1`. The zero ring has no primes and is excluded by native `IsLocalRing`. | Retain supportwise CM convention. |
| K0.1 injective ideal-power torsion | D, injective E; ideals `(t)`, 0, D | Torsion submodules are respectively E, E, 0, all injective; replacing power torsion by kernel of t gives k, which is not injective over D. | Supplied result, retained. |
| Čech complex and degree convention | D, list `[t]`; field list `[1]`; empty list | `[D→D[1/t]]` has H⁰=0, H¹=E; `[k→k]` has both zero; empty-list support 0 has H⁰=N and no higher cohomology. | Retain cohomological degrees 0,1. |
| Composite-support spectral sequence | P₂, I=(x), J=(y); D with I=J=(t) | First example only iterated H¹H¹ survives, containing `1/(xy)`, in total degree 2. Second: H⁰_(t)(E)=E, H¹_(t)(E)=0, total degree 1. | Retain; cannot impose finite generation on intermediate local cohomology. |
| Ring-map comparison | Identity D; P₂→P₂/(y); D→k((t)) | H¹ values E/E; E/E with y acting zero; 0/0 after the ideal becomes the unit ideal. | Retain non-flat quotient example. |
| Filtered-colimit comparison | D/tⁿ with transition ×t; constant D | Colimit is E; H⁰ on either side is E, higher groups 0. Constant diagram has H¹=E on both sides. `tⁿ[t^(−n−1)] = [t^(−1)] ≠ 0`. | Retain; no uniform torsion exponent. |
| Principal H⁰/H¹ formulas | D and D/t², support t | For D: kernel=0, localization cokernel=E; for D/t²: kernel union=D/t², localization=0, H¹=0. | Retain. |
| Two-generator H² and iterated H¹ | P₂, x,y; support (1,y) | First H² is `P₂[1/(xy)]/(P₂[1/x]+P₂[1/y])`, with nonzero class 1/(xy), equal to iterated H¹. Unit support gives 0 on both sides. | Retain. |
| K0.2 annihilator product definition/empty cutoff | Any N, d=0; D/t², d=1, J=(t) | Empty product=D; positive cutoff yields `(t²)`, whereas radical replacement gives `(t)`. | Retain explicit natural cutoff. |
| Product versus intersection in annihilator API | `M=k⊕P₂/(y)`, J=(x,y), d=2 | Ann H⁰=(x,y), Ann H¹=(y); product=(xy,y²), intersection=(y). Each factor annihilates its own group; the product annihilates both. | Retain genuine product. |
| Annihilator product on zero/CM modules | M=0; D with d=1 | Every local-cohomology group below the cutoff is zero, hence both products are the unit ideal. | Retain. |
| K0.3 prefix quotient | ℤ and [], [2], [2,3] | Quotients are ℤ, F₂, 0; the product-ideal wrong model gives ℤ/6 for the last case. | Retain real quotient carrier. |
| Prefix concatenation/permutation maps | ℤ, [2] then [3]; swap [2,3] | Iterated quotient=(F₂)/3F₂=0=joint quotient; both quotient maps send every integer to 0. | Retain equivalences commuting with projections. |
| Secant definition and length bound | D [t], [t²], [t,t]; field [0], [1]; zero module | Dimension chains 1→0, 1→0, 1→0→0; field [0] gives 0→0 and [1] fails maximal-ideal membership; zero gives ⊥→⊥. | Only the first two nonempty lists pass. |
| Secant dimension formula | P₂ [x,y]; zero module [0] | `0+2=2`, true; on zero, `⊥+1=⊥` but secancy is false. | Retain explicit nonzero hypothesis for the iff. |
| Permutation/sublist/powers | P₂ [x,y], [y,x], [x²], [y] | Terminal dimensions 0,0,1,1 and lengths 2,2,1,1; all satisfy dimension+length=2. | Retain. |
| Truncated-product property | P₂ [x,y]→[xy]; wrong full list [xy,y] | Dimensions 2→1 versus 2→1→1. | Retain truncation restriction. |
| Regular implies secant; concatenation | P₂ x then y on P₂/x; field [] | Each quotient map drops dimension 2→1→0; empty list length0 preserves dimension0. | Retain nonzero finite/local assumptions. |
| Secant parameter completion | P₂ prefix[x]; D empty; field empty | Append [y], [t], [] respectively; terminal dimensions all 0, lengths 2,1,0. | Retain. |
| K0.4 local-cohomological CM predicate | D; Q; zero module | D has H⁰=0 below dimension1; Q has H⁰=kx≠0 below dimension1; zero has no natural degree below ⊥. | True/false/true, matching intended predicate. |
| CM-secant definition/empty list | Q [y] and []; P₂ [x,y] | Q: a(Q)=(x,y), y∈a(Q), terminal Q/y≅k[x]/x² is dimension0 CM. Empty list on Q fails terminal CM. P₂ has unit annihilator products. | Retain; CM-secant need not be regular. |
| CM-secant terminal versus intermediate quotients | Q [y] | Initial quotient Q has H⁰=kx; terminal quotient has dimension0. Thus full list is CM-secant while its empty prefix is not CM-secant. | Correctly does not assert every prefix CM-secant. |
| K0.5 Schenzel positive-power torsion bound | Q [y], n≥1; D [t] | `ker yⁿ=kx`; a(Q)·kx=(x,y)·kx=0. In D, `ker tⁿ=0`; a(D)=D kills it. | Retain all positive powers, no CM assumption. |
| Parameters regular on CM modules | P₂ [x,y]; Q [y] | Kernels on successive P₂ quotients are 0; kernel y on Q is kx≠0 and Q is not CM. | Retain CM hypothesis. |
| K0.6 extension of CM-secant lists | P₂ [x]; Q [y]; field [] | Append [y], [], []; terminal support dimensions 0,0,0. For zero M no nonzero terminal quotient is possible. | Retain theorem's nontrivial-module binder. |
| Reversal/type d−1 convention | P₂ [x,y]→[y,x]; Q [y] | Reversed last parameter lies in a(P₂)=P₂; remaining membership in a(P₂/x)=P₂. For Q, y∈(x,y). | Retain reversed indexing. |
| K0.7 dualizing shift | D, normalized ω=D[1]; field ω=k | On D, Ext^(−1)(D,ω)=D and its Matlis dual=E=H¹; Ext⁰=0 dualizes to H⁰=0. On k, degree0 duality gives k=k. | Retain negative Ext index. |
| Noncomplete duality/completion scalars | R=k[t]_(t), E=k(t)/R | H¹=E=Hom_R(R,E)=Hom_Rhat(Rhat,E) with the canonical completion action. Hom_R(Rhat,E) has the additional nonzero kernel Hom_R(Rhat/R,E) on restriction to R. | Retain the distinction between R- and Rhat-linear Hom. |
| Matlis annihilator identity | N=R,k,0 with E containing k injectively | Both annihilators are respectively 0, maximal ideal, R. Over a field E=k² still gives Ann Hom(k,E)=0, so essentiality is unnecessary. | Retain injective cogenerator condition, not an arbitrary target. |
| Duality annihilator product identity | D, j=0,1 | Ann H⁰=R=Ann Ext⁰; Ann H¹=0=Ann Ext^(−1). Their relevant products agree. | Retain. |
| Dualizing catenarity/dimension function | D; P₂ | Generic-to-closed codimensions 1 and 2; normalized coheight values are (1,0) and (2,1,0). | Retain shift varying with prime. |
| Non-CM locus with equidimensional support | Q; D | V(a(Q))=V(x,y) is exactly its non-CM closed point; V(a(D))=V(D)=∅. | Retain equidimensionality. |
| Defect set without equidimensionality | `R=k[[x,y,z]]/(xy,xz)`, M=R, d=2 | At line generic (y,z): depth0+coheight1<2, true, although the localization is a field. At plane generic (x): 0+2<2, false. At closed point: 1+0<2, true. | Retain separate defect-set statement; cannot call it the non-CM locus. |
| K1.1 d-sequence definition | k with [0], [1]; zero module with any list | For [0], the tested submodule is 0; for [1], multiplication is identity on k; both are d-sequences. Zero module always passes. [1] has terminal quotient0, so this is not regular-sequence terminology. | Retain broad definition. |
| d-sequence order sensitivity | ℤ with [2,0] versus [0,2] | First list: ×2 injective on 2ℤ, then tested image0. Second: ×0 on 2ℤ has kernel2ℤ≠0. | True/false; retain ordered lists. |
| Later-index torsion characterization | `R=k[[t,u]], M=R/(u)⊕R`, [t,u] | ker(tu)=ker(u)=R/(u)⊕0; ker(t)=0. | Retain correction of source Remark 3.9. |
| K1.2 Goto–Yamagishi colon identity | P₂ [x,y], i=2, n=1,2 | `((x):y)∩(x,y)ⁿ` and `(x)∩(x,y)ⁿ` are (x), then (x²,xy). | Retain. |
| Goto–Yamagishi intersection headline | Same instances | `(x)∩(x,y)ⁿ = (x)(x,y)^(n−1)` gives (x)=(x), then (x²,xy)=(x²,xy). | Retain. |
| Positive-exponent boundary in Goto–Yamagishi | k, d-sequence [0], i=1, n=0 | Colon intersection is k; prefix intersection is0. At n=1 both are0. | Retain n>0; no natural-subtraction extension to n=0. |
| K2.1 prefix product | ℤ,[2,3], s=0,1,2,3 | Products are ℤ,(2),(2),(2); the full ideal's square is ℤ. `take` beyond length repeats the full ideal, so definition is total. | Retain, with theorems bounded by length where needed. |
| Prefix-product recurrence and zero entry | `[x,y]` in P₂; `[0,1]` in ℤ | I₁=(x), I₂=(x²,xy)=I₁(x,y); for [0,1], I₁=I₂=0. | Retain empty product as unit. |
| K2.2 three-clause condition | [] on arbitrary M; [t] on D; [t] on k[t]/t² | Empty clauses are identities/injectivity on zero; D passes. On k[t]/t², ×t on tM is0 with tM≠0, so clause(i) fails. | Retain actual predicate, excluding the wrong model. |
| K2 auxiliary quotient quantifier | P₂ rs=[x], auxiliary[y] | Terminal R/x has dimension1; y is secant; quotient R/y=k[[x]]; ×x on (x) is injective. | Retain auxiliary secancy on the terminal quotient. |
| Auxiliary-parameter colon identity | P₂ system[x,y], i=2, auxiliary[x], Λ={2}; P₃ i=3, auxiliary[x,y], Λ={3} | Both colons in the first case equal(y); with Λ empty both are0. In the second both equal(x,z). | Instances pass; primary 1999 locator unreadable. |
| Reversed-prefix d-sequence | `k[[x,y,z]]/(x²,xy)`, CM-secant[y,z] | Reversed [z,y] passes: z regular, then y injective on (y) modulo z. Original [y,z] fails because 0≠xz is killed by y. | Retain reversal. |
| Kawasaki estimate A | P₂, i=j=k=1,l=2,n₁=1,2 | `((x):y)∩(x,y)=(x)`; for exponent2 the intersection and asserted product are (x²,xy). | Instances pass; no source certification of induction. |
| Kawasaki estimate B | P₂, i=j=k=l=2, auxiliary[x], n₂=1,2 | Both sides are (y²), then (y³). P₃, auxiliary[x,y], exponent1 gives (x,z²) on both sides. | Instances pass. |
| Kawasaki estimate C | Same P₂, then P₃ | Inclusions `(y)⊆R`, `(y²)⊆(y)`, and `(x,z²)⊆(x,z)` hold. | Retain inclusion, not equality. |
| Kawasaki estimate D | Same P₂, then P₃ exponent2 | Equalities (y)=(y), (y²)=(y²); in P₃, left=(xz,z²), right=(x,z²), strict inclusion. | Retain inclusion. |
| Kawasaki estimate E | P₂, k=i=j=2, auxiliary[x], v=1; P₃ k=i=j=3, auxiliary[x,y], v=2 | Exponents1,2 give colons (y),(y²) on both sides. P₃ exponent1 gives (x,z) on both sides; the last auxiliary y belongs to a(P₃/z)=P₃. | Instances pass; source verification outstanding. |
| Torsion identity, all m,n>0 | `M=k⊕P₂`, rs=[x,y], auxiliary[]; quotient by xM | Quotient=k⊕k[[y]]. ker(yᵐ)=k⊕0=joint (x,y)-torsion, independent of m>0. ker x is the whole quotient, so using the earlier element alone fails. | Retain. |
| Last auxiliary regularity | P₃ rs=[x,y], auxiliary[z]; P₂ rs=[x], auxiliary[y] | Multiplication kernels are0 on R, R/(x,y), R/[x(x,y)]ⁿ; also ker y on R/(xⁿ)=0 for every n>0. | Retain primed auxiliary element. |
| Empty prefix in auxiliary regularity | D rs=[], auxiliary[t] | ker(t:D→D)=0; I₀ⁿ=D, quotient0, kernel0. | Retain empty-product convention. |
| Kawasaki proposition headline | Q CM-secant[y]; P₂ CM-secant[x,y] | Q: ×y on yQ injective; all positive y-power torsion is kx. P₂: reverse[y,x] regular; on R/xⁿR, ker yᵐ=0=joint torsion. | Retain including nonregular CM-secant example. |
| Robustness under auxiliary quotients | P₃ rs=[x,y], auxiliary[z]; empty list | Mod z gives P₂ and the same zero colon kernels; empty auxiliary quotient gives the original module and identical three clauses. | Retain. |
| K3.1 Rees module/degree zero | ℤ,I=(2),M=F₂; I=0; I=R | First degree0=F₂, every positive degree0; tensor alternative has degree1 F₂. For I=0 only degree0 survives; I=R gives M[t]. | Retain image construction; R02 for labels. |
| Rees coefficient membership and extensionality | ℤ,I=(2),M=ℤ, polynomials2t and t | 2∈2ℤ so 2t belongs; 1∉2ℤ so t does not. Equal coefficient lists give the identical polynomial-module element. | Retain prose API. |
| Rees action and maps | Same ring, f=×3, g=×5 | 2t·1=2t and 2t·2t=4t² with 4∈I²; f(2t)=6t, g(f(2t))=30t=(g∘f)(2t); identity gives2t. | Retain convolution/functorial API in README. |
| K3.2 chart carrier/action | ℤ,I=(2),a=2; I=R,a=1; a=0 | Chart rings are ℤ, R, zero ring respectively. Span of image F₂ at a=2 is0, at a=1 is F₂. | Retain native subalgebra and restricted action. |
| Chart annihilator criterion | ℤ,F₂,a=2 and a=1 | At a=2, both annihilators are the whole chart ring because image and span are0. At a=1 both are(2). | Retain. |
| Tensor-to-chart kernel | ℤ,I=(2),M=F₂,a=2 | Tensor source=F₂, image=0, kernel=F₂; it is exactly the 2-power torsion. After inverting2 both sides0. | Retain surjection, not a tensor isomorphism. |
| Principal chart and regularity | `R=k[[x,y]]/(xy)`, I=(x),a=x | x-power torsion=(y); chart module=R/(y)=k[[x]], on which ker x=0. | Retain quotient by power torsion. |
| Chart maps/zero/unit/ring cases | f=×3 on ℤ,a=2; M=0; I=R,a=1; M=R | 1↦3 and compositions multiply scalars; zero→zero; M_(1)=M; span of imageR is the chart ring. | Retain. |
| Chart finiteness | M=R², any chart | Images of (1,0),(0,1) generate; M=0 needs zero generators. The tensor source surjects, so no flatness required. | Retain finite-module hypothesis. |
| Homogeneous localization comparison | ℤ,I=(2),M=ℤ, a=2 | Degree-zero fraction `(2ⁿm)tⁿ/(2t)ⁿ` maps to m, and inverse sends m to m/1. For M=F₂ all such localized classes vanish. | Retain module comparison on supplied sheaf carrier. |
| K3.3 generic Proj sheaf | S=k[t], N=S; N=k concentrated in degree0 | Degree-zero localized modules are k and0, hence sheaves O and0 in both K3.3 and supplied gradedTwist at0. | R01: one owner/carrier. |
| Shift/transition convention | S=k[X₀,X₁], N=S(-1) | Generator degree1; local frames1/X₀,1/X₁ satisfy `1/X₀=(X₁/X₀)(1/X₁)`. Degree −1 twist has zero global sections. | R01: agrees with AdicSpacesPartIII. |
| General grading negative control | S=A[t], deg t=2, N=S(1) | N_(t)=0 since N_(2k)=S_(2k+1)=0. Thus arbitrary twists are not automatically invertible. | Retain unrestricted grading, no false invertibility API. |
| Sheaf maps and exactness | S=k[t], sequence S(-1) —t→ S → k | Sheaf sequence is `0→O —iso→ O→0`; cokernel sheaf0 although cokernel modulek≠0. A scalar map ×c remains ×c on the chart. | Existing polynomial case imported; general extension may remain. |
| Tail invariance | S=k[t], inclusion tS→S | Localize at t: both degree-zero pieces=k and map is identity. Omitted degree0 quotient=k has sheaf0. | Retain extension on supplied carrier. |
| Module blowing-up and off-centre map | ℤ,I=(2),M=F₂; I=R; I=0 | Blow-up module=0 in first case, M for unit ideal, sheaf on empty scheme for zero ideal. Off V(2), pullback and blow-up module are both0. | Retain image and off-centre comparison. |
| Chartwise CM predicate | Zero module; I=0; I=R,a=1 on Q | Zero stalks satisfy vanishing; zero ideal has no chart primes; Q has nonzero H⁰=kx below dim1 and fails. | True/true/false: not a vacuous predicate on nonempty charts. |
| Sheaf-CM/chart-CM iff | D,I=(t); Q,I=R | First all nonzero local stalks have depth=dimension (1 at closed point,0 generic); second fails at its dimension1 closed stalk. | Both directions agree on positive/negative examples. |
| K3.4 strict transform | ℤ,F₂,I=(2); node R,I=(x); I=R | Pullback F₂ loses all exceptional-supported sections, giving0. Node loses(y), giving k[[x]]. Unit ideal removes no sections and givesM. | Retain arbitrary-blow-up extension of the dense-open supplier. |
| Rees/strict-transform comparison | Same three examples | Rees sheaves and strict transforms respectively 0/0, k[[x]]/k[[x]], M/M. | Retain; not an identification with pullback. |
| K3.5 product-of-ideals scheme identity | P₂,I=(x),J=(x,y); node I=(x),J=(y) | On product chart x² the algebra is R[y/x], identical to the iterated chart. On node, IJ=0 and both iterated/product blow-ups are empty. | Retain even with zero divisors. |
| Product-of-ideals module identity | P₂,M=R/(x), I=(x),J=(x,y) | Blow up J first: y-chart module=k[[y]], then x-localization kills it; product chart module also0. Unit-ideal iteration gives M=M. | Retain torsion removal at each stage. |
| K3.6 schematic support | P₂,M=R/(y),I=(x,y); ℤ,M=F₂,I=(2) | First x-chart support is V(y/x), dimension1, equal to blow-up of Spec R/(y). Second restricted ideal=0 on F₂, so both supports are empty. | Retain schematic image, not full inverse image. |
| Finite-type height inequality | k→k[t], q=(t),0; k[x]→k[x,t], q=(x,t) | Values `1+0≤0+1`, `0+1≤0+1`, `2+0≤1+1`. | Retain inequality without universal catenarity. |
| Rees-dimension bound | D,J=(t),0,D; zero ring | Dimensions 2≤2, 1≤2, 2≤2; zero-ring values ⊥≤⊥. | Retain inequality; equality would fail at J=0. |
| Proj dimension bound | Rees of D,(t); D,0 | Nonempty case `dim Proj+1=1+1=2=dim Rees`; zero ideal gives empty Proj, dimension⊥. | Retain nonempty condition for chain argument. |
| Support-dimension headline | P₂,M=R/(y),I=(x,y); ℤ,F₂,I=(2); M=0 | Chart support dimensions 1≤1, ⊥≤0, ⊥≤⊥ respectively. | Retain genuine support dimension. |
| K4.1 regular-element reduction | P₂,rs=[x], auxiliary y | Degree-n comparison is `xⁿR/yxⁿR = xⁿk[[x]]`; ker y on each quotient0; dimensions decrease2→1. | Retain terminal regularity. |
| Reduction negative control | Same rs, choose auxiliary x | `xR/x²R≠0`, whereas x(R/xR)=0; degree1 comparison fails. For M=0, injectivity alone holds but [0] is not secant. | Retain terminal regularity and M≠0. |
| K4.2 first stages | s=0; Q,rs=[y] | I₀=R gives M; Q/y-power torsion=Q/(x)=k[[y]], depth1. | Retain. |
| Two-generator relation direction | P₂,a=x,b=y, chart denominator y | x/y satisfies yT−x=0; substituting into xT−y gives x²/y−y, generally nonzero. | Retain bT−a consistently. |
| Torsion in two-generator presentation | Node R, denominator x, relation xT−y | Relation gives x²T=0; removing x-power torsion kills T and y, leaving k[[x]], matching R[(x,y)/x]. | Retain torsion quotient. |
| Closed-fibre polynomial generality | Residue field F₂, polynomial T²+T+1 | f(0)=f(1)=1, so f is irreducible of degree2; the residue extension has four elements. Monicity still makes multiplication injective on L[T]. | Retain arbitrary monic irreducible lift, including non-rational points. |
| K4.3 annihilation claim | M=(x,y) in P₂, rs=[x,y] | Intermediate module is M; H¹_(x,y)(M)=k from `0→M→R→k→0`. x·k=y·k=0, but 1·k=k≠0. | Nonzero witness for both annihilators. |
| Annihilation with nonregular original list | `R=k[[x,y,z]]/(x²,xy)`, rs=[y,z] | First chart removes(x), giving k[[y,z]]; H¹_(y,z)=0, although y was a zero divisor on R. | Retain no original regularity hypothesis. |
| Vanishing claim and sharp cutoff | P₃, rs=[x,y,z], closed x-chart C with y=xT | C has parameters x,z,T and dimension3. H¹_(x,z)(C)=0; H²_(x,z)(C)≠0 but H⁰_max of it=0. Its H¹_max is H³_max(C)≠0. | Vanishing at j<1 holds; extending to j=1 fails. |
| Vanishing small-s boundary | s=2 | Required outer degree j<0 has no natural solutions. The claim imposes no accidental j=0 vanishing. | Retain integer/natural cutoff handling. |
| Relation kills H¹ | P₂,N=(x,y), a=x,b=y | H¹(N)[T]=k[T]; ×(yT−x)=0 because both coefficients act0. | Retain both annihilator hypotheses. |
| Relation negative control | P₂,N=R/(xy) | H¹_(x,y)(N) has y-branch class y^(−2); `(yT−x)y^(−2)=Ty^(−1)≠0`. | Arbitrary N without annihilation does not suffice. |
| K4.4 closed-point depth headline | P₂,rs=[x,y]; Q,rs=[y] | Closed blow-up chart depths2≥2 and1≥1. Generic point on first chart has depth0, so the closed-fibre/maximal-prime conditions matter. | Retain explicit prime hypotheses. |
| Depth s=0 and zero modules | Empty prefix; zero localized module | j<0 selects no degrees; zero local cohomology groups remain subsingleton for every j. | Retain valid boundary cases inside the headline, not separate Lean padding. |
| K4.5 weaker Kawasaki theorem | P₂ rs=[x,y]; Q rs=[y]; field rs=[] | Conditions hold and terminal quotient dimensions0; resulting chart depth/dimension pairs (2,2),(1,1),(0,0). | Retain terminal CM in addition to secancy/conditions. |
| CM-secant Kawasaki headline | Same examples; zero M | CM-secant gives the conditions; output pairs above agree. Zero M gives zero sheaf and all local vanishings. | Retain nonregular and zero cases. |
| K4.6 Huckaba algebra and CM source ring | u=x³,v=x⁵y³,w=x¹⁵y²,z=y⁷ | v³=wz has exponent(15,9); w⁷=u³⁵z² has exponent(105,14). The 21 monomials vⁱwʲ, 0≤i<3,0≤j<7, have 21 distinct residues modulo(3,7), giving free rank21 over k[u,z]. Local depth=dimension=2. | Retain all fields. |
| Huckaba chart and non-CM conclusion | a=x³,b=x⁵Y³,c=x¹⁴Y²,d=x⁴Y⁷ | b²¹=a²³d⁹ and c²¹=a⁹⁰d⁶ make (a,d) parameters. c²/a would have exponent(25,4), absent from the semigroup; hence c² mod a is nonzero. dc²=ab³c has exponent(32,11), so d kills that class. Chart depth1<dimension2. | Retain headline counterexample. |
| Huckaba characteristic control and wrong centre | k=F₂,F₃; centre(u,z) instead of maximal ideal | The exponent identities and 21 residue classes do not change in either characteristic. The parameter centre satisfies the CM-secant theorem; the maximal-ideal chart still has the nonzero killed class. | Retain arbitrary field and exact centre. |
| Worked examples consistency | Q,[y]; ℤ,[2,3]; ℤ,F₂,(2); later torsion index; Huckaba | Outputs respectively k[[y]], (2) rather than ℤ, zero rather than F₂, ker(tu)=ker u≠ker t, and depths1 versus2 as above. | All five worked examples agree with the targets. |
| Source-only p-standard existence test | P₂, M=R⊕R/(x), d=2 | H¹ has annihilator(x), so a(M)=(x), dim R/a(M)=1. Type0 would require both parameters in(x), leaving quotient dimension≥1. Type1 exists as [y,x]. | The reversed inequality after Kawasaki 1996 Definition 2.5 is not used by this roadmap. |

The 103 computed rows above cover all named targets and the supplied convention checks. API identities were also evaluated on the stated modules: quotient maps commute, scalar-induced maps preserve degrees and composition, truncation becomes the identity after localization, and product-chart spans agree. The four definitions of module/predicate data with serious wrong alternatives are distinguished explicitly: image versus tensor Rees module, image versus tensor chart module, ordered d-sequences versus unordered lists, and the actual local-cohomology CM condition versus a free proposition. There is no denominator used without localization or the relevant regularity hypothesis.

### Pinned-library and ownership audit

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are the manifest revisions, not a newer library checkout. The following 14 groups record declarations inspected at those pins; paths in this table are relative to the respective library repository.

| Group | Pinned declaration and location | What it supplies / what it does not supply |
| --- | --- | --- |
| Local cohomology | `localCohomology`, `Mathlib/Algebra/Homology/LocalCohomology.lean:173`; `localCohomology.isoOfSameRadical`, line 261 | Ext-colimit definition and radical invariance over a Noetherian ring; no assumption that Čech comparison is already proved there. |
| Support dimension | `Module.supportDim`, `Mathlib/RingTheory/KrullDimension/Module.lean:32`; `supportDim_eq_bot_iff_subsingleton`, line 43; `supportDim_eq_ringKrullDim_quotient_annihilator`, line 49 | Dimension of support, zero-module bottom, and finite-module annihilator-quotient comparison. |
| Dimension drop | `Module.supportDim_le_supportDim_quotSMulTop_succ`, `Mathlib/RingTheory/KrullDimension/Regular.lean:141`; avoidance equality, line 151; `supportDim_quotSMulTop_succ_eq_supportDim`, line 157 | Section binders at lines 28–29 impose Noetherian ring and finite module; the local results also require the element in the maximal ideal. |
| Local rings and lists | `IsLocalRing`, `Mathlib/RingTheory/LocalRing/Defs.lean:30`; `Ideal.ofList`, `Mathlib/RingTheory/Regular/RegularSequence.lean:41` | Local rings explicitly extend `Nontrivial`; list ideal is the span of entries, not their product. |
| Polynomial modules | `PolynomialModule.coeff_inj`, `Mathlib/Algebra/Polynomial/Module/Basic.lean:79`; `single`, line 131; `smul_apply`, line 228; `map`, line 293; `map_smul`, line 308 | Finite polynomial coefficient carrier, convolution and genuine linear maps. This is adequate for the proposed image Rees module. |
| Rees algebra | `reesAlgebra`, `Mathlib/RingTheory/ReesAlgebra.lean:40`; `mem_reesAlgebra_iff`, line 65; `reesAlgebra.fg`, line 116 | Coefficientwise ideal powers and finite generation from a finitely generated ideal. The ring-as-module Rees construction must use this carrier. |
| Localized modules | `LocalizedModule.moduleOfIsLocalization`, `Mathlib/Algebra/Module/LocalizedModule/Basic.lean:363`; `mkLinearMap`, line 481 | Native localization and its scalar action; no injectivity of M→M[1/a] without an additional hypothesis. |
| Scheme modules/affine tilde | `Scheme.Modules.presheaf`, `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:89`; `pullback`, line 182; `AlgebraicGeometry.tilde`, `Modules/Tilde.lean:152`; `tilde.map`, line 202 | Actual sheaf carriers and affine associated modules. Affine tilde is not generic graded-module sheafification on Proj. |
| Proj chart and polynomial dimension | `AlgebraicGeometry.projIsoSpec`, `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:847`; `Polynomial.ringKrullDim_of_isNoetherianRing`, `Mathlib/RingTheory/KrullDimension/Polynomial.lean:106` | Positive-degree standard chart and Noetherian polynomial dimension formula. |
| Rees grading | `reesAlgebra.grade`, `TauCeti/RingTheory/ReesAlgebra/Grading.lean:57`; `gradedMonoid`, line 85; `isInternal_grade`, line 145; `gradeZeroEquiv`, line 167; `monomialDegreeOne`, line 198 | The grading, degree-zero ring and actual element at, not a second proposed grading. |
| Affine blow-up algebra | `Ideal.affineBlowup`, `TauCeti/RingTheory/Ideal/AffineBlowup.lean:60`; `mem_affineBlowup_iff`, line 134; `map_algebraMap_affineBlowup`, line 146; `isRegular_algebraMap_affineBlowup`, line 157; `affineBlowupLift`, line 222 | Native subalgebra; membership criterion needs a∈I; universal lift needs regularity on its target, not merely ideal divisibility. |
| Rees/chart comparison | `reesAlgebra.awayEquivAffineBlowup`, `TauCeti/RingTheory/ReesAlgebra/AffineBlowup.lean:140` | Ring homogeneous-localization comparison, not the module analogue. |
| Blow-up chart cover | `TauCeti.AlgebraicGeometry.affineBlowupι`, `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean:61`; range, cover and structure-map theorems, lines 70,76,87 | Actual scheme charts, cover by a generating family and compatibility over Spec R. |
| Injective torsion | `injective_primaryComponent`, `TauCeti/Algebra/Module/Injective/Noetherian.lean:61` | Injectivity of ideal-power torsion in the Noetherian setting; imported rather than rebuilt in K0.1. |

I searched by objects as well as names: local-cohomology comparisons, ideal-power torsion, secant/d-sequences, Rees modules, graded-module sheafification, strict transforms, affine blow-up charts, support dimension and CM modules. I used `roadmaps grep`/`roadmaps show`, searched main and the available open-head files and board packages, and read the matches before relying on them. In particular, a search only for `Proj.tildeModule` would miss the owner named `gradedTwist` in R01. No duplicate fully qualified name from this `Suggested.lean` was identified in the readable roadmap files. This is not a claim about unprovided private/open work.

The main checkout was `4d14cbd5ba21a1804ca78c9989b9ea485bcfad08`. I resolved the following cross-roadmap contracts there, except the explicitly identified new open supplier:

| Supplier | Resolved file/section and lines | Contract checked |
| --- | --- | --- |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:551–583`, §0.3 | Relative Proj, twists, affine comparison and agreement with StableReduction; degree-one hypotheses belong to invertibility statements. |
| SchemeAndStackFoundations | Same file, §0.16 at 1099–1122; §0.17 at 1138–1168; §0.18 at 1254–1268 | Catenarity, depth and CM modules/sheaves, including zero modules and support-restricted equality. |
| SchemeAndStackFoundations | Same file, §2.7 at 3493–3517 | Local/sheaf cohomology with supports, comparison, flat base change and depth detection. |
| SchemeAndStackFoundations | Same file, §2.18 at 3970–3983; §2.21 at 4390–4405 | Derived affine equivalence, dualizing complexes and normalized localization shift. The normalization is not an unqualified degree-zero object at every prime. |
| SchemeAndStackFoundations | Same file, §4.11 at 5538–5571 | Strict transform along a modification with a chosen dense open. K3.4 explicitly extends to arbitrary blow-ups, which justifies keeping that extension. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516–542`, §0.K.1 | Koszul complex, tensor convention and homotopies needed in the torsion argument. |
| DerivedModuleAlgebra | Same file, §1.3 at 1733–1756; §1.5 at 1809–1818 | Derived completion and comparison with ordinary completion on finite cohomology. |
| DerivedModuleAlgebra | Same file, §§1.M.1–1.M.2 at 2242–2264,2290–2305 | Injective hull, completion action and Matlis duality; the latter section supplies arbitrary residue fields, avoiding a finite-field restriction. |
| AdicSpacesPartII | `TauCetiRoadmap/AdicSpacesPartII/README.md:1149–1179` | Localization Čech complex; exactness is invoked for a unit-ideal chart cover, not for an arbitrary support ideal. |
| DGFloer | `TauCetiRoadmap/DGFloer/README.md:612–649`, Layer 1 item 3 | Filtered-complex spectral sequence with convergence hypotheses. Here the Čech filtration is finite, so the stated application meets them. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:468–473`, Layer 4 | Blow-up and strict-transform geometry; finite-type/properness inputs used in the Noetherian finite-module applications. |
| ArithmeticGaloisDuality | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4799–4840`, D7.1, new-roadmap open head `1510b10` | Complete-coefficient local duality. The target's noncomplete module comparison is a genuine extension, not an unrestricted use of this supplier. |
| AdicSpacesPartIII | `TauCetiRoadmap/AdicSpacesPartIII/README.md:3914,3950–3976`, F0.9 | Generic graded twists/associated sheaf, yielding R01. |
| GroebnerGeometry | `TauCetiRoadmap/GroebnerGeometry/README.md:252,370–375`, G4 | Existing projective-space graded sheafification charts/exactness and specialized comparisons, yielding R01. |

The base DeformationAndDerivedPatchingAlgebra roadmap, at the indexed new-roadmap head `7b0ba72`, explicitly consumes this Part II's commutative-algebra strand; I did not turn that later consumer into a supplier. Outside R01, the additional ownership searches found ring Rees algebras/charts already supplied and the derived/filtered Rees constructions distinct from the image module `⊕IⁿM` here. The latter and the Kawasaki annihilator/colon/depth development belong here. Open-head ownership was checked against the supplied/readable files and the prescribed roadmap index, not against hypothetical unseen pull requests.

The 19 citation-resolver leads were inspected rather than counted as missing suppliers. Names such as `Module.IsCohenMacaulay`, `NormalizedDualizing.localization_shift` and derived completion are roadmap contracts, not claims of pinned library declarations. `ChartRing.moduleLocalizedModule` exists in this Lean file. The other own API labels are covered by R02. There is no independently confirmed missing supplier target in those leads.

Within K3 the dependency on homogeneous module localization precedes the chart comparison explicitly; it does not create a mathematical cycle. K2's A–E are stated as one simultaneous induction on interval length, rather than assuming a target from its conclusion. The deeper source induction is not certified here because its text was unavailable.

### Headline completeness and Lean form

The README's headline list, all represented in `Suggested.lean`, is:

| Headline | Declaration line | Result of signature/padding review |
| --- | --- | --- |
| Schenzel's positive-power torsion bound | 94, `schenzel_torsion_bound` | Nonempty secant list, positive exponent, finite module and finite support dimension retained. |
| Extend CM-secant list to parameters | 103, `isCMSecant_exists_append` | Explicit nontrivial module; zero-dimensional terminal quotient. |
| Goto–Yamagishi intersection identity | 128, `goto_yamagishi_intersection` | Arbitrary commutative ring/module; positive exponent and valid index. |
| Every CM-secant prefix satisfies Kawasaki's conditions | 176, `kawasakiConditions_take_of_isCMSecant` | Actual three-clause predicate and bounded prefix index. |
| Chart support-dimension bound | 214, `supportDim_chartModule_le` | Actual chart module and a∈I; no domain or regularity restriction. |
| Closed-point depth induction | 237, `depth_ge_of_kawasakiConditions` | Actual localized chart module, maximal chart prime lying over the maximal ideal, all initial-prefix conditions. |
| CM blowing-up under weaker hypotheses | 254, `isCMBlowupChartwise_of_kawasakiConditions` | Secancy, all prefix conditions and terminal CM all present. |
| CM-secant blowing-up theorem | 264, `isCMBlowupChartwise_prefixProduct_of_isCMSecant` | Actual prefix product and all chart primes, including zero stalks. |
| Huckaba counterexample over any field | 296, `huckaba_not_isCMBlowupChartwise_maximalIdeal` | Concrete monomial subalgebra/localization and its actual maximal ideal; no field-characteristic narrowing. |

I elaborated scratch copies with `#check @name` for all **29 declarations**: 25 named declarations plus the four generated anonymous-instance names. The expanded types agree with their stated hypotheses; no required Noetherian, finiteness, locality or scalar-action binder disappeared. No signature change was made or is requested.

For every one of the nine sorried theorems I tried the single tactics `simp`, `rfl`, and `infer_instance` on a copy, using `solve` to reject partial progress. **All nine still required `sorry`.** The pinned object searches above found no matching single library lemma for these new statements; in particular, the available regular-sequence dimension and ring Rees-chart lemmas do not imply the general CM-secant headlines by one `exact`. There is no demonstrated padding declaration to delete.

The docstring explicitly names the unstated dualizing-complex results and the sheaf strict-transform/product/support results, with their missing carriers. The local-cohomology and chartwise predicates used in Lean have real bodies on native carriers, so the stated chartwise theorems are meaningful acceptance tests. The omitted geometric headlines must eventually use the existing roadmap sheaf carrier identified in R01; that carrier is planned on main, not already present in the pinned libraries. The remaining auxiliary estimates are supporting targets, not missing replacements for these nine headlines.

Every layer has Examples and Dependencies; the substantive definitions have API descriptions and at least three discriminating Checks. Those Checks distinguish zero modules, empty lists, unit/zero ideals, nonregular parameters, torsion, non-equidimensional support, characteristic 2/3 and graded-shift direction. The principal shape defect found in the audited API text is R02. The README remains the development plan and the Lean file contains only headlines and supporting real definitions/instances.

## Not verifiable

- **`kawasaki1999`:** The exact primary statements and simultaneous proof of Propositions 3.2–3.5, p. 5, and Theorem 3.6, equations (3.6.1)–(3.6.5), p. 6, proof pp. 6–13, including sampled estimate E. I tried the author publication page and its compressed DVI through the sources service; it rejected the document format. I also tried DOI `10.1090/S0002-9947-01-02817-3` and the old/current AMS PDF routes. The latter returned a journal index rather than the article, despite a service “fetched” result. I did not treat those files as theorem text or assume published numbering agrees. The finite ideal computations above certify only their displayed instances.
- **`kawasaki2000`:** Original §§2–3 statements/proofs and the five corrections reported by Česnavičius. DOI `10.1090/S0002-9947-00-02603-9` and publisher PDF routes likewise did not yield readable article text. The roadmap labels these historical references and supplies directly readable statements in Česnavičius; their primary-source verification remains incomplete. The institutional symposium-paper search result has a similar title but does not certify the cited journal locators.
- **`schenzel1982`:** The original LNM 907, §2.4.2 historical locator was not readable through the service's legal-source search. The torsion statement actually used was checked in `cesnavicius` line 397, Remark 3.3, and `kawasaki1996` line 88, Lemma 2.4, with the positive-power extension tested above.
- **`huneke1982`:** The service reported the original Advances in Mathematics article as uncertified/paywalled. Its role here is historical attribution, and I did not request it again or add it as a new missing-text request. The d-sequence definition and identities were checked in the accessible sources instead.

The missing-reference record retains the three unresolved works under their existing keys. No source manifest, source text, roadmap or merge-order file was edited. This review is finished with the stated limitations; it is not a claim that an unavailable text has been verified.

## Source issues

- **Error** in cesnavicius at §1.14, printed p. 4, line 156: the source says CM means depth equals support dimension at every point, including zero stalks; it should restrict the equality to the support, since zero has depth ∞ and support dimension −∞; affects a stated result.
- **Misprint** in cesnavicius at Remark 3.9, printed p. 12, line 485: the source says the earlier element's torsion equals product torsion; it should use the later element's torsion; affects a stated result.
- **Misprint** in cesnavicius at Proposition 3.11(iii), printed p. 13, line 515: the source says an unprimed sequence element is the regular auxiliary element; it should use the last primed auxiliary element; affects a stated result.
- **Misprint** in cesnavicius at the proof of Theorem 3.14, printed p. 15, line 595: the source says every factor of I_s is the full s-generated ideal; it should make the i-th factor the i-th prefix ideal; affects the proof.
- **Misprint** in cesnavicius at equation (3.14.10), printed p. 16, line 650: the source says multiplication by aT−b vanishes after using the sequence with relation bT−a; it should use bT−a consistently, although both annihilate under the stated hypotheses; affects the proof.
- **Misprint** in kawasaki1996 after Definition 2.5, printed p. 42, line 100: the source says p-standard parameters of type s exist when s≤dim A/a(M); it should require s≥dim A/a(M), with the usual type range; affects a stated result.
