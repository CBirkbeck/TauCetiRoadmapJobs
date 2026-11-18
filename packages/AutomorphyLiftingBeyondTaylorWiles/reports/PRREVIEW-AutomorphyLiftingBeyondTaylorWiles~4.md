# Review of AutomorphyLiftingBeyondTaylorWiles (pull request #1824 at 3ab280d)

**Verdict:** needs changes

**Summary.** One finding blocks acceptance: §5.9 states that CG18 Theorem 5.16 holds for `n = 2` over an imaginary quadratic field and that the result is CG18 Theorems 1.2–1.3, while §5.8 itself says the proof covers less than Theorem 5.16, and the standing datum excludes cases those theorems contain. The repair is a rewording of two sentences. There are three small corrections and two format notes, none blocking; the sampled statements, the locators, the supplier citations and the computations of the Checks all hold. Nothing is left for a human to decide beyond the final approval.

The previous review (of `6f46438`) had no finding, so there is nothing to mark repaired; the change since then (the new opening overview, scope and supplier contracts moved to the end, the former §5.10 withdrawn in favour of GL2ModularityLifting §5.8) was read in full with the rest.

## R01 (P2) — §5.9 asserts CG18 Theorem 5.16 and Theorems 1.2–1.3 for imaginary quadratic fields, but the roadmap proves only the narrower statement of §5.8

An implementer who takes §5.9 at its word must prove more than Layers 1–5 support, and a reader is told that CG18's imaginary-quadratic theorems are recovered when only part of them is.

In §5.9 (line 1249): "Then Theorem 5.16 holds assuming only the clauses B^gal, B^lgc and B^van(b)" and "The resulting statement is the GL_2 conditional modularity lifting … in the form of CG18 Theorems 1.2–1.3 and 5.11". Against this:

- §5.8 (line 1227) says its statement "is narrower than CG18 Theorem 5.16(6)", because a place `x` where `r` ramifies and `r̄` is unramified and nontrivial lies in neither `R_triv` nor `R_reg`. Such places exist for `n = 2`: unipotent ramified `r` with `r̄` unramified forces Frobenius eigenvalue ratio `N(x) ≡ 1`, and `det r̄(Frob_x) ≡ 1`, so `r̄(Frob_x)` is `±1` or a nontrivial unipotent times `±1`; only `r̄(Frob_x) = 1` is in `R_triv`. Theorem 5.16(6) (CG18 line 3513) admits `r̄(Frob_x) = −1`; §5.8 does not.
- CG18 Theorem 1.2 (CG18 line 192) allows `ρ|D_v` ordinary and not finite flat at `v | p`, and Theorem 1.3 (CG18 line 225) other minimal ramification types (hypothesis (4), at `N(x) ≡ −1`). The standing datum of §1.1 requires Fontaine–Laffaille jumps `{0, 1}` at every `v | p` and unipotent ramification only, so neither is reached. Their conclusion (`R_min ≅ T_m` with freeness) is obtained here only when `R_triv = ∅` (§5.5).

Smallest change: in §5.9 write "Then the statement of §5.8 holds for `n = 2` assuming only …", and replace the comparison by one that is true, for example "it contains the finite-flat, unipotently ramified case of CG18 Theorem 1.2, and adds Ihara avoidance at places where `r̄` is trivial". The proof paragraph ("Specialize §5.8") is already right. The heading of §1.7 uses the same label ("Lifts satisfying the hypotheses of Theorem 5.16 have type S") for a statement that assumes a standing datum; "of §5.8" would match.

## C01 — The supplier contract points to the wrong Tau Ceti file for the augmentation

"Use `TauCeti.MonoidAlgebra.augmentation` in `TauCeti/Algebra/MonoidAlgebra/Exactness.lean`" (under "From Tau Ceti", line 1299). At the pin the definition is in `TauCeti/Algebra/MonoidAlgebra/Augmentation.lean`, line 50 (`noncomputable def augmentation (K) [Monoid K] : MonoidAlgebra R K →+* R`, namespace `TauCeti.MonoidAlgebra`); `Exactness.lean` only uses it (`ker_augmentation_eq_span`, line 130). Name `Augmentation.lean`.

## C02 — "Auxiliary place" in the overview means a place of `R_triv`, while the rest of the text uses it for Taylor–Wiles places

