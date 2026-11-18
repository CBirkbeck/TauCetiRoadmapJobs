# Review of SerreModularityByCompatibleSystems (pull request #2514 at 40c8abe)

**Verdict:** needs changes

**Summary.** The targets, the Lean statements and the supplier citations hold up. All fifteen sampled locators check out against Dieulefait–Pacetti, Khare–Wintenberger I, Khare and Serre, and every Check I computed is true. One finding blocks: the opening overview states three consequences (the finite-flat weight-two case, the level-one case and the regular compatible-systems theorem) without hypotheses that their targets carry, and as written each is false. It needs a word or two in each sentence. There are five small corrections and two format notes, none blocking. The human reviewers have one licence fact to look at.

## R01 (P2) — The overview states three consequences without hypotheses their targets carry, and as written they are false

A reader who stops at the overview takes these sentences (README line 7) as the roadmap's results. As written, they include representations that the targets exclude.

- **Finite-flat case.** The sentence about "a residual representation that is finite at `p` … and has cyclotomic determinant" leaves out absolute irreducibility, which `S7/finite-flat-weight-two-case` assumes. For `p ≥ 5`, `ρ̄ = 1 ⊕ χ̄_p` is the generic fibre of `μ_p × ℤ/p`, so it is finite at `p`, and it has determinant `χ̄_p` and `N(ρ̄) = 1`. But `S₂(SL₂(ℤ)) = 0`, so no weight-two newform of level `N(ρ̄)` exists.
- **Level-one case.** "In level one the absolutely irreducible representations come from cusp forms of level one" leaves out oddness, which `S6/level-one-case` assumes. Take the Hilbert class field `H` of `ℚ(√229)`: the class number is 3, and `H` is totally real because the fundamental unit `(15+√229)/2` has norm −1. The two-dimensional representation of `Gal(H/ℚ) ≅ S₃`, reduced mod 229, is absolutely irreducible, unramified outside 229 and even. Every `ρ̄_f` is odd, so this representation comes from no cusp form.
- **Regular compatible systems.** "Every odd, irreducible, regular compatible system … is modular" leaves out the twist that `S7/regular-compatible-systems` includes. The Tate twist `ρ_{f,λ} ⊗ χ_ℓ` is odd, irreducible and regular, with Hodge–Tate weights `{1, k}`. No newform is attached to it, since attached systems have weights `{0, k−1}`.

The smallest repair: "an odd, absolutely irreducible residual representation that is finite at `p`"; "In level one the odd, absolutely irreducible representations"; "is modular up to a twist" (or "comes, after a twist, from a newform").

## C01 — Kisin's result (2.2.17) is a Corollary, not a Theorem

The text calls it "Kisin's Theorem (2.2.17)" (lines 55, 61 and 304), so a reader looking for a theorem with that number in [KiFM] finds nothing. In [KiFM] it is Corollary (2.2.17), printed p. 685. It assumes Hypothesis (1.2.6) and excludes `ρ̄|G_{F_v}` of the form `(ωχ ∗; 0 χ)`; the hypothesis tables of GL2ModularityLifting already account for both. Write "Corollary (2.2.17), p. 685".

## C02 — `khare_level_one` does not state the weight `k(ρ̄)`, but the README says it states the level-one case

Line 352 says that `Suggested.lean` "states it as `khare_level_one`". The target `S6/level-one-case` asserts weight `k(ρ̄)`, whereas the Lean conclusion only asks for some `k ≥ 2` and a level-one newform. The module docstring also lists "the level-one case" among its statements without saying that the weight is dropped. Would "states its level-one conclusion, with an unspecified weight at least two, as `khare_level_one`; the weight `k(ρ̄)` needs Serre's local recipe, absent at the pins" be acceptable? The docstring would then name the level-one weight among the refinements that cannot be stated.

## C03 — The description does not mention the two open revisions that repoint main's references to this roadmap

On main, the scope paragraph of SerreWeightAndLevelOptimisation (its README line 17) says that ClassicalSerreModularity owns "the scalar non-dihedral dyadic classical completion and the unconditional Serre statement". SmallRamificationAndAbelianVarietyBaseCases §5.12 (line 2543) names `ClassicalSerreModularity:R33.4` as the consumer of Paso 6. This roadmap owns the first two and states Paso 6. ClassicalSerreModularity at its head defers all three here, and has no R33.4. The open revisions #2518 and #2517 repoint those sentences to this roadmap, keeping every section number cited here. A sentence such as "SerreWeightAndLevelOptimisation (#2518) and SmallRamificationAndAbelianVarietyBaseCases (#2517) move their references from ClassicalSerreModularity to this roadmap and should merge with it" would tell a reader why.

