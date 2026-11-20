# Review of NeronModelsAndSemistableAbelianVarieties (pull request #2708 at 9cfa998)

**Verdict:** accepted

**Summary.** Accepted: a full review of the folder found no false or unsupported statement. The new section 3.9a (the curve–Jacobian criterion) agrees with Deligne–Mumford at every locator it gives, its two Checks compute as stated, and no other roadmap, on main or open, states the criterion. There is one small correction (the perfect-residue-field hypothesis of the converse in 3.9a is used by no step of the route the section gives) and five format notes, none blocking. Two questions for the author and four facts for the human reviewers are at the end.

## C01 — The route given for the converse of 3.9a never uses that `k` is perfect

An implementer who follows the route will find the hypothesis `k` perfect unused and cannot tell whether a step was meant to need it. In 3.9a (README lines 1323–1362) each input is stated over an arbitrary discrete valuation ring: StableReduction Layers 7–8 ("All over an arbitrary discrete valuation ring unless stated", README line 4592; Layer 7 on main gives nodal models "over every localization at a maximal ideal of the integral closure in one finite extension"), 3.3 and 3.9 (README lines 1031 and 1290, "over an arbitrary discrete valuation ring"), the Isom scheme and fppf descent of SchemeAndStackFoundations §4.15, and `StablePicardFaithful`, which is applied at geometric points. The flatness of `R̃ ⊗_R R̃` over `R`, the schematic density of its generic fibre and Stacks Lemma 41.7.2 use no residue-field hypothesis either. The sources carry the hypothesis for another reason: Deligne–Mumford obtain the stable model over the extension from the case of a rational point over an algebraically closed residue field (pp. 89–91), which this route replaces by StableReduction, and Stacks Remark 55.18.2 itself says the equivalence presumably holds for general residue fields.

The smallest change is one sentence after "records the equivalence for perfect `k`": that the route above does not use the hypothesis, which is kept because the cited sources state the converse under it. Alternatively the converse could be stated for every discrete valuation ring, with the two sources cited for the perfect case; I checked the route step by step, not an independent proof of the general statement, so the first option is the safe one.

## N01 — One Fontaine range starts a page early

In 5.3 (README line 2768) "Exposé VIII, … §§2.3.2–2.3.7, pp. 335–339": §2.3.2 begins on p. 336 (fontaine-ladic line 502); p. 335 carries §2.3.1. The References entry already gives 336. Carried from the previous review; the line is unchanged.

## N02 — The Serre locator in 5.3a gives the page of the file, not the printed page

In 5.3a (README line 3019) "Serre 1970, n° 2.4, cases b), c), p. 10": the cases are on the printed page 19-09, which is the tenth page of the Numdam file (serre-facteurs lines 265–277; the first printed page 19-01 is the second page of the file).

## N03 — `HasNodalReduction` is also a declaration of the pinned Tau Ceti

3.9a and 6.14 cite `HasNodalReduction` only as StableReduction Layer 7's predicate, and the supplier contracts say that only the listed Mathlib and Tau Ceti declarations exist at the pins. `TauCeti.HasNodalReduction` exists at the pin (`TauCeti/AlgebraicGeometry/Curves/StableReduction/NodalReduction.lean`, line 58: a `Model` that is proper with `AtWorstNodalOfRelativeDimensionOne` structure map). It would help to list it under "From Tau Ceti".

## N04 — Two sentences that are unclear or ungrammatical

In 5.1a (README line 2666) "over the fixed field of the kernel of `I_K` on `A[m]`": that field is a finite extension of the maximal unramified extension of `K`, not a local field in the sense of the sentence; naming it, or `K(A[m])`, would say which base is meant. In the Examples of Layer 6 (README line 4050) "The worked comparisons of this roadmap combines" should read "combine".

## N05 — The generated dependency blocks of the description are out of date

The `depends-on` and `merge-order` blocks of the description list pull request #2578 as still open and to merge first. Its commit is on main and is merged into this head, and the folder's change against main is the 171 lines the prose describes.

