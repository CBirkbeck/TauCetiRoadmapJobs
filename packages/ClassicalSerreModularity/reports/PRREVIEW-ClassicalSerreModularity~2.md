# Review of ClassicalSerreModularity (pull request #1020 at 1d19567)

**Verdict:** needs changes

## R01 (P1) — Supply the global hypotheses of the conditional Breuil–Mézard inputs

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:1006`: “Tung's deduction at `p = 3` with the arithmetic-action and support-to-cycle hypotheses stated there”. The same paragraph invokes the dyadic patched data.

**Claim.** The unconditional general-weight Fontaine–Mazur theorem follows from the listed local identities and the potentially Barsotti–Tate patching data of I.2. The missing step is precisely the construction and verification of the arithmetic-action, all-type component-support and generic-multiplicity comparisons assumed by the local supplier. Naming those hypotheses does not discharge them. I.2 supplies weight-two finite-level patching; it does not state this general-weight completed-action comparison.

**Witness.** `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:2293`, §6.3, explicitly assumes globalization, component support and generic multiplicities; §6.5, line 2334, assumes the dyadic analogues. Neither constructs them. For a domain A, A and A⊕A have equal support but generic multiplicities 1 and 2.

**Repair.** Add named targets here constructing the actual global patched module and arithmetic action, identifying each type quotient with the specified local deformation ring, and proving component support and the generic-multiplicity comparison, including the exceptional characteristic-three and scalar dyadic cases. Give their precise hypotheses and noncircular dependencies; consume those targets before applying §§6.3 and 6.5. Alternatively cite an earlier owner that actually supplies all those conclusions. The repaired multiplicity condition must distinguish A from A⊕A; a support-only target fails this test. This is the remaining portion of the previous R01, not an objection to owning the rational lifting theorem here.

## R02 (P2) — Retain the Tate twist in the general Hodge-weight statement

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:1006`: “de Rham at `p` with distinct Hodge–Tate weights ... Then `ρ` is modular”. Both odd and dyadic clauses have this wording.

**Claim.** Arbitrary distinct Hodge–Tate weights give an un-twisted classical modular representation. The cited statement only gives that conclusion after normalization to weights `{0,k−1}`. The adjoining Pan target correctly retains “up to twist”.

**Witness.** dp line 144 and dp line 159 require `{0,k−1}`, `k>1`. Twisting an admissible weight-two representation at p=5 by χ₅⁴ preserves its reduction and oddness but changes `{0,1}` to `{4,5}`; a normalized classical attachment has a zero weight.

**Repair.** State the general conclusion as modular up to cyclotomic twist. For weights `{a,b}`, a<b, explicitly normalize by χ_p^(−a), obtain weight b−a+1, and recover ρ by twisting back. State the un-twisted corollary for `{0,k−1}` used by the chain. On the witness, χ₅^(−4) restores `{0,1}`; both residual and determinant-parity conditions are unchanged by χ₅⁴.

## R03 (P2) — Make the two local prescriptions compatible

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:235`: “`S′` a further finite set of places ... every place of `S′` splits completely”.

**Claim.** The quantified local-completion and splitting conditions can be imposed simultaneously. “Further” does not specify the needed relation between the two sets.

**Witness.** Take K=D=ℚ, S=S′={2}, and E₂/ℚ₂ unramified quadratic. The prescribed completion has degree 2, whereas complete splitting requires degree 1. Both input sets are finite and the prescribed extension is Galois.

**Repair.** Require E_v=K_v for v∈S∩S′, or explicitly take S and S′ disjoint when presenting the disjoint-set version. The compatibility formulation preserves the larger valid domain. Add this negative control: the degree-two overlap is excluded, while trivial prescribed completions on an overlap satisfy both conditions with local degree 1.

## R04 (P1) — Ordinary powers converge; they do not stabilize on a finite module

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:279`: “the powers `U_p^{n!}` stabilise on each finite-level finite `𝒪`-module”.

**Claim.** Finite generation over the coefficient DVR makes the sequence eventually constant. This Check gives a false justification for the ordinary projector. A finite 𝒪-module here need not be a finite set.

**Witness.** On M=ℤ₃ with U multiplication by 4, the first powers are 4,16,4096; no tail is constant in ℤ₃. Nevertheless v₃(4^(n!)−1)=1+v₃(n!) tends to infinity, so the limit is 1.

**Repair.** State stabilization on M/πᵃM separately for every a, and pass to the inverse limit using completeness of finite modules over 𝒪. On the witness, the powers modulo 9 are 4,7,1 and thereafter 1, while their limit on M is the identity. Retain the topologically nilpotent branch, whose limit is zero, and distinguish this limit from literal stabilization.

## R05 (P2) — State what the ordinary control map proves

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:272`: “with the kernel and cokernel the source allows”.

**Claim.** This is the control theorem used to change parallel weight in I.0, but it gives no condition on either kernel or cokernel, and no precise smallness or localization domain. An implementer cannot tell whether integral specialization, specialization after inverting p, or only a correspondence of characteristic-zero eigensystems is required.

**Witness.** sw99 line 1091 puts a free-action hypothesis on its module theorem; sw99 line 1110 gives a separate arbitrary-level finiteness result. A→A and A→A/(π) both satisfy the bare existence-of-a-map clause, with kernels 0 and (π), respectively.

**Repair.** Replace the quoted clause by the actual control statement, specifying the arithmetic character, level, relevant module or Hecke algebra, localization, and exact kernel/cokernel conclusion. Separate the small-level integral statement from its arbitrary-level or characteristic-zero consequence, and name the consequence used to change weight in I.0. An isomorphism or characteristic-zero eigensystem comparison must exclude A→A/(π), whose generic fibre is zero, while admitting the identity. This asks for the theorem's mathematical contract, not a stronger integral isomorphism than the source proves.

## R06 (P3) — Use a Frobenius example that detects inversion

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:141`: “`u² + u + 1 = 0` ... arithmetic Frobenius sends it to `u²`, and geometric Frobenius reverses the action”.

**Claim.** This is the convention Check distinguishing arithmetic and geometric Frobenius. On 𝔽₄ both actions are identical, so the proposed wrong convention passes.

**Witness.** For this u, u⁴=u. Squaring has order 2; its inverse also sends u to u². Thus both sides of the purported discriminator evaluate to u².

