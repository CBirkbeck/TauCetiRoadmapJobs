# Review of CrystallineCohomology (pull request #857 at 5231bad)

**Verdict:** needs changes

## R01 (P3) — Two replacement formulas fail the TeX gate

**Location:** `TauCetiRoadmap/CrystallineCohomology/README.md:7293` and `:7562`: “the product formula Tr_{X×Y}=Tr_X⊗Tr_Y”.
**Claim:** Both replacements introduce TeX subscript syntax outside a code span.
**Witness:** The gate reports `tex=2`, identifying precisely these two lines; every other scanner and the dependency check passes.
**Repair:** At both locations, write “the product formula `Tr_{X×Y}=Tr_X⊗Tr_Y`”. The scratch replacement encloses both offending expressions and preserves the trace identity.

## R02 (P3) — State that the pull request adds a new roadmap

**Location:** PR #857 description, paragraph beginning “Roadmap folder `TauCetiRoadmap/CrystallineCohomology`” (`pull-request.md:24`).
**Claim:** Neither the title nor the description states whether this adds a roadmap or revises one on main.
**Witness:** `origin/main` contains no `TauCetiRoadmap/CrystallineCohomology` folder. The base-to-head diff adds three files, 11,777 lines and three Lean declarations, with no deletions.
**Repair:** Replace that paragraph with: “This pull request adds the new roadmap `TauCetiRoadmap/CrystallineCohomology`: README.md, Suggested.lean and metadata.toml. Suggested.lean states the Dieudonné–Manin block decomposition and monodromy nilpotence, with the supporting Φ–N structure; the README specifies the full development.”

## Previous findings

- R01 — repaired: README:11635 adds the six cited works through line 11646; the uncited Messing entry is gone.
- R02 — repaired: README:1695, 1696 and 1704 retain the three mathematical Checks without their Lean-style test labels.
- R03 — repaired: the affected references now use target titles, quotient projections, evaluation on D and the trace product identity; the formula formatting introduces this report’s R01.
- R04 — repaired: README:8111 gives p.4; README:10604 gives pp.244–246; README:2623 lists F0.6 and F0.7 once; README:2605 separates the formula’s code spans.

## Verified sound

🤖 Independent AI review using GPT-6; incremental re-review of 94 changed lines since `6ab379a`.

In the table, W means W(k); T is `[ℤ → ℤ]` with d=id, F₀=p and F₁=id; E is BLM’s free strict Dieudonné complex on x.