## C04 — The locator for the fine-moduli bound behind `N′` points to a page that does not contain it

Line 35 attributes the choice of `N′` ("`N′ = N` if `N ≥ 5`, `5N` otherwise") to "[KW-I], proof of Theorem 10.1, p. 20". That proof (KW-I lines 871–877) mentions no auxiliary level and no fine-moduli bound. It refers the weight-one step to Khare's note ([Kh97]). Cite [Kh97] alone for `N′`, or keep [KW-I] only for the overall route.

## C05 — One example sentence in Layer S3 does not say what it refers to

"Its order-three polynomial has value `1` at `X=1` in characteristic `2`" (line 240) is true of `X² + X + 1`. But no polynomial is named nearby, and a reader cannot tell what the sentence tests. If it is meant to say that `ℤ₃[ζ]` has no map to a field of characteristic two sending `ζ` to 1, say so; otherwise drop it.

## N01 — Several target titles and ids carry the source's numbering

Titles such as "Paso 1"–"Paso 6", "Lemma 2.1", "Lemma 2.3" and "Remark 6", and ids such as `S2/lemma-2-1-large-image`, `S3/remark-6-…` and `S4/dp-…`, carry the source's numbering. The mathematical half of each title ("killing the odd part of the level") already stands alone; the source label could move into the locator.

## N02 — Citations of AlgebraicModularFormsAndSerreWeights mix spellings

The text writes "AlgebraicModularFormsAndSerreWeights R15.4" (line 75), "`AlgebraicModularFormsAndSerreWeights:R15.4`" and "§R15.5A.3". These identifiers resolve only through that roadmap's numbering note, which maps R15.1–R15.5 to its Layers 1–5. Adding the layer number ("R15.4, Layer 4") would let a reader find the heading.

## Verified sound