**Repair.** Use u∈𝔽₈ with u³+u+1=0. Arithmetic Frobenius gives u², while its inverse gives u⁴=u²+u≠u². Keep the 𝔽₄ example only as a residue-characteristic check. The corrected example also checks the native arithmetic exponent in `IsArithFrobAt`.

## R07 (P3) — Apply the required roadmap namespace and layer shape

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/Suggested.lean:34`: “namespace TauCeti.SerreConjecture”; `TauCetiRoadmap/ClassicalSerreModularity/README.md:1311` repeats it. For example, Layer R26.1 starts at line 455 and proceeds to R26.2 without the required closing subsections.

**Claim.** The file presents roadmap targets in the library's namespace, and the README does not consistently use the required per-layer Examples and Dependencies sections. Several definition APIs and Checks are pooled, rather than giving three discriminating Checks per definition.

**Witness.** The Lean file has 20 declarations in `TauCeti.SerreConjecture`; the required namespace is `TauCetiRoadmap.ClassicalSerreModularity`. `IsFrobAt` has only the r=1 and quadratic-residue-field Checks, the latter failing the convention test in R06.

**Repair.** Rename the namespace and the matching README reference; use the required “target signatures” module title. Add the missing layer-ending subsections without duplicating target statements, and give each kept definition its API and three discriminating Checks. Re-elaborate the same five headline theorems and all signatures after the rename. This is presentation policy; no native-library collision or false Lean theorem was found.

## R08 (P3) — Undo the previous review's off-by-one page correction

**Location.** `TauCetiRoadmap/ClassicalSerreModularity/README.md:299`: “Lemma 2.2, p. 192, and Theorems 5.1–5.2, pp. 204–205”.

**Claim.** These are printed page numbers. The previous review incorrectly added the Numdam cover page when calculating them; the repair faithfully followed that incorrect advice.

**Witness.** sw01 line 24 starts printed p.185 on PDF page 2. Visual inspection shows Lemma 2.2 on printed p.191 (PDF 8), Theorem 5.1 on p.203 (PDF 20), and Theorem 5.2 on p.204 (PDF 21).

**Repair.** Cite Lemma 2.2, p.191, and Theorems 5.1–5.2, pp.203–204. These printed page footers were inspected directly, not inferred from the previous review. This correction concerns the review's arithmetic, not an error in Skinner–Wiles.

## Verified sound

### Previous findings, assessed before the full review

| Previous finding | Passage at this head | Assessment |
| --- | --- | --- |
| R01: lifting inputs had no owned construction | README 246: “prove the integral-point theorem for incomplete Skolem data”; 270: “nearly ordinary Hecke algebras, pseudo-deformation rings and pro-modularity argument ... are targets”; 356: matching-weight crystalline comparison | **Partly repaired.** Moret-Bailly, ordinary pseudo-deformations, arithmetic finiteness, classical lifting and Pan's auxiliary vanishing are now expressly owned. R01 above identifies the remaining conditional arithmetic-action input. R02 and R05 concern the new statements themselves. |
| R02: stale supplier locators | README 51–67 and 204–218 use the new exact supplier sections | **Repaired as a locator issue.** R15.3/R15.4 are explicitly sanctioned aliases in AlgebraicModularFormsAndSerreWeights, README 18. Their resolver warnings are false positives. The conditional content of the local Langlands supplier is a separate substantive issue. |
| R03: names claimed in README but absent from Lean | README 390–455 describes the system constructions in prose; the compiled names are enumerated at 1311–1315 | **Repaired.** The gate reports zero missing README identifiers; the 20 actual declarations agree with that list. |
| R04: nonexistent reduction map between different residue characteristics | README 1073: “No coefficient map from `𝒪 = ℤ_q[μ_q]` to a field of characteristic `2` exists” | **Repaired.** The replacement uses the order-three integral matrix relation; no cross-characteristic ring map is invoked. |
| R05: locator/reference/redundancy issues | README 299 has the requested changed locators; the unused RS reference and the redundant φ(p)=0 conjunct have disappeared | **Partly repaired, with reviewer correction.** The latter two repairs are correct. The prior page correction was wrong: R08 restores printed-page locators. The prior suggestion about Nagura was explicitly optional and was not an absent-headline finding. |

### Gate, scope and elaboration

The supplied gate is for the specified head. All its counters are zero, including build, dependency, imports, sorry-data, set_option, stray-files and outside-folder; result **OK**. The head was independently checked, and the diff outside `TauCetiRoadmap/ClassicalSerreModularity` is empty. No pull-request file was changed. The dependency check was run again, with output:

```text
depcheck: 208 roadmaps, 1481 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This mechanical check does not establish the missing within-target supply in R01.

The imported Newform module was built first. `lake env lean` on the unchanged `Suggested.lean` succeeds with exactly five `sorry` warnings, at lines 111, 118, 127, 138 and 172. A scratch copy with `#check @name` for **all 20 declarations** also elaborates: coefficient characteristics, primality, level positivity, continuity/open-kernel, semisimplicity, oddness and image hypotheses remain in the actual signatures. There is no standing-variable loss. No signature was changed.

All **five sorried theorems** were tried on a scratch copy with one-tactic alternatives (`simp`, `rfl`, `infer_instance`, or an existing hypothesis). None closed. Reading their conclusions and the pinned APIs found no matching one-lemma proof. None merely computes a boundary case or restates a definition; there is no padding finding.

The five statable headlines are qualitative Serre modularity, level-one modularity, finiteness of semisimple level-one classes, positive density of the auxiliary primes, and weight-one Artin modularity. All five are stated on native carriers. The README also promises strong Serre weight/level/character, finite-flat weight two, regular compatible-system modularity, prescribed lifts, ordinary/crystalline/de Rham lifting and weight-one geometric descent. The module docstring identifies their absent conductor, Serre-weight, finite-flat, local-period, compatible-system and geometric-form carriers. These are not replaced by free predicates or sorried data. The finite elementary prime bounds are mathematical estimates, not an executable procedure; their tests do not make a computational algorithm part of the roadmap.

### Seeded source sample

References were fetched through the source service from author pages, arXiv, Numdam or publisher open archives. The source IDs below are the service IDs. Source lines refer to the numbered cached extraction. The preprint page conventions in the README were retained: kh is v1; dp is v2; kw1 and kw2 are the authors' running page numbers. A location being verified does not assert that the source itself has a complete proof; exceptions are explicit below.

