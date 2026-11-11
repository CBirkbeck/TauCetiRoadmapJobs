<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6791992193 -->
Review (codex) of b0f108e

Verdict: needs_changes

1. **F01** (P3) Put coefficient scalars on the dual functional, not its value

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:307`: “(γf)(x)=f(γ⁻¹x)=χ(γ)⁻¹f(x)”.

   **Claim:** The displayed Check moves a coefficient scalar through a Pontryagin functional. But §1.5 defines f with values in ℚ_p/ℤ_p and only ℤ_p-linearity. The R-action in line 294 is precomposition, `(rf)(x)=f(rx)`, not multiplication on that codomain. In particular, nontrivial p-power character values cannot be multiplied into f(x) in the manner displayed. This is a defect in the Check, not in the intended inverse-character convention.

   **Witness:** Take p=5, L=Φ(ζ₅), R=O_L, M=L/R, γx=ζ₅x and f=Tr_(L/ℚ₅) modulo ℤ₅. For x=(ζ₅−ζ₅²)/25, f(x)=0 but f(γ⁻¹x)=2/5≠0.

   Here Φ/ℚ₅ is unramified quadratic, so [L:ℚ₅]=8, Tr(1)=8 and Tr(ζ₅)=Tr(ζ₅²)=−2. Trace is integral on R, making f well-defined on M; M is discrete, so f is continuous. Any action on the value would send f(x)=0 to 0. This is a coefficient-and-duality model testing the claimed scalar identity, not an assertion that an arbitrary model is a particular arithmetic Selmer group.

   **Exact repair:** After extending coefficients to contain χ, write

   `(γf)(x) = f(χ(γ)⁻¹x) = (χ(γ)⁻¹·f)(x)`

   for a χ-eigenvector x, with the last scalar acting on the functional by precomposition. State the inverse-character conclusion on the corresponding rational character components, retaining the coefficient-trace comparison when changing dual carriers. Replace the existing scalar-pullout Check with the trace example above. On that example the repaired left and right sides both equal 2/5. Keep the definitions at lines 45 and 294, which already give the correct actions. No Lean declaration is needed.

2. **F02** (P3) Supply a third discriminating Check for the limit definition

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:309`: “The definition asserts no finite generation: finite generation of X_a and S_a is proved in §3.4.”

   **Claim:** This is a statement about where a proof occurs, rather than a mathematical Check of the definition. Section 1.5 has exactly three Check bullets. Even after R01 is repaired, only the character-action and finite-error bullets test an object. The required third discriminating Check is missing.

   **Witness:** `packages/InertAnticyclotomicCMMainConjecture/README.md:305–309` contains three bullets; the last specifies no input, computed value, non-example or comparison capable of distinguishing correct and incorrect limits.

   **Exact repair:** Replace the last bullet with a finite-tower computation. For p=5 and R=O unramified quadratic, let D_k=π^(−k)O/O with the inclusion maps. Via the perfect integral trace, D_k^∨=O/π^kO, and the dual transition is reduction: [1] modulo π² maps to [1] modulo π, while [π] maps to 0. The first two finite duals have 25 and 625 elements. Thus `(colim D_k)^∨=lim D_k^∨=O`; the incorrectly directed system of injections by π would instead have direct limit Φ/O, which is torsion. This tests the restriction/corestriction and discrete/compact directions independently of the action and finite-error Checks. The stated computation gives the required third Check without asserting finite generation by definition.

Two P3 findings, no P1 or P2 findings. The previous finding is repaired. The arithmetic headlines, source sample and supplier order pass the checks recorded below; the remaining repairs concern the Checks for the Pontryagin-dual definition. The four authored package files were not modified.

## Verified sound

### Previous finding and changed passages

Checked the preceding review and repair report first. The preceding review has one finding, F01 (P3), about compact and rational coefficients in the pinned Selmer carrier. It is **repaired**, including its two secondary occurrences:

| Repaired location | Repaired passage | Verification |
|---|---|---|
| `packages/InertAnticyclotomicCMMainConjecture/README.md:21` | “for every topological coefficient module with continuous action, discrete, compact or rational” | The native carrier imposes no coefficient-discreteness assumption. |
| `packages/InertAnticyclotomicCMMainConjecture/README.md:63` | “No discreteness is required: the discrete module W of §1.4, the compact lattices T and T′ and the rational module V_T all fit” | Opened `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:58–77` and `LowDegree.lean:813–829` at the pin. The additional R-module, arithmetic topology, propagation and tower APIs are distinguished from this kernel. |
| `packages/InertAnticyclotomicCMMainConjecture/README.md:109` | “supplies its Selmer kernel, without the unramified condition at almost all places and for every topological coefficient module with continuous action” | Matches the native carrier and the narrower discrete arithmetic interface described by `TauCetiRoadmap/EllipticCurves/README.md:1264–1276`. |

