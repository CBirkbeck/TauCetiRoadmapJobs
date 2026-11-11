# Review of LieHighestWeight (pull request #1220 at 81a68b8)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

Two findings, both P3 and both outside the folder: the family index and the generated summary block of the description. The three findings of the previous review that concerned the folder (the Serre negative control, the characteristic of the `sl₂` centre Check, the missing Layer 0 headline) are repaired, and the full pass over the folder found nothing else. The worker's gate passes. No file of the pull request was changed.

In this report `README.md` and `Suggested.lean` are the two files of the folder; the family index is `TauCetiRoadmap/RepresentationTheory/README.md`. `Mathlib/…` and `TauCeti/…` paths are at the manifest pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Main was read at `c69ba93`.

## R01 (P3) — The family index still states the supply in the wrong direction

Re-raised: R04 of the previous review.

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82`, “The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences”; `:89`, “the smooth-group ↔ Lie-algebra correspondence that the highest-weight and compact-group roadmaps presuppose”.

**Claim:** Ado–Iwasawa takes PBW from this roadmap, and this roadmap presupposes LieGroups.

**Witness:** `README.md:76`: “AdoIwasawa consumes native ordered PBW … directly”; `README.md:139`: “LieGroups Layer 7 consumes the split Serre presentation of §7.1”. The index says the opposite of both. The description lists this itself under “Review considerations”.

**Repair:** The index is one of the pull request's own files, so the edit belongs in this pull request. Replace the two bullets by:

- “**PBW feeds both Ado–Iwasawa and Lie highest weight.** Both consume Tau Ceti's PBW theorems directly (ordered basis, injectivity, filtration, domain and Noetherian consequences). The highest-weight roadmap adds normalized symmetrization and the first-order bracket on the Rees zero fibre; Ado–Iwasawa develops the cofinite-quotient machinery, which is independent of highest weights.”
- “**Lie highest weight feeds Lie groups; Lie groups feed compact groups.** The highest-weight roadmap is algebraic and supplies the split Serre presentation that the Lie-group roadmap's complexification layer consumes. The Lie-group roadmap builds the smooth-group ↔ Lie-algebra correspondence that the compact-group roadmap presupposes, and abstracts the general Weyl integration formula the compact-group roadmap proves only for SU(2).”

Tested on the two witnesses: with these bullets the index agrees with `README.md:76–79` and `:137–140`.

## R02 (P3) — The generated `roadmap-summary` block describes an earlier head

Re-raised: R05 of the previous review.

**Location:** description, generated block `roadmap-summary`: “while the type-A tensor decomposition weakens the highest-weight gap bound from strict to weak inequality” and “general-linear comparisons and applications to compact group centers as targets”.

**Claim:** This head changes a type-A gap bound and has compact-group centre applications as targets.

**Witness:** Neither file of the folder has a gap-bound target. `README.md:132–137` says the compact-group applications, “the centre `P∨/Y` of a compact semisimple group” among them, “are not targets of this roadmap”. The author's own prose below the block says the block is stale.

**Repair:** Regenerate the block from this head. It should name the Layer 0 basis headline, the reductive Lie-algebra centre comparison and the affine lattice quotients, and drop both quoted clauses. Check on A₁: Layer 10 compares `Y/Q∨` and `P∨/Y` as lattice quotients (orders 1 and 2 for `Y=Q∨`) and constructs no compact group.

## Verified sound

### Previous findings

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01 (P1), Serre negative control | `README.md:2019`: “In the free positive part on e₁,e₂, before the Serre quotient for diag(2,2), omit both directed positive cross-relations” … “deleting just one relation from the full presentation does not give this negative control” | Repaired. E₁₂E₂₃−E₂₃E₁₂=E₁₃≠0; either relation kills the bracket since `[e₁,e₂]=−[e₂,e₁]`. |
| R02 (P2), `sl₂` centre Check | `README.md:2779`: “Over a characteristic-zero field, for Z=K and S=sl₂ …”; `:2782`: “In characteristic 3, e³ is nonzero by PBW and central” | Repaired. `[eⁿ,f]=n eⁿ⁻¹(h+n−1)` gives `[f,e³]=−3e²(h+2)=0` and `[h,e³]=6e³=0` in characteristic 3. The general theorem keeps its arbitrary field. |
| R03 (P2), Layer 0 headline | `Suggested.lean:128` `normalizedPolynomialTensorBasis` with eight definitions (`:73`–`:119`); `README.md:1060` names it | Repaired. Statement checked exactly, below. |
| R04 (P3), family index | unchanged | Not repaired: R01. |
| R05 (P3), generated summary | unchanged | Not repaired: R02. |

### Gate, build, signatures, padding

- Worker's gate at this head: every rule 0, `build=0 OK`. My rerun of the gate command reports `outside-folder=1` for the family index, which this pull request owns; every other rule is 0. The outside-folder diff command of the brief is empty.
- Dependency check output: `depcheck: 235 roadmaps, 2135 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 14 `sorry` warnings, nothing else. 14 theorems and 9 definitions with real bodies; no `set_option`, no sorried data, no admitted example.
- Elaborated signatures (all 24 entries of the worker's list) compared with the README statements. The two flagged as having lost `[IsTriangularizable K H L]` have it as `inst_7`; `invariantForm_isSymm_iff_tits_sign` also keeps `IsAlgClosed K`. The Layer 0 theorem and definitions have no section variables. README and Lean generality agree for each of the 14.
- One-tactic probe on a scratch copy, each `sorry` replaced by `first | rfl | (simp; done) | infer_instance`: all 14 fail. No padding found. The eight Layer 0 definitions are each used by the headline (the operator through the tensor operator, the coefficient through the pairing).
- Every backticked name of the roadmap's own in the README is declared in `Suggested.lean`, and each Layer 0 definition has its API bullets and at least three Checks (`README.md:885–936`, `:973–987`, `:995–1033`, `:1055–1087`).

### The Layer 0 headline, computed

The Lean definitions were transcribed literally (monomial guard, `X₁∂₀` on both factors, the alternating highest vector, the factor `(N−k)!/N!`, the coefficient pairing with `1/(binom(m,i)binom(n,j))`, the substitution `Xᵢ ↦ Σⱼ gⱼᵢXⱼ`) and evaluated in exact rational arithmetic for all 0≤m,n≤5: 9,120 equalities, 0 failures. They cover: every string lies in `P_m⊗P_n`; the `(m+1)(n+1)` strings have full rank; every Gram entry, diagonal and off-diagonal, equals the stated formula; and for two random rational invertible g per (m,n), `(g⊗g)·s_k = det(g)^r Σᵢ coeff_i(g·e_k^N) s_i` for every r, k.

### Adversarial table

| Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- |
| `polynomialMonomial` | (d,i)=(0,0),(2,1),(1,2) | 1; xy; 0 (truncated subtraction would give y²) | Keep |
| `polynomialAction` direction | g=[[1,1],[0,1]] | x↦x, y↦x+y; native `g *ᵥ e₁`=(1,1); inverse transpose gives x↦x−y | Keep |
| `polynomialAction` composition | Xᵢ under σ_g∘σ_h | Σₖ(gh)ₖᵢXₖ = σ_(gh)(Xᵢ) | Keep |
| `polynomialAction` weight | diag(2,3), xy | 6xy; contragredient xy/6 | Keep |
| `polynomialOperator` | degree 1 and 2 | E(y)=x, F(x)=y, E(x)=F(y)=0; E(xy)=x², F(xy)=y² | Keep |
| `tensorPolynomialOperator` | x⊗x, y⊗x, y⊗y | y⊗x+x⊗y; y⊗y; 0 | Keep |
| `polynomialTensorHighest` vs closed form | general r | (x₁y₂−y₁x₂)ʳx₁^(m−r)x₂^(n−r) expands to Σ(−1)ʲbinom(r,j) e_j^m⊗e_(r−j)^n | Keep |
| highest vector, m=n=1 | r=0, r=1 | x⊗x; x⊗y−y⊗x; E_tot of both is 0; plus sign gives 2x⊗x | Keep |
| determinant twist | swap x,y on x⊗y−y⊗x | −(x⊗y−y⊗x), det=−1; general g: (ad−bc)(x₁y₂−y₁x₂) | Keep |
| `polynomialTensorCoefficient` | bidegree (1,1), index (0,1) | x⊗y:1; y⊗x:0; i(x⊗y):i | Keep |
| `polynomialTensorPairing` | i(x⊗y), x⊗y | −i; reversed i; with y⊗x 0; 1⊗1 in bidegree (1,1): 0 | Keep |
| `polynomialTensorString` | m=n=1 | x⊗x, (y⊗x+x⊗y)/2, y⊗y; x⊗y−y⊗x; k>N gives 0 | Keep |
| headline Gram | m=n=1 | computed (1,1/2,1,2); formula 0!1!1!3!/(3!·binom(2,k)) = 1,1/2,1 and 1!0!0!2!/1!=2 | Keep |
| headline Gram | m=0,n=2 | 1,1/2,1; third lowering 0 | Keep |
| headline, all three clauses | 0≤m,n≤5 | 9,120 exact equalities, 0 failures | Keep |
| string norm vs lowered norm | general | ((N−k)!/N!)²·k!N!/(N−k)!·‖v‖² = ‖v‖²/binom(N,k) | Keep |
| 0.1 symmetric square | m=2 | F²(x²⊗xⁿ)=2A+4nB+n(n−1)C; Gram of A,B,C = 1, 1/(2n), 2/(n(n−1)) | Keep |
| 3.1 Rees relation | `[x,y]=y` | j(x)j(y)−j(y)j(x)=t²ι(y)=ħ·j(y); bracket y, not −y | Keep |
| `exists_reesZeroFiberBracket` | abelian L; `[x,y]=y`; zero ring | B=0; B(x,y)=y so B≠0; 0=0 | Keep |
| 3.1 lift independence | a+ħj(z) | commutator changes by ħ²j([z,y]); quotient ħj([z,y]) ↦ 0 | Keep |
| 3.1 derivative identity | ξ=(2,3) | p=x,q=y: 3=3; p=x²,q=y: 2xy=12 and ξ([4x,y])=12 | Keep |
| 3.1 Rees Casimir | `sl₂` | j(h)²+2ħj(h)+4j(f)j(e)=t²Ω; zero fibre h²+4ef; {e,h²+4ef}=−4eh+4eh=0 | Keep |
| 3.2 ordered product | a=0,b=1,c=1,d=0 | x⋆y=yx+ħy; XY=Y(X+ħ) | Keep |
| 3.2 first-order coefficient | monomials | b·c·y^(a+c)x^(b+d−1) = (∂ₓp)·y·(∂_y q); B_ord(x,y)=y, B_ord(y,x)=0 | Keep |
| 3.2 symmetrized coefficient | p=x,q=y | D(xy)=y/2; B_sym(x,y)=y−y/2=y/2; B_sym(y,x)=−y/2; difference y | Keep |
| 5.1 opposition | A₂ | ω₁↔ω₂; L(ω₁) not self-dual; ω₁+ω₂ fixed | Keep |
| `invariantForm_isSymm_iff_tits_sign` | `sl₂` V(1), V(2); λ=0; rank 0 | exponents 1,2,0,0 (empty sum): signs −1,+1,+1,+1; matrix [[0,1],[−1,0]] is skew | Keep |
| same, `sl₃` adjoint | λ=ω₁+ω₂ | positive coroots sum to 2α₁∨+2α₂∨; exponent 4; Killing form symmetric | Keep |
| 5.1 D₄ converse | — | w₀=−Id, diagram group of order 6 | Keep |
| 6.1 orbit sums | A₁ | m₀=1 (sum over W would give 2); ch V(2)=m₂+m₀, 3=2+1 | Keep |
| 6.1 inverse reading | V(2)⊕2V(0) | orbit coefficients (1,3) → multiplicities (1,2); 3+2=5 | Keep |
| 6.1 character decides equivalence | V(1)⊗V(1), V(2)⊕V(0), 2V(1) | z²+2+z⁻² twice; 2z+2z⁻¹ | Keep |
| 6.2 inversion identity | A₁, w=s | sρ−ρ=−2ρ=−α | Keep |
| 6.2 fixed-point sum | GL₂, λ=(1,0), t=(2,3) | 2/(1−3/2)=−4; 3/(1−2/3)=9; sum 5=2+3 | Keep |
| 6.2 Fourier sign | z+z⁻¹; z | coefficients (1,1); (1,0) | Keep |
| 7.1 translation | A₁, ρ(h)=1 | τ_(−ρ)(h²+2h)=h²−1; τ_ρ gives h²+4h+3 | Keep |
| 7.1 dot-orbit separation | {0,−2},{1,−3} | ((h+1)²−1)/3 = 0,0 and 1,1; wrong shift at −2: 8/3 | Keep |
| 7.1 dominant separation | A₁: 0 and −2 | same central character, −2 not dominant | Keep hypothesis |
| 7.1 one Casimir insufficient | A₁×A₁, (2,0),(0,2) | sum-Casimir equal; first-factor Casimir 8 and 0 | Keep |
| 7.1 inner automorphism | exp(ad e) | h↦h−2e; f↦f+h−e; κ(h−2e,f)=−8=κ(h,f−h−e) | Keep |
| `exists_pbwSymmetrization` | l=[]; l=[x,y] with `[x,y]=y` | 1; (XY+YX)/2=YX+Y/2; sym(x)sym(y)−sym(xy)=Y/2≠0 | Keep, linear only |
| `serreLift_injective_of_base` | A₁; A₁×A₁ | 3/3; 6/6 | Keep |
| 7.1 height reduction | A₂ | (1,1)→(−1,2), a column; (3,0)→(−3,3), mixed sign; 2+6=8 | Keep |
| 7.1 transpose | B₂, α₁ long, columns (2,−2),(−1,2) | (0,2)→(2,−2); (3,−2)→(−3,4)=−α₁+α₂; untransposed: (−2,3)→(4,−3)=α₁−α₂; 2+8=10 | Keep |
| 7.2 carriers | rank-one Cartan; `sl₂` | step 0 has 1 not h; h² at ±1: 1,1; h²+2h: 3,−1; h²+4ef↦h² | Keep |
| 8 Cayley–Dickson product | i,j,ℓ=(0,1) | (ij)ℓ=(0,k); i(jℓ)=(0,ji)=(0,−k) | Keep |
| 8 left Moufang | z=ℓ,x=i,y=j | ℓi=(0,−i), (0,−i)ℓ=(i,0), left side k; ℓj=(0,−j), i(0,−j)=(0,k), ℓ(0,k)=(k,0) | Keep |
| 8 Jordan derivation | A=E₀₀, B=E₀₁+E₁₀ | [L_A,L_B](A)=B/4−B/2=−B/4 | Keep |
| 8 trace of L_A | A=1 | 27=9·3 | Keep |
| `finrank_e6_e7`, `finrank_e8` | root counts | 6+72=78; 7+126=133; 8+240=248; 80+84+84=248 | Keep |
| `compact_g2_derivation_divisionOctonion` | D=0 excluded | Killing(D,D)=−‖ad D‖²; dimension 14 = 2+12 | Keep |
| `exists_complexified_divisionOctonion_equiv` | 1+i⊗u, u²=−1 | N=1+i²=0 with nonzero vector; unit ↦ unit | Keep |
| 9.1 reconstruction | abelian K; `gl₂` | scalars c≠c′ inequivalent; standard (V(1),1), determinant (V(0),2) | Keep |
| LR headline | n=2, λ=μ=(1); n=1; n=0 | counts 1,1 and 4=3+1; (1,1) excluded, count 1; 1=1 | Keep |
| `productEnveloping` | Z=S=0; Z=K,S=0 | 1↦1⊗1; t↦t⊗1 | Keep |
| `exists_productCenterEquiv` | Z=K, S=`sl₂`, char 0 and char 3 | K[t]⊗K[Ω]; char 3 keeps 1⊗e³, degree 3 vs even degrees of K[Ω] | Keep |
| 9.3 trace Casimir | `gl₂`, μ=(3/2,1/2) | 15/4−1/4=7/2 | Keep |
| worked staircase | `gl_N` | C(ν−ε_t)−C(ν)=−3N+3+4t, so differences 4(t−s) | Keep |
| alcove headline | A₁, x=2/3; x=1 | ±2/3+2k meets [0,1] at 2/3 only; odd integers at 1 only, x↦2−x fixes 1 | Keep `f x = x`, not `f = 1` |
| 10.1 extended group | A₁ | x↦1−x sends 2/3 to 1/3; Ω of order 2; translation by 2 has class 0 | Keep `W_aff` |

### Sources: the seeded sample

No locator in the README is marked unverified. For each of the twelve sampled targets I opened the cited passage in the cached text and compared theorem number, printed page and hypotheses.

| Target | Passage read | Outcome |
| --- | --- | --- |
| 0.1 | EtingofLieGroupsLieAlgebras lines 2507 (model, p. 63), 2516 (Thm 11.16), 2597 (Thm 11.18, p. 65) | Ladder and multiplicities as cited; the Hermitian scale and norms are stated as derived and were computed above. |
| 3.1, 3.2 | GuttDeformationQuantization lines 899–922, slide 14 of 28 | Real linear Poisson convention and symmetrization; the arbitrary-ring statements are stated as derived, not attributed. |
| 5.1 | EtingofLieGroupsLieAlgebras lines 6700, 6708 (Ex. 32.13, Prop. 32.14, p. 165); EtingofRepresentationsLieGroups line 3469 (§17.2, p. 81) | Complex simple case in the source; the README states its extension and inputs. |
| 6.1 | EtingofLieGroupsLieAlgebras lines 5955 (Prop. 30.4, p. 148), 5979–5981 (step (3)⇒(2), p. 149), 5989, 6004 | The cited step is the one used; the proposition is not claimed to state the inversion. |
| 6.2 | EtingofLieGroupsLieAlgebras lines 5185, 5190 (Prop. 26.3, Thm 26.4, p. 131) | As cited. |
| 7.1, 7.2 | EtingofRepresentationsLieGroups lines 2153, 2207, 2987, 3041 (Thm 10.1 p. 51, Rem. 10.2 p. 52, Thm 13.5 p. 69, Thm 14.1 p. 70); EtingofLieGroupsLieAlgebras lines 4818, 4839, 4884 (Thm 24.2, Lemma 24.3, p. 122; height induction p. 123) | As cited; §24.1's algebraic closure is noted in the README and replaced by the root-lattice route. |
| 9.1 | EtingofLieGroupsLieAlgebras line 3711 (Cor. 18.9, p. 93); Stembridge2002LR line 109 (second Corollary, p. 3) | As cited. |
| 9.2, 9.3 | EtingofRepresentationsLieGroups lines 2987, 3041; pinned product and abelian equivalences | The centre argument rests on pinned declarations; Dixmier §1.6 is under Not verifiable. |
| 10.1 | GarnierAlcoves lines 231, 276 (Thms 1.3.2, 1.3.5; printed p. 5, footer at line 279), 389 (Prop.-Def. 2.2.1, pp. 7–8), 642 (Cor. 2.2.7, p. 10), 1161 (Prop. 2.3.1, pp. 16–17) | Printed pages agree; the extraction's page markers do not follow the printed numbering, the footers do. |

Also read: SchaferNonassociative lines 1022 and 1461 (printed pp. 28 and 41), GaribaldiE8 line 382 (Example 4.4, p. 9), BaezOctonions lines 1687, 1856, 2040, 2122 (Theorems 4–7, pp. 37, 41, 46, 48).

### Pinned declarations opened, duplication by object

- `TauCeti/Algebra/Lie/Sl2/ClebschGordan.lean:101`, `:221`, `:275` (`cgVector`, `cgSummand`, `isInternal_cgSummand`): the abstract decomposition on `Sl2Std`, with no polynomial carrier, Hermitian form or norm. The Layer 0 headline is not a restatement.
- `TauCeti/Algebra/Lie/Sl2/Standard.lean:151`, `:175`, `:188`, `:200`: coordinate module and ladder operators, not `X_a∂_b` on `MvPolynomial`.
- `TauCeti/LinearAlgebra/SymmetricPower/Algebra.lean:230`, `:254`; `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`; `TauCeti/RepresentationTheory/SU2/SymmetricPower.lean:97`, `:105`: the dictionary and the factorwise action `g *ᵥ v`, which is the convention of `polynomialAction`.
- `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BinaryForm/Basic.lean:201`, `:218`: binary forms with the contragredient coaction of the group scheme; a different object and convention from the standard-vector substitution, as `README.md:907` says.
- `Mathlib/Algebra/MvPolynomial/Basic.lean:567` (`lcoeff`) and `MvPolynomial.pderiv`: the carriers of the two new operators.
- A grep of the pinned Tau Ceti for `pderiv` under `Algebra/Lie` and `RepresentationTheory` finds nothing; the worker's library near-matches for the nine Layer 0 declarations contain no statement about polynomial tensor strings.
- Every declaration `Suggested.lean` uses exists at the pins (the file elaborates), and the worker's citation resolver lists no missing Lean name or cross-roadmap citation.

### Cross-roadmap citations and open work

Resolved on main unless stated:

- RootSystems Layers 1–6: `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:428`, `:614`, `:685`, `:804`, `:905`, `:1035`. The chamber and longest-element data cited as “Layer 4” in §5.1 follow that roadmap's former-numbering row at `:1136` to `TauCeti.longestElement` and `RootPairing.dominantChamber`.
- ClassicalGroups Layers 2–4: `…/ClassicalGroups/README.md:216`, `:237`, `:272`. SchurWeyl Layer 7: `…/SchurWeyl/README.md:580`. LieGroups Layers 4, 6, 7: `…/LieGroups/README.md:463`, `:673`, `:787`. SpinRepresentations Layer 9: `…/SpinRepresentations/README.md:1010`.
- ReflectionInvariantTheory §2: `TauCetiRoadmap/ReflectionInvariantTheory/README.md:19`. CharacteristicClasses C5: `TauCetiRoadmap/CharacteristicClasses/README.md:1344`; its citations of this roadmap (`:116`, `:1354`, `:1358`) resolve through the former-numbering and former-name tables.
- LieGroupoidsPoisson G4.6A/B: `TauCetiRoadmap/LieGroupoidsPoisson/README.md:18`, `:71`, `:78`. PseudodifferentialOperators §3.1: `:692`. TensorProductCombinatorics §§1.5, 1.6, 2.6: `:599`, `:694`, `:1191`; its “Layer 6F” citations (`:76`, `:2575`) have the row at `README.md:73`.
- GroebnerGeometry G4: `:252`. ChevalleyGroups C2: `TauCetiRoadmap/ChevalleyGroups/README.md:98`. ReductiveGroups Layer 10C: `TauCetiRoadmap/ReductiveGroups/README.md:4223`.
- TangentialBordism §§9.1–9.2 (open, `TauCetiRoadmap/TangentialBordism/README.md:2701`, `:2752` at its head): a consumer of the compact Albert algebra, not a supplier.

None of the roadmaps named as never to be cited as suppliers is cited as one. The overlap list has one item: #1797 changes the same two files and conflicts; the description's `merge-order` block places #1797 before this pull request, so an order is stated. It lists no dropped or revision-only ids. Of the closest open roadmaps I reread the scope of ClassicalGroups (#1192) and SpinRepresentations (#1207) at their heads; neither owns a target of this folder. Ownership against the other open pull requests was checked only through the worker's overlap and citation lists.

### Shape and headlines

Summary, scope, conventions, supplier contracts, build paragraph, Layers 0, 3, 5–10 each ending with Examples and Dependencies, worked examples, consumers and references are present; the skipped layer numbers are explained by the former-numbering table. The headline families are the Layer 0 basis, the Rees zero-fibre bracket, global PBW symmetrization, the invariant-form sign, the split Serre presentation, the G₂ and F₄ identifications with the E-series dimensions, the division-octonion complexification and compact G₂, the Littlewood–Richardson multiplicities, the product centre and closed-alcove uniqueness: all fourteen are stated. The module docstring names the four that are not statable (formally real Albert and compact F₄, the Vinberg and Freudenthal model comparisons, the polynomial derivative comparison, category-O linkage) with the missing carrier of each.

## Not verifiable

- HumphreysIntroLieAlgebras, BourbakiLie78, GoodmanWallachSymmetry: settled as uncertified; cited by locator only and not requested again.
- Dixmier, *Enveloping Algebras*, §1.6 (cited at `README.md:2769`): not in the sources cache. The previous run's request reached only the publisher's paywalled page; I did not request it again. The centre argument was checked against the pinned declarations instead.
- Serre 1987, Fulton–Harris 1991, Humphreys 2008 (category O), Jantzen, Molev 2007: background entries of the reference list, not in the cache and not opened. No target's statement depends on them.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at Theorem 11.16, proof of (iii), printed p. 64 (line 2557): the source says the m-th lowered vector maps to a multiple of x^m y^(n−m); it should be x^(n−m) y^m, since the vector killed by x∂_y is xⁿ; affects the proof.
- **Misprint** in EtingofLieGroupsLieAlgebras at Theorem 24.2, proof of (iii), printed p. 123 (line 4887): the source says the easy case is a single index with nonnegative coefficient; it should be a single index with positive coefficient, all coefficients being nonnegative already; affects the proof.
- **Error** in GarnierAlcoves at §2.2, printed p. 7 (lines 381–383): the source says a fundamental weight is minuscule when its coefficient in the highest root is 1 and that these represent all classes of P/Q; it should use the highest coroot for weights, and the minuscule weights represent only the nonzero classes; affects a stated result.