| Sampled target | Locator read and comparison |
| --- | --- |
| Residually reducible ordinary lifting | sw99 lines 2468–2479, Theorem A, printed p.74; proof at 2509–2536, pp.75–76. Odd residual character, distinct local character, ordinary inertia and finite-order determinant factor are retained. Over ℚ the character field is abelian. |
| Crystalline lifting with a matching-weight seed | Ki Proposition (3.13), Theorem (3.14), author pp.19–21 could not be read; see Not verifiable. The README explicitly retains matching weight, local scalar endomorphisms and 2≤h≤2p−1. kw2 §10.2 references this input, but is not a substitute for checking Ki. |
| Residual-weight normalization transition | dp lines 195–205, Remark 2, p.5, compared with README 408–419. The finite-order Teichmüller twist keeps the characteristic-zero Hodge pair; the residual determinant gets χ̄^(2a). The chosen crystalline lift may have a different Hodge pair. |
| Khare's level-one theorem | kh lines 40–50, Theorem 1.1, p.2. Odd, irreducible, level-one representations in every characteristic, with the specified weight and level; no exclusion of p=2 or 3 is introduced. |
| Flatness of prescribed-lift rings | kh lines 304–345 and 430–457, §2.1, pp.8–11. Arithmetic finiteness is needed in addition to the generator/relation count. The local relative dimensions are h⁰ away from p and h⁰+1 at p. The README retains them. |
| Prescribed auxiliary nebentypus | kh lines 524–558, Proposition 2.2, p.13. Odd residual characteristic, nonsolvable image and the weight restriction are present; the auxiliary character varies through the specified prime-power part, not an arbitrary independent character. |
| Level-one lifting and change of prime | kh lines 919–959, Lemma 5.4 and Corollary 5.5, p.22. The weight bound and the exceptional nonordinary endpoint are retained. The transfer of a bounded range is not confused with the full characteristic-wise theorem. |
| Terminal-row contract | kh lines 974–1095, §6.1, pp.23–26. Recomputed all six numerical branches of the five rows. The roadmap corrects the bad exponent in the last row and the copied ramification primes in the preceding row. |
| Lemma 6.3 | kw1 lines 472–504, pp.11–12. The large auxiliary prime, congruence conditions and minimality needed to propagate its type are present. The characteristic bound excludes reduction at the prime carrying the type's order. |
| Theorem 3.4 | kw1 lines 224–238, p.6. Raising levels gives qualitative modularity under D_r, with the special characteristic-two clause. Exact weight/level refinement is separately planned. |
| Khare's weight-one descent | kw1 lines 854–877, Theorem 10.1 proof, p.20, gives the sketch and attribution. README 976–983 supplies its own finite-cohomology and finite-eigensystem argument. The original Kh97 note and corrigendum remain unreadable. |
| Paso 1 | dp lines 430–459, p.10. The prime w>2k, residual solvable branch and weight-two replacement are retained; the new fixed ramification set may include w. |
| Dihedral local type at N | dp lines 487–504, Paso 2, p.11. The README corrects residue-field order, inertia location and finite-image claims, and adds κ(Art(N))=1 for the finite induction. |
| Paso 5 | dp lines 637–655, p.14. The reducible branch uses de Rham lifting, not an unjustified crystalline claim at the ramified coefficient prime; irreducible and bad-dihedral cases are separated. |
| Strong form from the qualitative theorem | dp lines 24–39, Introduction p.1, and kw1 lines 224–238, p.6, compared with README 879–889 and 1232–1238. The roadmap explicitly adds the scalar dyadic refinement rather than attributing it to the quoted optimization references alone. |

Savitt's correction was read in sa lines171–185, arXiv v3 Remark1.7, p.4; it identifies the published error and explains the additional lattice construction. The additional new Fontaine–Mazur statement was checked directly against dp lines 140–164, Theorems 1.4–1.5, p.4, producing R02. The SW01 page checks were repeated visually against the actual printed page footers, producing R08.

### Computed adversarial pass

The following 132 rows record explicit tests, not proofs of the general theorems. “Pass” means the indicated positive/negative control agrees with the statement. Rows cover the named targets, their defining conventions, the sampled targets and all findings. Deep implications are tested at their discriminating input boundaries; no numerical experiment is being represented as a proof of modularity.