For G=(ℤ₅,+) acting trivially on M=ℤ₅ or ℚ₅, c(t)=t has d¹c(s,t)=t−(s+t)+s=0, B¹=0, and c(1)=1. With one identity localisation, the full condition gives H¹ and the zero condition gives 0. This checks an actual nonzero compact/rational coefficient example. `H1EquivOfSmulEqSelf` at `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:1057` supplies precisely that continuous-homomorphism interpretation. The carrier is even defined for continuous monoid actions; using it for the topological groups here is legitimate.

The cochains' inherited pointwise quotient topology is not asserted to be the arithmetic topology: the pinned warning at `LowDegree.lean:824` remains relevant. The general DVR R-module interface is absent; the separate `TauCeti.instModuleH1` at `TauCeti/RepresentationTheory/Homological/ContCohomology/H1/ZMod.lean:83` is for ZMod coefficients and does not discharge it. SelmerIwasawaCohomology §2.1 supplies the R-linear diagram and §§2.5–2.6 its propagation.

Searched the rest of the package for the old discrete-only inventory, exclusion of compact/rational coefficients, and incorrect scalar-pullout pattern. The three inventory occurrences are corrected. The discrete W-instance in §1.4 is correct. The scalar-pullout formula occurs in §1.5's Check; the definitions in the Conventions and §1.5 use precomposition correctly. No preceding finding was marked “not actionable in this package”; none is re-raised.

### Scope, organization and coverage

Read all four authored files and the five plan gaps, all 36 numbered targets, all 36 target Needs lines, all 36 Checks blocks, and all seven layer Examples and Dependencies endings. Rechecked all 15 seeded targets. For unchanged material, the preceding review's computed rows were useful corroboration; sections it only summarized, including §§3.1–3.3, 3.5, 4.1, 5.1, 5.4–5.6 and 6.1–6.3, were read and recomputed here. The table records the arithmetic tests, source sample, headlines and both findings without reproducing every API sentence as a separate catalogue.

The roadmap preserves the Gross datum over H, arbitrary finite coefficient extension R/O, the complete auxiliary family, and the vertical characteristic factor. E/K is an additional hypothesis only for the specified finite-character applications. There is no replacement of a roadmap on main, new good-prime shortcut, computational algorithm, copied source passage, sorry'd datum or option override. The organization is forced by the mathematics: local transport precedes global kernels; the primitive class precedes its coordinate; global ranks and strict comparison precede signed duality and the integral equality; control precedes rank bounds. No layer is named for a source chapter or claims to follow a source's organization.

Compared the shape with `TauCetiRoadmap/EllipticCurves/README.md`, `TauCetiRoadmap/ClassFieldTheory/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` on main. There is a summary, ownership, conventions, supplier contracts, mathematical layers, dependencies and references. Definitions retain prose APIs. R02 records the exception to the required discriminating Checks. No process dates, pull-request numbers, machine paths, HTML anchors or LaTeX delimiters were found in the authored roadmap. `metadata.toml` identifies math.NT. Own backticked Lean declarations: zero; the backticked declaration names belong to pins or explicitly named suppliers and were resolved below.

### Computed adversarial table

Write Λ=R⟦T⟧. Lattice and cohomology models in this table test algebraic identities and conventions; they are not claims that every model occurs for a CM curve. A “pass” records these tests and the cited support, not a formal proof of an unimplemented arithmetic theorem.

