# Review of CompletedCohomologyAndLocalGlobalCompatibilityPartII (pull request #2262 at 1a53e38)

**Verdict:** needs changes

## R01 (P2) — Two gaps ask SmoothRepresentationsOfLocalGroups for Langlands-parameter statements it cannot own

**Location:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` lines 116 and 120: "occurrence in an irreducible smooth π exactly when WD(π) has inertia τ and N=0" and "which for tame E/F is equivalent to the Langlands parameter of π being `Ind_{W_E}^{W_F}ψ`".

**Claim:** Both clauses are statements about the local Langlands correspondence for GL_d(F). The named supplier section, SmoothRepresentationsOfLocalGroups §SR.5.2, has no correspondence π ↦ WD(π); supplying one there would make it depend on a later roadmap. `gap:minimal-stratum-types` is also compound: type theory plus a Langlands comparison with a different owner.

**Witness:** SmoothRepresentationsOfLocalGroups README line 548: "Local Langlands for tori is an input stated where used"; the GL_n correspondence is EndoscopicTransferAndUnitaryTraceComparison §§10.26–10.30, later in the merge order, whose README line 20 consumes §SR.5.2's raw Weil–Deligne fields.

**Repair:** Move `gap:crystalline-inertial-types` to the subsection "From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison" with "Supplier section: §10.30" (same `needs`, with WD(π) written `rec_p(π)`), and change its supplier in the plan's `gaps`. In `gap:minimal-stratum-types` end the sentence at "a multiple of θ". Add, in the same subsection and in the plan: "What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:tame-induced-parameters): For a tamely ramified degree-d extension E/F and the data (α, θ) of gap:minimal-stratum-types, an irreducible smooth π is isomorphic to `c-Ind_{E^×J^0(α)}^G Λ` with Λ restricting to a multiple of θ on `H^{m+1}(α)` exactly when its Langlands parameter is `Ind_{W_E}^{W_F}ψ` with `ψ|U_E^{m+1}=θ|U_E^{m+1}`. Supplier section: §10.30. EP Proposition 3.19, second part, p. 356 (EP lines 828–831, 843)." Add the new gap to the *Needs:* lines of §§5.4, 6.4 and 6.5, and EndoscopicTransferAndUnitaryTraceComparison §10.30 to those of §§6.2 and 6.3. EndoscopicTransferAndUnitaryTraceComparison is after SmoothRepresentationsOfLocalGroups and before this roadmap, so no upward edge results.

## R02 (P3) — Three EP page locators

**Location:** README lines 271, 446, 461, 564, 602 ("Theorem 5.3, pp. 364–365"); line 540 ("§5.3, p. 364"); line 120 ("Lemma 3.18 and Proposition 3.19, p. 356").

**Claim:** The pages do not match the published text.

**Witness:** EP line 1202 (Theorem 5.3) and its proof, lines 1204–1209, follow the page marker of p. 365 (EP line 1196). EP §5.3 starts at line 1084 (p. 362); its supercuspidal set and tame remark are lines 1116–1125 (p. 363). Lemma 3.18 is stated at EP line 816 (p. 355).

**Repair:** Write "Theorem 5.3 and proof, p. 365" (with "§5.4, pp. 364–365" where the set-up is meant); in §6.4 write "§5.3, pp. 362–363 (EP lines 1116–1125), and §5.4, p. 364 (EP lines 1185–1190)"; in line 120 write "Lemma 3.18, pp. 355–356, and Proposition 3.19, p. 356".

## R03 (P3) — "acts trivially" in the §3.2 API means "annihilates"

**Location:** README line 280: "A scalar a acts trivially on the testing module exactly when precomposition by a kills every continuous H-map M∞→V*."

**Claim:** As written the equivalence is false: acting trivially is acting as the identity.

**Witness:** Model M=O[[H]], Θ=O with trivial action, a=1: the testing module is O and 1 acts on it as the identity, while precomposition by 1 does not kill the augmentation map.

**Repair:** "A scalar a annihilates the rational testing module M∞,H(V) exactly when precomposition by a kills every continuous H-map M∞→V*." On the instance: a=1 annihilates neither side; a=0 annihilates both.

## R04 (P3) — A Mathlib declaration used in §3.1 is missing from the contract and the *Needs:* line

**Location:** README line 255: "Algebraically the same calculation uses Mathlib `Submodule.mem_iInf`, `LinearMap.mem_ker` and `Module.annihilator_eq_bot`".

**Claim:** `Submodule.mem_iInf` is named in the route but is absent from "From Mathlib" (lines 37–41) and from the *Needs:* line of §3.1 (line 267) and the Layer 3 Dependencies.

**Witness:** At the pin, `Submodule.mem_iInf` is `Mathlib/Algebra/Module/Submodule/Lattice.lean`, line 238; `grep mem_iInf` on the README returns line 255 only.

**Repair:** Add to "From Mathlib": "`Submodule.mem_iInf` in `Mathlib/Algebra/Module/Submodule/Lattice.lean`, line 238, membership in an intersection of submodules, used for the common kernel in §3.1"; add "Mathlib `Submodule.mem_iInf`, `LinearMap.mem_ker`" to the *Needs:* line of §3.1 and to the Layer 3 Dependencies.

## R05 (P3) — The description speaks of Lean declarations and a `sorry` warning that the head does not have

**Location:** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** `Suggested.lean` at this head declares nothing, so there is no `sorry` and no warning.

**Witness:** `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean` lines 44–46: an empty namespace; elaboration prints no warning.

**Repair:** "`Suggested.lean` states no declaration: none of the seven headline theorems is statable at the pins, and its module docstring names each with the carrier it lacks." and "the targeted Lake build succeeds with no warning". The description should also say that the README declares 17 supplier gaps (18 after R01), by supplier.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.1 point sets, weight dictionary | d=2, k=(2,0) and (1,0); d=1 | a=(1,0), highest weight (0,−1); a=(0,0); CEGGPS line 532 gives ξ_i=−a_{n+1−i}; d=1: three sets equal | agrees |
| §1.2 lift input | p=d=3 | 2d=6, 3 divides 6: patched theorems excluded, §5.2 local route applies; EG lines 6961–6965 give the lift | agrees |
| §2.1 components | A=O[[x]]/(x²−ϖ), A=O[[u,v]]/(uv) | after a²=ϖ: (x−a)(x+a), 2 primes, also for p=2; second ring 2 primes; BIP lines 2343–2345 | agrees |
| §2.2 central character | d=2, F=ℚ_5, u=2; d=1, ψ(Art 5)=[2] | δ(2)=ε(Art_geom 2)=2, compact action 1/2; [2][3]=[6]=[1]; ClassFieldTheory C.6: χ_cyc(Art_arith u)=u⁻¹ | agrees with BIP line 2397 |
| §3.1 capture, endomorphisms | H=1, M=O⊕O/ϖ; W=0 | φ(a,b)=(0,ā)≠0 with f∘φ=0; W=0 gives common kernel O | hypotheses needed, stated |
| §3.2 testing modules | M=O[[K]], n=2, r=1; M=O/ϖ; a=1 | both Hom spaces of dimension 2; test 0, balanced tensor O/ϖ (torsion-free M needed, M∞ projective); a=1 refutes API bullet | R03 |
| §3.3 minimal-stratum growth | E=ℚ_5(√5); j≡1 mod e(q_E−1) | gcd(2,n)=2 at even n: no classes; j≡1 mod 8: v(α^j)=jv, residue x^j=x; gaps bounded | agrees; EP Prop. 3.25 does not |
| §3.4 fixed-centre density | H=ℤ_5^×, δ(z)=z; 𝔾_m, V=zⁿ | Cδ = line of h⁻¹, (2·f)(h)=2f(h); φ(v)(h)=ℓ(h⁻ⁿv) equivariant, hⁿ not | agrees with DPS lines 1983–1997 |
| §3.5 algebraic detection | d=2, exponents 1 and −1 | (1,0) sum 1; det powers even; (0,−1) dominant, sum −1 | agrees with BIP lines 2432–2446 |
| §4.1 component detection | R=O[[u]], A=O[[x]]/(x(x−ϖ)) | dim R∞/(x)=2=2+1−1; prime (x,u): dim 1, contraction (u) not minimal | agrees; BIP line 2458 containment not used |
| §4.2 local faithfulness (headline) | B=O[[x]]/(x²) | intersection of minimal primes (x)≠0; reducedness from BIP line 2020 | agrees, given gaps |
| §5.1 testing density | B=O[[x]]/(ϖx); B=O[[x]]/(x²); B=0 | first reduced since (ϖ)∩(x)=(ϖx), x≠0, x=0 in B[1/p]; second: x zero at every point | both hypotheses needed, stated |
| §5.2 crystalline density (headline) | p=2, d=1, F=ℚ_2 | x↦xⁿ at −1 is (−1)ⁿ: both components met; R[1/p]=∏_χ (BIPD lines 332–339) | agrees with BIPD lines 349–354, 454–461 |
| §5.3 crystabelline density (headline) | growth; inflated Steinberg of GL_2(k_F) | q^{nd(d−1)}·q^{nd}=q^{nd²} (EP lines 743–745); π^{K(1)}=1⊕St and Steinberg both contain it | agrees; N=0 clause correctly restricted |
| §5.4 supercuspidal density (headline) | ρ irreducible, ρ′ with same inertia; ψ=χ∘N | ρ restricted to I multiplicity-free, N scalar on each summand, nilpotent, so 0; χ⊕χη reducible | agrees |
| §6.1 benign density (headline) | d=2, f=1, eigenvalues 1, p | ratio p=p^f excluded (EP line 1325); complement of closed set is admissible open | agrees |
| §6.2 type tests | W=0; μ_p∞(F) of order p^a | Ann(0)=R, V(R)=∅; n mod p^a gives all p^a characters | agrees; supplier of σ(τ): R01 |
| §6.3 typed density (headline) | σ(τ)≠0 | CEGGPS lines 1651–1655; Jτ=Ann_R M∞=0 by capture and §4.2 | agrees, given gaps; R01 |
| §6.4 minimal-stratum points | 𝔽₂₅, e=6; F=ℚ_3(ζ_3), d=1 | sixth powers: order 24/6=4, equal 𝔽₅^×; ζ_3=1−ϖ in U¹∖U², so m≥1, n≥3 | agrees; R01, R02 |
| §6.5 minimal-stratum density (headline) | ℚ_5(√5); degree 12 over ℚ_5 | e=2, uniformizer minimal, 5∤4; 5∤24 but no minimal element | agrees; R01 |
| Conventions, rigid density | A=O[[x]]/(x²) | one point; x vanishes there, x≠0: function form fails, closed-set form holds | agrees |
| gap:crystalline-lift-prescribed-determinant | p divides d | X^d=η, η≡1: roots reduce to d′-th roots of unity, one reduces to 1 | no restriction on p, as stated |

- Source locators checked against the text: 71 (BIP 16, EP 24, CEGGPS 10, DPS 4, BIPD 8, IYE 4, EG 3, HP 2, and NAK, DEJ, CON, AB, ST); 3 wrong (R02).
- Library declarations opened at the pin: 15 Mathlib (the fourteen of "From Mathlib" at the stated files and lines, and `Submodule.mem_iInf`), 2 Tau Ceti (`TauCeti.completedGroupAlgebra`, `Basic.lean` line 145; `TauCeti.IsCompactModule.completedGroupAlgebraModule`, `Module.lean` line 322).
- Cross-roadmap citations resolved: 48 section citations in 16 roadmaps, on main or at the open heads; all headings exist (ClassFieldTheory §2.6 through its correspondence table, to Conventions C.6).
- Gate: every check passed. Dependency check: `depcheck: 213 roadmaps, 1891 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: no error, no warning; it declares nothing, so there was nothing for `#check` or the one-tactic probe. No carrier for a framed deformation ring, crystalline representation or Weil–Deligne representation exists at the pins: no headline is statable, and the docstring names all seven.
- Declared gaps: 17, each with the same slug in the README and the plan; two have the wrong owner for part of their content (R01).
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, HilbertModularVarietiesAndShimuraCurvesPartII, PotentialAutomorphyInfrastructurePartII, CompletedCohomologyPartII; shared: benign crystalline density, owned for d=2 and F=ℚ_p by PadicLocalLanglandsForGL2Qp §3.6a and for general F, d here; M∞, capture and benign loci owned by the parent §§5.1–5.3.
- Source independence: 36 passages compared with 12 sources, none reproduced (longest shared run 5 words); largest share EP, 78 of 242 locator mentions; contents compared with EP: independent (EP §§2–3 are spread over §§3.1, 3.3 and 5.1, between material of BIP and DPS).