| Statement / object | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| GQ, IntBar, FpBar | Qbar automorphisms fix ℚ; in FpBar(2), 1+1=0, whereas in IntBar, 1+1=2≠0 | Pass: different characteristic carriers retained |
| IsFrobAt | r=1 requires 1∈Q, impossible for a prime ideal; in 𝔽₄, Frob(u)=u² and Frob⁻¹(u)=u² | Definition passes; convention Check R06 |
| IsUnramifiedAt | I acts by 1: ker contains I; I acts by [[1,1],[0,1]]: invariant dimension 1, versus 2 after semisimplification | Pass; full inertia action matters |
| IsOdd | trivial rank two over ℚ: det=1≠−1; over 𝔽₂: det=1=−1; diag(1,χ̄₃)(c): det=2=−1 | Pass |
| IsAbsIrreducible | trivial span dimension 1<4; diagonal span ≤2<4; S₃ standard matrices over 𝔽₅ and 𝔽₂ span dimension 4 | Pass |
| IsSType | totally real cubic discriminant 229>0, nonsquare; standard S₃ action has c=I: det 1≠4 over 𝔽₅, but 1=−1 over 𝔽₂ | Pass: oddness separates the two cases |
| coeff, coefficientRing | Δ has a₁=1, a₀=0 and integer coefficients; the generated subring is ℤ; a₂=−24 | Pass |
| ArisesFrom: genuine versus trivial | level 11, p=3, ℓ=2: required (tr,det)=(−2,2)=(1,2); trivial gives (2,1) | Pass |
| ArisesFrom: dual | level 11, p=7, ℓ=2: determinant 2; dual determinant 2⁻¹=4≠2 | Pass |
| ArisesFrom: coefficient embeddings | X²+X−1 modulo 11: at 3 gives 11=0, at 7 gives 55=0; 3≠7 | Pass: existential coefficient map is intentional |
| ArisesFrom: irreducibility not built in | τ(2)=−24≡667 (mod691); 1+2¹¹=2049≡667; determinant 2¹¹≡666 | Pass: reducible Eisenstein congruence excluded only by S-type |
| toRepresentation and base change | identity sends (1,0) to (1,0); swap sends it to (0,1); upper unipotent fixes a one-dimensional subspace | Pass |
| IsProjConj | scalar 2I has projective class I; nontrivial unipotent has minimal polynomial (X−1)² rather than X−1 | Pass; invertibility forces scalar≠0 |
| primesOfRat | norms of (2),(3) are 2,3; inverse image of {4} is empty; inverse images of ∅ and universal set are ∅ and universal set | Pass |
| Auxiliary level | N=0,1,4,5,11 gives N′=0,5,20,5,11; 4 divides20 but not5 | Pass; lower bound needs N>0 |
| Soluble prescribed completions | S=S′={2}, degree of E₂ is2; splitting requires1 | R03 |
| Soluble disjoint positive example | ℚ(√5): 5≡5 mod8 gives unramified degree2 at2; 4²≡5 mod11 gives splitting at11 | Pass with disjoint local prescriptions and D=ℚ |
| Moret-Bailly local opens | x=2/3 lies in (0,1), v₂(x)=1≥1; x=1/2 lies in (0,1), v₂(x)=−1<1 | Pass |
| Moret-Bailly avoidance | Gal(ℚ(√2,√3)/ℚ)=C₂²; one generator fixes a quadratic subfield, two independent generators have common fixed field ℚ | Pass: all generating classes needed |
| Controlled residual potential modularity | p=2 has weights2,4; crystalline weight-two clause admits2, semistable branch handles4; c=I and nontrivial unipotent both have det1 | Pass: both real dyadic local shapes expressly owned |
| Nearly ordinary projector | U=4 on ℤ₃: U^(1!),U^(2!),U^(3!)=4,16,4096; modulo9:4,7,1; limit1 | R04 |
| Nearly ordinary control | identity A→A: kernel0, generic fibre A[1/π]; quotient A→A/(π): kernel(π), generic fibre0 | R05 |
| Pseudo-deformations and nice primes | split diag(1,χ) and upper-triangular nonsplit extension have trace1+χ and determinantχ; extension classes 0 and nonzero | Pass: trace alone does not identify a lattice |
| Residually reducible ordinary lifting | p=3, χ=χ̄₃: χ(c)=−1=2; χ on inertia nontrivial, versus χ=1 giving equal residual characters | Pass: distinguishedness present |
| Residually irreducible ordinary lifting | residual quotient eigenvalues1,2 at p=3 are distinct; 1,1 are not | Pass; printed dihedral proof correction not certified |
| Ordinary exact level | a tame nontrivial rank-one inertia summand gives codim invariants1; unramified summand gives0 | Pass: conductor cannot be read from solvability |
| Hilbert integral comparison | a zero characteristic-zero Hecke fibre has no points; a nonzero finite flat O-algebra has positive O-rank | Pass: matching seed and integral conditions required |
| Full KW finiteness / point extraction | O/(π) is finite with generic fibre0; finite flat O has generic fibre Frac(O)≠0 | Pass: finiteness alone not used as point existence |
| Böckle criterion | O[[x]]/(x): n=m=1, O-rank1; O[[x]]: n=1,m=0, infinite O-rank | Pass: finiteness excludes the latter |
| Relative versus absolute CI | ℚ[ε]/ε²: embedding dimension1, one relation; ℚ[[x,y]]/(x,y)²: embedding dimension2, three minimal relations | Pass; nonregular coefficient identity has relative length0 but is not absolute CI |
| Matching-weight crystalline lift | p=3,h=4 gives HT{0,3} and 4≤2p−1=5; h=6 exceeds5; scalar residual endomorphism space dimension4>1 | Hypothesis boundary passes; Ki text not verified |
| Classical lifting endpoint | p=3, residual weight2, lift weight4; Hasse multiplication adds p−1=2, so seed weight2→4 while lift HT remains{0,3} | Pass |
| Potentially Barsotti–Tate / H | crystalline weight2 has N=0; Steinberg weight2 has N≠0; dyadic solvable dihedral image has solvable derived series and fails nonsolvable hypothesis | Pass |
| Four prescribed lifts | p=2,k=2 selects crystalline weight2; p=2,k=4 selects semistable weight2; for odd p, normalized k is in[2,p+1] | Pass; not conflating residual and lift weights |
| Residual normalization | twist by χ̄_p^a multiplies determinant by χ̄_p^(2a); its Teichmüller lift has HT0 and leaves {0,h−1} fixed | Pass |
| Families through prescribed lifts | fixed ramification set excludes q, but member at q can have χ_q determinant and ramified inertia; WD monodromy0 does not make χ_q unramified | Pass |
| Residual links | same characteristic polynomial X²−tX+d has two coefficients(t,d); an upper-triangular extension and its split form share both | Pass: lifting/irreducibility conditions retained |
| Khare level one / Lean headline | trivial rank-two action has conductor1 but span dimension1; S-type excludes it; Δ at weight12 provides conductor1, det χ̄^11 | Pass: theorem is not vacuous or about arbitrary predicates |
| Prime conductor weight two | prime conductor q gives one prime factor; conductor1 gives zero; the q-adic member may still ramify at q | Pass |
| Böckle's level-one presentation | chosen presentations O and O[[x]]/(x) have(n,m)=(0,0),(1,1), respectively | Pass: counts belong to presentations |
| Flatness of prescribed-lift rings | local h⁰=1 gives relative dimension1 away from p and2 at p; replacing ring by O/(π) loses flatness | Pass |
| Ordinary minimal weight-two lift | inertial determinant ω_p^(k−2)χ_p reduces to χ̄_p^(k−1); at k=2 it is χ_p | Pass |
| Auxiliary local smoothness | quadratic relation at χ′=1 becomes β²−ψ=0; derivative at β=r is2r, a unit for odd p and r≠0 | Pass |
| Prescribed nebentypus lift | P=29, ℓ^e=7: quotient modulus4; k−2=20,24,28 are0 mod4, while22,26 are2 mod4 | Pass |
| Lifts in compatible systems | at a fixed good prime r, common polynomial has coefficients independent of λ; at λ∣r the local Hodge clause is separate | Pass: equality of two coefficients, not equality of unrelated local representations |
| Factorial identity | x=6: Σψ(6/n)=log720=6.579251212; prime exponents(4,2,1) for(2,3,5) | Pass |
| Log-Gamma differences / remainder | n=2,x=2: derivative of first difference=(ψ(2)−ψ(3/2))/2>0; at x=1 remainder0.08106147 lies between0 and1/12=0.08333333 | Pass |
| U,V estimates | x=2000: U=2163.710076<2170.2; V=1839.399086>1832 | Pass numerical boundary |
| ψ bounds | x=1: −1.402<0<1.086; x=2: −0.486<log2=0.693147<2.172 | Pass |
| Nagura interval | n=25,P=29:145<150; n=24,next prime29:145>144; n=100000,P=100003:500015<600000 | Pass; all99,976 integers25…100000 tested |
| Consecutive prime ratio | 37/31=1.193548<1.2; 263/251=1.047809<1.44; 1.44<1.499 | Pass |
| Finite auxiliary estimate | p=5:15≤15; p=7:35≤35; p=31:189≤279; p=21589:116639999≤233139611 | Pass; all2,422 primes5…21591 tested |
| Khare prime estimate | p=31,P=37,m=4: multiplying denominators gives189≤279; P=257 has odd part of P−1 equal1 | Pass: Fermat prime cannot be used |
| Serre-weight twists | p=11,k=4: irreducible companion p+3−k=10; split companion p+1−k=8 | Pass; two local shapes give different outputs |
| Weight interval | p=31,P=37,ℓ^e=9,L=4: j=17,18,19,20 gives(j+2,38−j)=(19,21),(20,20),(21,19),(22,18), all≤32 | Pass for stated containment |
| Bound induction S(B) | weight32 is in S(32)'s quantified domain and outside S(31)'s; inclusion of domains reverses implication S(32)⇒S(31) | Pass |
| Reducible PBT gives ordinary | reducible inertia chars1 andχ̄ have a one-dimensional quotient; this does not say every solvable irreducible image has such a quotient | Pass: separate branches retained |
| Level-one change of prime | k=12 permits q≥k−1=11; q=7 violates that clause | Pass: bound retained |
| Degenerate branches | reducible image has invariant line dimension1; irreducible dihedral action has no global invariant line but becomes split on index2 subgroup | Pass: distinct lifting inputs |
| Ordinary distinction/parity | even k gives k−1 odd; at c, (−1)^(k−1)=−1; odd k gives+1 | Pass |
| Terminal row weight8 | P=7,j=2 gives return weights4,6; j≡0 mod2 | Pass |
| Terminal row weights10,12 | P=11,j=4 gives6,8; j≡0 mod2 | Pass |
| Terminal row weights14…20 | P=19,j=8 gives10,12; j≡0 mod2 | Pass |
| Terminal row weights22…30 | P=29,j=16 gives18,14; j=14 gives16,16; residues mod4 are0,2 | Pass |
| Terminal row weight32 | P=31,j=18 gives20,14;18≡0 mod6, whereas printed16≡4 | Pass: corrected source exponent |
| Small-weight table | maximal input32 returns at most20 in the last row; previous bounds20 then30 precede32 | Pass: strict descent |
| Level-one assembly | p=31→P=37 uses known bound32, obtains bound38; no recursive use of a weight>32 in the return | Pass |
| Corollary1.2 assembly | auxiliary coefficient prime and fixed conductor prime remain distinct; conductor valuations away from the fixed prime are0 | Pass |
| Finiteness / Lean headline | fixed p has p−1 cyclotomic characters and finitely many unordered pairs, at most p(p−1)/2; full extensions are not counted by semisimple classes | Pass: semisimplicity and conjugacy included |
| Corollary8.1(ii), W₁ | odd conductor with one good-dihedral prime has prime support size1; removing it leaves size0 | Pass |
| Good-dihedral definition | sample q=409,t=41:41∣410,41>5,409≡1 mod8 and mod3,409≡−1 mod5 | Numerical local conditions pass; not claiming a global representation from congruences alone |
| Lemma6.3 image | tame inertia order41>5 excludes exceptional A₄,S₄,A₅, whose element orders≤5; reduction in characteristic3 preserves order41 | Pass; at characteristic41 order may collapse to1 and is excluded |
| Lemma8.2 / Lean density headline | p=5 congruences permit409: (mod8,mod3,mod5)=(1,1,4); c has eigenvalues1,−1, trace0, det−1 | Pass; actual density also imposes the Frobenius class |
| Auxiliary-prime insertion | multiplying conductor by q² adds exactly one new prime factor, with valuation2 at q | Pass |
| Dickson and dihedral weights | p=7: p=2k−1 givesk=4; p=2k−3 givesk=5; projective cyclic order at most2 drives the alternatives | Pass |
| L_r | conductor3·5·q² has3 prime factors: admits r=3, rejects r=2; dyadic weights2/4 respectively admitted/rejected | Pass |
| W_r | same conductor count; weight2 admitted, weight4 rejected for every p | Pass |
| D_r | v₂(2q²)=1: D₀ rejects (2 dividesN), D₁ admits (4 does not divideN) | Pass |
| Dyadic prime-gap inequality | p=13,P=17,e=4:176≤208; exponent interval[8,10] contains even8,10 | Pass |
| W_r⇒L_r | non-Fermat P=37 gives returns19…22 within bound32; small characteristics3,5 are separate inputs | Pass |
| L_r⇒W_(r+1) | removing one prime from support of size r+1 leaves size r; good-dihedral prime retained | Pass |
| W₁ initial case | support size1 reduces to size0, the established level-one case | Pass |
| Double induction | (weight bound, support bound)=(32,1) precedes(38,1), then(38,2); each cited predecessor decreases the designated component | Pass |
| All L_r⇒D₀ | odd N has v₂(N)=0; its finite prime support has some integer cardinal r | Pass |
| Raising-level auxiliary characteristic | choose ℓ outside finite ramification/coefficient exclusions; at unramified ℓ the old conductor exponent is0 | Pass |
| Theorem3.4 raising levels | r=0 admits odd p with v₂(N)=0 and dyadic k=2; dyadic k=4 requires r≥1 | Pass |
| Minimal-lift strong refinement | dyadic k=2 uses crystalline HT{0,1}; k=4 does not satisfy that lift branch | Pass: scalar k=2 explicitly included |
| KW Theorem1.2 | odd p all weights; p=2,k=2 including scalar local action; p=2,k=4 separately optimized | Pass: no good-prime-only restriction |
| Dyadic weight claim | a Kummer class of valuation1 pulls to valuation3 at ramification index3, still odd; at index2 gives2, even | Pass |
| D₁ via congruence3 | order-three local type has N=0 and tame ramification index3 at2; Steinberg type has N≠0 | Pass: type change is material |
| D_r for r≥2 | 2-adic conductor exponent a≤r is the same inequality as 2^(r+1)∤N; at a=r+1 the condition fails | Pass |
| Theorem9.1 | p=2 cases partition as k=2 or4; nonsolvable case and dihedral solvable case have disjoint image hypotheses | Pass |
| Strong Serre headline | finite-flat elliptic residual at p≥5 has weights{0,1}, hence Serre weight2; determinant χ̄ gives ε=1 | Pass on export; exact invariants not encoded in Lean |
| Finite-flat export | p=5,ℓ=2: determinant2 and exponent k−1=1; trivial nebentypus contributes1 | Pass; requires full finite-flat residual action |
| Regular compatible systems | HT{0,1} has gap1>0; finite-order Artin HT{0,0} has gap0 and belongs to separate weight-one target | Pass |
| Artin reductions | standard S₃: order6 invertible mod5, not mod3; for subgroup C₂, averaging has denominator2 and invariant rank1 in characteristic0 and5 | Pass |
| Artin Frobenius density | transposition class size3 in S₃ of order6: density3/6=1/2; eigenvalues1,−1 distinct modulo every odd ℓ | Pass |
| Weight one moduloℓ | k=ℓ, companion weight1; at ℓ=5, eigenvalues1,4 have difference3≠0, versus scalar1,1 difference0 | Pass |
| Weight-one reduction | model H¹ torsion ℤ/6 has ℓ-torsion nonzero only at2,3; for ℓ=5 connecting cokernel0 | Pass: exceptional set finite, not necessarily empty |
| Khare weight-one descent | a fixed nonzero integer difference6 is divisible only at2,3; divisibility at infinitely many distinct rational primes forces difference0 | Pass on finite-eigensystem proof; Kh97 not certified |
| Artin headline / Lean | odd S₃ standard rep: c has trace0,det−1; weight1 determinant exponent0 gives ε(ℓ), not ε(ℓ)ℓ | Pass |
| Modern weak target / solvable case | irreducible dihedral and A₄/S₄ cases covered in odd characteristic; reducible cyclic image fails irreducibility | Pass |
| Kisin FM | p=5 twist χ₅⁴ changes HT{0,1}→{4,5}; residual twist χ̄₅⁴=1; odd determinant changes by(−1)^8=1 | R02; R01 for input supply |
| Pan lifting | irreducible ρ with reducible residual semisimplification is allowed; split χ₁⊕χ₂ has invariant line and is excluded; p=3<5 | Pass hypothesis boundary |
| Congruence modularity transfer | normalized HT pairs{0,1},{0,3} both have a zero weight and positive gap; unnormalized{4,5} requires R02's twist | Pass after correcting the input theorem |
| Fontaine–Laffaille not bad dihedral | k=2,p=7:7>4; bad-dihedral equalities would give3 or1, neither7 | Pass |
| Solvable residual termination | p=5≥5; reducible case uses Pan, irreducible solvable case uses residual modularity then lifting | Pass: characteristic-zero irreducibility retained |
| Paso1 | k=4,w=11:11>8; new HT pair{0,1}; w can enter S₁, so S₁ need not equal the original fixed set | Pass |
| Dihedral local type | q=3,N=2: residue field size4, units order3; κ^N=κ²≠κ, inertia order3, normalized induction image6 | Pass |
| Same type without normalization | κ(Art(N))=ζ₃ gives scalar subgroup order3, total image18 rather than6; projective image remains6 | Pass |
| Dihedral residual lattice | standard inertia diag(ζ,ζ⁻¹) reduces toI, invariant rank2; adapted inertia [[1,1],[0,1]] has invariant rank1 in characteristic3 | Pass: full reduction depends on lattice |
| Paso2 insertion | q=13,N=406561: N≡1 mod8,3,5,7,11; N≡−1 mod13; det(Frob_N)=ψ(N)N has infinite order | Pass; finite inertia does not imply finite local image |
| Lemma2.1 large image | p∈S₁∪{2,3} has p<q; order-q root remains orderq modulo p; at p=q it becomes1 | Pass: quantifier excludes q |
| Paso3 odd-level removal | fixed set{3,5,N}→{5,N}→{N}; local χ₃/χ₅ still ramifies in its own coefficient characteristic | Pass |
| Lemma2.3 at2 | ζ²+ζ+1=0; inertia order3, Frobenius swaps ζ,ζ²; after mod3 adapted invariant dimension1 | Pass |
| Remark6 | e=3 sends odd valuation1 to3; cannot make très ramifiée class finite flat; e=2 sends1 to2 | Pass corrected argument |
| Paso4 | weight4 dyadic branch→Steinberg weight2→order-three type→finite-flat weight2; fixed set{2,N}→{N} | Pass |
| Paso5 | N≡1 mod8 implies N≡1 mod4; normalized even k has 2k−1≡3 mod4, excluding the level-one bad-dihedral option | Pass; reducible branch uses only de Rhamness |
| Paso6 | p=5 normalized even weights2,4,6; k=6 endpoint uses weight-two semistable prescription, not weight-six finite flatness | Pass |
| Odd-characteristic assembly | p=3 is not fed into Pan's p≥5 branch; auxiliary w>2k≥4 gives w≥5 | Pass |
| Dyadic auxiliary odd prime | p>3, k=2: bad-dihedral values3,1 are both<p | Pass |
| Characteristic-two closure | irreducible solvable image in GL₂(𝔽₂) may be S₃, dihedral of order6; oddness det=1=−1 | Pass |
| Qualitative theorem / global dependencies | primes partition into{2} and odd primes; no p=1 input because primality is explicit | Mathematical scope passes; R01 prevents route certification |
| Two modularity notions | oldform from levelM at levelN has same good-prime pair(t,d); primitive associate at M recovers that pair | Pass: irreducibility turns semisimplification into an isomorphism |
| Strong from qualitative | p=2 local scalar k=2 still falls in the crystalline minimal-lift branch; excluding it would omit an allowed local matrixI | Pass on refinement structure |
| Two proof routes | both export one weight/level/character triple(k,N,ε), rather than two definitions of modularity | Pass |
| Finite-flat export from either route | HT gap1 gives weight2; det/χ̄=1 gives residual character1; required nebentypus is trivial after character change | Pass |
| Conditional cycle data | support(A)=support(A⊕A); generic multiplicities1 and2 differ | R01 |
| Auxiliary smoothness quadratic sign | β=γ=1, χ′=2 gives α=2, ψ=2; corrected polynomial1+1−2=0, printed polynomial1−1−2=−2 | Source correction confirmed |
| Dihedral rotation versus centre | S₃ has centre order1 and rotation subgroup order3; a cyclic inertia subgroup of order3 lies in the latter, not the former | Source correction confirmed |
| Savitt exceptional characters | p=5,j=0,m=1: exponents m+p=6 and pm+1=6 coincide modulo24 and factor through niveau1 | Author's correction confirmed |
| Printed SW01 pages | PDF pages8,20,21 minus the cover offset give191,203,204 | R08 |