| Statement | Instances tried | Values computed on both sides / negative model | Result; change |
|---|---|---|---|
| Repaired native Selmer contract | Trivial G-action, G=ℤ₅, M=ℤ₅ and ℚ₅; one identity localisation | d¹(id)=0; B¹=0; c(1)=1. Full local condition retains [c]; zero condition gives kernel 0. | Pass; previous F01 repaired. |
| Conventions and §0.1 | K=ℚ(√−23), p=5; finite coefficient extension | Reduced forms (1,1,6),(2,±1,3): h=3; [H:ℚ]=6; −23 mod 5=2 is nonsquare. Frobenius polynomial (X+5)² has trace −10, not 0. Quotient L′/R with old lattice surjects onto L′/L≠0 when L′≠L. | Pass; model, coefficient and Frobenius distinctions preserved. |
| §0.2 tower comparison | n=0,1 at p=5; conjugation | Local degrees 1,5, versus tame degree 24. cγc⁻¹γ=1 versus γ²≠1 under the wrong action. | Pass. |
| §0.3 conductor/sign dictionary | χ orders 1,5,25 | c=0,2,3; signs +,+,−. Order 25 factors through layers 2 and 3, not 1. AH character-set labels reverse; point labels do not. | Pass; no natural subtraction at c=0. |
| §0.4 Cartier dual | R=O and O[√π] | Differents O and (2√π); inverse-different quotient has 25 elements at p=5. Tr_(Φ/ℚ₅)(1)=2, giving 2/5^k in the trace pairing. | Pass; inverse different retained. |
| §0.5 scalar derivative kernels | Coefficients a=5, T; R=O[√π], basis change u=1+√π | a(χ)=5≠0 in the first case; T vanishes only at χ=1. δ(uv₊)=(1+√π)δ(v₊); δ₁(uv₊)=6(1+√π)δ(v₊)/5. | Pass; nonzero p-multiples are detected and R-values need not lie in O. |
| §1.1 signed Kummer images | n=0; generator Q and πQ; denominator π^j | L₀⁺=0, corank L₀⁻=1. Q⊗π⁻¹≠0, but πQ⊗π⁻¹=0. In a complementary free line π^m e⊗π^(−j)=0 iff j≤m. | Pass; nonzero logarithm alone does not prove nonzero tensor class. |
| §1.1 transition direction | Base logarithm b, one step | Restriction gives b; formal trace/corestriction gives 5b. | Pass. |
| §1.2 comparison independence | Unit u; multiplication by π; β³=aπ with a of order 24 | uL=L; ker[π] has 25 elements for R=O. c(a)/a=a⁴ has order 6; its cube roots have order 18, absent from μ₂₄ of the totally ramified cubic. | Pass; no assumed conjugation automorphism of R. |
| §1.3 away-p vanishing | Good residue cardinality q=4; finite good-reduction extension | Absolute values of α and q/α both 2≠1, so rational H⁰,H²,H¹ vanish. When α≡q mod ϖ, the integral group W(−1)^(Frob) has nonzero ϖ-torsion. | Pass; rational and integral conclusions differ. |
| §1.4 four kernels | n=0; zero/full local conditions; nonzero away-p component | Sel₊=Sel_str; Sel₋=Sel_ord. Identity localisation gives kernels 0 or H¹. A nonzero away-p component is excluded even from relaxed Selmer. | Pass; correct native kernel instance and restricted-ramification comparison. |
| §1.5 dual action, R01 | Φ/ℚ₅ unramified quadratic, L=Φ(ζ₅); M=L/R; trace f; x=(ζ₅−ζ₅²)/25 | f(x)=0; f(ζ₅⁻¹x)=(8−(−2))/25=2/5. Claimed scalar-on-value side would be 0. Correct scalar-on-functional side is 2/5. | Check fails; apply R01. |
| §1.5 annihilators and finite errors | Local condition 0; finite module ℤ/5 | Ann(0)=the full compact dual, so compact strict/relaxed reverse discrete relaxed/strict. Dual of ℤ/5 has 5 elements; tensoring that finite dual with ℚ₅ gives 0. | Pass. |
| §1.5 limit direction, R02 repair test | D_k=π^(−k)O/O; k=1,2 | Dual sizes 25,625; reduction sends [1]→[1], [π]→0. Inverse dual limit O is torsion-free; wrong direct limit Φ/O is torsion. | Proposed third Check passes; replace scheduling remark. |
| §2.1 primitive class | Trivial auxiliary character; fixed-support p-tower; added auxiliary prime | R[Gal(K/K)]=R and evaluation=id; removing/recovering a cofinal first coordinate has factor 1, not 6/5. Added-prime deletion factors are nonzero since √q/q≠1. | Pass; primitive conductor does not mean lattice generator. |
| §2.2 primitive special values | χ=1 versus ramified χ | Deleted inert factor 1−(−5)/25=6/5 at χ=1; ramified local factor 1. | Pass. |
| §2.3 sign/nonvanishing | ε=+, order 25; ε=−, trivial; ξ=πv | (−1)³ε=−1 and opposite derivative 0; trivial derivative 0 for ε=−. πv≠0 but its coordinate π is not a unit. | Pass. |
| §2.4 integral coordinate | ξ=Tv, v′=(1+T)v; ramification e=2 | Coordinates T and T/(1+T), equal ideal (T). Coordinate ϖ_R has ideal (ϖ_R), strictly larger than (π)=(ϖ_R²). | Pass; uniqueness and coefficient extension respect the lattice. |
| §2.5 interpolation | χ(γ)=ζ₅; ε=− at χ=1 | δ_(χ⁻¹)(γv)=ζ₅δ_(χ⁻¹)(v), not ζ₅⁴ times it. For ξ=πv₋ both trivial derivatives are 0 but L_p(1)=π. | Pass; inverse character and nonzero denominator in the asserted range. |
| §3.1 full auxiliary module | Full family with unit factor 2; only a factor-π class; inverse avatar | Λ·(2c)=Λc, whereas Λ·(πc) has quotient factor (π). At Frobenius with φ-value α, untwisted character is q, twisted one q/α, unequal for α≠1. | Pass; full family and inverse twist are essential. |
| §3.2 Gross descent | h_K=3, p=5; tame degree 24 | 1/3 and 1/24 are 5-adic units. For h divisible by 5, 1/5 is not integral. | Pass; no class-number-one shortcut. |
| §3.3 local comparison | Integral direct sum; zero invariants; base layer | R-ranks 1+1=2. Replacing one line by π times itself leaves quotient Λ/(π)≠0. A nontrivial tame scalar t with t−1 a unit fixes only 0, also after ramified base change. | Pass; pairing and signs agree with supplier. |
| §3.4 ranks | Rank-one ideal (ϖ_R,T); complex-place Euler characteristic | Generic rank 1, minimal generator count 2; Euler rank difference 1·1=1. | Pass; torsion-free is not asserted free. |
| §3.5 strict comparison | K=ℚ(√−23), p=5; tame character; vertical factor | [H(E[5]):K]=3·24=72. Tame character has order 24, nontrivial on decomposition. char Λ/(π)=(ϖ_R)^e, while localisation at 1/p gives module 0. | Pass; nonsplit χ-component equality, correction divisors and vertical factor retained. |
| §4.1 global duality | loc S=H^ε versus TH^ε; dual inclusion | Cokernels 0 and Λ/(T); last dual map is surjective because the discrete map is injective. | Pass; localisation not assumed onto. |
| §4.2 headline opposite torsion | ε=±; torsion submodule of torsion-free H | rank S_ε=rank X_ε=1; S_(−ε)=S_str=0; rank X_(−ε)=0. Torsion quotient S_rel/S_ε injecting into a free line is 0. | Pass. |
| §4.3 relaxed torsion and symmetry | K=ℚ(i), p=7, α=−1+2i; involution root a=5 | αᾱ=5; dual-character value 5/α=−1−2i≠α. ι sends 5 to −5/6 and a second application returns 5. | Pass; comparisons change representations and cancel two involutions. |
| §4.3 Leopoldt input | F=K and F=K₁, p=5 | Unit rank at K is 0, hence defect 0. Gal(K₁/ℚ)=C₅⋊C₂ has order 10 and τγτ⁻¹=γ⁴≠γ; Gal(K₁/K)=C₅. | Pass; declared abelian-over-K gap has the needed scope. |
| §4.4 headline characteristic formulas | H^ε=Λ, S=TΛ, C=T²Λ; char X_str=(T) | char(S/C)=(T); char(H^ε/S)=(T); char X_(−ε)=(T²)=char(H^ε/C). First formula then gives char((X_ε)_tors)=(1). With C=πS the added vertical multiplicity is e. | Pass; two duality comparisons and exact multiplicativity. |
| §4.5 primitive/full lattice | Smoothing α≡2 mod 5; hypothetical factors all divisible by ϖ_R | Nα−φ(α)≡4−2=2 is a unit, versus hypothetical char quotient (ϖ_R L_p). For degree d=2 and f=T, scalar restriction gives (T²). | Pass; integral smoothing input is supplied, not inferred from rational interpolation. |
| §4.6 headline main conjecture | L_p=T, [R:O]=2; L_p=π, e=2 | char_R=(T), norm ideal=(T²); for π the vertical multiplicity is 2, while after inverting p the quotient is 0. | Pass; opposite sign and integral scope retained. |
| §5.1 control products | p=5, n=0,1,2 | (ω⁺,ω⁻)=(1,T),(1,γ⁵−1),(Φ₂₅(γ),(γ−1)Φ₅(γ)); product γ^(5^n)−1. Degrees at n=2: 20+5=25. Mod 5 the last pair becomes (T²⁰,T⁵), a proper ideal. | Pass; empty product and both directions of character zero-set law. |
| §5.2 local control | p=5, n=0,1,2; nonfree negative model | Corank pairs (0,1),(0,5),(20,5). Finite divisible cokernel Q killed by ϖ^k gives Q=ϖ^kQ=0. For 𝔪=(ϖ,T), 𝔪/T𝔪=R⊕R/ϖ, giving a finite error without freeness. | Pass; stronger isomorphism follows from the stated splitting. |
| §5.3 signed Selmer control | n=0, signs ±; ramified e=2 | Plus quotients by 1 both 0; minus uses T-coinvariants. Lengths of ϖ⁻¹R/R and π⁻¹R/R are 1 and 2. | Pass; finite errors, dual variance and rational comparison agree. |
| §5.4 signed decomposition | n=2, p=5; order 1,5,25 | Retained character counts 5 in minus, 20 in plus; sum 25. Mod 5 common quotient has T⁵=0, so nonzero integral correction is possible; after inverting 5 the coprime factors split. | Pass. |
| §5.5 dimension/length | M=0, A/(t²), κ²; ramified coefficients containing ζ₅ | (dimension,length)=(0,0),(1,2),(2,2). For f=T−(ζ₅−1), ord_ζ₅ f=1 but ord_ζ₅⁻¹ f=0. | Pass; inversion symmetry restricted to an O-coefficient generator up to a unit. |
| §5.6 strict specialisation | Localised X=A/(t²); χ=1 | Dimension 1≤length 2. For χ=1 the inverse character is 1. Injection gives an upper bound without any surjectivity assumption. | Pass. |
| §6.1 strict divisor containment | char opposite=(fg), char strict=(f); orders 1 and 2 | (fg)⊆(f); ord f=1≤ord fg=3. Reverse containment fails at f=T,g=T². | Pass; title interpreted by the explicit ideal inequality. |
| §6.2 CM local correction | n=0 and n=2, p=5 | Ordinary local CM dimensions 1 and 25; each character multiplicity 1. Underlying ℚ₅ dimensions 2 and 50 would double the correction. Image dimension can be 0 or 1. | Pass. |
| §6.3 matching bound | ε=+, χ=1/order 5; order of L_p zero | Matching branch has no +1; order 0 forces Selmer dimension 0. Order 25 is opposite parity and is excluded from this branch. | Pass. |
| §6.4 headline rank bound | χ=1 with ε=±; order 25 with ε=+; K=ℚ(√−23) | Bounds ord₁ and ord₁+1; order 25 receives +1. At order 0, ranks ≤0 or ≤1. h_K=3 excludes the E/K hypothesis. For A=ℚ, A⊗ℤ₅=ℚ₅ but lim A/5^kA=0, verifying why the Kummer route needs finite generation. | Pass. |