| Statement | Instances tried | Values computed (README / check) | Result | Change |
| --- | --- | --- | --- | --- |
| S1 residual-weight normalization | `p=5`: inertia `χ̄⊕χ̄²`; niveau-two `(1,3)`; oddness after twist | `k=1+5+2=8`, twist `χ̄⁻¹` gives `1⊕χ̄`, `k=2`; `(1,3)`: `k=9`→`(0,2)`, `k=3∈[2,6]`; `θ(c)²=1` so `det(c)=−1` kept | holds; DP Remark 2 p. 5, Se87 §2.7 Rem. (2) p. 188 | none |
| S1 Fontaine–Laffaille not bad dihedral | niveau one/two orders; `p=7,k=5` | `χ^{k−1}` order ≤2 ⇒ `2k−2=p−1` or `k=p`; niveau two order `(p+1)/gcd(p+1,k−1)`: `8/4=2` at `p=7,k=5` | matches DP Lemma 1.14 proof p. 9 | none |
| S2 dihedral type at `N` | `κ(Art N)=1` vs `ζ`; `(q,N)=(3,7)`; `(7,13)`; `5²−1` | image orders `2q` vs `2q²`; `3∣6` gives `κ^N=κ`, reducible; `7∣14`, `7∤12`; `24=4·6≠25` | holds | none |
| S2 Paso 2 | `q=13`; `det ρ(Frob_N)` | `N=406561` prime, `≡1` mod 8,3,5,7,11, `≡12` mod 13, smallest such; `det=ψ(N)N`, not a root of unity ⇒ `D_N` image infinite | holds; DP pp. 10–11 | none |
| S2 Lemma 2.1 | KW Def. 2.1 with `t=q` | `t=q>max(Q(N(ρ̄_p)/N²),5,p)` since `S₁∪{2,3}<q`; `N≡1` mod 8 and mod all primes `<q` | holds; DP p. 11, KW-I p. 5 | none |
| S2 Paso 3 | unramified `p_i`-adic member; weak vs KW minimality at `N` | unramified ⇒ HT `{0}` only, so DP's "unramified" is a misprint; weak minimality allows `Ind(κε)`, `ε` of `p_i`-power order (`p_i∣N−1`) | README correction right | none |
| S3 Lemma 2.3 | `D₀P`, `F₀P`, reductions mod `π`, tame relation | both sides `(ζ,0;ζ²,πζ²)` via `ζ(1+π)=ζ²`; `F₀P=PF₁=(1,π;1,0)`; `D₁≡(1,0;1,1)`, `F₁≡diag(1,−1)`; `α/β=2≡−1` | holds; KW 5.1(4) at `(3,2)`: WD `(1⊕1,0)` | none |
| S3 Remark 6 / Paso 4 | très ramifiée Kummer class over `e(K/ℚ₂)=3` | `v` odd ⇒ `3v` odd ⇒ not flat (Fontaine bound `u=2e>2e−1`); steps 1–3 need unramified at 3, HT `{0,1}`, non-solvable | holds; KW-I p. 19 has the argument | none |
| S3 Paso 5 | `N≡1 (mod 8)`, level one bad dihedral | bad dihedral at level one needs `p≡3 (mod 4)`; `N≡1` excludes; reducible case needs only de Rham (CSM §2.3 keeps it) | holds | none |
| S4 Paso 6 | parity; odd sums unramified outside 3; BLZ at 4 | `det=χ̄₅^{k−1}`, odd ⇒ `k∈{2,4,6}`; characters: `1, χ̄₃` only, odd sum `1⊕χ̄₃`; `k=4=3+1` | holds; DP p. 14 | none |
| S5 characteristic two | order-4 projective element; auxiliary `p>3` | `g/μ` unipotent, `(1+N)²=1` ⇒ projective order ≤2; Lemma 1.14 at `k=2` forces `p∈{3,1}` | holds; DP p. 15, KW-I L6.1 | none |
| S5 dependency audit | Pan Rmk 8.0.4; Tung L4.3.3–4.3.4; Kisin intro | Pan 1.0.4 uses KW; Tung cites Calegari 3.2, Snowden 8.2.1, KW Thm 6.1, Paškūnas 3.29; Kisin's odd⇒modular uses KW | holds; label slip | C01 |
| S6 two notions agree | weight one; semisimplification | (ii)⇒(i) newform is eigenform; (i)⇒(ii) Brauer–Nesbitt plus irreducibility; weight one by DS §6.9 | holds; DP p. 1, KW-I p. 2 | none |
| S6 strong form | `p=2` bounds; `ε̄`; scalar `ρ̄|D₂` | `k∈{2,4}`, `p²−1=3<4`; `ε̄=det ρ̄·χ̄^{1−k}=ε(ρ̄)`; inertia of `G_{ℚ₂}^{ab}` pro-2 ⇒ `χ|I₂=1`, `k=2` | holds; Se87 §2.6 p. 188 | none |
| S6 level one | `Δ` mod 11; `p=2,3` | `τ(11)=534612≡1`; 11a1 `v₁₁(Δ)=5`, très ramifiée ⇒ `k=12`; `p=2,3`: no `ρ̄` | holds; Kh Thm 1.1 p. 2 | C02 |
| S6 finiteness | reducible case; `p=2` | characters unramified outside `p` of order prime to `p` factor through `(ℤ/p)^×`; trivial at `p=2`; Kh §7.1: `S₂(Γ₁(p²))` | holds; Kh Cor. 1.3, p. 28 | none |
| S7 finite-flat weight two | `E[p]`, good reduction, `p≥5`; très ramifiée | Prop. 4: `k=2` iff finite and `det|I=χ̄`; très excluded | target holds; overview sentence false | R01 |
| S7 Theorem 10.1(i) | Tate twist `ρ_f⊗χ_ℓ` | HT `{1,k}`, odd, regular; target's "after a twist" covers it, overview omits | target holds | R01 |
| S7 Artin reductions | `ℓ∤|G|`; `Frob_ℓ∼c`; `(3,2)` lattices | `ρ(c)` order 2 ⇒ `2∣|G|` ⇒ `ℓ` odd; eigenvalues `1,−1` distinct; `3∣6` so `L₀`,`L₁` reductions differ | holds | none |
| S7 weight-one reduction / descent | `X₁(N)`, `N≥5`; `k≥2`; `N′` | `0→H⁰/ℓ→H⁰(X_{𝔽_ℓ})→H¹[ℓ]→0`; `H¹=0` (`k≥3`), `≅Ω¹` cohomology free (`k=2`); `N=1,4,5,11→5,20,5,11`; `N=0→0` | holds; KW-I p. 20 lacks `N′` | C04 |
| `serre_conjecture_weak` | `p=2`; `IsConj φ id`; Frobenius convention; probe | `−1=1`, oddness automatic; `i∈ℚ̄` so `σ≠id`; `det=φ(ε(ℓ))ℓ^{k−1}` arithmetic; `simp` leaves goal | true, non-vacuous | none |
| `khare_level_one` | `p=2,3`; weight | vacuous at 2, 3 (Tate–Serre); conclusion `k≥2` only, not `k(ρ̄)` | true; README sentence overstates | C02 |
| `finite_level_one_semisimple` | `1⊕χ̄_p`, `p` odd; probe | hypotheses satisfiable; conjugacy by `B` is isomorphism; `simp` leaves goal | true | none |
| `weight_one_artin_modularity` | arithmetic vs geometric Frobenius; level | conjugate newform `f̄` absorbs convention; level of newform = Artin conductor, so `ℓ∤N` ⇒ unramified; dihedral case satisfies hypotheses | true | none |
| Overview line 7 | `1⊕χ̄_p` at `N=1`; `S₃` from `ℚ(√229)` mod 229; Tate twist | `S₂(SL₂(ℤ))=0`; `det=sign(c)=1`, even; HT `{1,k}` | three sentences false | R01 |