### Pinned-library and ownership audit

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native definitions/declarations were opened, rather than inferred from their names:

| Pinned file and line | Declaration / actual scope |
| --- | --- |
| `Mathlib/RingTheory/Frobenius.lean:54` | `AlgHom.IsArithFrobAt`: congruence with the power given by the cardinality of the base residue ring; it does not itself assert prime rational r or representation unramifiedness. |
| `Mathlib/Algebra/Group/Subgroup/Basic.lean:1177` | `AddSubgroup.inertia`: σx−x lies in the subgroup for every x; used through the ideal inertia API. |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:259` | `NumberField.ComplexEmbedding.IsConj`: conjugating the embedding equals composing with σ. |
| `Mathlib/NumberTheory/NumberField/DirichletDensity.lean:82` | `NumberField.Set.HasDirichletDensity`, on actual prime ideals; the inverse-image adapter has the right domain. |
| `Mathlib/RepresentationTheory/Semisimple.lean:34` | `Representation.IsSemisimpleRepresentation`: complemented subrepresentation lattice; no continuity or finite-image hypothesis is smuggled into it. |
| `Mathlib/RepresentationTheory/Maschke.lean:158` | `MonoidAlgebra.Submodule.exists_isCompl`, with finite group and nonzero group order in the field at line 136. It is not available at primes dividing the image order. |
| `Mathlib/RepresentationTheory/Invariants.lean:73` | Native invariant submodule; no replacement stable-vector carrier needed. |
| `Mathlib/Data/Nat/MaxPrimeFac.lean:39` | `Nat.maxPrimeFac`; default n makes Q(0)=0 and Q(1)=1. The positive-input multiplication and nonzero-exponent power lemmas are the relevant APIs. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean:111` | `Real.convexOn_log_Gamma` gives convexity on positive reals, not strictness or the new explicit remainder by itself. |
| `Mathlib/NumberTheory/Chebyshev.lean:453`, `:483`, `:581` | Existing coarse upper/lower ψ bounds and prime-power comparison; their constants do not duplicate Nagura's sharper bounds. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` | `HeckeRing.GL2.Newform` extends an away-from-level eigenform, with newness and a₁=1; it does not bundle a Galois attachment. Its character lift and coefficient normalization were also read at 134 and 164. |
| `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93` | Native Frobenius prime set for the finite extension. |
| `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51`, `:74` | Density and infinitude of Frobenius classes. The auxiliary-prime theorem adds compatible cyclotomic congruences, so it is not just this lemma restated. |
| `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:33`, `:41` | Native cyclotomic character infrastructure. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Native abelian variety carrier, not the finite-flat residual-model or compatible-family construction. |