Standing p≥5, characteristic-zero number fields, inert p, and finite extensions of Φ exclude p=2,3, split p, equal-characteristic or zero coefficient rings, inseparable number-field extensions and noncompact coefficient rings. These are scope hypotheses, not assumptions added during a proof. The generic local-length inequality also works for M=0 and arbitrary finite or infinite dimension, with length valued in ℕ∞. Infinite-dimensional finrank's junk value is not substituted for that dimension. All normalisations use the same arithmetic Artin map, π=−p, inverse derivative covariance, direct logarithm covariance and contragredient dual action; R01 is the exception in the written Check.

### Source sample and manifest

Read the five accessible cached texts. All six cited works have exactly one manifest key; BKO21, AHII05, AHI06, BIL86 and RUB91 are recorded as certified legal copies, and BRU67 is waived. No extra author-flagged unverified locator was found. No new source was fetched, no manifest entry was changed, and no settled source was requested again. Printed page numbers were checked against the extraction's printed headers, not confused with PDF page indices.

| Seeded target | Locator checked in the text | Support and limits |
|---|---|---|
| §0.3 | AHII05 §2, p.613, lines 98–113; Remark 3.2, p.614, lines 160–169; BKO21 §2, pp.948–949, lines 249–252 and 287–299 | Order/conductor shift, exceptional trivial character, reversed character-set labels and unchanged point labels. |
| §1.1 | BKO21 §6.0.2, p.962, lines 860–865; AHII05 §2, p.613, lines 105–119 | Signed Kummer images and their orthogonal conditions, with the stated R-extension. |
| §1.4 | BKO21 §6.0.2, p.962, lines 866–874; AHII05 pp.612–613, lines 76–97 | Away-p condition is zero; strict, ordinary and relaxed kernels and restriction limits have the displayed variance. |
| §1.5 | AHII05 pp.613,615, lines 95–97, 123–128 and 172–178 | Restriction/corestriction limits and inverse action. The source does not justify pulling R-scalars out of a ℤ_p-valued functional; R01 is local to the roadmap Check. |
| §2.5 | BKO21 §6.0.1, p.961, lines 831–844; Corollary 2.2, p.949, lines 308–309 | Signed coordinate, inverse-character denominator and matching-parity nonvanishing. The roadmap correctly treats the trivial character separately. Overbar typography qualification is below. |
| §3.5 | AHII05 Proposition 3.3(ii), p.615, lines 180–189; RUB91 §4, pp.36–37, lines 486–551 and 565–571; AHI06 Lemma 2.4.5/Corollary 2.4.6, pp.1028–1029, lines 1081–1131; Propositions 2.4.15–2.4.16, pp.1032–1033, lines 1234–1308 | Nonsplit class-group/unit equality on the nontrivial decomposition component; twisting and common specialization corrections. AHI06's ordinary-prime arguments are explicitly templates, while the inert arithmetic comparison is a target here. |
| §4.3 | AHII05 Theorem 4.1, p.616, lines 233–246; BIL86 §3 p.350, lines 285–295, Leopoldt hypothesis p.353, lines 374–381, Theorem 3.24 pp.364–365, lines 618–643; AHI06 Lemma 1.2.1, pp.1010–1011, lines 415–427 | Rank and coprimality, full p-torsion base, field-level Leopoldt and involution. The roadmap uses the declared abelian-over-K input and compares conjugate modules without assuming an R-automorphism. |
| §4.4 | AHII05 Theorem 4.2 and (4.1)–(4.4), pp.616–617, lines 247–280 | Both characteristic identities, the second under the integral splitting; the relaxed-to-signed duality comparison at lines 266–271 supplies the first identity's sequence. |
| §4.5 | AHII05 Theorem 4.3 and following paragraph, p.617, lines 283–298; BKO21 pp.961–962, lines 831–844 and 881–886 | Primitive coordinate and characteristic generator. Integral smoothing is exposed as the target's proof obligation and comes from the normalized-class supplier, not mere interpolation. |
| §4.6 | BKO21 Theorem 6.1, p.962, lines 875–886; standing Gross hypotheses pp.960–961, lines 802–821,847–852 | General Gross datum over H, p∤h_K, opposite-sign torsion and integral characteristic formula. E/K is not imposed here. |
| §5.1 | AHII05 §5, p.618, lines 307–317 | Exact two products, product identity and action on points/Selmer groups. Recomputed n=0,1,2. |
| §5.2 | AHII05 Lemma 5.1, pp.618–619, lines 318–338 | Source gives injection and finite cokernel under splitting. Divisibility plus freeness in the roadmap proves its stronger zero-cokernel statement. |
| §5.3 | AHII05 Theorem 5.2, pp.619–620, lines 343–391 | Dual surjection, finite kernel under splitting, and finite away-p inertia errors. No bound is inferred solely from rational vanishing. |
| §6.1 | BKO21 proof of Theorem 6.2, pp.962–963, lines 894–908 | Correct ideal containment and order inequality; inverse-character comparison is treated separately over O. |
| §6.4 | BKO21 Theorem 6.2/proof, pp.962–963, lines 888–908 | E/K hypothesis, matching branch and opposite +1. The extension to all n≥r follows from the stated control argument; the source itself uses conductor indexing. |