## Questions for the author

- In 5.3e Saito's formula is stated for a *complete* discrete valuation ring with perfect residue field. Liu's introduction (liu-genre2 lines 30–33, p. 51) sets it up for any discrete valuation ring with perfect residue field, and reduces to the strict henselisation on p. 53. Is completeness in Saito's Theorem 1, or added here? Saito 1988 is behind a paywall and I could not read it.
- In 1.6 the weak Néron model is cited to "Bosch–Lütkebohmert–Raynaud, §1.2, Definition 1, p. 12", the same locator 1.1 gives for the Néron mapping property. Is the weak model defined there, or in §1.1? The book is behind a paywall and I could not read it.

## Previous findings

The previous review (of `a62a075`) had no findings. Its other remarks:

- N01 — not repaired: README line 2768 still reads "pp. 335–339"; written again above.
- Its first question (which step of the converse of 3.9a uses that `k` is perfect) is answered by this review's check of the route and is now C01. Its second question (completeness in Saito's theorem) stands and is repeated above.

The change since that head is the merge of main: the opening overview and the present section order. No statement of a layer changed; every passage was nevertheless read again.

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result |
|---|---|---|---|---|
| 1.1 Néron mapping property (sample) | `𝔾_{m,R}`, `Y = Spec R`; Tate `v(q)=1`, ramified quadratic `R'`; `j = 𝟙` | `R^× → K^×` misses `π`; `v'(π')=1` odd, `v'(q)=2`, so `π'` on non-identity component | `N(R') = N⁰(R')` since `Φ = ℤ/1`; `j = 𝟙`: every object passes | Checks true; definition excludes sections-only and étale-only variants. Source not readable |
| 1.9a closure Checks | `y²+y=x³−x`, `P=(0,0)` | `5P=(1/4,−5/8)`, `−5P=(1/4,−3/8)`; `t=−x/y`: `2/5`, `2/3` | both of 2-adic valuation 1, distinct; `(t−2/5)(t−2/3) ≡ t²` mod 2 | True: length-2 nonreduced fibre |
| 2.1 identity component (sample) | good; split `I₅` | Stacks 39.8.1 (045X): equidimensional; 39.7.11 (0B7R): `G⁰` flat closed, geometrically irreducible, quasi-compact | `M_k = 𝔾_m × ℤ/5` has 5 components, `M⁰_k = 𝔾_m` | Locators match (stacks-groupoids); SGA 7 locator not readable |
| 2.2 component group | nonsplit `Iₙ`, `n = 1,2,4,5,0`; `μ₂` over `𝔽₂`, `𝔽₃` | fixed points of `−1` on `ℤ/n`: 1,2,2,1; on `ℤ`: 1 | orbits on `ℤ/5`: `{0},{1,4},{2,3}`, degree 5, one `k`-point | True; `0 < n` needed |
| 2.3 Chevalley decomposition (sample) | good, split multiplicative, additive | `(t,a,u) = (0,g,0), (1,0,0), (0,0,1)`, sum `g` | Conrad Thm 2.6 (perfect `k`), Prop 2.16(2) splitting `T×U` for perfect `k` | Match at conrad-semistable lines 108–111, 228–235 (pp. 3, 6) |
| 2.4 toric character lattice (sample) | split, nonsplit torus; `[m]` | `X^* = ℤ`; Galois by `−1`; `[m]^* = m` | Conrad Thm 3.1: torus and abelian quotient exist over any `k` (lines 259–262, p. 7) | Match; SGA 7 locators not readable |
| 2.9 wild Checks | `y²=x³+32` over `ℤ₂`; `y²=x³+9` over `ℤ₃` | `v₂(−432·32²)=4+10=14`; `v₃(−432·81)=3+4=7` | Tate's algorithm: `a₆=2⁵`, `2⁶∤a₆` gives `II*`; `v₃(b₆)=2`, `b₈=0` gives `IV` | True; both exceed tame 10 and 4 |
| 3.4 ramified Tate curve (sample) | `n=1,e=2`; `e=1`; `q=t²`, `X²−tX−t`; `e=0` | `ℤ/n → ℤ/en`, `r ↦ er`: `ℤ/1→ℤ/2`; identity; `ℤ/2→ℤ/4`, `r↦2r` | Conrad Ex. 4.6: `n+n(e−1)=ne` lines, map multiplication by `e` (lines 447–474, pp. 11–12) | Match; injective for `e>0`, zero map for `e=0` |
| 3.5 finite flat Check | `y²+txy+y=x³` over `𝔽₂[[t]]` | `Δ = −27+9t³ = 1+t³` in characteristic 2; `−(x,y)=(x,y+tx+1)` | `x=u⁻²`, `y²=x³=u⁻⁶`, so `(u⁻²,u⁻³)` is 2-torsion | True; Conrad Lemma 5.4 p. 18 matches, with the misprinted corank |
| 3.9a forward (sample) | genus 0; `y²=(x²−p)(x−1)(x−2)(x−3)`, `p≥5` | fibre `y²=x²(x−1)(x−2)(x−3)`: one node, local `y²−x²u = p·unit`, regular | normalisation `w²=(x−1)(x−2)(x−3)` elliptic: `t=1`, `a=1`, `g=2` | True for every DVR; Deligne–Mumford forward step at lines 570–574 (p. 89) |
| 3.9a converse (sample) | genus-one torsor under good `E/ℚ_p`; descent route step by step | tree with one genus-one component contracts to a smooth model; Lang plus Hensel give a point: contradiction | D–M: `T` finite unramified, radicial, closed, contains dense generic fibre (lines 667–673, p. 92) | True; `g ≥ 2` needed; perfect `k` unused by the route (C01) |
| 3.9a `StablePicardFaithful` | smooth `g≥2`; elliptic tail; rational nodal component | `Q+τP ∼ τQ+P`, distinct for `Q≠P`: infinitely many divisors of the unique `g¹₂` through `τP` | `[−1]` acts by `−1` on `Pic⁰(E)`; branch swap inverts `𝔾_m` | True; D–M Thm 1.13, Lemmas 1.14–1.17 at lines 416–465 (pp. 85–87) |
| Stacks citations in 3.9a | Remark 55.18.2; Lemma 41.7.2 | remark: equivalence for perfect residue field, presumably general | lemma: closed immersion ⇔ proper, unramified, universally injective | Both say what the README says |
| 3.11 finite-level control | `[[1,ℓ],[0,1]]` and its `ℓ`-th power | fixed lattices both `ℤ_ℓ e₁` | mod `ℓ²`: fixed vectors `b ≡ 0 (ℓ)` versus all | True; the two differ |
| 3.12 full level | `N=2` twist; `q=π^N`; eigenvalue bound | root of unity `≡ 1` mod odd `ℓ` or mod 4 is 1 | `−1 ≡ 1 (2)`: ramified quadratic twist additive | True; Conrad Prop 6.5 p. 23 matches |
| 4.2, 4.5 lattices | three parallel edges; `2I₂`; `diag(1,4)` | Gram `[[2,−1],[−1,2]]`, determinant 3 | cokernels `(ℤ/2)²` and `ℤ/4`, both of order 4 | True |
| 4.3 sign Checks | `(2,3),(5,−7)`; valuation 5 mod 4 | `2·(−7)−3·5=−29`, reversed `29` | period class 1, Weil class 3 in `ℤ/4`; both 1 in `ℤ/2` | True |
| 4.7 intersection matrix (sample) | tree; `n`-cycle; `I₂`; `I₀*` | `ker(d)/im(I)`: 0; `ℤ/n`; `ℤ/2` | `I₀*` with central multiplicity 2: `(ℤ/2)²`, agreeing with 2.8 | Checks true; SGA 7 Theorem 12.1 not readable |
| 5.0c, 5.3i, 6.0a (sample) | `y²=x³−x` at 5; `E[3]` | points: `1+1+2+2+1+1=8`, `a₅=−2`, `P₅=X²+2X+5`; `X²P₅(5/X)=5P₅(X)` | wrong sign differs by `4X≡X (3)`, forcing `F=0`; Ribet–Stein Thm 5.12 p. 73, Thm 5.16 p. 74 | True; locators match |
| 5.1 Check | `ℚ₇`, `N=3`, `q=2·7³` | cubes mod 7: `0,1,6`; 2 not a cube | `X³−2` irreducible, separable mod 7: root unramified | True |
| 5.1a potential good reduction (sample) | good; Tate; `y²=x³−x` over `ℚ₂` | inertia image trivial; infinite unipotent | `j=1728` integral: finite image, bad reduction | Statement standard and consistent with 3.12 and 3.3; Serre–Tate not readable |
| 5.3 period comparison (sample) | Tate `π⁵`, `e_K=2`; `q=5,30` over `ℚ₅`; `y²+y=x³` over `ℤ₂` | `N_K=5`, `N_p=5/2`; `log 6 ≡ 5 (25)`, nonzero | 3 points over `𝔽₂`, `a=0`, polynomial `t²+2` | True; Fontaine III §5.2.1 p. 158, §1.8.6 p. 135; VIII §1.3.5–1.3.7 pp. 329–330; Coleman–Iovita p. 3, Thm 2.1 p. 11 |
| 5.3a elliptic conductor (sample) | 11a1; `y²=x³−x` over `ℚ₂`; scaled good equation | `f₁₁=1`; `f₂=5` (conductor 32) | Serre n° 2.4: `ε=0,1,2`, `δ=0` for `p≠2,3`; Brumer–Kramer (6.1), p. 243 | Match; page slip N02 |
| 5.3c Euler characteristics | `Iₙ`, `II`, `III`, `IV`, `I₀*` | `χ`: `n`, 2, 3, 4, 6 | `m−1+ε`: `n`, `1−1+2`, `2−1+2`, `3−1+2`, `5−1+2` | Equal in each case |
| 5.3d determinant of cohomology (sample) | minimal regular elliptic model; Tate curve | `λ₁ = L`, `λ₂ = L²⊗L⁻¹ = L`, so `λ₁¹³⊗λ₂⁻¹ = L¹²` | section `Δ_min·ω_min¹²`: order `v(Δ_min)`; Tate: `v(q)` | Consistent; Liu §2.1 pp. 58–59 and p. 51 match; Saito not readable |
| 5.3e Ogg | good; `I₀*`, `p≥5`; `y²=x³−x` over `ℚ₂` | `0=0+1−1`; `6=2+5−1` | `v(Δ)=v(64)=6`, `f=5`, `m=2`: `5+2−1=6` | True |
| 5.6 local Euler polynomial (sample) | split, nonsplit Tate; surface `t=a=1` | `(V^∨)^I` trivial line: `1−T`; `1+T` | Raynaud 4.7.4: absolute values `1, q, q^{1/2}` on étale, toric, abelian steps; dual gives degree 3, roots `1, q^{−1/2}, q^{−1/2}` | True; Raynaud 4.6.1 p. 315, 4.7.4 p. 317 match |
| 6.4a connected Kummer (sample) | `A=0`; `m=1`; Tate; additive in characteristic `p` | kernel ranks `m²` generic, `m` special | `[p]=0` on `𝔾_a`: not surjective | True; Mazur III Lemma 3.3 p. 149; Milne III Lemma 5.3 p. 267 |
| 6.4c component defects | `E_q→E_{q^m}`; `[m]`, `ord q = n` | `ℤ/n→ℤ/mn`, `r↦mr`: kernel 0, cokernel `ℤ/m` | `[m]` on `ℤ/n`: kernel and cokernel of order `gcd(m,n)` | True |
| 6.6 Check | `y²+xy=x³+a₂x²+2`, `a₂=0,1` | `b₂=1+4a₂` unit, so `c₄` unit; node at origin | tangent `T²+T+a₂`: split, irreducible over `𝔽₂` | True |
| 6.9 minimal differential (sample) | `y²=x³+π⁶` against `y'²=x'³+1` | `ω = u²dx'/(u³(2y'+…)) = u⁻¹ω'`, `Δ=u¹²Δ'` | `u=π`: valuation 12, `π⁻¹ω_min` outside the lattice | True; Tate's text not readable legally |
| 6.13 group count | centraliser of `(12)(34)(56)`; point stabiliser | `2³·3! = 48` | fixing 1 fixes 2: `2²·2 = 8` | True; pinned lemma opened |
| 6.14 full level | `N=3,4`; function field over perfect `k` | residue fields finite over `k`: perfect; residue characteristic prime to `N` | `#GSp_{2g}(ℤ/N) < N^{4g²}` | True; uses 3.12 and 3.9a as stated |
| `LocalExistence`, `DedekindExistence` (headlines) | DVR; integral Noetherian normal base of dimension one | restriction `Hom(Y,X) → Hom(Y_η,X_η)` bijective for smooth `Y` | README 1.1, 1.2, 1.7, 1.9: same quantifiers, quasi-compactness included | Lean and README agree; no binder lost |
| `HasGoodModel`, `GoodIsogeny` (headline) | `[p]`; `E_q→E_{q³}`; additive pair; `[0]` | (good, good); (bad, bad); neither good | Conrad Prop 4.1(1) with ranks: `t_B = t_A = 0` | True for every DVR; marking as schemes suffices, since points extend by properness |
| `EquationGoodComparison` (headline) | good; scaled equation; `I₁` | `ord Δ = 0` on the minimal model | smooth projective model, abelian-scheme model | True; needs `IsMinimal`, which is in the signature |
| Headlines not stated (monodromy criterion, semistable reduction, curve–Jacobian, component cokernel, Néron–Ogg–Shafarevich) | carriers searched at the pins | no semi-abelian predicate, no Tate module of `AbelianVariety`, no Néron declaration | module docstring names each and the missing carrier | Correctly left unstated |
| Pull request text against the head | each bullet of the description | 1 heading added (3.9a), 0 removed, 0 Lean statements changed | description: same; StableReduction on main lines 643–657 say what is quoted | Agree; generated blocks out of date (N05) |