Object-based searches in both pinned libraries and the indexed roadmap sources covered conductor/reduction, Serre weights, finite-flat models, compatible families, ordinary Hecke and pseudo-deformation rings, potential modularity, arithmetic patching, newforms and weight-one attachments. Generic native invariants, matrix maps, semisimplicity, density and prime-factor functions are reused. The 15 auxiliary definitions in `Suggested.lean` are small aliases/predicates/adapters necessary for the five headlines, not competing generic libraries. No identical fully-qualified declaration in the readable other roadmap files was found; R07 concerns the mandated namespace, not a claimed collision.

The scope audit read 21 supplier roadmaps using the roadmap service (the main content head is `4dffb5d7`; main copies of ClassFieldTheory, ModularForms and Completed/Chebotarev were distinguished from new open-roadmap suppliers) and searched main, board packages and the supplied open-work index by mathematical object. Main-branch examples ModularForms and Completed/Chebotarev were read for shape. The principal resolved contracts are:

| Supplier | Sections/objects actually resolved |
| --- | --- |
| ArithmeticGaloisRepresentations | Layers1–5, including conductor at README2582, reduction2770, Dickson2969, bad-dihedral3011, image recognition3193–3241; elliptic residual subsection of §6.1. |
| ArithmeticGaloisDuality | R02.4.5b at4073 and R02.4.6 at4141 supply Grunwald–Wang and its exception; R02.5–R02.6 supply the Selmer and auxiliary-prime inputs. |
| DeformationAndDerivedPatchingAlgebra | §§1.9,3.4,3.5,3.14 and Layers5–6; §3.14 really contains the formal-presentation/local-CI comparison despite its broader heading. Support algebra alone does not give R01's arithmetic data. |
| GlobalGaloisDeformations | R04.3–R04.6; §6.6 at1574 is dyadic finite-level data, §6.7 at1615 is the classifying map, §6.8 at1662 reconstructs from jointly injective points. |
| LocalGaloisDeformationRings | Local conditions, §3.10 crystalline rings, §5.14 endpoint rings and §8.17 completed tensor product; these are deformation objects, not unconditional global modularity theorems. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.24a at1976, R07.4.20 at6371 and R07.5.6a at7776; full model, coefficient action and identification are retained. |
| AlgebraicModularFormsAndSerreWeights | R15 aliases at18; §§2.3–2.4,2.8,2.12,3.1,4.2,4.10,5.10,6.2,6.4,7.5 resolve the geometric forms, Hasse, weights, lifting, attachments and modularity predicates. |
| GL2AutomorphicRepresentationsAndTransfer | R17.3–R17.6: Jacquet–Langlands, solvable base change/descent, Langlands–Tunnell and dyadic dihedral input. |
| SerreWeightAndLevelOptimisation | §3.7 at729 is conditional weight optimization; Layers4–6 retain local hypotheses and dyadic exceptions. No universal residual modularity is imported from it. |
| SmallRamificationAndAbelianVarietyBaseCases | §5.0 and its subtargets supply raw and marked family carriers and realizations; §5.11 at2481 supplies small weights. The raw carrier is not rebuilt here. |
| AutomorphicGaloisRepresentations | General-weight attachments, §4.10 at2029 for finite-weight ordinary shape, §§6.8–6.12 for integral Hecke representations, §7.1 at2964 for compatible-system predicate, §7.3 at3097 for fixed-eigenform families. |
| HilbertModularVarietiesAndShimuraCurves | H1 and H6.2–H6.5/H6.9 (1393–1548) are the moduli and conditional local-locus inputs; R18.3 supplies quaternionic Hecke modules. The new I.0 explicitly owns its additional real/dyadic and ordinary local realization work. |
| PadicLocalLanglandsForGL2Qp | §§4.5,6.1–6.6,6.10; the conditional nature of §§6.3 and6.5 produces R01. |
| PadicHodgeTheory | §6.4 at1192: endpoint residual comparisons and Barsotti–Tate branch. |
| IntegralHeckeAndGaloisDeterminants | §0.5 at862: trace and characteristic-coefficient comparison, not nearly ordinary control. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.2.5 at2040 includes the Lang–Weil estimate used to obtain smooth local points; the citation is not missing merely because the heading emphasizes thin sets. |
| Chebotarev; ClassFieldTheory; ModularForms | Layer10 density; Layer13 abelian characters/norms; Layers4–5 primitive forms and multiplicity one, with separate weight-one treatment. |
| LocalGaloisGroups; LocalFieldsRamification | Local decomposition/inertia and ramification infrastructure used in the arithmetic comparisons; no second local conductor construction is assigned here. |