| Changed statement or reference | Instances tried | Left-side value | Right-side value | Result; change |
| --- | --- | --- | --- | --- |
| Unit evaluation / first Chern reference, README:838 | k[ε]/ε² → k; unit 1+ε | Reduction gives 1 | Restriction gives 1 | Equal; target title resolves |
| PD stratification Check, README:1389 | p=3, D=𝔽₃[t], f=t²; u=p₁(t) | ε(f⊗1)=(u+ξ)² | u²+2uξ+2ξ^[2]=(u+ξ)² | Equal; identity under both scalar identifications |
| Empty crystalline cohomology, README:1695 | X=∅ | RΓ=0 | Zero complex | Equal; label deleted |
| Point crystalline cohomology, README:1696 | k=𝔽₂, e=2 | H⁰=ℤ/4, Hⁱ=0 for i>0 | W₂(𝔽₂)=ℤ/4 in degree zero | Equal; label deleted |
| Derived-limit Check, README:1704 | p=2; η=Σ(e>0) 2ᵉx^(2ᵉ−1)dx | [η]≠0; primitive coefficients would all equal 1 | Modulo 8, η=2x dx+4x³dx=d(x²+x⁴); all finite-level classes vanish | Noninjectivity retained |
| Étale envelope reference, README:2001 | Identity étale map P→P | D after base change is D | P⊗ₚD=D | Equal; supplier target resolves |
| Smooth-ambient computation, README:2087 | X=Spec 𝔽₂ in Spec ℤ/4 | RΓ_crys=ℤ/4[0] | Envelope de Rham complex=ℤ/4[0] | Equal; both renamed references resolve |
| Embedding/Čech reference, README:2136 | Single identity cover of the point | Normalized positive Čech degrees=0 | Totalization=ℤ/4[0] | Reference preserves computation |
| Change of topology, README:2205 | Spec 𝔽₂ over ℤ/4, structure crystal | Zariski cohomology=ℤ/4[0] | Étale cohomology=ℤ/4[0] | Equal; title resolves |
| Filtered ambient reference, README:2515 | J=0; m=1, form degree 0 | F¹Ω⁰=0 | J^[1]Ω⁰=0 | Equal; title resolves |
| Formal comparison Check, README:2605 | ℙ¹ over W(𝔽₂) | Crystalline H⁰,H¹,H²=(ℤ₂,0,ℤ₂) | Lift’s de Rham H⁰,H¹,H²=(ℤ₂,0,ℤ₂) | Equal; code spans repaired |
| Hypercover proof references, README:2711 | Identity hypercover of a point | RΓ=W[0] | Normalized cosimplicial totalization=W[0] | Equal; topology target resolves |
| Leray curve reference, README:3339 | E₀×Spec k→Spec k | H¹_crys(E₀)=W² | Only degree-zero base column contributes W² | Reference preserves rank two |
| Proper smooth tests reference, README:3482 | E/𝔽₂: y²+y=x³ | #E(𝔽₂)=3, a₂=0 | Frobenius polynomial T²+2; determinant 2 | Rank-two reference resolves |
| Dieudonné/α inverse, README:3715 | p=2; ℤ in degree −1; F=id | α_F(1)=1/2 | 2·α_F(1)=1=F(1) | Inverse recovered, including negative degree |
| Morphisms form DC, README:3931 | ℤ in degree zero, F=id; f=×3, g=×2 | (g∘f)(1)=6; id(1)=1 | g(f(1))=6; F(1)=1 | Composition and identity retained |
| Derived décalage proof reference, README:4070 | p=2; K=[ℤ --4→ ℤ] | H¹(E₂K)=ℤ/2 | (ℤ/4)/(ℤ/4)[2]=ℤ/2 | Equal; named input resolves |
| Finite quotient projection, README:4387 | M=ℤ[0], F=id; p=2, r=3 | N₃=8ℤ; W₃=ℤ/8 | Projection sends 9 to 1 | Carrier and map retained |
| Surjectivity, README:4406 | Same M; classes 0,…,7 | Image={0,…,7} | Codomain=ℤ/8 | Equal; every class represented |
| Zero classes, README:4421 | Same M; x=8 and x=1 | [8]=0 true; [1]=0 false | 8∈8ℤ true; 1∈8ℤ false | Both directions tested |
| Quotient differential, README:4438 | p=2, r=1, free E | d[x]=[dx], coefficient of dx=1 mod 2 | [d(x)]=[dx]≠0 | Equal; nonzero test |
| Projection cochain map, README:4454 | T; p=2, r=1 | N₁⁰=ℤ, N₁¹=2ℤ+ℤ=ℤ; W₁(T)=0 | Both dπ(1) and πd(1) equal 0 | dV contribution retained |
| Classical degree-zero universal property reference, README:5754 | R=𝔽₂; identity map at length 1 | W₁Ω⁰=𝔽₂; 1↦1 | Unique unital 𝔽₂→𝔽₂ sends 1↦1 | API reference retains its meaning |
| Saturated comparison reference, README:6342 | R=𝔽₂, lift B=ℤ₂ | Completed de Rham complex=ℤ₂[0] | WsatΩ_R=ℤ₂[0] | Equal; universal target resolves |
| Trace product, README:7293 | X=Y=ℙ¹; h₁h₂ | Tr_(X×Y)(h₁h₂)=1; ε₂=−1 | Tr_X(h)Tr_Y(h)=1; (−1)ε₁ε₁=−1 | Mathematics agrees; R01 formatting |
| Diagonal’s product-trace reference, README:7562 | X=ℙ¹; [Δ]=h₁+h₂ | pr₂,*([Δ])=1; pr₂,*([Δ]h₁)=h₂ | Identity sends 1↦1 and h↦h | Mathematics agrees; R01 formatting |
| Log regularity locator, README:8111 | Standard toric boundary on 𝔸² at origin | dim O=2; quotient by (x,y) has dimension 0 | 0+rank ℤ²=2 | Equal; Proposition 2.6 starts on p.4 |
| Log crystal evaluation, README:9042 | Relative identity log point, structure crystal | F_D=k; ∇=0 | Module k, relative Ω¹=0 | Evaluation wording retains the object |
| Log PD Poincaré proof, README:9108 | Relative identity log point | Ru_*O=k[0] | Log de Rham complex=k[0] | Equal; same coefficient evaluation |
| Good reduction locator, README:10604 | X=Spec O_K with pulled-back log structure | HK=W[0]; N=0 | exp(log(u)N)=1; comparison unchanged | Equal; §3.5 begins on p.244 |