The overview (line 7) says the local rings are smooth "when no auxiliary place has trivial residual representation". In §3.7 ("auxiliary places x ∈ Q") and in the contract for GlobalGaloisDeformations (line 1337) auxiliary places are the Taylor–Wiles places, at which `r̄` is never trivial, so the sentence reads as an empty condition. What is meant is `R_triv = ∅` (§5.5): "when `r̄` is trivial at no place of the finite set where ramification is allowed" would say it.

## C03 — A pointer in Scope and ownership still says "below" for a layer that now stands above it

"the global component and operator comparison below differs by allowing all number fields" (line 1285). Since the scope section moved to the end, the comparison (§§3.2–3.5) is above; "the supplier contract below" in the same paragraph is still right.

## N01 — Line-number locators

Each locator carries "CG18 line N", the line of a text extraction a reader does not have; theorem and published page already locate the statement. Two of them point at the wrong line: the sentence after Conjecture B(5) cited in §2.7 is at line 4722 (cited 4710), and Remarks 9.7–9.8 cited in §3.5 are at lines 4875 and 4885 (cited 4843).

## N02 — Subsection headings named by source numbers

Nine subsection headings carry a source's numbering (1.3, 1.5, 1.6, 1.7, 2.8, 3.5, 3.6 "(CG18 §9.4)", 4.2, 5.4). The layers are named by their mathematics; the subsections would read better named the same way, with the source number kept in the locator.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions: `(d, q₀, ℓ₀)` | `(r₁,r₂,n)` = (1,0,2), (0,1,2), (2,0,2), (1,0,3), (0,2,2) | (2,1,0), (3,1,1), (4,2,0), (5,2,1), (6,2,2); `2q₀+ℓ₀=d` each | agree with Checks of Conventions, §2.3, §2.8 |
| §0.2 deck class `det(B)a^{1−n}`, `T_{α,k}=⟨α^{k−n}⟩` | `n=3`, `k=1,2,3`; scaling by `c` | `u⁻²`, `u⁻¹`, `1`; `c^{n−1}c^{1−n}=1`; order 5: `(u³,u⁴,1)` | true; excludes `det(B)` and `det(g)` readings |
| §0.2 PGL₃ Hecke polynomial, `q=2`, roots (2,3,1/6) | positive and inverse cosets mod 25 and mod 5 | `T₁=31/3`, `T₂=41/3`; (1,23,19,17) vs (1,3,4,17); both (1,3,4,2) mod 5 | true |
| §0.3 Hecke algebras (Definition 9.1) | `F=ℚ`, `n=2`, `p>3`; `O[C₅]`; `O×O`, `d=(1,−1)` | `H¹(C₂∗C₃)=0`, `T=O`; `k[C₅]=k[u]/u⁵`; `m^Q=(ϖ)×O` since `−2` unit | CG18 line 4650 supports base definition; extension to all levels declared |
| §0.5 duality without boundary | `C₂` sign character over 𝔽₃; level one Eisenstein | `H⁰=0` vs 𝔽₃; `H⁰_m=k`, `H²_c,m=k`, `H²_m=0` | true; source (CG18 lines 4767, 5159) uses boundary vanishing, README does not need it |
| §1.1 standing datum; oddness | `n=2`, `p=3`, `r̄(c)=1` | trace `2=−1`, eigenspaces (2,0); exception only `p=n+1` (`t=n≡−1`) | true; CG18 line 4396–4421 read |
| §1.2 local rings; p-torsion | `Φ=diag(1+X,δ/(1+X))`, `Σ=diag(1+a,1−a)`, `a²=(q−1)a=0`; `q=7`, `O=ℤ₃` | `S²=0`, `ΦS=qSΦ` so `(q−1)tr(ΦS)=0`; `tr(ΦS)=a((1+X)−δ/(1+X))≠0` | true; contradicts CG18 Lemma 8.2(1), as README says |
| §1.3 dimension | sum of factor dimensions | `Σ_{v|p}(n²−1+[F_v:ℚ_p]n(n−1)/2)+|R|(n²−1)+1` equals stated | true |
| §1.4 coordinate `δ ↦ θ(δ^{b})`, `b=(1−n)⁻¹` | `n=3,p=5`; `n=2` | `1−n≡3`, `b=2`, `θ(d³)²=θ(d)`; `b=−1` | consistent with §2.2(6) and §4.1 |
| §1.6 numerical coincidence | imaginary quadratic `n=2`, `|T|=1`, `q=3`; real quadratic | `g=q+|T|−4=0`, `j=3`, `dim R_∞=6=1+3+3−1`; `g=q+|T|−3` | derivation from §1.5 recomputed; CG18 line 4543 |
| §2.1 polynomial normalisation | rescaled `T`, `n=2`, norm 2, char 7 | determinant `N^{n(n−3)/2}`: 4 instead of 2 | true |
| §2.2 clauses (1)–(3), (6) | `T_{α,1}=⟨α^{1−n}⟩ ↦ θ((α^{1−n})^{b})` | `=θ(α)=ψ_v(Art_v(α))` | CG18 lines 4700–4705, 3156; (6) declared as added |
| §2.4 B^tw | `Q=∅`; `n=2` old space | identity; eigenvalues `α,β`, projector keeps `α` | CG18 lines 4710–4721 |
| §2.7 surjection | image generated by `T_{λ,i}` and diamonds | diamonds in image only via (6) | CG18 line 4722–4724 |
| §3.2 amalgam | `F=ℚ`; ℚ(√−5), `x=(7,3+√−5)` | `PSL₂(ℤ[1/ℓ])`, index `ℓ+1`; `a²+5b²=7` insoluble; index 8 | true; CG18 lines 4827–4839 treat principal case only, as README says |
| §3.4 chain map | boundary of `q²` edge sum; augmentations; `q=7` mod 9 | `A₂(v₀)+v₀−A₁(v₁)−qA₁(v₀)+qv₁=F(v₀)−F(v₁)`; 1 and 1; `q⁻²=7`, `49·7≡1` | true; on `H⁰`: `(a,b)↦q²(a−b)` on edges, identity on diagonal |
| §3.5 Lemma 9.6 | `p=7`, `N=29`, roots 2,4; roots 1,1 | Gram `(N+1)²−T²≡4−36≡3=−(2−4)²`; `α²−1=3`; both 0 | true; CG18 lines 4782–4874 |
| §4.1 minimal complexes | `C=O²`, `t=diag(1,ϖ)`; `C=O`, `t=ϖ` | idempotent `diag(1,0)`, telescope `O⊕E`; 0 vs `E` | CG18 lines 5125–5137; correction of Lemma 7.3 is right |
| §4.2 data; reflection | `(q₀,ℓ₀)=(1,1)` | `T⁰=H²∨`, `T¹=H¹∨`; `dim R_∞=1+q+j−ℓ₀` | CG18 lines 5174–5208; source's `T^i` index is a misprint |
| §4.3 mod ϖ comparisons | `0→k→E/O→E/O→0` in degree `q₀` | `H^{q₀−1}(E/O)_m=0` gives `H^{q₀}(k)_m=H^{q₀}(E/O)_m[ϖ]` | CG18 lines 5183–5185, 5220 |
| §5.3 transfer | `A=O⟦x,y⟧/(xy)`, `M=A/(x)` | `Supp M/ϖ=V(x)` only | DeformationAndDerivedPatchingAlgebra §6.7 states the lifting used; CG18 lines 5233–5239 |
| §5.4 Theorem 9.19 | hypotheses side by side | README adds `ζ_p∉F(ad⁰)`, split `R`, clause (6), all levels | stronger hypotheses, same conclusion; CG18 line 5166 |
| §5.6 cuspidal recognition | `Speh(σ,2)`, `n=4`, `N(λ)≡1` | roots `(a,a,b,b)`; Frobenius in `G_{F(ζ_p)}` forces `N(λ)≡1` | true; CGH20 lines 199–207 |
| §5.8 character choice | `n=2,p=5`: (0,1); `n=3,p=5`: (0,1,2) | (2,3), sum 5; (4,0,1), sum 5 | true |
| §5.9 (R01) | `n=2`, `r` ramified unipotent, `r̄` unramified at `x` | `r̄(Frob_x)∈{±1, ±unipotent}`; only `+1` in `R_triv` | overclaim: R01 |