The citations to later ordinary, potential-modularity and elliptic-modularity roadmaps are presented as consumers, not supplier edges. The rational-field theorem and its actual prerequisites must therefore be owned here where earlier suppliers stop; R01 identifies one remaining failure of that ownership. Open-roadmap ownership was searched using the provided index/readable sources; no independent search for unprovided open PR heads was made.

## Not verifiable

- **ki:** Kisin, *Modularity for some geometric Galois representations*, Proposition (3.13), Theorem (3.14), author pp.19–21. The cited Harvard author URL returns DVI, which the source service cannot extract. The published Cambridge chapter was also located, but no readable legal text of these statements was obtained. The sampled matching-weight theorem is therefore not certified from its primary source.
- **kh97:** Khare, *Remarks on mod p forms of weight one*, IMRN1997, pp.127–133, and its1999 corrigendum, p.1029. The source service tried both DOI landing pages; both returned HTTP403 from OUP. The accessible kw1 attribution was checked, and the roadmap's replacement argument was examined, but neither original text nor corrigendum is certified.
- **ki2:** *Modularity of 2-adic Barsotti–Tate representations*, Theorem(0.1). The source service classified the Springer DOI as paywalled/uncertified. The README already cites it by locator only. This settled item is not a new missing-text request; kw1's Hypothesis(H) and the stated dyadic patching route were checked separately.
- **Skinner's unpublished correction:** the roadmap identifies it and makes the full-scope dihedral ordinary argument its own target. SW01's printed statements, restricted argument and page locators were read; no unpublished corrected text was available. No claim is made that its proof was source-certified.