The adversarial rows for untouched statements stand as in the previous review of `6ab379a`.

- Two corrected locators verified: Niziol line 143, Proposition 2.6, p.4; HyodoKato line 745, §3.5, p.244, continuing through §3.6, pp.245–246.
- Seven further locator groups read: StacksCrys lines 1433–1540 and 2032–2077; BLM lines 456–479, 675–715 and 732–767; Beilinson lines 487–498 and 499–544; these cover the changed seeded PD-stratification, Dieudonné-morphism and log-Poincaré passages.
- Six bibliography additions checked against their in-text citations; five titles verified in fetched texts: IllusieErrata line 5, IllusieRaynaud line 8, ChatzistamatiouRulling line 6, Berner line 6, Kedlaya line 6; CTSS remains locator-only.
- Three quotient declarations opened at the pin: `Mathlib/LinearAlgebra/Quotient/Defs.lean:98` and `:236`, `Mathlib/LinearAlgebra/Quotient/Basic.lean:174`; the quotient facts remain README API, not Lean padding.
- Ten replacement local target titles resolve; five relevant DerivedDeRhamCohomology targets (§§PD.5–PD.6, 2.27) and AdicSpacesPartIII §§F0.6–F0.7 resolve; the described downstream moves resolve to §A4.CR.7.2 and §0.CR.6.6.
- Three scratch `#check @` signatures elaborated and matched the README with no lost binders; direct elaboration and targeted module build pass, with exactly two `sorry` warnings each.
- Gate rerun: `tex=2`, all other reported counters zero, `FAIL`; targeted build separately passes. Dependency output: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Zero changed files outside the folder; zero layer or Lean declaration changes since `6ab379a`; title, description prose and `roadmap-summary` checked against the added-folder diff, with the omission in R02.

Overlap check: read DerivedDeRhamCohomology, PrismaticCohomologyPartIV, AInfCohomology, PrismaticCohomology, PrismaticCohomologyPartII, DerivedModuleAlgebra, EnhancedDerivedSheaves and PerfectoidSpaces scopes; PD/de Rham constructors belong to DerivedDeRhamCohomology, module completion to DerivedModuleAlgebra, enhanced descent to EnhancedDerivedSheaves, perfectoid coefficients to PerfectoidSpaces, and principal-p Dieudonné décalage/crystalline/log foundations here. AInf and the prismatic parts consume these foundations and own their respective extensions; no changed ownership conflict found.

Source independence: changed passages only; 12 passages compared with 5 sources, no copied expression or reused source material detected. Stacks Project has the largest share, 82 of 370 linked source citations before References. No layer was added, removed or reordered; the arrangement comparison was not reopened.

## Not verifiable

- CTSS: the DOI resolves to Project Euclid, but the sources service found no legal full-text PDF; the new bibliography entry is checked as a citation, not certification of §1, Lemme 2.
- Kato’s course-page copy remains unclassified as in the previous review; the changed log-evaluation and Poincaré wording was checked against Beilinson §§1.7–1.8 instead.

## Source issues

- none

## For the human reviewers

- Kato’s course-page copy has unresolved host classification; the amended passages at `TauCetiRoadmap/CrystallineCohomology/README.md:9042` and `:9108` retain Kato citations, with Beilinson as the independently read supporting source.