Also checked the primitive class and special-value inputs at BKO21 lines 398–416, 434–488 and 823–836 against the previously verified normalisation, and the nonvanishing/sign argument of AHII05 Proposition 3.1 at lines 151–169. The stronger integral decomposition is supplied by AnticyclotomicLocalUnits, corresponding to BKO21 Theorem 2.1, not assumed as a good-prime restriction.

### Pins and duplication by object

Confirmed the checkout commits against `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Opened the following declarations and their hypotheses. Paths here are library-relative.

| Pinned object | File and line | Content checked |
|---|---|---|
| `Module.length`, `Module.length_le_of_surjective`, `Module.length_eq_finrank` | `Mathlib/RingTheory/Length.lean:31`, 202, 293 | ℕ∞ length; surjectivity included at 201; finite-module hypothesis for finrank. The infinite-rank comparison is at 288. |
| `IsLocalRing.length_restrictScalars` | `Mathlib/RingTheory/LocalRing/Length.lean:54` | Residue-field length factor, local algebra and scalar-tower hypotheses. |
| `Polynomial.cyclotomic`, `Polynomial.cyclotomic_prime_pow_mul_X_pow_sub_one` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227`, 525 | Native cyclotomic polynomial; prime-power identity requires prime p. |
| `Module.Basis` | `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | Coordinates are supplied by an actual linear equivalence. |
| `Ideal.span_singleton_mul_left_unit` | `Mathlib/RingTheory/Ideal/Span.lean:100` | Requires a unit, preserving the principal ideal. |
| `IsGalois.normalBasis` | `Mathlib/FieldTheory/Galois/NormalBasis.lean:121` | Finite Galois extension and its regular representation. |
| `IsDedekindDomain.selmerGroup` | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161` | Multiplicative valuation/S-unit carrier, not this cohomological kernel. |
| `IsRegularLocalRing` instance | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:80` | Local principal domain gives regularity. |
| Power-series regularity and dimension | `TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean:157`, 169 | `TauCeti.PowerSeries.isRegularLocalRing`, `ringKrullDim_of_isDiscreteValuationRing`: dimension 2 here. |
| `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` | `TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean:59` | Requires dimension ≤2, satisfied by Λ_R. |
| `TauCeti.Iwasawa.charDivisor` | `TauCeti/RingTheory/Iwasawa/Char/Divisor.lean:87` | Height-one local lengths; totalization uses toNat/finite support, with intended finite torsion hypotheses retained here. |
| Characteristic ideal and operations | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85`,125,132,152,198 | `charIdeal`, pseudo-isomorphism invariance, exact multiplicativity, `LinearEquiv.charIdeal_eq_comap` with the correct inverse/comap direction, and nonzero principal quotient. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Inverse limit of finite quotient group algebras; no automatic compactness for arbitrary R. |
| `TauCeti.IsCompactModule.completedGroupAlgebraModule` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` | Explicit compact-module argument and continuous action. |
| Native Selmer kernel | `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`,86,97,103 | `SelmerStructure`, `localization`, `selmerGroup`, `mem_selmerGroup_iff`; additive local conditions and compatible continuous maps. |
| Native H¹ | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829`,1057 | Continuous cocycles modulo coboundaries; trivial-action continuous-homomorphism equivalence. |
| Arbitrary-m elliptic Selmer and Kummer | `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:147`,176,223,238 | `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap`, `kummerSelmerMap_injective`; ellipticity and invertibility of m for Kummer. |
| Mordell–Weil | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:145` | `WeierstrassCurve.Affine.fg_point_of_numberField`; the finite generation used by §6.4. |
| Other descent groups | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104`; `SelmerGroupA.lean:144` in the same directory | `WeierstrassCurve.Affine.selmerGroup₂` and `selmerGroupA`; neither is redeclared here. |
| Hecke characters | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70` | `TauCeti.GlobalNumberFields.HeckeCharacter` is a continuous idele-class character, not the missing Gross realization or signed tower. |

Object searches at the pins for anticyclotomic towers, signed Selmer/Kummer conditions, Rubin's L-function and Coates–Wiles derivatives found no native implementation of those missing arithmetic objects. The general bases, lengths, characteristic ideals, continuous kernels and finite elliptic Selmer groups are cited rather than redeclared. Searches in the characteristic-ideal files found no arbitrary-base DVR norm theorem or character-order theorem discharging the declared gaps. The empty Suggested.lean creates no fully qualified name collision.

### Current supplier resolution and open ownership

Read the board-package index and the supplied open-roadmap and overlap indexes before checking availability. Used `roadmaps show`, `roadmaps grep` and `roadmaps resolve`; the resolver found no missing cross-roadmap citation or roadmap Lean name. Its library-name pass was unavailable on this host, so the pinned source reads above were performed separately. `roadmaps show` does not list NonordinaryCMSpecialValues or LubinTateFormalModulesAndQuasiCanonicalLifts, but both exist as earlier board packages; their READMEs and retained plan IDs were read. This is not a claim of absence.

| Supplier | Resolved location and object |
|---|---|
| AnticyclotomicLocalUnits, open #1692 | `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:148`,237,297,324,347,361,458,498,522,591,648,673,688,1075,1103,1117: §§0.1,0.5,1.2–1.5,2.4,3.1–3.2,3.6,4.2–4.4,8.2,8.4–8.5. Signed point/unit labels, inverse derivative/direct logarithm covariance, exact annihilators and integral splitting agree. |
| NonordinaryCMSpecialValues, board | `packages/NonordinaryCMSpecialValues/README.md:168`,247,257,325,368,386,396,406,453,463,473,709: CM period/dual Tate convention, normalized class, reciprocity/twist/period laws, splitting/Frobenius/Honda and central nonvanishing. `design/plan.json:490`,535,1590 retains NCM.0/dual-tate-convention, NCM.1/normalized-zeta-class and NCM.5/central-nonvanishing. Fixed-support norm multiplier is 1; smoothing at α≡2 gives unit residue 2. |
| LubinTateFormalModulesAndQuasiCanonicalLifts, board | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:688`,717,1646,1676: character, arithmetic Artin inverse-unit law and fields. `design/plan.json:1125`,1230,3332 retains LT.2/lt-character, LT.2/reciprocity-comparison and LT.8/bko-fields. Degrees p^(2n),p^n and conjugation inversion agree. |
| ComplexMultiplicationAndExplicitReciprocity, open #1254 | `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:634`,642,646,684,699,703: §§4.1,4.3; full CM action, rank-one components, good Frobenius and Gross attachment. `Suggested.lean:50`,70 declares `IsCanonicalGrossCharacter` and `canonicalGrossExistence`. The consumer does not impose the canonical conductor-support restriction. |
| SelmerIwasawaCohomology, open #869 | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:343`,372,411,427,441,469,591,717,821,1329,1373,1426,1562,1582,1600,1758: §§2.1–2.6,2.10,2.13,2.19,3.0,3.1,3.3,3.10–3.12,3.16. R-linear diagrams, propagation, trace dual, limit/control, involution and H²/Tor errors all resolve. |
| ArithmeticGaloisDuality, open #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1303`,1401,3118,3436,3505,6232,6354: R02.2.2–2.3, R02.4.2–4.4, D7.7.1–7.2. Five-term sequence, index multiplication, ordered dual-first Tate pairing and coefficient comparisons agree. |
| EulerSystemsAndKolyvaginSystems, open #1272 | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1606`,4558,4983,5466: §§2.2,8.1,8.11,8.25. Full Euler systems, no-complete-splitting hypothesis, condition (*) alternative and non-torsion input to weak Leopoldt. |
| IntegralIwasawaTheory, open #1306 | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:310`,680,704,712,724: §§2.2,4.1e–4.4. Field defect/injectivity, Baker–Brumer, unit resolvents and the existing abelian-over-ℚ theorem; imaginary-quadratic-base extension is the declared gap. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909`,2485,2620,2710,2818,2828: §§1.7,4.3,4.5,4.6 and finite-DVR base change/restriction. Existing restriction is to ℤ_p, not arbitrary O. |
| EllipticCurves, main | `TauCetiRoadmap/EllipticCurves/README.md:423`,683,793,1262: Layers 1,3,4,7, including the explicitly discrete Selmer interface acknowledged by the repair. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:1150`,1781,1834,1924: Layers 6,11–13, local arithmetic reciprocity and global compatibility/existence/ray-class interfaces. |

The supplied overlap computation, against main d2e9ef2 and the indexed open heads, reports no conflicting head changing this roadmap, no dropped cited ID and no revision-only ID. A fresh `roadmaps overlaps` call cannot address this board-only package by name; it reports that the roadmap is not on main or an open roadmap pull request. The supplied package-aware overlap report, and the direct current supplier resolutions above, were therefore used.

The closest open scopes were read: AnticyclotomicLocalUnits #1692 owns local units and leaves global Selmer theory downstream; EulerSystemsAndKolyvaginSystems #1272 owns the generic Euler-system formalism; SelmerIwasawaCohomology #869 owns generic arithmetic comparisons. `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md:3–19` (#1311) owns circular/cyclotomic units; `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:3–19` (#1423) owns Heegner-point systems and their applications. Neither duplicates this inert elliptic-unit signed equality. The board's `packages/ModularIwasawaMainConjecturesPartII/design/README.md:260`,276 explicitly imports IC.3–IC.4 from this owner. It is downstream, not a supplier. Object searches found no second owner of the present arithmetic endpoints.

The five gaps have matching slugs in the plan and README, named earlier owners, and precise hypotheses. The two elliptic-unit gaps extend NCM's restricted-modulus normalized class to the full auxiliary family and to Rubin's nonsplit theorem. The norm gap extends a ℤ_p-base theorem to arbitrary O; the character-prime gap identifies multiplicity with analytic order; the Leopoldt gap extends abelian-over-ℚ to abelian-over-imaginary-quadratic. None is treated as an unowned prerequisite or as already implemented. A search hit in `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:2395` (#1715) is a citation to Brumer in its references, not an earlier supplied general theorem discharging the gap.

Ran the prescribed dependency check, with the package name, merge order, movable flag and content checkout. Its complete output was:

```text
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Every target Needs line and supplier reference was also read manually. No forbidden supplier is cited. No order file was modified.