## Not verifiable

- EP lines 883 and 899: the cached extraction prints "≥" and ">" alike, so "n>2m" against "n≥2m" could not be read; the README's strict inequality is the safe one.

## Source issues

- **Error** in BIP at proof of Lemma 6.5, p. 48: the source says the constructed character, trivial on a uniformizer, agrees with κ modulo ϖ; it should be multiplied by the unramified Teichmüller character of κ̄ at the uniformizer; affects the proof.
- **Gap** in BIP at proof of Theorem 6.8, p. 49: the source says the whole support of one algebraic test lies in a single component of the patched ring; it should be a component through one point of the fixed-determinant fibre; affects the proof.
- **Error** in EP at Proposition 3.25, p. 358: the source says the number of classes of depth n grows like q_E^n for all n; it should be for depths where a minimal element exists, zero elsewhere (n not prime to e); affects a stated result.
- **Misprint** in EP at Lemmas 2.6 and 2.9, pp. 343–344, and Corollary 3.2, p. 351: the source says W is any finite-dimensional representation; it should be nonzero, since the zero representation captures nothing nonzero; affects a stated result.
- **Misprint** in CEGGPS at the paragraph before Corollary 4.26, p. 70: the source says the centre acts by ξ on the compact specialisation and ξ⁻¹ on the smooth dual; it should be the reverse, by the transposition of §4.22 (BIP Lemma 6.6); affects nothing.

## For the human reviewers

- The README departs from its published sources at the five places listed under Source issues (README lines 56, 58, 120, 374, 591); a specialist may wish to confirm each correction.