- Source locators checked against the text: 45 in CG18, 7 in CGH20, 2 in KT17 (the four KT17 lines of the References entry were not opened); theorem numbers and published pages agree; two line numbers off (N01).
- Library declarations opened at the pins: 7 (`Field.absoluteGaloisGroup` AbsoluteGaloisGroup.lean:42; `Representation` Basic.lean:48; `HeckeCoset` Defs.lean:157; `HeckeRing` :189; `Module.support_eq_zeroLocus` Support.lean:216; `Monoid.PushoutI` PushoutI.lean:60; `groupCohomology.coindIso` Shapiro.lean:58) and Tau Ceti `augmentation` (C01).
- Cross-roadmap citations resolved by heading: 118 sections in 26 roadmaps (21 on main, 5 at open heads); none missing. Section contents read: DeformationAndDerivedPatchingAlgebra §§6.1, 6.7; ArithmeticLocallySymmetricSpaces ALS.3.14; GlobalGaloisDeformations §§5.7, 5.8, 6.5; ModularityAndLanglandsExtensions §§2.7–2.8.
- Declared gaps: 11, same slugs in the plan and in the README, each with a named supplier and section; none asks for what the supplier section already states.
- Automatic checks re-run on the head: all pass. Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, no output. The file declares nothing, so there is no `#check @name` comparison and no one-tactic probe. Headlines (§§1.3, 1.6, 1.8, 3.5, 3.6–3.7, 4.1–5.1, 5.4–5.5, 5.6, 5.8–5.9) are each named in the docstring with the missing carrier; no deformation ring, arithmetic quotient or automorphic representation exists at the pins.
- Pull-request text: every sentence of the description read against the head; none contradicted (the five roadmaps it says are named only in the opening and scope occur at lines 11, 1281, 1289 only; no outside-folder change).
- Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialAutomorphyInfrastructurePartII, GL2ModularityLiftingPartII, PotentialAutomorphyInfrastructure, CrystallineLocalGlobalCompatibilityCM, HilbertModularVarietiesAndShimuraCurves, GlobalGaloisDeformations, LocalGaloisDeformationRings, and ModularityAndLanglandsExtensions; shared objects: the selected-root comparison of CG18 Lemma 9.6, owner this roadmap §3.5 (GL2ModularityLiftingPartII cites it); the conditional lifting endpoint of CG18 Theorem 5.16, owner ModularityAndLanglandsExtensions §2.8 under CG18's Conjecture B, with §5.8 here a kept variant under the strengthened package and split `R` (difference stated in Scope); the rank-two numerical coincidence of GlobalGaloisDeformations §6.5 is a different count (no defect).
- Source independence: 16 passages compared with 3 sources, none shared beyond statements the mathematics forces (longest run about 16 words, the component clause of Lemma 8.2(4)); largest share CG18, 72 of 86 line locators; contents compared with CG18: independent (Layer 0 ↔ §§9.1–9.2 precedes Layer 1 ↔ §§8.5–8.6; §§6–7 are supplied and applied in Layers 4–5; the order inside Layer 1 is forced by §1.2 → §1.4 → §1.5 → §1.6).
- Research link: The headline targets are Lemma 8.2, Proposition 8.5, Lemma 9.6 and Theorem 9.19 of Calegari–Geraghty (2018), with Theorem 5.16 as application; §5.5 is the smooth case used by Calegari–Geraghty–Harris (2020), Theorem 1.2. Rests on CG18 and CGH20 as read.