### Headlines, Lean and exhaustive padding audit

The summary's end theorems are §4.6, the integral inert main conjecture, and §6.4, the finite-character CM rank bounds. The additional deep endpoints listed in Suggested.lean are §4.2, opposite signed torsion/compact vanishing, and §4.4, the signed characteristic formula. The module docstring names all four and gives the missing arithmetic objects for each: signed local Kummer conditions and tower limits, Gross realizations/avatars, primitive and full elliptic-unit classes, and Rubin's L-function. Native generic H¹, Selmer kernels, finite elliptic Selmer groups and characteristic ideals do not by themselves construct these objects. No headline can be supplied here merely by a few simple definitions on those native carriers; no weakened substitute or free predicate is used.

Ran `lake env lean` on `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean` from the pinned content checkout, using its absolute argument as prescribed. **Exit 0, no output and no warnings.** No Tau Ceti import required a targeted build. The file has the single `import Mathlib`, one module docstring, the required namespace, zero declarations and zero sorry occurrences. The exhaustive one-tactic probe therefore has **zero sorried theorems to probe**. The mechanical `#check @name` binder audit has **zero declared signatures to compare**. These are exhaustive zero-case checks, not sampled omissions. No Lean process remains running.

## Not verifiable

- BRU67 is waived. Its source text was not fetched or certified. Its existing locator was retained, and the corresponding named supplier contract and its application were checked.
- BKO21's extraction loses some overbars, notably on p.961. The previous review records rendered-page verification of that typography; this round checked the extracted locator, covariance and character calculations, but could not independently render the cached PDF because neither pdftoppm nor PyMuPDF is installed. No new source request was made for this already available text.
- BIL86's extraction omits some displays around pp.351–352 and 364–365. The theorem number, hypotheses, involution description and descent remark are readable, but missing individual glyphs were not independently certified. RUB91's OCR has damaged symbols in some unit formulas; its §4 hypotheses and decomposition-character condition are readable. These extraction limitations are not alleged source errors.
- Future supplier contracts and arithmetic comparisons are not completed formal proofs. The Lean result verifies the permitted acceptance-file form/import, while the source and computed checks above provide the mathematical review evidence.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the control-product exponent is p^k; it should be p^n for the fixed level n; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry input is AHI06 Lemma 2.1.2; it should be Lemma 1.2.1; affects nothing.
- **Misprint** in BIL86 at Introduction, p.342: the source says the two main results are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b0f108e82174d2b88bf1610386d601e0c71705b7", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture~5", "model": "gpt-6-astra", "worker": "chris-6"} -->