- Source locators checked against the text: 15 sampled targets, 57 locators in DP pp. 1–15, KW-I pp. 2–11 and 18–21, Kh pp. 2–3 and 28, Se87 pp. 187–191, Pan (Thm 1.0.2, Rmk 8.0.4), TuB (Thm A; Lemmas 4.3.3–4.3.4, p. 21), HT (Thms 1.4, 6.3), KiFM (intro; Cor. (2.2.17), p. 685).
- Library declarations opened at the pin: Mathlib `AlgHom.IsArithFrobAt` (RingTheory/Frobenius.lean:55), `IsArithFrobAt` (:184), `Representation.IsSemisimpleRepresentation` (RepresentationTheory/Semisimple.lean:34), `MonoidAlgebra.Submodule.exists_isCompl` (RepresentationTheory/Maschke.lean:159), `NumberField.ComplexEmbedding.IsConj` (NumberTheory/NumberField/InfinitePlace/Embeddings.lean:259), the Krull topology instance (FieldTheory/KrullTopology.lean); Tau Ceti `HeckeRing.GL2.Newform` (NumberTheory/ModularForms/Newforms/Newform.lean:104), `dirichletLift` (:134), `cuspFormsNew` (Newforms/Basic.lean:269), `NumberField.Chebotarev.frobeniusPrimeSet` (NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93), `hasDirichletDensity_frobeniusPrimeSet` and `infinite_frobeniusPrimeSet` (Chebotarev/Density/Chebotarev.lean:51, 74).
- Cross-roadmap citations resolved, every id cited from 14 roadmaps: ClassicalSerreModularity (10 target ids, Conventions §§2.1–2.5, interfaces) at its open head; GL2ModularityLifting §§7.7, 8.7–8.9, 9.2–9.3, 10.14–10.15, 12.1–12.5 and CompletedCohomologyAndLocalGlobalCompatibility §§5.1, 5.4–5.6, 6.3, 6.5–6.6 at their heads; on main AlgebraicModularFormsAndSerreWeights (R15.x via its numbering note; §§1.2–7.5), SerreWeightAndLevelOptimisation, SmallRamificationAndAbelianVarietyBaseCases, PadicLocalLanglandsForGL2Qp, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LocalGaloisDeformationRings §8.8, ArithmeticGaloisRepresentations (and its §6.1 anchor), GL2AutomorphicRepresentationsAndTransfer R17.5–R17.6, ModularForms, ClassFieldTheory, Chebotarev. The cited sections of the latter two also survive at the heads of #2517 and #2518.
- Dependency check: `depcheck: 211 roadmaps, 2271 edges, 0 problem(s)`; no UPWARD or CYCLE line; the pull request changes nothing outside the folder.
- Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings and nothing else. `#check @` of all four theorems and the key definitions matches the README; no binder lost; nothing changed. The definitions are identical to ClassicalSerreModularity's, in another namespace.
- One-tactic probe (`simp`, `trivial`, `aesop`) on a copy of the file: none of the four theorems closes.
- The worker's automatic checks all passed.

