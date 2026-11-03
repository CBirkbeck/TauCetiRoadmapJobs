# Review of ColemanPowerSeries (pull request #1309 at f9fecdf)

**Verdict:** accepted

## Previous findings

- **R01 — repaired at the downstream head.** The previous request was “Complete the smoothing-series ownership transfer”. This roadmap still says “The common natural-parameter constructions have this single owner” (`TauCetiRoadmap/ColemanPowerSeries/README.md:11`). The newly resolved `TauCetiRoadmap/DirichletPadicLFunctions/README.md:304` now says “nothing here redefines them”; its supplier contract at :105 consumes ColemanPowerSeries §§2.10–2.10a. Sections 1.1–1.2 retain coefficient recurrence and moment refinements. Its `Suggested.lean:132` characterizes the supplied measure by its Amice equation; the former competing denominator/smoothing definitions are absent. Both interfaces give f₂=2+T, F₂=1/(2+T), f₁=1 and F₁=0. The head under review is unchanged since the previous review; the relevant change is in the downstream roadmap. No reverse supplier edge was introduced.
- **Earlier R02 remains repaired.** `README.md:980` says “The underlying function is native `eval₂`”. The undeclared label remains absent; Mathlib's `coe_eval₂Hom` supplies the identity. At p=2,n=0, evaluation sends T to −2 and ΣTᵏ to 1/3.
- **Earlier R03 remains repaired.** The relative-basis Checks at `README.md:255` distinguish coordinates (1,2) from (1,−2) for 1+2i, and the corrected-norm Checks at :5856 distinguish M(Y)=−Y, M(3)=9 and M(c)=c for a Teichmüller constant of order seven. Each definition retains at least three Checks.

No new findings. Acceptance means ready for human final approval, not approval or merge by the AI.

## Verified sound

This is a full review of the two specified files, including unchanged passages: 481 numbered README targets, their API statements and Checks, and all six Lean declarations. I read the normative repository README and CONTRIBUTING and consulted the main-branch LocalFieldsRamification, ProfiniteArithmetic and PadicMeasuresIwasawaAlgebras roadmaps for shape and contracts. The computations below were reassessed against this head; they are not an incremental carry-forward verdict. Finite examples test conventions and boundaries; they do not prove the universal theorems.

**Scope and principles.** The native fields, integral closures, unit groups, norm limits and supplied Coleman constructions retain their existing owners. The additional chosen-root comparisons, coefficient-Frobenius splittings, explicit matrices, uniform precision and all-prime formal statements are identified as refinements. The source's odd-prime arithmetic range is distinguished from all-prime determinant/interpolation statements; ramified arithmetic coefficients are distinguished from finite-free tensor extension. I found no computational algorithm, route-specific substitute, copied source passage, sorry-valued data or option override. The PR changes nothing outside the reviewed folder, and this review changed no PR file. There are no declared supplier gaps.

**Gate and dependency checks.** The supplied gate passes, including its targeted build. My gate rerun reported every text, shape, import, scope and dependency counter zero and ended `OK`. Direct `lake env lean` elaboration also passed, with only the three expected sorry warnings. The independently rerun dependency command returned:

```text
depcheck: 205 roadmaps, 1616 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. A separate scan of the numbered targets resolved 878 local links in Needs lines: none pointed forward and none formed a cycle. I also read the Needs lines, including non-link library and supplier inputs. No ownership or merge-order file was changed.

**Signatures and padding.** A scratch copy checked all six fully qualified declaration types and tried `simp`, `rfl` and `infer_instance` separately as complete proofs of each admitted theorem. All nine proof attempts failed to close their goals. Native norm, trace, evaluation and derivative lemmas supply ingredients, not a one-lemma proof of any of these three headlines. The suspected lost binders in `correctedNorm_limit` are present as implication arguments: the maximal-ideal equation, adic topology, residue p-Frobenius and continuity of σ and σ⁻¹. Finite freeness, DVR, completeness, compactness and separation also survive. No signature repair is needed. The unrestricted scalar-algebra definition has meaningful p=0,1 values; the norm theorems themselves retain primality and the required arithmetic assumptions.

| Headline | Treatment in Suggested.lean |
|---|---|
| Corrected norm convergence, multiplicative retraction and uniform integral precision, §§1.95,1.116,1.122–1.124 | `UnramifiedSeries.correctedNorm_limit`, :76 |
| All-prime logarithmic-derivative image, §3.35 | `Series.normFixedLogDeriv_surjective`, :112 |
| All-prime fixed-space boundary range, §3.12 | `Series.psiFixedBoundary_range`, :120 |
| Arithmetic interpolation and Frobenius/semilocal comparisons | Docstring names the missing chosen arithmetic tower, norm limit and comparison operators |
| Bernoulli reciprocity and normalized arithmetic Coleman map | Docstring names the missing arithmetic map and normalized pseudomeasure |
| Principal Coleman exact sequence | Docstring names the missing arithmetic carriers and map |
| Real principal circular-unit image and actual quotient | Docstring names the missing circular closures and quotient comparison |

The three definitions have real bodies and are used by those headlines. No omitted headline can be recovered at these pins by just a few simple definitions; in particular an arbitrary subgroup or linear map would not state the arithmetic quotient theorem.

**Pinned library audit.** Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches included native integer rings, integral closures, finite power bases, norm/trace, power-series substitution and derivation, pro-p powers, completed actions and Teichmüller lifts. A name-location scan found declaration-name matches for 256 of 267 qualified backtick candidates; the remaining candidates were file/module labels, the six local declarations, and planned PMIA `AbstractMeasure.psiSeries`. This scan was a lead, not a proof of signatures. The following 16 entries record declarations opened with their surrounding assumptions:

| File at the pin | Declaration and checked boundary |
|---|---|
| `Mathlib/RingTheory/Adjoin/PowerBasis.lean:63` | `PowerBasis.ofAdjoinEqTop`, with integral selected generator and generation; :68 pins that same generator |
| `Mathlib/FieldTheory/Minpoly/IsIntegrallyClosed.lean:242` | `PowerBasis.ofAdjoinEqTop'`, integrally closed domain and torsion-free target context |
| `Mathlib/RingTheory/Norm/Defs.lean:61` | `Algebra.norm = LinearMap.det` of multiplication; :71 permits the total-function value 1 without a basis, so the supplied rank-p basis is essential |
| `Mathlib/RingTheory/Norm/Defs.lean:82` | `Algebra.norm_eq_matrix_det`, finite chosen basis; :87 gives the scalar power |
| `Mathlib/RingTheory/PowerSeries/Evaluation.lean:157` | `eval₂Hom`, continuous coefficients, HasEval, complete Hausdorff linearly topologized receiver; :161 identifies its function |
| `Mathlib/Algebra/Group/Pi/Units.lean:25` | `MulEquiv.piUnits`, actual componentwise units |
| `TauCeti/RingTheory/Norm/Units.lean:40` | `TauCeti.Algebra.normUnits = Units.map (Algebra.norm R)`; :45 gives the underlying value, without inventing a second norm |
| `TauCeti/NumberTheory/LocalField/FiniteExtension/IntermediateField.lean:64` | `finiteIntermediateFieldNormedField`, finite intermediate field over a nonarchimedean local field; no topology assumed on the ambient closure |
| `TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean:434` | `integerRing_eq_integralClosure`; :454 `integerRingEquivIntegralClosure` and :460 identity on field-valued elements |
| `TauCeti/NumberTheory/LocalField/Norm/Basic.lean:337` | `continuous_normUnits` on compatible local-field extensions; integral norm/trace comparisons in the same module |
| `TauCeti/RingTheory/MvPowerSeries/Substitution.lean:254` | `PowerSeries.aeval_subst` requires HasSubst, continuous evaluation and HasEval; it does not license nonnilpotent formal root translation |
| `TauCeti/NumberTheory/Cyclotomic/Irreducible.lean:115` | `irreducible_cyclotomic_prime_pow_ratPadic`, every prime and exponent, including exponent zero |
| `TauCeti/NumberTheory/LocalField/RootsOfUnity/Cyclotomic.lean:40` | `finrank_cyclotomic_prime_pow_ratPadic`, degree pⁿ(p−1) for order pⁿ⁺¹ |
| `TauCeti/RingTheory/Henselian/Teichmuller.lean:92` | `teichmuller`; :151 `eq_teichmuller`, a multiplicative section for a Henselian local ring with finite residue field |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean:454` | `IsProP.module`, commutative compact totally disconnected topological group and pro-p hypothesis; the scalar is the native p-adic power |
| `TauCeti/Topology/Algebra/Group/Profinite/ProP/CompletedGroupAlgebraModule.lean:71` | `completedGroupAlgebraModule`, actual continuous group action; the native completed-algebra `Map.lean:92`, :205 and :220 give map, continuity and surjectivity |

**Ownership and supplier resolution.** Searches used `roadmaps grep` on indexed main/open heads, pinned sources and board packages, followed by reading the relevant contracts. The six local fully qualified declaration names have no competing owner in the readable roadmaps. The shared natural smoothing object now has one owner. General Lubin–Tate and anticyclotomic constructions found by the object search are different extensions, not alternative constructions of this cyclotomic interface. No supplier was moved.

| Resolved passage | Contract checked |
|---|---|
| `Completed/LocalFieldsRamification/README.md:159`, :343, :576, :726, :773 | Layers 0–3: native integer rings/topologies, principal units, Teichmüller section, arithmetic Frobenius, Eisenstein and selected-basis consequences |
| `Completed/LocalGaloisGroups/README.md:258` | Layer 0 shifted cyclotomic Eisenstein polynomial and irreducibility; constant coefficient p and degree pⁿ(p−1) |
| `Completed/ProfiniteArithmetic/README.md:407`; ProfiniteProPGroups Layer 3 | Native continuous p-adic powers and pro-p closure, not a module structure on full residue-unit factors |
| `Completed/NumberFieldArithmetic/README.md:1399`, :1608 | Layer 5 semilocal tensor/product comparison, integral projections and compatible arithmetic maps |
| `TauCetiRoadmap/IntegralIwasawaTheory/README.md:136`, :149, :162, :181 | §§1.1–1.4: chosen global roots, circular numbers intersected with units, real phase (1−a)/2, sign torsion and cyclic generation |
| `TauCetiRoadmap/IntegralIwasawaTheory/README.md:586`, :831, :857, :877 | §5.0 Bernoulli pseudomeasure; §§7.1–7.3 all-prime unramified interpolation, odd-prime normalized arithmetic sequence, actual plus map, real closure and quotient |
| `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:709`, :848, :888, :909 | §§1.3,1.5–1.7: finite unit quotients, weak topology, moments and native completed-algebra comparison |
| Same README :1148, :1229, :1328, :1381, :1471, :1597, :1826 | §§2.1–2.6 and 2.10: Amice, ψ, inverse coordinate weighting, convergent root averaging, coefficient extension, unit-supported transform and residue fixed-error theorem |
| Same README :1978, :2485, :3367 | §§3.1,4.3,5.2: total-fraction pseudomeasures, nonzero Weierstrass preparation, compact inverse-system contracts |
| `TauCetiRoadmap/DirichletPadicLFunctions/README.md:105`, :304, :323, :417 | Shared smoothing interface is consumed; moments and p-adic-parameter extensions remain downstream |
| `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:236` | Consumes §§1.45–1.49, with direction ColemanPowerSeries → that roadmap |

The citation resolver's four Lean-name leads are resolved: the three local headlines are present, and `AbstractMeasure.psiSeries` is supplied as a planned operator in PMIA §2.2 (:1307), not asserted to exist at the pin. The root-fixed Frobenius, positive interpolation twist and negative inverse twist agree with IntegralIwasawaTheory after its a=n+1 shift. PMIA's inverse weighting contributes a⁻¹, canceling the derivative's factor a. The normalized arithmetic map is minus the raw composite in both roadmaps.

**Seeded source sample.** All 15 targets were checked mathematically. Fourteen locators were read in the cited text or supplier; the original Coleman locator for §1.95 remains uncertified. The explicitly labelled arithmetic deductions below are not falsely attributed as numbered source theorems. No additional target was labelled unverified in the README. All five written works and the fixed-revision Lean proof source were requested through the sources service.

| Target | Locator read; hypotheses and support |
|---|---|
| 0.9 | RJW lines 2723–2780, §9 pp.161–163; lines 2934–2949, Lemma 10.9 p.167. Odd p, chosen roots and Xᵖ−ρ; selected generator and dyadic case are explicit deductions |
| 0.79 | LocalFieldsRamification Layer 0.III, README:159–190; native identity comparison and topology uniqueness support the selected-root adapter |
| 0.125 | SharifiANT lines 3863–3880, Definitions 6.1.14–18 and Lemma 6.1.17 p.119. Finite separable complete discrete valuation fields; total ramification gives residue degree one, then ρ=1+π reduces to 1 |
| 0.148 | SharifiNotes lines 5000–5020, §6.1 pp.157–158. Finite semilocal decomposition; scalar norm cᵖ is the explicit rank-p determinant deduction, not a separate theorem in those notes |
| 0.156 | RJW lines 2758–2777, equations (9-2)–(9-3) pp.162–163; lines 3015–3021, Theorem 10.13 p.169. Norm limit and residue-one subgroup; roadmap correctly restricts the module structure to principal units |
| 0.173 | SharifiNotes lines 4537–4543 and 4658–4669, §5.4 p.143 and Notation 5.4.10 p.146. Finite unramified E; the inverse-Frobenius residue section and splitting are the stated bridge proof |
| 0.176 | Same locators. The signed Tate map is a separately derived all-prime bridge; injectivity at 2 uses levels n≥1, not the zeroth coordinate |
| 0.204 | SharifiNotes lines 4658–4663, Notation 5.4.10 p.146. Coefficient and cyclotomic actions are distinct; Teichmüller equivariance gives t(r)↦t(rᵖ) |
| 0.207 | Same §5.4 locators and the explicit §0.176 proof. No source claim of a separately numbered signed dyadic theorem |
| 0.210 | SharifiNotes lines 5000–5020, §6.1 pp.157–158. Finite-family coordinate extensionality is a native-product deduction |
| 1.95 | Coleman §IV equation (2), Lemma 13 p.103: original unreadable. SharifiNotes lines 4619–4623, Corollary 5.4.7 p.145, independently states exactly the corrected-iterate congruence for units and n≥m |
| 1.99 | RJW lines 2884–2895 and 2989–3021, Lemma 10.7 p.166, Proposition 10.12 pp.168–169, Theorem 10.13 p.169. Source uses compact diagonal interpolation; the nested closed-fiber reformulation follows from the stated approximation and continuity inputs |
| 4.8 | RJW lines 3714–3751, Lemma 12.20 pp.186–187. Finitely many principal generators; compact coefficient space and density prove both inclusions, including r=0 |
| 4.16 | RJW lines 3291–3294, Definition 11.8 p.176; lines 3714–3787, Lemmas 12.20–22 pp.186–188. Actual closed principal circular norm limit, with odd p retained |
| 4.26 | RJW lines 3789–3810, Theorem 12.23 pp.188–189. Full image I(G)ζ and the extra Tate cokernel; the roadmap uses its separately corrected Coleman sign |

The [published RJW text](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) and [Sharifi Iwasawa notes](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf) use the numbering above; printed pagination, rather than drifting extraction page markers, was checked. The fixed revision `45307015169791f1316f23a459c8e92ed5961c54` of PadicLFunctions was read through the source service: `Coleman/NormOperator.lean`, PadicLFunctions lines 88,302–337,847–885; `Coleman/Theorem.lean`, lines 979–1023; `IwasawaProof/LogDerivative.lean`, lines 143–158 and 1470–1515. These contain the claimed basis/norm, compact interpolation and residual logarithmic-image routes over ℤ_p. They do not themselves establish the roadmap's unramified-coefficient generalization or native-carrier comparisons. No external code was executed.

**Adversarial values.** Y=1+T, ρ_n has order pⁿ⁺¹ and π_n=ρ_n−1. N takes values in the base copy of the series ring. In rows concerning unit towers, t denotes the indicated Tate or Teichmüller tower, as specified by the input. Each row below records values, not merely a build result. Tests outside standing hypotheses are negative controls. All 481 numbered targets and all six Lean declarations occur once; one additional row tests the repaired ownership interface. I corrected the previous review's §4.29 finite-level example: at p=3 the real principal local group is 1+3ℤ₃, not {1}. That error was in the review table, not the roadmap.

| Statement | Instances tried | Computed values on both sides / negative control | Result; change |
|---|---|---|---|
|0.1|p=2,z=−1,w=i|ord(w)=4=2²; starting z=1 permits w=1 of order 1|Pass; none|
|0.2|p=2 and p=3|i²=−1; (ζ₉²)³=ζ₃²≠ζ₃; ζ₉³=(ζ₉⁴)³=ζ₃ although ζ₉≠ζ₉⁴|Pass; none|
|0.3|p=3,n=0|ρ₁³=ρ₀ on both sides|Pass; none|
|0.4|p=2,n=0,1|orders 2,4 = 2¹,2²|Pass; none|
|0.5|p=2,3,n=0|fields ℚ₂,ℚ₃(ζ₃); degrees 1,2|Pass; none|
|0.6|p=2,n=0|included −1=i²=−1|Pass; none|
|0.7|p=2,n=0|relative degree 2/1=2|Pass; none|
|0.8|p=2,n=0; p=3,n=0|repr(i²)=(−1,0); repr(1+2i)=(1,2), versus (1,−2) for basis (1,−i); repr(ρ₁³)=(ρ₀,0,0); ranks 3 relative,6 absolute|Pass; none|
|0.9|p=2,n=0|generator i=i; inverse generator −i≠i|Pass; none|
|0.10|p=3,n=0|relative dimension 6/2=3|Pass; none|
|0.11|p=2,n=0|minpoly(i)=X²+1=X²−ρ₀|Pass; none|
|0.12|p=2,n=0|N(i)=i(−i)=1=−ρ₀|Pass; none|
|0.13|p=2,n=0|N(i−1)=2=−π₀|Pass; none|
|0.14|p=2,ρ=i|i²+1=0; monic constant 1|Pass; none|
|0.15|p=3,n=0|polynomial T²+3T+3; constant 3,degree 2|Pass; none|
|0.16|p=3,x=1/3 and 0|k=1 gives 1∈ℤ₃[π]; k=0 fails for 1/3; 3⁰0=0|Pass; none|
|0.17|p=2,n=0|integral closure ℤ₂; 1 integral,1/2 not integral|Pass; none|
|0.18|p=2,n=0|integral root value −1; residue 1|Pass; none|
|0.19|p=2,n=0,1; p=3,n=0|repr(π₀)=(−2), root coordinate (−1); π₀²=−3−3π₀ gives (−3,−3); repr(i)=(1,1) in (1,i−1), versus (0,1) in (1,i)|Pass; none|
|0.20|p=3,n=0|generator π=ζ₃−1; root ζ₃≠π|Pass; none|
|0.21|p=3,n=0|minpoly π=T²+3T+3; evaluation 0|Pass; none|
|0.22|p=3,n=0,1|dimensions 2,6 = (3−1),3(3−1)|Pass; none|
|0.23|p=2,n=0|2=−π₀ belongs to (π₀)|Pass; none|
|0.24|p=3,n=0|red(2+π)=2; red(π)=0|Pass; none|
|0.25|p=3,c=5|red(5)=2=5 mod 3|Pass; none|
|0.26|p=3,n=0|red(ζ₃)=red(1+π)=1|Pass; none|
|0.27|p=3,n=0|π↦0,2↦2; π∈kernel,2∉kernel|Pass; none|
|0.28|p=3,n=0|quotient representatives 0,1,2; cardinal 3=card 𝔽₃|Pass; none|
|0.29|p=3,n=0|π²=−3(1+π)∈(3)|Pass; none|
|0.30|p=3,n=0|O/(π)=𝔽₃; 2 inverse 2|Pass; none|
|0.31|p=3,n=0|π²∈M implies π∈M; quotient field has only maximal ideal 0|Pass; none|
|0.32|p=2,n=0|local ring ℤ₂; maximal ideal (2)=(−2)|Pass; none|
|0.33|p=3,n=0|canonical maximal ideal (π), not (3)=(π²)|Pass; none|
|0.34|p=3,n=0|O is free ℤ₃-module of rank 2|Pass; none|
|0.35|p=2,n=0|ℤ₂ is DVR,π=−2 nonzero nonunit|Pass; none|
|0.36|p=3,n=0|v(π)=1; v(π²)=2 excludes π² as prime|Pass; none|
|0.37|p=3,n=0|residue 𝔽₃ has 3 elements; red(ζ)=1|Pass; none|
|0.38|p=3,n=0|red(2)=2 gives unit; red(π)=0 gives nonunit|Pass; none|
|0.39|p=2,n=0; p=3|P=T+2 evaluates0,constant2 nonunit; constant2 at p=3 evaluates unit2|Pass; none|
|0.40|p=3,u=ζ₃|lift 1+T degree 1<2; constant 1 unit|Pass; none|
|0.41|p=3,u=ζ₃|polynomial series 1+T evaluates to ζ₃|Pass; none|
|0.42|p=3,n=0|extended norm of 3=1/3=base norm|Pass; none|
|0.43|p=2,n=0|integral root −1 has order 2; square 1|Pass; none|
|0.44|p=3,n=0|norms 1 and 3^(−1/2)≤1; norm(1/3)=3>1|Pass; none|
|0.45|p=3,n=0|coordinate model ℤ₃²; π has coordinates (0,1)|Pass; none|
|0.46|p=3,u=2|norm(u)=1=norm(u⁻¹); π norm<1|Pass; none|
|0.47|p=3,n=0|π²=3u with u=−ζ₃, a unit|Pass; none|
|0.48|p=3,n=0|norm(π)=3^(−1/2); square=1/3|Pass; none|
|0.49|p=2,n=0|norm(π)=1/2<1|Pass; none|
|0.50|p=2,n=0|(π)^r=(2)^r; ball radius 2^(−r)|Pass; none|
|0.51|p=2,n=0|eval(T)=−2=π₀; eval(T+2)=0; eval(1+T)=−1=ρ₀; eval(ΣT^k)=1/3 and (2−ρ₀)/3=1|Pass; none|
|0.52|p=3,P=1+T|polynomial and series evaluations both ζ₃|Pass; none|
|0.53|p=2,n=0,u=3|constant unit series 3 evaluates to 3|Pass; none|
|0.54|p=3,n=0,x=π⁻¹|norm=3^(1/2)=norm(π)^(−1)|Pass; none|
|0.55|p=3,n=0|norms of π⁻¹,1,π are 3^(1/2),1,3^(−1/2)|Pass; none|
|0.56|p=3,n=0|π integral,norm<1; π⁻¹ not integral,norm>1|Pass; none|
|0.57|p=2,n=0|both valuation-integer carriers contain 2,exclude 1/2|Pass; none|
|0.58|p=3,n=0|both rings contain π,exclude π⁻¹|Pass; none|
|0.59|p=3,n=0|2 unit,norm 1; π nonunit,norm<1|Pass; none|
|0.60|p=3,n=0|π in maximal ideal,norm<1; 2 outside,norm 1|Pass; none|
|0.61|p=3,n=0|red(π)=0,norm<1; red(2)=2,norm 1|Pass; none|
|0.62|p=3,n=0,r=2|π² on boundary norm=1/3; π outside|Pass; none|
|0.63|p=3,n=0|(3)=(π²), whereas π∉(3)|Pass; none|
|0.64|p=2,n=0|balls 2^rℤ₂=(π)^r shrink to {0}|Pass; none|
|0.65|p=2,n=0,x=1+2^m i|coordinates (1,2^m)→(1,0)|Pass; none|
|0.66|p=2,x=1+2^m i|norm=1+2^(2m)→1=N(1)|Pass; none|
|0.67|p=2,n=0,x=i−1|integral and field norms both 2|Pass; none|
|0.68|p=2,x=1+2^m i|integral norms 1+2^(2m)→1|Pass; none|
|0.69|p=2,L=ℚ₂(i),u_m=1+2^m|N(u_m)=(1+2^m)²→1; N(u_m⁻¹)=(1+2^m)⁻²→1; N(−1)=1|Pass; none|
|0.70|p=3,F=2+T|red ε(F)=2=red F[0]|Pass; none|
|0.71|p=3,x_m=2+3^m|residues 2 for m≥1; limit residue 2|Pass; none|
|0.72|p=2|unsigned (−1,i) fails N(i)=1≠−1; signed (1,−i) works|Pass; none|
|0.73|p=3|equalizer residual at constant 2 is 8/2=4≠1; at 1 it is 1|Pass; none|
|0.74|p=3|compatible constant −1 tower lies in closed product; constant 2 fails|Pass; none|
|0.75|p=3,F_m=1+3^m T|ε(F_m)−1=3^mπ→0|Pass; none|
|0.76|p=2,3,5|sections1,−1,ω(2); residues1,2,2; ω(2)^4=1 whereas 2^4=16≠1|Pass; none|
|0.77|p=5,a=2|ρ↦ρ²; inverse action would give ρ³≠ρ²|Pass; none|
|0.78|p=3,a=−1|N(ρ₁⁻¹)=ρ₀⁻¹=σ(Nρ₁)|Pass; none|
|0.79|p=2,n=0|comparison sends −2 to −2,not its inverse −1/2|Pass; none|
|0.80|p=2,n=0|v(π)=v(−2)=1|Pass; none|
|0.81|p=3,n=1|v(3)=6=3(3−1)|Pass; none|
|0.82|p=3,n=0,x=3|normalized abs 1/9=(1/3)²|Pass; none|
|0.83|p=3,2,u=−1|principal false,true; residues 2,1|Pass; none|
|0.84|p=3,r=2|both native and scalar Teich lifts −1|Pass; none|
|0.85|p=2,n=0|E(−1)=E; p=3 gives degree 2|Pass; none|
|0.86|p=3,unramified O|T²+3T+3 Eisenstein; over ramified e=2 constant valuation 2 fails|Pass; none|
|0.87|p=3,n=0,1|degrees 2,6 independently of unramified f|Pass; none|
|0.88|p=2,n=0|π=−2 has valuation 1 in unramified E|Pass; none|
|0.89|O finite unramified; p=2,3,n=0|repr(π₀)=(−2) at2; π₀²=−3−3π₀ and repr(ρ₀)=(1,1) at3; root basis gives (0,1)|Pass; none|
|0.90|p=2,3; E unramified|[E(i):E]=2 at p=2; at p=3 [E₁:E₀]=6/2=3|Pass; none|
|0.91|p=3,scalar c=2|unit norm 8=2³|Pass; none|
|0.92|p=3,f=2,n=0|unramified quadratic ∩ ramified quadratic=ℚ₃; composite degree 4|Pass; none|
|0.93|p=3,f=2|σ(c) reduces to r³≠r for r of order 8; σ(ρ)=ρ|Pass; none|
|0.94|k=𝔽₉,ord r=8|residues r,r³,r; (r³)³=r|Pass; none|
|0.95|E=ℚ₂|units are odd,closed in ℤ₂; equalizers closed; tuple 1 lies in limit|Pass; none|
|0.96|two identical factors|e₁=(1,0),e₂=(0,1); e₁e₂=0,e₁+e₂=1|Pass; none|
|0.97|p=2,n=0|relative polynomial X²+1; evaluation at i=0|Pass; none|
|0.98|p=2,n=0|N(i)=1=−ρ₀|Pass; none|
|0.99|p=3,transport σ|c↦σc,ρ↦ρ; inverse-root extension fails root law|Pass; none|
|0.100|p=3,two factors,c=(2,−1)|norm=(8,−1)|Pass; none|
|0.101|p=3,f=2,n=0|relative e=2,f_relative=1,degree 2|Pass; none|
|0.102|k=𝔽₉|residue map sends c to r,ρ to 1|Pass; none|
|0.103|p=3,f=2,n=1|e(E₁/E)=6=d₁; residue degree1; [E₁:E]=6|Pass; none|
|0.104|p=2,n=0,1|signed coordinates 1,−i; N(−i)=1 but (−i)²=−1|Pass; none|
|0.105|p=2,n=0|N(−i)=1=sρ₀|Pass; none|
|0.106|p=3,f=2,n=1|absolute e=6,not total degree 12|Pass; none|
|0.107|p=3,f=2,n=1|absolute residue degree 2,not 12|Pass; none|
|0.108|p=3,f=2|card residue=9=3²; units=8|Pass; none|
|0.109|p=3,f=2,n=0,x=3|normalized abs 3^(−4)=(1/3)^4|Pass; none|
|0.110|p=3,f=2,n=0|v(3)=2=d₀,not 4|Pass; none|
|0.111|p=3,f=2,n=0|normalized abs_E₀(3)=1/81=(normalized abs_E(3))²=(1/9)²|Pass; none|
|0.112|p=3,x=π|underlying comparison value π=π|Pass; none|
|0.113|p=3,n=0|image of (π)=(π); (3)=(π²) differs|Pass; none|
|0.114|p=3,x=2+π|both residue maps give 2|Pass; none|
|0.115|p=3,u=ζ₃|both field values ζ₃|Pass; none|
|0.116|p=3,u=ζ₃|residue 1 and u−1=π∈maximal ideal|Pass; none|
|0.117|p=3,u=ρ₁|both principal-unit norm maps give ρ₀|Pass; none|
|0.118|p=2,n=0|E₀=E(−1)=E|Pass; none|
|0.119|p=2,n=0; p=3,n=0|−1=i² lies in E₁; ρ₀=ρ₁³ lies in E₁|Pass; none|
|0.120|E=ℚ₃,n=0|E₀=K₀=ℚ₃(ζ₃)|Pass; none|
|0.121|p=3,n=0|generator π=ζ₃−1,not ζ₃|Pass; none|
|0.122|p=3,n=1|basis length 6=3(3−1)|Pass; none|
|0.123|p=3,n=0,x=π²|unique coordinates (−3,−3)|Pass; none|
|0.124|k=𝔽₉,scalar c|both residues r; σ-twisted alternative gives r³|Pass; none|
|0.125|p=3,n=0; any unramified E|r(ρ)=r(1+π)=1+0=1; r(π)=0|Pass; none|
|0.126|k=𝔽₉|inclusion sends residue r to r,not r³|Pass; none|
|0.127|p=3,c=2|field value of unit norm 8=field norm|Pass; none|
|0.128|p=3,c=2|N(c)=8=2³|Pass; none|
|0.129|p=3,c=2,two steps|N(Nc)=512=2⁹|Pass; none|
|0.130|p=2,k=𝔽₈,ord r=7|σ(c) has residue r²; inverse has r⁴≠r²; σ fixes chosen root|Pass; none|
|0.131|p=3|fixed-root σ sends ρ to ρ,not ρ⁻¹|Pass; none|
|0.132|p=3|σ(ρ₁³)=ρ₁³=ρ₀|Pass; none|
|0.133|f=2,k=𝔽₉|σ²(r)=r⁹=r; σ(r)=r³≠r|Pass; none|
|0.134|k=𝔽₉|res σ(c)=r³=(res c)³|Pass; none|
|0.135|k=𝔽₉|residue transition (r³)³=r|Pass; none|
|0.136|p=2|signed towers at exponents 0,1 differ at level 1: 1≠−i|Pass; none|
|0.137|E=ℚ₃|twisted residues (−1)³=−1; base tower unchanged|Pass; none|
|0.138|p=3|sρ=ρ since (−1)²=1|Pass; none|
|0.139|p=2,n=0,1|sρ=1,−i|Pass; none|
|0.140|p=2,n=0,1|signed orders 1,4; unsigned orders 2,4|Pass; none|
|0.141|two factors|pr₁(2,3)=2,pr₂(2,3)=3|Pass; none|
|0.142|two factors|e₁²=e₁,e₁e₂=0|Pass; none|
|0.144|transport σ,k=𝔽₉|scalar residue r↦r³|Pass; none|
|0.145|transport σ,p=3|selected root ρ↦ρ|Pass; none|
|0.146|p=3,n=0|maps agreeing on c and ρ agree on c₀+c₁ρ|Pass; none|
|0.147|p=3,two factors|norm(2,−1)=(8,−1)|Pass; none|
|0.148|p=3,scalar tuple(2,−1)|coordinate cubes (8,−1)|Pass; none|
|0.149|p=3,two steps|first norm coordinate 2→8→512=2⁹|Pass; none|
|0.150|p=2,n=0|evaluation point −2 has norm 1/2<1; 1 has norm 1|Pass; none|
|0.151|p=2,n=0|Gal(E(i)/E)={i↦i,i↦−i},order 2|Pass; none|
|0.152|k=𝔽₉|norm residue r³≠r for ord r=8|Pass; none|
|0.153|k=𝔽₃|r³=r; r=2 gives 8 mod 3=2|Pass; none|
|0.154|p=3,Teich −1|residues all 2=2|Pass; none|
|0.155|p=3,Teich −1|level-zero residue 2; principal identity residue 1|Pass; none|
|0.156|p=3|root tower residues 1; stationary −1 residues 2,excluded|Pass; none|
|0.157|p=3|roots satisfy u_n−1=π_n; −1−1=−2 is unit,excluded|Pass; none|
|0.158|p=3|residue kernel is preimage {1}; root tower in,−1 out|Pass; none|
|0.159|p=3,a=3|coordinates 1,ρ₀; nonzero exponent detected at level 1|Pass; none|
|0.160|p=3,r=2|N(−1)=−1; residue 2=2|Pass; none|
|0.161|p=3|split(−1)=(2,1),split(ρ)=(1,ρ)|Pass; none|
|0.162|p=3,a=−1|root tower exponent 1↦−1; Teich −1 fixed|Pass; none|
|0.163|p=3,a_m=1+3^m,u_m=t(1+3^m)|action=t((1+3^m)²)→t(1); at level n, m≥n+1 gives ρ_n on both sides|Pass; none|
|0.164|p=3|U¹/U² has 3 elements; full residue units have 2,excluded|Pass; none|
|0.165|p=3,root tower u|0•u=1,2•u=u²|Pass; none|
|0.166|p=3|δ₋₁•t(1)=t(−1),δ₁•t(1)=t(1)|Pass; none|
|0.167|k=𝔽₉,ord r=8|res Nω(r)=r³; res ω(r)=r≠r³|Pass; none|
|0.168|p=5,a=2,n=0|ρ↦ρ²; scalar 3↦3|Pass; none|
|0.169|k=𝔽₉,c=ω(r)|both Nσ(c),σN(c) have residue r⁹=r|Pass; none|
|0.170|k=𝔽₈|starting r,next r⁴; (r⁴)²=r; forward r² would fail|Pass; none|
|0.171|k=𝔽₉|t(r) principal iff r=1; signed dyadic roots have residue 1|Pass; none|
|0.172|k=𝔽₉|t(r) residues r,r³,r; k=𝔽₈ instead gives r,r⁴,r²|Pass; none|
|0.173|k=𝔽₈,ord r=7,u=t(r)τ|level1 residue r⁴; split(u)=(r,τ); inverse=t(r)τ; principal tuple splits as(1,τ)|Pass; none|
|0.174|p=3,k=𝔽₉|first principal quotient size 9=3²; residue-unit size 8 excluded|Pass; none|
|0.175|signed dyadic tower u|0•u=1,2•u=u²; level 1 values 1,−1|Pass; none|
|0.176|p=2,a=0,1,2|level1 coordinates 1,−i,−1; ι(2)=ι(1)²; level0 all1|Pass; none|
|0.177|two factors,p=3|(ρ,1) norm transitions (ρ₀,1)|Pass; none|
|0.178|p=2,n=0|N(1−i)=2=1−ρ₀; N(i)=1≠ρ₀|Pass; none|
|0.179|p=2,a=−1,n=0|N(−i)=1=σ(Ni); at p=3 both sides ρ₀⁻¹|Pass; none|
|0.180|two factors,p=3|(ρ,1) principal; (ρ,−1) not principal|Pass; none|
|0.181|two factors|shuffled tuple ((ρ_n,1))↔((ρ_n),(1)); inverse returns same entries|Pass; none|
|0.182|two factors,k=𝔽₉|Frobenius (r,s)↦(r³,s³); e₁ fixed|Pass; none|
|0.183|two factors|split(t(r),v)=((r,1),(1,v)); inverse returns (t(r),v)|Pass; none|
|0.184|p=5,a=2|scalar 3 fixed,root squared|Pass; none|
|0.185|p=5,a=2|ρ↦ρ²≠ρ³ (inverse convention)|Pass; none|
|0.186|k=𝔽₉,a=2|both composites cρ↦σ(c)ρ²|Pass; none|
|0.187|k=𝔽₉|coefficient σ changes r→r³; cyclotomic action leaves r unchanged|Pass; none|
|0.188|p=3|δ₂•t(1)=t(2)=2•t(1)|Pass; none|
|0.189|p=2,a=3,n=1|σ₃(−i)=i=(−i)³|Pass; none|
|0.190|S₃ permutes three identical factors|(12)(23)e₁=e₂,reverse order gives e₃|Pass; none|
|0.191|three factors,p=3|δ_(12) swaps (t(1),1,1) to (1,t(1),1)|Pass; none|
|0.192|two factors|(a,b)=(1,0) maps to (t(1),1),distinct from (1,t(1))|Pass; none|
|0.193|p=5,a=b=2|σ₂σ₂ρ=ρ⁴=σ₄ρ|Pass; none|
|0.194|k=𝔽₉|t(r) belongs iff r=1; residues r,r³ verify both directions|Pass; none|
|0.195|p=2|t(0),t(1) differ in coordinate 1: 1 versus −i|Pass; none|
|0.196|k=𝔽₉|principal fiber res⁻¹{1}; t(r≠1) lies in open complement|Pass; none|
|0.197|k=𝔽₈,n=1|t(r)_1=ω(r⁴),not ω(r²)|Pass; none|
|0.198|k=𝔽₈,ord r=7|level-zero residue of t(r)=r; next residue r⁴ squares to r|Pass; none|
|0.199|k=𝔽₃|inverse Frobenius fixes 2; section stationary −1|Pass; none|
|0.200|u=t(r)v|first coordinate r=res u₀|Pass; none|
|0.201|u=t(r)v|second coordinate t(r)⁻¹t(r)v=v|Pass; none|
|0.202|(r,v)|inverse then split gives (r,v); product t(r)v|Pass; none|
|0.203|k=𝔽₉,u=t(r)|σ action residue r³ at level 0|Pass; none|
|0.204|k=𝔽₈,ord r=7|σt(r) initial residues(r²,r) = t(r²); cyclotomic action leaves(r,r⁴) unchanged|Pass; none|
|0.205|k=𝔽₉|both action orders send cρ to σ(c)ρ^a|Pass; none|
|0.206|p=2,a=1,n=0,1|coordinates 1,−i; exponent residue gives same|Pass; none|
|0.207|p=2,a=0,1|level-zero coordinates both 1; level-one coordinates 1≠−i|Pass; none|
|0.208|p=2,a=2,b=1,n=1|t(ab)=−1=t(b)²|Pass; none|
|0.209|two factors,p=3|N(ρ₁,1)=(ρ₀,1)|Pass; none|
|0.210|two factors,p=3|(ρ,1) versus(1,ρ) have level0 first coordinates ρ₀≠1; matching all coordinates returns identical tuples|Pass; none|
|0.211|two factors|each residual equation for (ρ,1) equals (1,1)|Pass; none|
|0.212|two factors|nth projection of shuffled (u,v)=(u_n,v_n)|Pass; none|
|0.213|p=3,two factors|shuffle and norm both give (ρ₀,1)|Pass; none|
|0.214|p=3|(ρ,1) principal both sides; (ρ,−1) fails both|Pass; none|
|0.215|k=𝔽₉,two factors|first residue of σ(r,s)=r³|Pass; none|
|0.216|two factors|σ(e₁)=(1³,0³)=e₁|Pass; none|
|0.217|k=𝔽₉|each residue σN(r)=r⁹=Nσ(r)|Pass; none|
|0.218|swap two factors|first coordinate of (u,v) after action v|Pass; none|
|0.219|swap two factors|e₁↦e₂; coefficient Frobenius instead fixes e₁|Pass; none|
|0.220|p=3,swap|N swap(2,−1)=(−1,8)=swap N(2,−1)|Pass; none|
|0.221|two 𝔽₈ factors,initial(r,s)|split residue=(r,s); next section residues(r⁴,s⁴) square to(r,s); forward gives(r⁴,s⁴)≠(r,s)|Pass; none|
|0.222|two factors|inverse ((r,s),(v,w))=(t(r)v,t(s)w)|Pass; none|
|0.223|two factors,principal(v,w)|split(v,w)=((1,1),(v,w)); inverse returns(v,w)|Pass; none|
|0.224|p=3|(ρ,1) all residues 1; (ρ,−1) second residue 2|Pass; none|
|0.225|two factors|(t(1),1) and (1,t(1)) separated by first coordinate|Pass; none|
|0.226|two factors,p=3 versus2|p=3: res(1,−1)=(1,2)≠(1,1),excluded; p=2: residue(1,1),included|Pass; none|
|0.227|p=3,n=0|action constant on a+3ℤ₃; a=1 sends ρ→ρ|Pass; none|
|0.228|f=2|σ exponent mod 2 gives id,σ; cyclotomic exponent mod p^(n+1)|Pass; none|
|0.229|f=2,k=𝔽₉|σ²r=r⁹=r; σr≠r|Pass; none|
|0.230|k=𝔽₉|both actions send residue 1 to 1|Pass; none|
|0.231|k=𝔽₉|σ applied to residues r,r³ gives r³,r; norm relation r³=r³|Pass; none|
|0.232|swap two factors|norm of (v_(n+1),u_(n+1))=(v_n,u_n)|Pass; none|
|0.233|p=3,n=0|comparison π↦π,ρ↦ρ; scalar residue r↦r|Pass; none|
|0.234|p=2,n=0|supplied basis(1,i) transported to(1,i); repr(i²)=(−1,0); wrong root−i≠i|Pass; none|
|0.235|p=2,n=0|N(i)=1,Tr(i)=0; u=3 lifts to polynomial 3 of degree 0|Pass; none|
|1.1|p=2,scalar T on 1|Φ(T)=2T+T²≠T|Pass; none|
|1.2|p=2,F=T mod 2|coordinates (1,1),assembly 1+(1+T)=T|Pass; none|
|1.3|p=2,c=(−1,1)|assembly −1+Y=T|Pass; none|
|1.4|p=2,c=(T,0)|assembly Φ(T)=2T+T²; untreated coefficient gives T≠2T+T²|Pass; none|
|1.5|p=2,c_m=(2^m,0)|assembly 2^m→0|Pass; none|
|1.6|p=2,F=T|exact coordinates (−1,1) give error 0∈(2^k) for k=0,1,2|Pass; none|
|1.7|p=2,c=(2,0)|assembly 2 divisible by 2,not 4; same for coordinates|Pass; none|
|1.8|p=2|c=(−1,1) is unique for T; (1,1) assembles T+2≠T|Pass; none|
|1.9|p=2,F=T|coordinates (−1,1); F=Y² gives (Y,0)|Pass; none|
|1.10|p=2,3|p=2: repr(T)=(−1,1), repr(Y²)=(Y,0); wrong (0,Y) reconstructs Y³. p=3: repr(Y⁴)=(0,Y,0); wrong (0,0,Y) reconstructs Y⁵|Pass; none|
|1.11|p=3|vectors at i=0,1,2 are 1,Y,Y²|Pass; none|
|1.12|p=2,F=T|Φ(−1)+Φ(1)Y=−1+Y=T|Pass; none|
|1.13|p=2,F=Y|M=[[0,Y],[1,0]]; M²=YI|Pass; none|
|1.14|p=2,F=Y|N(Y)=det M=−Y|Pass; none|
|1.15|p=2,F=Y|N(ΦY)=N(Y²)=Y²|Pass; none|
|1.16|p=3,c=2|N(2)=8=2³|Pass; none|
|1.17|p=2,F=1,Y|traces 2,0|Pass; none|
|1.18|p=3,F=1,Y,Y³|traces 3,0,3Y; p·c₀ same|Pass; none|
|1.19|p=2,F=T|trace −2 belongs to (2); trace/2=−1|Pass; none|
|1.20|p=2|Y not fixed (N=−Y); −Y fixed; 1 fixed|Pass; none|
|1.22|p=2,3|N(Y)=−Y,Y; signs −1,+1|Pass; none|
|1.23|p=2,F=T|det[[-1,Y],[1,-1]]=1−Y=−T|Pass; none|
|1.24|p=3,c=2|N(2)=8≠2,so not member; −1 is member|Pass; none|
|1.25|p=3|constants 1,−1 satisfy c²=1; c=2 gives 4≠1|Pass; none|
|1.26|p=3,F=3T|reduction 0; F∈(3) but F∉(9)|Pass; none|
|1.27|p=3,F=3T|ΦF=9T+9T²+3T³,valuation minimum 1=F|Pass; none|
|1.28|p=3,c=1,4|inputs diff 3; norms diff 63 divisible by 3|Pass; none|
|1.29|p=3,c=2|N(2)=8≡2 mod 3|Pass; none|
|1.30|p=3,F=4|N4−1=63 has v₃=2≥1+1|Pass; none|
|1.31|p=3,F=4,n=2|N²4−1=262143 has v₃=3|Pass; none|
|1.32|p=3,F=2,n=1|N²2−N2=504 has v₃=2|Pass; none|
|1.33|p=2,F_m=T+2^m|coordinates (−1+2^m,1)→(−1,1)|Pass; none|
|1.34|p=3,c_m=1+3^m|N(c_m)=c_m³→1|Pass; none|
|1.35|p=3,c_m=3^m|trace 3^(m+1)→0|Pass; none|
|1.36|p=3,F=2|successive constants 2,8,512; differences v₃=1,2|Pass; none|
|1.37|p=3,F=2|limit −1 satisfies (−1)³=−1|Pass; none|
|1.38|p=3,F=2|errors −3,−9,−513 have valuations 1,2,3|Pass; none|
|1.39|p=3,F=2,n=0,1,2|precision valuations 1,2,3=n+1|Pass; none|
|1.40|p=2,F=Y|L(Y)=−Y; N(−Y)=−Y|Pass; none|
|1.41|p=3,F=G=2|L(4)=1=L(2)²|Pass; none|
|1.42|p=2,F=−Y|L(F)=−Y=F|Pass; none|
|1.43|p=3,F=2|L(F)=−1,constant unit; inverse −1|Pass; none|
|1.44|p=3,c_m=1+3^m|L(c_m)=1=L(1) for m≥1|Pass; none|
|1.45|p=2,a=Y,F=1|τ(ΦY)=2Y=Y·τ(1)|Pass; none|
|1.46|p=3,m=0,1,3|τ(Y^m)=3,0,3Y|Pass; none|
|1.47|p=3,P=1+Y|τ(P)=3=3ψ(P)|Pass; none|
|1.48|p=3,F=2+Y|τ(F)=6=3ψ(F)|Pass; none|
|1.49|p=2,F=T|c₀=−1=ψ(T)|Pass; none|
|1.50|p=2,F=Y²|root sum Y²+(−Y)²=2Y²=Φ(2Y)|Pass; none|
|1.51|A=ℚ[ε]/ε²,M=[1+ε],d=ε∂ε|d det=ε; det·Tr(M⁻¹dM)=ε; empty matrix gives 0=0|Pass; none|
|1.52|p=2,F=Y²,c=(Y,0)|∂F=2Y²; pΦ(∂Y)=2Y²|Pass; none|
|1.53|p=2,F=Y,H=diag(0,1)|2∂M+HM−MH=M=M_(∂Y)|Pass; none|
|1.54|p=2,a=T|structural map 2T+T²=ΦT|Pass; none|
|1.55|p=2,ζ=−1|τ₁ΦY=(−Y)²=Y²=iotaΦY|Pass; none|
|1.56|p=2,F=T,ζ=−1,i=1|τ₁T=−Y−1; translated expansion −1−Y|Pass; none|
|1.57|p=2|E=[[1,Y],[1,−Y]],det=−2Y≠0 but not a unit|Pass; none|
|1.58|p=2,F=Y|Eα(M)=[[Y,Y²],[−Y,Y²]]=diag(Y,−Y)E|Pass; none|
|1.59|p=2,F=Y|Φ(NY)=−Y²=Y(−Y)|Pass; none|
|1.60|p=2,F=Y|candidate −Y embeds as −Y²; candidate Y gives +Y²≠−Y²|Pass; none|
|1.61|p=2,n=0,F=Y|ε₁ΦY=i²=−1=ε₀Y|Pass; none|
|1.62|p=2,F=T|specialized coordinates (−1,1),value i−1|Pass; none|
|1.63|p=2,F=Y,n=0|matrix specializes to [[0,−1],[1,0]],multiplication by i|Pass; none|
|1.64|p=2,F=Y,n=0|ε₀(NY)=1=N(i)|Pass; none|
|1.65|p=2,unit Y|underlying unit-square values 1=1|Pass; none|
|1.66|p=2,F=−Y|evaluations (1,−i); N(−i)=1|Pass; none|
|1.67|p=3,F=Y|evaluation tower (ρ_n); coordinate norms ρ₀|Pass; none|
|1.68|p=3,F=−1|evaluation residue 2=F[0] mod 3|Pass; none|
|1.69|p=3|Y gives residue 1,−1 gives 2; principal true,false|Pass; none|
|1.70|p=3,P=T²+3T+3|degree 2 vanishes at π₀; at π₁ degree obstruction 2<6|Pass; none|
|1.71|p=3,F=T|ε_nF=π_n≠0 for all n|Pass; none|
|1.72|p=3,F=T,G=0|evaluations π_n≠0; zero difference yields all zeros|Pass; none|
|1.73|p=2,F=1,−Y|level 1 values 1,−i distinguish them|Pass; none|
|1.74|p=3,F−G=3^m T|evaluation norm 3^(−m)normπ≤3^(−m)|Pass; none|
|1.75|p=2,F=Y,n=0,k=1|ε₀NF=1=N ε₁F|Pass; none|
|1.76|p=3,u=root tower|lift Y already fixed; approximation error 0 at every precision|Pass; none|
|1.77|p=3,k=𝔽₉,c|Φc=c,Σc=σc≠c; scalar T acts by 3T+3T²+T³|Pass; none|
|1.78|p=2,F=T over O|coordinates (−1,1) unique; wrong (1,1) adds 2|Pass; none|
|1.79|p=3,F=Y³|coordinates (Y,0,0)|Pass; none|
|1.80|p=3|O-series basis 1,Y,Y²,rank 3 independent of f|Pass; none|
|1.81|O finite unramified,p=3|coordinates of 3^mY tend (0,0,0)|Pass; none|
|1.82|p=3,c=ω(r)|N(c)=c³=σc|Pass; none|
|1.83|p=3,F=1,Y,Y³|τ values3,0,3Y; p c₀ gives3,0,3Y,not3Y³|Pass; none|
|1.84|p=3,F=cY³|τ(F)=3cY=3c₀(F)|Pass; none|
|1.85|p=3,k=𝔽₉,c|NΣc=(σc)³=Σ(c³)|Pass; none|
|1.86|p=2,F=Y|root product −Y²=Φ(NY)|Pass; none|
|1.87|p=3,F=3T over O|minimum coefficient valuation of ΦF=1=v(F)|Pass; none|
|1.88|k=𝔽₉,ord r=8|res Nω(r)=r³=res Σω(r),not r|Pass; none|
|1.89|p=3,F=4|N4−1=63,v₃=2|Pass; none|
|1.90|p=3,F=4,G=1|input congruence mod3; norm congruence mod9 (63)|Pass; none|
|1.91|p=3,c_m=1+3^m|N(c_m)−1→0|Pass; none|
|1.92|O unramified,p=3|ψ_O(c)=c,ψ_O(cY)=0,ψ_O(cY³)=cY|Pass; none|
|1.93|p=3,F=cY³|τF=3cY=3ψ_OF|Pass; none|
|1.94|p=2; O=ℤ₂ or unramified degree3|det[[0,Y],[1,0]]=−Y=M(Y); det diag(3,3)=9=M(3)≠3. ord(c)=7: σ⁻¹N(c)=(c²)⁴=c⁸=c; σN(c)=c⁴≠c|Pass; none|
|1.95|p=2, f=Y,3,c with ord(c)=7|Y→−Y→−Y: differences −2Y,0. 3→9→81→6561: differences6,72,6480 have v₂=1,3,4≥1,2,3. c→c: differences0|Pass; none|
|1.96|k=𝔽₈,Teich c of order7; p=2,Y|N(c)=c²=Σc≠c; M(c)=c; N(Y)=−Y excludesY and includes−Y|Pass; none|
|1.97|p=3|unit constants {c:res c≠0}; 2 in,3 out; closed finite-residue locus|Pass; none|
|1.98|p=3|image contains root tower; stationary 2 fails norm relation 8≠2|Pass; none|
|1.99|p=3,u=(ρ_n),k=0,1|F=Y has errors0≤1/3 and0≤1/9; second bound1/9≤1/3 and adds coordinate1|Pass; none|
|1.100|p=3,u=root tower|preimage Y; ε_nY=ρ_n|Pass; none|
|1.101|p=3|Col(root tower)=Y; inverse sends Y to (ρ_n)|Pass; none|
|1.102|p=3|fixed constant −1 maps to constant tower −1; both inverse composites −1|Pass; none|
|1.103|k=𝔽₉,F=cY|σ_n ε_nF=σ(c)ρ_n=ε_nΣF|Pass; none|
|1.104|p=2,F=Y,n=0|receiving matrix [[0,−1],[1,0]] on both carriers|Pass; none|
|1.105|p=2,F=Y|Nε₁Y=1=ε₀NY|Pass; none|
|1.106|p=2,F=Y|Trε₁Y=i−i=0=ε₀τY|Pass; none|
|1.107|k=𝔽₈,F=c=ω(r)|twisted evaluations c,σ⁻¹c; norm residue r=(r⁴)²|Pass; none|
|1.108|p=3,F=Y,σ fixes roots|corrected iterates stay Y; evaluations ρ_n|Pass; none|
|1.109|k=𝔽₉,twisted Teich tower|series c gives exact error 0 at every level|Pass; none|
|1.110|p=3,F−G=3^mT|σ preserves p; twisted error norm ≤3^(−m)|Pass; none|
|1.111|p=3,F=4,k=2|M²4−1=262143,v₃=3|Pass; none|
|1.112|O unramified,F=T|ε_nF=π_n≠0|Pass; none|
|1.113|O unramified,F=T,G=0|twisted evaluations π_n≠0; roots fixed by σ|Pass; none|
|1.114|k=𝔽₉,c≠1|twisted towers differ at level 0: c≠1|Pass; none|
|1.115|p=3,c_m=1+3^m|M(c_m)=c_m³→1|Pass; none|
|1.116|p=3,F=2|L=−1,errors −3,−9,−513; p=2,F=Y gives L=−Y|Pass; none|
|1.117|k=𝔽₈,u_n=σ^(−n)c|ε_nCol(u)=c=σ^n(u_n)|Pass; none|
|1.118|k=𝔽₉|Col(t(r))=ω(r); inverse uses residues r,r³,r|Pass; none|
|1.119|k=𝔽₉|split Teich component is finite/discrete; both inverse composites c=c|Pass; none|
|1.120|k=𝔽₉,c=ω(r)|Col(σt(r))=σc=ΣCol(t(r))|Pass; none|
|1.121|E=ℚ₃|σ=id,corrected norm=N; root tower series Y|Pass; none|
|1.122|p=3,F=2|errors v₃=1,2,3; convergence to −1|Pass; none|
|1.123|p=2,F=Y,n=0,1|errors −2Y,0 ∈(2),(4)|Pass; none|
|1.124|p=3,c_m=1+3^m|projector values all 1→1|Pass; none|
|2.1|R=ℤ,Y unit|ΔY=1,ΔY⁻¹=−1; zero ring gives 0=1|Pass; none|
|2.2|f=g=Y|Δ(Y²)=2=1+1; R=𝔽₂ gives 0=0|Pass; none|
|2.3|f=Y|Δ(Y⁻¹)=−1=−ΔY|Pass; none|
|2.4|f=Y,k=−2,0,2|logarithmic derivatives −2,0,2=kΔY|Pass; none|
|2.5|constant unit −1|derivative 0,Δ=0|Pass; none|
|2.6|char 0 versus 3|Δconstant=0; Δ(1+T³)=0 in 𝔽₃ despite nonconstant input|Pass; none|
|2.7|ℤ→𝔽₃,f=Y³|reduction of Δf=3→0; Δ(reduced f)=0|Pass; none|
|2.8|f=Y,substitution 2T+T²|Δ(Y²)=2; chain factor Y·(2+2T)/Y²=2|Pass; none|
|2.9|p=3,f=Y|ΔΦf=3=3ΦΔf|Pass; none|
|2.10|a=0,1,2,3; R=ℤ,𝔽₂,𝔽₃|q₀=0,q₁=1,q₂=2+T,q₃=3+3T+T²; coefficient definitions give the same values; q₂ mod2=T nonunit; q₃ mod3=T²|Pass; none|
|2.10a|a=1,2,3; p=2,3|F₁=0; F₂=1/2−T/4+T²/8+… and (2+T)F₂=1; F₃=1−2T/3+…; at p=2 F₃(0)=1, at p=3 a=3 excluded|Pass; none|
|2.11|a=b=2|f₄=4+6T+4T²+T³=(2+T)(2+2T+T²)|Pass; none|
|2.12|p=3,a=2,3|constant coefficients 2(unit),3(nonunit)|Pass; none|
|2.13|p=3,a=2|underlying unit series 2+T=f₂|Pass; none|
|2.14|a=2|Δf₂=(1+T)/(2+T)=1/2+T/4+…|Pass; none|
|2.15|a=2|Δf₂=1−1/(2+T)=1−F₂|Pass; none|
|2.16|integer a=−1|∂Y⁻¹=−Y⁻¹=aY^a|Pass; none|
|2.17|f=Y,a=−1|Δ(f(Y⁻¹−1))=−1=−Δf(Y⁻¹−1)|Pass; none|
|2.18|a=−1|f₋₁=−Y⁻¹; T f₋₁=Y⁻¹−1|Pass; none|
|2.19|a=−3|f₋₃=−3+6T+…; constant −3|Pass; none|
|2.20|R=ℤ₃,a=−1,−3|constants −1 unit,−3 nonunit|Pass; none|
|2.21|a=−3 over ℚ|Δf₋₃=Δf₃−3=−2+(2/3)T+…|Pass; none|
|2.22|a=2,R=ℤ₃→𝔽₃|cleared TF₂f₂=f₂−2=T on both sides|Pass; none|
|2.23|a=−1|F₋₁=−1; (a−1)−F₋₁=−1=Δf₋₁|Pass; none|
|2.24|p=3,a=1/2|Y^a=1+T/2−T²/8+…; ∂ coefficient T=1/4=a·a|Pass; none|
|2.25|p=3,f=Y,a=1/2|Δ(Y^(1/2))=1/2=aΔY|Pass; none|
|2.26|p=2,f=Y|τΔf=τ1=2=2Δ(NY)|Pass; none|
|2.27|p=2,f=Y|Δ(NY)=Δ(−Y)=1=ψ(ΔY)|Pass; none|
|2.28|p=2,f=−Y|Nf=f; ψΔf=ψ1=1=Δf|Pass; none|
|2.29|p=3,f=Y|restricted Δ gives 1; product Y² gives 2|Pass; none|
|2.30|p=3,f_m=Y^(3^m)|Δf_m=3^m→0=Δ1|Pass; none|
|2.31|p=2,F=1|boundary 1−Φ1=0; τ0=0|Pass; none|
|2.32|p=3,a=2,n=0|(ρ₁²)³=ρ₀²; relative polynomial X³−ρ₀²|Pass; none|
|2.33|p=2,a=3,n=0|N(i³−1)=2=−(ρ₀³−1)|Pass; none|
|2.34|p=2,a=3|f₃(i)=i,N(i)=1=f₃(−1)|Pass; none|
|2.35|p=2,a=3|N(1+Y+Y²)=1+Y+Y²; root product=1+Y²+Y⁴|Pass; none|
|2.36|p=3,a=2,3|level-zero values 1+ζ₃(unit),1+ζ₃+ζ₃²=0(nonunit)|Pass; none|
|2.37|p=3,c(2)|raw second moment −1/2; identity tower gives 0|Pass; none|
|2.38|p=3,Tate exponents 3^m|raw images all 0→0|Pass; none|
|2.39|p=3,c(2)|normalized second moment +1/2=−(−1/2)|Pass; none|
|2.40|p=3,a=2|2Col₀(c₂)(x²)=−1,2λ₂(x²)=1; Col=−Col₀ gives +1|Pass; none|
|2.41|p=3,a=2,F=Y|evaluated dilation ρ_n²=σ₂(ρ_n)|Pass; none|
|2.42|p=3,u=root tower,a=2|Col(σ₂u)=Y²=Col(u)(Y²−1)|Pass; none|
|2.43|principal u,p=3|Col(u²)=2Col(u); Tate u gives 0=2·0|Pass; none|
|2.44|dilation a=−1|Δ contributes −1,inverse weighting contributes −1; product +1|Pass; none|
|2.45|p=3,Tate t(1)|normalized principal module map value 0; t(2) also 0|Pass; none|
|3.1|p=3,f=−1|Nf=−1,Δf=0; (−1)²=1 but (−1)³≠1|Pass; none|
|3.2|p=2,F=T,k=0,1,2|iterates T,2T+T²,4T+6T²+4T³+T⁴|Pass; none|
|3.3|p=2,F=T|linear coefficients 2^n→0; constant input 1 stays 1|Pass; none|
|3.4|p=2,F=T|linear sum Σ2^n=−1 in ℤ₂; terms→0|Pass; none|
|3.5|p=2,F=T|Frobenius sum starts −T+(1/3)T²; zero input gives 0|Pass; none|
|3.6|p=2,F=T|partial linear sums 2^N−1→−1|Pass; none|
|3.7|p=2,F=T|sum h starts −T+T²/3; h−Φh has coefficients 1,0 as T|Pass; none|
|3.8|p=2,g=Y−Y³|ψg=0; sum fixed; first coefficients 2,1/3|Pass; none|
|3.9|p=2,F=T²|first nonzero coefficient after Φ is 4=2²,not 2|Pass; none|
|3.10|p=2,F=T²|ΦF≠F (4≠1); constant 3 fixed|Pass; none|
|3.11|p=3,F=2|ψF=2,boundary 0; T not fixed by ψ (−1≠T)|Pass; none|
|3.12|p=2,g=0,Y|zero has preimage 0; Y has τY=0,constant 1,so no preimage|Pass; none|
|3.13|p=2,g=3Y|ψg=0,g[0]=3; every scalar reached by cY|Pass; none|
|3.14|p=3|constants 3^m map to 0; cY endpoint c; 3^m→0 preserved|Pass; none|
|3.15|p=3|N-fixed units have closed norm equation; constant −1 in,2 out|Pass; none|
|3.16|p=3,f_m=Y^(3^m)|Δf_m=3^m→0=Δ1|Pass; none|
|3.17|p=3,F=3|ψF=F; quotient 1 also fixed|Pass; none|
|3.18|f_n=F+p^nT^n|coefficient error p^nδ_jn,norm≤p^(−n)→0|Pass; none|
|3.19|p=3,u=v=Y,F=0,k=0|Δ(uv⁻¹)=0; wrong positive correction gives Δ(Y²)=2≠0 mod3|Pass; none|
|3.20|p=2,3,F=1,n=0,1,2|choose−Y at2,Y at3; Δ=1; residual error0∈(p^n) at each n|Pass; none|
|3.21|p=3,F=1|actual image ΔY=1; residual and integral errors 0|Pass; none|
|3.22|p=3,residue unit −1|integral fixed lift −1; reduction 2=2|Pass; none|
|3.23|p=2,F=1|ψ-fixed 1 reduces to ΔY=1; lift −Y has N-fixedness|Pass; none|
|3.24|p=3,u=Y|Δu=1,ψ₀1=1; u=1−T³ gives Δ=0|Pass; none|
|3.25|p=3,a=T|h=T+T³+T⁹+…; a−h=−T³−T⁹−…=T³H(T³)|Pass; none|
|3.26|𝔽₃,m=1,a=2|η coefficients n=1,2,3 are 1,2,1=−2,−4,−8 mod3|Pass; none|
|3.27|𝔽₃,m=1,a=2|η₁=η₃=1,η₂=η₆=2; m=3 gives zeros|Pass; none|
|3.28|𝔽₃,m=1,h₁=1|a=−1=2; −ma=1 cancels h₁; m=3 forces h₃=0|Pass; none|
|3.29|𝔽₃,h=η(1−T)|a₁=1,others0; u₀=1,u_N=1−T for N≥1; η coefficients2,2,2 agree with h|Pass; none|
|3.30|𝔽₃,a₁=2,a₂=1,others0|product 1+T+2T²+2T³; constant 1|Pass; none|
|3.31|𝔽₃,u=1+T²,v=1,N=1|η agrees in degrees 0,1:0,0; Δ differs at degree 1:2≠0|Pass; none|
|3.32|𝔽₃,u=1−2T|h₀=0,h₁,h₂,h₃=1,2,1; u(1+T³) has same η,so uniqueness false|Pass; none|
|3.33|𝔽₃,g=YT²|u=1,H=1 gives 0+YT²·1=g|Pass; none|
|3.34|𝔽₃,g=1|ψ₀g=1,ΔY=1; remainder YT² has ψ₀=Y≠YT²|Pass; none|
|3.35|p=2,g=1|f=−Y has Nf=f,Δf=1; p=3 uses f=Y|Pass; none|
|3.36|p=3,a=0,1,2|norm-fixed binomial units 1,Y,Y²|Pass; none|
|3.37|p=3,a=1/2|Δ(Y^a)=1/2; a=0 gives 0|Pass; none|
|3.38|μ=δ₁−δ₋₁|first moment 2,augmentation 0|Pass; none|
|3.39|μ=cδ₁|first moment c·1=c; c=0 gives 0|Pass; none|
|3.40|p=3,a=3|Y³ evaluations at n=0,1 are 1,ρ₀|Pass; none|
|3.41|p=3|Teich −1 and Tate Y have Coleman value 0; Δ values 0,1|Pass; none|
|3.42|μ=δ₋₁|weighting by x sends μ↦−μ; mass −1=first moment μ|Pass; none|
|3.43|p=3,μ=δ₁+δ₋₁ and δ₁−δ₋₁|first moments0,2; masses2,0; only first is in image; normalized Col(c₂)(x²)=1/2|Pass; none|
|3.44|p=3|Tate t(1) maps to 0; endpoint δ₁↦1; mass differs on δ₁+δ₋₁|Pass; none|
|3.45|p=3|principal kernel contains Tate t(1); Teich −1 residue 2 excludes it|Pass; none|
|3.46|p=3|t(1)↦0; first moment δ₁=1; composite value on kernel 0|Pass; none|
|3.47|A=ℤ₃×ℤ₃|tensor Tate endpoint has two copies,rank 2; A=𝔽₃ excluded (not flat)|Pass; none|
|4.1|p=3,n=0|global ζ₃ maps to selected ρ₀,not ρ₀⁻¹|Pass; none|
|4.2|p=3,a=2|c₂ maps to 1+ρ₀; a=3 gives 0,excluded|Pass; none|
|4.3|p=3,n=0|−1 fixed by conjugation; ρ₀ not fixed (ρ₀≠ρ₀⁻¹)|Pass; none|
|4.4|p=3,n=0|global −1 and ρ₀ belong to local closure; 0 not unit|Pass; none|
|4.5|p=3,n=0|real closure contains −1; excludes ρ₀|Pass; none|
|4.6|p=3,n=0|ρ₀ principal; −1 residue 2 excluded|Pass; none|
|4.7|p=3,n=0|real principal intersection {1}; −1 and ρ₀ excluded for different reasons|Pass; none|
|4.8|r=0; additive ℤ₃,g=3|empty product1=identity span; closure(3ℤ)=3ℤ₃=3·ℤ₃; 1 lies in neither side|Pass; none|
|4.9|p=3,a=2,n=0|phase ρ₀¹c₂=−1,real; raw c₂ not real|Pass; none|
|4.10|p=3|norm of root ρ₁=ρ₀; norm of −1=−1; principal roots stay principal|Pass; none|
|4.11|p=3,a=2,n=0|real generator −1 has residue 2=a mod3|Pass; none|
|4.12|p=3,a=2,n=0|q=ω(2)⁻¹(−1)=1; unadjusted −1 not principal|Pass; none|
|4.13|p=5,a=2|q⁴=γ⁴ global principal; q² satisfies x²+3x+1=0,not q=1|Pass; none|
|4.14|p=3,a=2|Nq₁=q₀=1; phase exponent uses 1/2 mod9,not natural subtraction|Pass; none|
|4.15|p=3,n=0|real principal cyclic group {1},generator q₀=1|Pass; none|
|4.16|p=3,Tate and constant towers|ρ_n∈C_(n,1),residue1 at all n; stationary−1 has residue2 and is excluded|Pass; none|
|4.17|p=3,C₂→1|e⁺↦1,e⁻↦0; 3e⁺+2e⁻↦3,inverse↦1/3; e⁻ is forbidden denominator|Pass; none|
|4.18|p=3,a=2|q₀=1,residue1,conjugation-fixed; Tate coordinate ρ₀≠ρ₀⁻¹ excluded|Pass; none|
|4.19|generator q,coefficient 0|each fiber for identity contains 0; compatible intersection nonempty|Pass; none|
|4.20|p=3,n=0|coefficient map sends every scalar to q₀^a=1; cyclic span {1}|Pass; none|
|4.21|p=3,n=0|full local cyclotomic group μ₆=μ₃×{±1}; principal group μ₃×{1}|Pass; none|
|4.22|p=3|Tate exponent 0 gives identity,exponent 3 gives coordinates 1,ρ₀; units-only parameter loses 0,3|Pass; none|
|4.23|p=3|plus projector kills Tate: (1+(−1))/2=0; principal identity maps to 0|Pass; none|
|4.24|p=3,a=2|normalized second moment on c₂ is 1/2; removing Tate/Teich factors leaves same value on q₂|Pass; none|
|4.25|G=C₂,a=c|δ_c−1 spans augmentation; identity a=1 gives zero,not full augmentation|Pass; none|
|4.26|p=3,a=2|Col(q₂)(x²)=λ₂(x²)=1/2; Tate image0; generated image isΛλ₂=Iζ|Pass; none|
|4.27|p=3,a=1|numerator ([1]−1)ζ⁺=0; e⁺λ₂ maps to quotient numerator|Pass; none|
|4.28|p=3|Tate killed already in cyclotomic quotient; endpoint δ₁ has moment1|Pass; none|
|4.29|u=1,q(2); p=3,Tate τ|classes[1]=[q(2)]=0; τ₀=ρ₀≠ρ₀⁻¹ so τ is not a real representative|Pass; review example corrected|
|4.30|class of q(2),p=3|unit class0 maps to measure class[λ₂]=0; λ₂(x²)=1/2 before taking the quotient|Pass; none|
|4.31|A=ℤ₃×ℤ₃|quotient transport gives (U/C)²; nonflat 𝔽₃ excluded|Pass; none|
|Lean scalarAlgebra|p=0,1,2; R arbitrary|Φ₀(F)=C(F[0]); Φ₁(F)=F; Φ₂(T)=2T+T²; zero ring gives0=1|Pass; none|
|Lean correctedNorm|O=ℤ₂,σ=id|N(Y)=−Y, M(−Y)=−Y; c=3 givesM(c)=9|Pass; none|
|Lean correctedNorm_limit|p=3,c=2; p=2,Y|iterates2,8,512,limit−1; errors−3,−9,−513 have v₃=1,2,3; L(Y)=−Y,error−2Y then0|Pass; none|
|Lean logDeriv|R=ℤ,𝔽₃,zero ring|ΔY=1,ΔY⁻¹=−1; in𝔽₃ Δ(1+T³)=0; zero ring0=1|Pass; none|
|Lean normFixedLogDeriv_surjective|p=2,g=1|τ1=2=2g; f=−Y satisfiesNf=f andΔf=1|Pass; none|
|Lean psiFixedBoundary_range|p=2,g=Y orY−Y³|bothτg=0; constants1,0; first has no preimage; second has preimage beginning2T+T²/3|Pass; none|
|Shared smoothing ownership|a=1,2; p=2,a=3|f₁=1,F₁=0; f₂=2+T,(2+T)F₂=1; F₃(0)=1; both contracts identical|Pass; previous R01 closed|

## Not verifiable

- **Coleman**, *Division Values in Local Fields*, DOI 10.1007/BF01390028: the source service returned `uncertified` after its DOI/publisher lookup. The original Theorem A pp.91–92, trace/norm results pp.98–103 and projector/interpolation results pp.104–106 were not read. In particular the sampled §1.95 locator, equation (2) and Lemma 13 p.103, is not certified against Coleman. Its formula was independently checked in SharifiNotes Corollary 5.4.7 and by the computations above.
- **CoatesSujatha**, *Cyclotomic Fields and Zeta Values* (2006): the title/publisher lookup returned `uncertified`. The cited §§2.1–2.4 pp.13–26, and the README's proposed corrections to that book, are not certified here.
- The external Lean source was inspected at the named revision but was not compiled or audited as a complete proof development. Its native-carrier and coefficient-extension ports remain roadmap work, as the README explicitly states.

No missing-source approval is requested. The successful publisher/author fetches resolved the transient lookup failures; no manifest was edited. The two paywalled works retain their uncertified status. These limitations are not being counted as proof of the corresponding source claims.

## Source issues

- **Error** in RJW at §9 after equation (9-3), printed p.163 (RJW lines 2772–2777): the source says all four unit limits are compact ℤ_p-modules; it should be only the principal limits, with prime-to-p residue torsion split off the full limits; affects a stated result.
- **Gap** in RJW at proof of Lemma 10.8, printed p.167 (RJW lines 2921–2929): the source says root translations act on the original integral series ring; it should be a construction after coefficient extension, followed by justified convergence and descent; affects the proof.
- **Misprint** in RJW at proof of Lemma 10.11(iii), printed p.168 (RJW lines 2971–2983): the source says the congruence ideals lie in ℤ_p[[T]] despite containing the cyclotomic uniformizer; it should be the extended integer-ring series ideal followed by coefficientwise intersection; affects the proof.
- **Misprint** in RJW at proof of Proposition 4.4, printed p.137 (RJW line 1647): the source says the geometric tail has positive overall sign; it should be its negative, giving F₃(0)=1 rather than −1; affects the proof.
- **Error** in RJW at §10.2 after Lemma 10.3, printed p.165 (RJW lines 2846,2861–2862): the source says the series is polynomial for every integer parameter prime to p; it should be polynomial for positive parameters, with f₋₁=−(1+T)⁻¹ an infinite series; affects a stated result.
- **Error** in RJW at Theorem 10.15, printed p.170 (RJW lines 3038–3050): the source says its displayed raw Coleman composite gives the positive pseudomeasure numerator; it should be the negative numerator, or the composite must be negated; affects a stated result.
- **Misprint** in RJW at proof of Lemma 12.21, printed p.187 (RJW line 3758): the source says the real generator has phase a/2; it should be phase (1−a)/2, giving γ(1)=1; affects the proof.
- **Error** in RJW at proof of Lemma 12.22, printed p.188 (RJW line 3778): the source says multiplying the full and principal discrete real groups by p−1 gives equal subgroups; it should be equality of their p-adic closures after the prime-to-p scalar is inverted; affects the proof.
- **Misprint** in SharifiNotes at proof of Lemma 5.4.5, printed p.144 (SharifiNotes line 4599): the source says the leading substituted term is detected modulo T^(k+1); it should be modulo T^(pk+1), so that the displayed T^(pk) coefficient survives; affects the proof.
- **Gap** in SharifiNotes at §5.4 before Proposition 5.4.6, printed p.144 (SharifiNotes lines 4601–4602): the source says the ramified infinite compositum has a unique Frobenius lift; it should be the lift fixing the chosen cyclotomic roots, since inertia gives other lifts; affects the proof.
- **Misprint** in SharifiNotes at proof of Proposition 5.4.6, printed p.144 (SharifiNotes lines 4608–4612): the source says the norm product starts at exponent one; it should be exponents zero through p−1, giving c^p rather than c^(p−1) on constants; affects the proof.
- **Misprint** in SharifiNotes at proof of Proposition 5.4.6, printed p.145 (SharifiNotes line 4616): the source says the final residue substitution leaves coefficients unchanged; it should be Φ(Σf), retaining arithmetic coefficient Frobenius; affects the proof.
- **Error** in SharifiNotes at Theorem 5.4.9 and Definition 5.4.12, printed pp.145–146 (SharifiNotes lines 4628–4631,4666–4667): the source says level n uses a root of order p^n although E_n contains μ_(p^(n+1)); it should be evaluation at the chosen root of order p^(n+1) minus one throughout; affects a stated result.
- **Error** in SharifiNotes at §6.1 opening, printed p.157 (SharifiNotes lines 5007–5014): the source says the coefficient integers are rank one over the full decomposition-group ring; it should be the unramified coefficient-field decomposition group, excluding cyclotomic inertia; affects a stated result.
- **Error** in SharifiNotes at §6.1 opening, printed p.157 (SharifiNotes lines 5013–5014): the source says the element supported at one place with value one is a normal-basis generator; it should be a local integral normal-basis element, whose conjugates span the residue-degree-many coefficients; affects a stated result.