- Source locators checked against the text: 41, in 13 sources (Deligne–Mumford 6, Conrad 14, Stacks 9, Raynaud 5, Fontaine 6, Coleman–Iovita 2, Liu 3, Serre 1, Brumer–Kramer 2, Mazur 1, Milne 1, Ribet–Stein 2); 2 page slips (N01, N02).
- Library declarations opened at the pin: 24 (among them `AbelianVariety.IsIsogeny`, Isogeny.lean line 61; `HasNodalReduction`, NodalReduction.lean line 58; `IsIntegralClosure.finite` and `isDedekindDomain`, IntegralClosure.lean lines 175 and 220; `Scheme.Hom.smoothLocus`, Smooth.lean line 300; `exists_ne_zero_apply_eq_self_of_forall_pow_eq_one`, PGroupInvariants.lean line 170).
- Cross-roadmap citations resolved: StableReduction Layers 1, 4, 7, 8 on main and its open revision; SchemeAndStackFoundations §4.15 (`isom_stable_curves`, `Mbar.isStack`, lines 7054–7068); six consumers' citations of §§1.2, 1.3, 1.8, 1.9, 2.2, 3.1, 3.8, 3.12, 3.13, 4.7, 5.1, 5.2, 6.4, all still present.
- Automatic checks: all passed; none set aside.
- Elaboration: `sorry` warnings at lines 68, 83, 112, 124 and nothing else. One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `exact?`) on a copy of the file closes none of the four theorems. The elaborated types of the five declarations were compared with 1.7, 1.9, 1.8, 5.2 and 6.5: no binder lost.
- Changes outside the folder: none. No `set_option`, no sorried data, one `import Mathlib` and three existing Tau Ceti modules.
- Ownership against open pull requests was checked on the heads provided.