Overlap check: read ClassicalSerreModularity, GL2ModularityLifting, PotentialModularityAndCompatibleSystems, SmallRamificationAndAbelianVarietyBaseCases (main and #2517), SerreWeightAndLevelOptimisation (main and #2518) and AlgebraicModularFormsAndSerreWeights; shared objects and owners: the arithmetic interfaces, ClassicalSerreModularity (`ArisesFrom` in AlgebraicModularFormsAndSerreWeights §7.5), repeated here in this roadmap's own namespace and credited; the characteristic-five terminal cases, SmallRamificationAndAbelianVarietyBaseCases §5.12, cited; the lifting theorems under named hypotheses, GL2ModularityLifting, which records that this roadmap discharges them; the scalar dyadic completion and the unconditional theorem, this roadmap (ClassicalSerreModularity's head agrees; main's SerreWeightAndLevelOptimisation is repointed by #2518); the solvable odd Artin case, GL2AutomorphicRepresentationsAndTransfer R17.5.9, contained in the general case here; Khare–Wintenberger Theorem 10.1(ii), ModularityAndLanglandsExtensions, a later consumer.

Source independence: 34 passages compared with 8 sources, none reproduced. The closest are the three steps of Paso 4 (README lines 216–218 against DP lines 607–633; the longest near-identical run is 11 words, the phrase naming the minimal weight-two Steinberg lift) and the proof of Theorem 10.1(i) (line 390 against KW-I lines 863–870; at most 7 words shared). Both follow the source's steps because the mathematics forces them. The largest share is DP, with 29 of 76 locators. Contents compared with DP: the Paso targets keep DP's order, which their *Needs:* chain forces (Paso 2 → Paso 1, Paso 3 → Paso 2, Paso 4 → Paso 3, Paso 5 → Paso 4, Paso 6 → Paso 5, characteristic two → Layer S4). The layer scopes are the roadmap's own, with targets DP lacks (the dihedral lattices, the normalization transition, the dependency audit, Layers S6–S7). Independent.

Research link: Layers S1–S5 are Dieulefait–Pacetti's 2022 simplified proof of Serre's conjecture (Khare–Wintenberger 2009). S6 is the strong form (Khare–Wintenberger Thm 1.2; Khare 2006). S7 gives Khare–Wintenberger Thm 10.1(i) and Cor. 10.2(ii), the Artin conjecture for odd two-dimensional representations, used for modularity of GL₂-type abelian varieties. This rests on the README and on DP and KW-I.

## Not verifiable

- [Kh97] (Internat. Math. Res. Notices 1997, 127–133): the DOI landing page refused access and no open copy was found. The `N′` convention (C04) and the attribution of the weight-one descent were not checked against it.
- [TuA], [Paš16] and [KW-II] lie outside the sample and were not opened.

Automatic checks set aside as false positives: the citation resolver reported that AlgebraicModularFormsAndSerreWeights has no R15.4. That roadmap's README maps R15.1–R15.5 to its Layers 1–5 in a numbering note, so R15.4 is its Layer 4, the local Serre weight.

## Source issues

- **Misprint** in DP at Paso 2, p. 11: the source says the residue field of the unramified quadratic extension of `ℚ_N` has order `(N−1)(N+1)`; it should be its unit group (the field has `N²` elements); affects nothing.
- **Misprint** in DP at Paso 2, p. 11: the source says `κ` restricted to the inertia group at `q` has niveau two; it should be the inertia group at `N`; affects nothing.
- **Error** in DP at Paso 2, p. 11: the source says the weight-two lift has dihedral image of order `2q` at `N`; it should say only its inertial type and projective image at `N` are dihedral of order `2q`, since `det ρ(Frob_N)=ψ(N)N` makes the image infinite; affects nothing.
- **Misprint** in DP at Paso 3, p. 12: the source asks for a minimal lift unramified at `p_i`; it should be crystalline at `p_i` (unramified Weil–Deligne parameter), since a `p_i`-adic lift with weights `{0,k−1}`, `k≥2`, is ramified there; affects nothing.
- **Gap** in DP at §1.3, definition of minimal lift, p. 6, with Lemma 2.1 and Pasos 3–4: the source's minimality only forbids new ramification, so a lift may change the type at `N` to `Ind(κε)` with `ε` of `p_i`-power order; it should use Khare–Wintenberger's minimality, which keeps `Ind κ`; affects the proof.
- **Gap** in DP at Remark 6, p. 13: the source argues from flatness over an extension of even ramification index; it should use that a très ramifiée representation is finite flat over no extension of odd ramification index, as in KW-I's proof of Theorem 9.1; affects nothing.
- **Gap** in KW-I at Theorem 1.2 with §3.2 and Theorem 3.4, p. 6: the source proves modularity only; it should derive weight `k(ρ̄)` and level `N(ρ̄)`, including the scalar dyadic case it claims for Theorem 1.2(2); affects a stated result.

## For the human reviewers

- ClassicalSerreModularity Conventions §2.2 says its trace/determinant attachment interface, which this roadmap's `Suggested.lean` repeats unchanged as `ArisesFrom`, follows the Imperial College London FLT project; I did not compare it with that repository.