## Not verifiable

- none

## Source issues

- **Error** in CG18 at Lemma 8.2(1), published p. 407: the source says both local rings are p-torsion free; it should be that their minimal primes have characteristic 0, since `(q−1)·tr(ΦS)=0` with `tr(ΦS)≠0` in `R¹_v`; affects the proof.
- **Error** in CG18 at Lemma 8.2(3) with the set `R` of §8.5, published pp. 407–408: the source says the character-side spectrum is irreducible for every `R`; it should require trivial `r̄|G_v` there, as distinct Frobenius eigenvalues give two components; affects a stated result.
- **Misprint** in CG18 at the proof of Lemma 9.6, published p. 416: the source says the Gram determinant is `T_x² − (1+N(x))²`; it should be `(1+N(x))² − T_x²`; affects nothing.
- **Error** in CG18 at the proof of Lemma 9.6, published p. 418: the source says the normalised squared operator acts by 1 on the amalgam cohomology; it should be `N(x)⁻²` (the unnormalised one acts by 1); affects nothing.
- **Misprint** in CG18 at the proof of Theorem 9.19, published p. 426: the source says the residual complex has `T^i` equal to the dual of degree `i − l₀`; it should be degree `q₀ + l₀ − i`; affects nothing.
- **Gap** in CG18 at Lemma 7.3, published p. 393: the source says the direct limit along powers of `T` is a perfect summand; it should be the summand cut out by the idempotent limit of `T^{n!}` (for `C=O`, `T=ϖ` the direct limit is `E`); affects the proof.

## For the human reviewers

- none