Dependency check output:

```text
depcheck: 182 roadmaps, 2080 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read AbelianSchemesAndArithmeticModuli, RelativeJacobiansAndIntegralCurveModels, FiniteFlatGroupsAndIntegralPadicHodgeTheory (main), FaltingsFinitenessAndIsogenyTheorems, EisensteinIdealAndRationalTorsion, HyperellipticCurves (open), and StableReduction (main and its open revision) with StableReductionPartII (open) for the criterion; all cite this roadmap as a supplier and none states Néron models, the semistable predicate or the curve–Jacobian criterion; nothing shared.

Source independence: 12 passages compared with 7 sources, none shared beyond phrases the mathematics forces (longest common run about six words, in the descent of 3.9a against deligne-mumford lines 670–673); largest share conrad-semistable, about 38 of about 270 locators; contents compared with conrad-semistable: independent (its §§2–7 are spread over Layers 2, 3 and 5, and Layer 3 interleaves its §§4, 5 and 7). Bosch–Lütkebohmert–Raynaud and SGA 7 I, the next largest shares, could not be read.

Research link: 3.9a is Deligne–Mumford (1969), Theorem 2.4; 3.10–3.12 are Grothendieck's semistable reduction theorem and criterion (SGA 7 I, 1972); 4.6 is Werner (1997); 5.3 rests on Coleman–Iovita (1999) and Fontaine (1994); 6.10–6.13 feed Boxer–Calegari–Gee–Pilloni (2021, 2025). Rests on the README and the sources read.

## Not verifiable

- Bosch–Lütkebohmert–Raynaud, *Néron Models* (1.1–1.10, 2.7, 4.13, 6.5): behind a paywall; cited by locator only.
- SGA 7 I, Exposé IX (2.1, 2.2, 2.4, 3.9, 4.1–4.7, 6.1–6.2): recorded as uncertified; cited by locator only.
- Serre–Tate 1968 (5.0a, 5.1a): the publisher's page is not an open one.
- Tate's *Algorithm* (2.6, 2.8, 2.9, 6.6–6.9): the only copy linked is on a third party's site, which I did not read.
- Saito 1988, Faltings–Chai, Darmon–Diamond–Taylor, Noot 2013, Illusie 2021, Silverman, the Yuan–Zhang erratum: no legal copy found.

## Source issues

- **Misprint** in conrad-semistable at the paragraph after Lemma 5.4, p. 18: the source says the finite part has corank `2g − (2t + a) = t`; it should be `2g − (t + 2a) = t`; affects nothing.
- **Misprint** in conrad-semistable at Theorem 4.2, p. 9: the source says the integral closure of `R` in `K`; it should be in `K'`; affects nothing.
- **Misprint** in conrad-semistable at Proposition 4.1(2), p. 8: the source prints the conclusion that `f` is an isogeny twice; it should print it once; affects nothing.

## For the human reviewers

- Licence: the References link Tate's *Algorithm* (Lecture Notes in Mathematics 476) to a scan on a site that is not the author's (README, the Tate entry of References).
- Licence: the supplier contract for RigidAnalyticGeometry links Huber's article to a copy in the reference folder of another person's seminar page (README line 4667).
- Licence: the Provenance section names two Apache-2.0 Lean repositories as prior art for 1.8, 1.9, 5.0a, 2.8, 6.5 and 6.6 and says `HasGoodModel` differs from their good-reduction predicate. I did not open those repositories.
- Not tested: Bosch–Lütkebohmert–Raynaud and SGA 7 I, the sources with the second and third largest shares of the locators, could not be read; wording and arrangement were compared with the largest (Conrad's notes) only.