Missing-source records are confined to the review scratch request file; no roadmap manifest or source file was edited. These limitations do not park this review: the findings and verdict above are complete.

## Source issues

- **Misprint** in kh at §6.1, printed p.25, kh line1076: the source gives ramification primes3 and19 in the mod7/29 row; it should give7 and29; affects the proof.
- **Error** in kh at §6.1, printed pp.25–26, kh line1090: the source chooses exponent16 for the weight32 return; it should use an admissible multiple of6, for example18, returning weights20 and14; affects the proof.
- **Misprint** in dp at Paso2, printed p.11, dp line488: the source assigns (N−1)(N+1) elements to the quadratic residue field; it should assign N² elements to the field and N²−1 to its unit group; affects nothing.
- **Misprint** in dp at Paso2, printed p.11, dp line492: the source puts the niveau-two inertia condition at q; it should put it at N; affects nothing.
- **Error** in dp at Paso2, printed p.11, dp line502: the source gives the weight-two lift finite local image of order2q; it should specify its finite inertial type and dihedral projective local image; affects a stated result.
- **Gap** in dp at Remark6, printed p.13, dp line600: the source cites flatness over an even-ramification extension as the contradiction; it should use impossibility of flatness over every odd-ramification extension; affects the proof.
- **Gap** in dp at definition of minimal lift, printed p.6, and Paso3, printed p.12, dp lines240 and548: the source's unramified-away-from-ramification condition does not preserve the auxiliary inertial type; it should invoke the stronger KW minimality condition retaining that type; affects the proof.
- **Misprint** in dp at Paso3, printed p.12, dp line548: the source calls the coefficient-prime crystalline lift unramified; it should call its Weil–Deligne parameter unramified, allowing the p-adic member itself to ramify; affects the proof.
- **Misprint** in kh at Proposition2.2 proof, printed p.15, kh line643: the source gives a minus sign before βγ(χ′−1); it should have a plus sign after substituting α=β+γ(χ′−1) into αβ=ψ; affects the proof.
- **Error** in kh at §4, printed p.19, kh line806: the source asserts its numerical prime-counting bound for every x>30; it should use a valid interval estimate, since its upper bound at31 is below10 but π(31)=11; affects the proof.
- **Misprint** in kw1 at Theorem9.1 proof, printed p.19, kw1 line816: the source says the new system lifts the original residual representation; it should say it lifts the intervening mod3 representation; affects the proof.
- **Misprint** in kw1 at Theorem9.1 proof, printed p.19, kw1 line830: the source cites Theorem5.1(2) for the cubic ramification control; it should use the type from Theorem5.1(4) transported by compatibility; affects the proof.
- **Gap** in kw1 at §3.2, printed p.6, kw1 line236: the source concludes the exact weight-and-level theorem directly from qualitative raising levels; it should supply the optimization argument, including scalar dyadic residuals; affects the proof.
- **Misprint** in ri at Proposition2.2 proof, printed p.280, ri line147: the source uses the centre of the dihedral image; it should use its index-two cyclic rotation subgroup; affects the proof.
- **Error** in sa at Theorem6.12(4), as identified in Remark1.7, author p.4, sa line175: the source's published version treats the i=1 residual characters as niveau two; they should be equal niveau-one characters, with split reduction and a separately constructed lattice; affects a stated result.
