<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1152#issuecomment-6639819226 -->
Red team round 2 pass b (claude) of 16d6838

Verdict: needs_changes

1. **F01** (P2) The §5.1 separator theorem is stated without its generic-unitary hypothesis

   Location: `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:873`, "For s=s_c q^ν with s_c central, prove that half-integrality of ⟨μ,ν⟩ for every weight of every test representation forces ν=0"; and the API bullet at line 882, "On the central-compact locus, half-integrality for the full test family implies zero real part".

   Claim: for central s_c, half-integrality on T(G) alone forces ν = 0.

   Witness: PGL₂, s_c = 1, ν = (½,−½) (the trivial representation). Adjoint pairings 1, 0, −1; standard pairings ½, −½; all half-integral, ν ≠ 0. The roadmap's own Check at line 890 records that this ν "fails genericity". ch26 line 1192–1196 (Corollary 6.32(1)) assumes "Suppose L(s) is generic. (1) If L(s) is unitary". The API bullet at line 855 has the hypothesis; the theorem sentence and the bullet at line 882 do not.

   Repair: at line 873 replace "For s=s_c q^ν with s_c central, prove that half-integrality of ⟨μ,ν⟩ for every weight of every test representation forces ν=0." by "For s=s_c q^ν with s_c central and s the Satake parameter of a unitary generic spherical representation, prove that half-integrality of ⟨μ,ν⟩ for every weight of every test representation forces ν=0." At line 882 replace "On the central-compact locus, half-integrality" by "On the central-compact unitary generic locus, half-integrality". Retest: the witness ν = (½,−½) is the non-generic point (coroot value q at the positive coroot) and is excluded by the hypothesis; ν = (¼,−¼) remains excluded by the standard pairing ±¼.

2. **F02** (P2) Every LanglandsParameterStacks label cited here is absent at the supplier's head

   Location: `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:7` ("LanglandsParameterStacks §§LP2e.15 and LP2c.8"), line 11 ("§§LP0.1–LP0.4, LP1.11–LP1.12 and LP2e.5"), line 97 (contract: "§§LP0.1–LP0.4, LP1.11–LP1.12, LP2e.5, LP2e.15 and LP2c.1–LP2c.4, LP2c.8"), and the `*Needs:*`/Dependencies lines 169, 216, 241, 434, 603, 1012, 1095, 1125, 1248.

   Claim: these labels name sections of LanglandsParameterStacks.

   Witness: `roadmaps show 'LanglandsParameterStacks'` (head of #1202, index of 2026-11-04) numbers its sections 0.1–0.9, 1.1–1.18, 2.1–2.15, 3.1–3.9, 4.1–4.26, 5.1–5.3, 6.1–6.3; the strings "LP0.1", "LP1.11", "LP2e.5", "LP2e.15", "LP2c.8" occur zero times in its README (the citation resolver reports the same at lines 7, 11, 216, 1012). The content cited exists under other numbers: crossed cocycles, condensed L-parameters, finite wild ramification and the geometric degree are 0.1–0.4; the group-valued Weil–Deligne dictionary and monodromy are 1.13 "Weil–Deligne parameters", 1.14 "Quasi-unipotence and nilpotent logarithm/exponential", 1.15 "Monodromy and the Weil–Deligne comparison" (not 1.11–1.12, which are cotangent complexes and the coadjoint nullcone); semisimplification is 2.4–2.5 "Semisimple L-parameters"; the abstract excursion centre map is 2.15; pseudocharacters with prescribed projection, reconstruction and continuity are 3.2–3.6; the Schur-object parameter is 3.9 "Parameters of Schur objects" (built on 2.15, 2.10 and 3.3).

   Repair: replace throughout, in Scope, the contract and every `*Needs:*`/Dependencies line: "LP0.1–LP0.4" → "0.1–0.4"; "LP1.11–LP1.12" → "1.13–1.15"; "LP2e.5" → "2.5"; "LP2e.15" → "2.15"; "LP2c.1–LP2c.4" → "3.2–3.6"; "LP2c.3–LP2c.4 (continuity)" → "3.4–3.6 (continuity)"; "LP2c.8" → "3.9". Retest: each replacement label is a `###` heading of the head's README with the title named above, and the resolver lead list for this README then contains only the downstream KloostermanSheavesAndBesselIsocrystals entry.

3. **F03** (P3) The spherical unitary-dual classification cites no primary source

   Location: `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:873–875` and 884 ("For split adjoint quasi-simple groups identify the spherical generic unitary real locus from its graded affine Hecke algebra … the affine Hecke algebra equivalence, the generic criterion and the root-datum classification are theorem targets of this subsection"), whose only locators are ch26 (lines 873 and 875); `sources.toml` has no entry for the classification papers.

   Claim: ch26 supports the classification target.

   Witness: ch26 line 810–813 attributes the classification to [Ba] (symplectic and orthogonal), [Ci1], [Ci2], [BC1] (exceptional), [BM1] (Iwahori–Hecke reduction) and [Ta] (GL(n)); ch26 line 814 attributes the generic criterion to [BM2]; Theorem 6.9 (ch26 line 869) is stated with those four references. The bibliography entries are ch26 lines 1847–1920 (Barbasch, J. Inst. Math. Jussieu 9 (2010); Barbasch–Moy, Invent. Math. 98 (1989); Barbasch–Moy, Contemp. Math.; Barbasch–Ciubotaru, Compos. Math.; Ciubotaru, Represent. Theory 9 (2005) and 10 (2006); Tadić).

   Repair: add manifest entries `barbasch-spherical`, `barbasch-moy-unitarity`, `barbasch-moy-whittaker`, `barbasch-ciubotaru-E`, `ciubotaru-F4`, `ciubotaru-E6` and `tadic-gl` (Represent. Theory is open access; the others may be recorded `uncertified` by DOI), and append to the locator of the §5.1 local theorem: "classification of the spherical unitary dual: Barbasch 2010 (classical split groups), Ciubotaru 2005 (F₄), Ciubotaru 2006 (E₆), Barbasch–Ciubotaru (E₇, E₈), Tadić (GL_n); reduction to the Iwahori–Hecke algebra: Barbasch–Moy 1989; genericity of the spherical quotient iff irreducibility: Barbasch–Moy, Whittaker models with an Iwahori fixed vector". Retest: every theorem the target restates then has a locator into the paper that proves it.

## Round-1 findings at this head

Each finding of the two round-1 passes was re-read against the head; the quoted passage is the repaired text.

| Finding | Status | Witness at 16d6838 |
|---|---|---|
| a.F01 (P2) arbitrary central characters | repaired | README line 336: "A cuspidal Π enters it only when its central character is trivial on Ξ. A central character of finite order is trivial on a finite-index subgroup of any such Ξ"; line 717: "whose central character has finite order"; line 754: "An essentially discrete series whose central character has infinite order is moved to this case by the local unramified twist". Checked: Ξ′ = nΞ is again discrete, torsion-free, and Z(K)∖Z(𝔸)/((Z(𝔸)∩U)Ξ′) is a finite extension of a finite set; a finite-order character of Z⁰(𝔸) has finite order on Z(𝔸) because Z(𝔸)/Z⁰(𝔸) injects into the torsion group (Z/Z⁰)(𝔸). The new Check at line 358 computes 3^d ≠ 1. FunctionFieldArithmetic §6.2 at #1474 uses exactly this Ξ and requires χ trivial on Ξ. |
| a.F02 (P2) parahoric model | repaired | README line 439: "𝒢 a parahoric group scheme over C with connected reductive generic fibre G … Congruence subgroups enter as levels on this model, not as other smooth models"; lh line 248 and lh line 1574 say parahoric. New Check line 461: special fibre of Spec O_v[x,(1+zx)⁻¹] at z=0 is G_a, points 1+zO_v; recomputed. |
| a.F03 (P3) ghs Definition 2.5 | repaired | README lines 147 and 177 cite only "ch26, §2.3, Definition 2.5, p. 7"; the ghs locator in sources.toml (lines 22–31) no longer names Definition 2.5. |
| a.F04 (P3) D-type half-spin Check | repaired | README line 864. Recomputed in ch26 line 1039 coordinates: on ½ω₁ the half-spin pairings are ½,0,−½ with multiplicities 1,6,1; on ½ω₂ and ½ω₄ they are ±¼ (4,4); vector pairings ±¼ on ½ω₁, ½ω₂ and ½,0,−½ (1,6,1) on ½ω₄; D₆ top weight pairs to ¾ and ½. All agree. |
| a.F05 (P3) trivial-representation Check | repaired | README line 526: norm-one torus, swap matrix, eigenvalues 1 and −1 of weight 0; the trivial character's parameter is the trivial cocycle (1, w̄), whose induced two-dimensional realization is the permutation of the two cosets. |
| a.F06 (P3) four Checks | repaired | Lines 167 (diag(2,3), weights 1 and log₂3), 920 (±I, traces ±2), 1068 (quadratic cover, eigenvalues 1,−1), 1149 (I, −I, n(0)=2). Each separates the two cases. |
| a.F07 (P1) algebraic test modules | repaired | README lines 105–107 "From TauCetiRoadmap.ReductiveGroups … Layer 10, §§10A–10B"; on main `TauCetiRoadmap/ReductiveGroups/README.md` has "#### 10A. The rational category and actual torus lattice" (line 1733) and "#### 10B. Induction, Weyl modules and simple heads" (line 1759). §5.1 Needs (lines 869, 893) and §8.0 (line 1270) cite them. |
| b.F01 (P2) compound gaps | repaired | README lines 51–71: six single-theorem contracts; plan.json `gaps` has the same 16 slugs with the same suppliers and sections; §4.2 (line 731), §4.3 (748), §5.4 (958), §5.5 (974) cite the slug each uses. |
| b.F02 (P3) absolutely simple | repaired | README line 944 "Let G be connected semisimple over K"; line 843 product definition of T(G); line 950 local reduction; Checks at lines 865–866 recomputed: q_L^{±1/4} = q_F^{±1/2}, induced eigenvalues ±q_F^{±1/4}, weight ±½ relative to both. |
| b.F03 (P3) locators | repaired | Line 789 "ch26 line 501" (Proposition 3.10(5) is ch26 line 501–502); lines 992, 1020, 1036 "pp. 15–16"; line 1254 "proof of Corollary 5.7, p. 15". |
| b.F04 (P3) normal-image dual maps | repaired differently, correctly | README line 103 declares `gap:normal-image-l-homomorphisms` with the kernel hypothesis; line 484 states the hypothesis; Check at line 496 (relative Frobenius sends α to pα). The repair's objection to the composite is right: the dual of the central isogeny (ker Υ)⁰×G₁′→G₁ points from ᴸG₁, so no arrow ᴸG₁′→ᴸG₁ is supplied by RG2.5.2's items. |

No repair introduced an error that this pass could find; the one gap in the repaired §5.1 text (S01) predates the repairs.

## Verified sound

Scope: both files read line by line, `README.md` (1461 lines, 52 numbered targets plus the five bold constructions of §4.0 and the local theorem of §5.1) and `Suggested.lean` (53 lines, one module docstring, no declaration). Counts: 0 Lean declarations (the `#check @name` binder audit is vacuous, no elaboration was run); 58 target families read; 38 source locators opened and compared (ch26 15, ghs 6, lh 4, hny 3, fs 2, glo 2, xz 2, st 1, lz 1, xue 1, stacks-as 1); 44 Checks evaluated with values (the table below, plus the numeric script); 146 cross-roadmap section labels resolved at the current heads of 15 supplier roadmaps and on main; 16 declared gaps compared between README and plan.json; the dependency check, diff scope and resolver run on this head.

Policy: `git diff --stat origin/main...HEAD` touches only `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/` (10 files). No `lemma` keyword, no `set_option`, no pull-request number or process narrative in README or docstring, no machine path; every target has a locator. The acceptance file has `import Mathlib`, the namespace, and a docstring naming each absent headline with its missing carrier. The headline list (geometricity and pure completions; constant-twist decomposition and boundary propagation; Li-Huerta uniformization and the Fargues–Scholze comparison; the Kloosterman/Bessel anchor; discrete-series purity and embedding independence; generic Ramanujan; elliptic and stack realizations; discrete rationality and Xue quotients; complementary-series propagation and extraneous-point elimination) needs L-parameters, Weil groups, lisse sheaves, shtuka stacks, isocrystals or nilpotent-orbit data, none of which exists at the pins; Property A (§8.4) is statable on `Finsupp` but is an auxiliary array lemma about no object of the roadmap, so its absence is correct. No padding, no sorry'd data.

Dependency check (verbatim, exit 0):

```text
moved: GlobalShtukasAndFunctionFieldLanglandsPartII moved in the merge order from #27 to #243, right after its last supplier HeckeStacksAndLocalShtukas (ArithmeticGaloisRepresentations, LanglandsParameterStacks, MotivesAndAlgebraicCycles, DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurity, PadicDifferentialEquationsAndRigidCohomology, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 209 roadmaps, 1822 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the `moved:` line is the permitted placement. FormalConnectionsOpers (#1056) is a new-roadmap head absent from the merge order, not a defect at the design stage. The downstream names KloostermanSheavesAndBesselIsocrystals (#259), LieHighestWeightPartII (#293) and SmoothRepresentationsOfLocalGroupsPartII (#294) are later than the moved position and are cited only as consumers; the resolver lead at line 13 (KB.6) is that consumer.

Supplier labels resolved (heads in parentheses): SmoothRepresentationsOfLocalGroups (#1688) SR.0.2, SR.1.3–SR.1.5, SR.2.2, SR.3.1–SR.3.4, SR.4.1–SR.4.2, SR.5.2, with Casselman's criterion and the unitary central character in SR.3.3, the c-group formulation in SR.4.2, and the *wd-raw-parameters* block at its line 4458 inside SR.5.2 (which spans lines 3821–4854); HeckeStacksAndLocalShtukas (#1252) HS0.1–HS0.4, HS1, HS2.9 "Towers for a general local field", HS3.1–HS3.4, HS4.1, HS4.7; DeligneWeightsAndPurity (#929) 0.1, 0.2, 0.3, 0.6, 0.7, 0.13, 0.17, 0.19, 5.2, 5.3, 5.5, 5.11, 5.12, 7.8, 7.9, 8.5, 8.17, 8.18; ArithmeticGaloisRepresentations (#856) 2.6 "Monodromy filtration and purity", 3.1–3.4; MotivesAndAlgebraicCycles (#1313) 6.3 "Generation, functoriality and finite type"; PadicDifferentialEquationsAndRigidCohomology (#1002) RD.1.16, RD.2.49–RD.2.51, RD.3.13, RD.3.25, RD.4.10–RD.4.12, RD.5.46, RD.6.23, RD.6.39, RD.6.51–RD.6.55 with RD.6.52a, RD.6.64–RD.6.65, RD.6.77, RD.6.84–RD.6.85; FunctionFieldArithmetic (#1474) 5.8, 6.1–6.6 (6.2 states the Ξ condition used in §2.1; 6.4 is for every connected reductive G); GlobalShtukasAndFunctionFieldLanglands (#1490) 1.4, 1.9–1.14, 2.1–2.5, 2.9–2.10, 3.6, 3.10, 3.12, 4.8, 4.12, 5.3–5.10, 6.1–6.2, 7.6–7.9; DiamondEtaleCohomology (#922) C0; DiamondSixOperations (#927) S1.2, S1.5, S2.1–S2.4; on main: EtaleCohomologyFoundations F.0–F.4, SchemeAndStackFoundations Layers 1–2, ReductiveGroupsPartII RG2.3, RG2.4, RG2.5.1, RG2.5.2 (with *dual-isogenies-and-products* and *dual-of-weil-restriction*), ReductiveGroups 10A–10B, RepresentationTheory/LieHighestWeight Layer 0 and Layer 6, AffineLieAlgebras A7–A8, NilpotentOrbits N0–N2; FormalConnectionsOpers (#1056) F4, F5, F8.4. NilpotentOrbits writes §N2 as a numbered list; "N2.1", "N2.2", "N2.4" are its items 1 (Jacobson–Morozov, triples, conjugacy), 2 (dominant normalization of h, weighted diagrams) and 4 (the finite orbit quotient with representatives), which carry the cited content; named Bala–Carter labels are not there, so the declared gap is needed.

Gaps: the 16 slugs agree between README and `design/plan.json` (supplier, section, `needs` text). Each supplier is named; each `needs` is one theorem with its hypotheses. None asks for what the pins or an earlier roadmap provide: PadicDifferentialEquationsAndRigidCohomology at #1002 has only the Dwork and rank-two Bessel examples (RD.2.42) and the de Rham–rigid comparison, not the reductive Bessel functor; SmoothRepresentationsOfLocalGroups at #1688 has no pseudo-coefficients (zero occurrences); RG2.5.2 has no normal-image map. Ownership by object (roadmap service index of the open heads and main): the spherical unitary dual and graded affine Hecke algebras are owned nowhere else; the reductive Kloosterman anchor, the Bessel companion, pseudo-globalization, Property A and extraneous points are found only here.

Sources read for this pass: ghs line 236 (A₀(G) is finite-order central character), ghs line 284–311 (Theorem 2.3(iv)–(vi): parabolic induction, pro-p-Iwahori invariants give a torus-valued parameter for quasi-split G, normal-image compatibility with ᴸΥ "corresponding to Υ" and no construction of it); fs line 1329–1345 (Theorem I.9.6: (ii) twisting, (vi) products, (vii) Weil restriction, (viii) parabolic induction); hny line 950–979 (Theorem 1 for a constant group: tame at 0 with principal unipotent monodromy; Theorem 2 with the good-prime hypothesis) and hny line 121, 2524–2546 (the construction is for split, almost simple, simply connected G, extended through z-extensions), consistent with the roadmap's central-isogeny reduction in §4.2; glo line 19–42 (Theorem 1.1: prescribed central character on Z(k)∖Z(𝔸), Π_{v₀} ≅ π_{v₀}, principal-series constituents elsewhere); ch26 line 372–374 (standing hypothesis), 473–482 (Theorem 3.8(3)), 485–511 (Definition 3.9, Proposition 3.10), 609–616 (Theorem 5.4 requires u ∈ S; the roadmap proves the wider statement in §5.3), 805–870 (§6.1: the generic criterion is [BM2], irreducibility iff no coroot value 1 for real ν, Hermitian iff w₀ν = −ν, Lemma 6.7 deformation), 1033–1045 (PSO coordinates), 1182–1206 (Proposition 6.31 pairings, Corollary 6.32), 1636–1650 (Property A); lh line 248 and 1574; st line 4018–4037 unchanged from round 1.

Adversarial table (every row computed in this pass):

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| Conventions | q=4, r=diag(1,4), Ne₁=e₀ | rNr⁻¹e₁ = e₀/4 = (N/4)e₁; weights 0,2; N: 2→0 | downward N agrees |
| §0.1 Checks | 2, 3, e^i, (3+4i)/5, diag(2,3) at q=4,5 | weights 1, log₂3, none, 0 (minimal polynomial 5X²−6X+5, both roots of modulus 1), {1, log₂3} | agree |
| §0.2(b) | ϕ(I) of order m, F^N central in it | (Fs)^N = F^N s′ with s′ ∈ ϕ(I); (F^N s′)^m = F^{Nm} | Nm-th roots, weight preserved |
| §0.3 Check 7 | roots of x⁴−x³−x²−x+1 | moduli 0.5807, 1, 1, 1.7221 | ι-pure but not arithmetically pure |
| §0.4 | GL₂, diag(q^{1/2},q^{−1/2}); diag(1,q²) | Steinberg N≠0 bounded; ratio q² admits no N | unique / none |
| §1.1 Checks | 1+i, 1+2i over 𝔽₂, ℓ=7 | norms 2 = 2¹, 5 ≠ 2^k; both 7-adic units | classes as stated |
| §1.2 | constant 3 over 𝔽₄ at degree d | 3^d vs 4^d: weight log₂3 at every d | hypothesis fails, conclusion not asserted |
| §1.3 Check 3 | SL₂, diag(2,½), q=4 | W_{−1} = ⟨e₂⟩; E₂₁e₁ = e₂ keeps it, E₁₂e₂ = e₁ leaves it | lower Borel, sign correct |
| §2.1 Ξ argument | ξ of order n, Ξ of covolume index c | nΞ has index n^rank in Ξ; quotient finite; ξ(nΞ)=1 | finite-order Π occurs |
| §2.1 Check 5 | G_m over 𝔽₄(t), ξ = 3^deg, ℓ=5 and ℓ=3 | 3^d ≠ 1 for d ≠ 0; 3 is not a 3-adic unit | excluded as stated |
| §3.1 Check 5 | α⁴ = α+1 in 𝔽₁₆ | α⁴ ≠ α, (α+1)⁴ = α⁴+1 = α; bounds 3→5→7 | agrees |
| §3.3 Checks | GL₂ St vs trivial; Frobenius SL₂→SL₂; μ₂ | same pair (q^{1/2},q^{−1/2}); α ↦ pα not a root; central kernel admitted | agrees |
| §3.4 Check 6 | norm-one torus, trivial character | parameter (1,w̄); induced realization = swap; eigenvalues 1,−1, weights 0 | agrees |
| §3.6 | E/F unramified quadratic, χ(ϖ_E)=q_F^{1/2}, q_F | induced eigenvalues ±q_F^{1/4} (weight ½) and ±q_F^{1/2} (weight 1) | q_E criterion |
| §4.0 A₄ | adjoint character 3, −1 (×3), 0 (×8) | (3−3+0)/12 = 0 | no invariants |
| §4.0 slope | A₁: r=1,h=2; G₂: r=2,h=6 | 3/2 → Irr ≤ 1; 14/6 → Irr ≤ 2 | agrees |
| §4.2 central matching | GL₂, Z⁰∩G_sc = μ₂, ξ_x unramified | ξ_x(−1)=1; anchor central character chosen by the χ of Kl(φ,χ) | handled by the declared contract |
| §4.4 | essentially d.s. with unitary central character | |χ| trivial on Z⁰(F) ⇒ trivial on G(F) (finite-index lattice map) ⇒ π discrete series | "(so π is discrete series)" holds |
| §4.4 Check 1 | St⊗(χ∘det), χ(ϖ)=3, q=4 | central value 9; pairs (2,½)→(6,3/2); ratio 4 both | agrees |
| §4.5 central reduction | unitary ω on Z(F) | unramified unitary extension from the rank-r lattice Z⁰(F)/Z⁰(F)¹ to G(F)/G(F)¹ (finite index); ω then finite on Z(F) since Z(F)/Z⁰(F) finite | contract is consistent |
| §4.7 | Casselman exponents with Weil-number values | |ιχ(a)| = q^{w/2}; w<0 independent of ι | agrees |
| §5.1 definition | PGL₂; PGL₃; PGL₂×PGL₃ | T = {Ad, std}; {Ad}; {Ad₁, std₁, Ad₂}; PGL₃ unitary generic ν=(t,0,−t), t<½: pairings t, 2t ∈ ½ℤ only at t=0 | agrees |
| §5.1 B₂ Check | ν=(½,0) in dual B₂ | vector ±½,0,0,0; spin ±¼ (×2); ⟨γ∨,½ω_n⟩ = ½ as ch26 line 1035 | agrees |
| §5.1 D₄/D₆ Check | ½ω₁, ½ω₂, ½ω₄; D₆ top weight | (½,0,−½)(1,6,1); ±¼ (4,4); ±¼ (4,4); vector ±¼, ±¼, (½,0,−½); D₆: ¾, ½ | agrees (script) |
| §5.1 local theorem | PGL₂, ν=(½,−½), s_c=1 | adjoint 1,0,−1; standard ±½; ν ≠ 0 | S01 |
| §5.1 Res check | Res_{L/F}PGL₂, f=2 | q_L^{±1/4} = q_F^{±1/2}; induced ±q_F^{±1/4}: weight ±½ for both q | agrees |
| §5.4 Check 3 | G₂, s_c=(−1)^a, ν=½ω₂, q=4 | coroot values −1,2,−2,2,−2,−4; none 4 or ¼; without s_c the (3,2) coroot gives +4 | hypothesis necessary |
| §6.1 Checks | GL₂ split; torus; Klein four in PGL₂ | dim S/Z = 1; quotient 1; centralizer of V₄ is V₄ (order 4) | agrees; (Ad⁰)^σ = Lie S_σ/Lie Z^Γ by exactness of invariants |
| §7.2 Check 4 | I, −I in SL₂ | n(0)=2 both; traces ±2 | agrees |
| §8.0 recognition | pattern n(·) at q_v=4, q_w=16 | χ_τ(q^ν) = Σ n(i)q^{i/2} determines q^ν mod W for either q; ν mod W by injectivity of exp on t̂_ℝ | agrees |
| §8.3 | a(0,±1)=1; a(−2,−2)=3 | r=2δ₀, c=δ₁+δ₋₁; both margins 3δ₋₂ | agrees |
| §8.4 Property A | all 729 symmetric ℕ-arrays on [−1,1] with values ≤2 | 0 violations; r=c ⇒ diagonal by the downward induction | agrees (script) |
| §8.5 Sp₆ | standard weights ±e_i; (½,½,½) vs (0,½,1) | n(±1)=3; n(2)=n(1)=n(−1)=n(−2)=1, n(0)=2; i₀=2, 1>0 | agrees (script) |
| Worked example F₄ | x=(5/2,1,½,0) on dual roots ±2e_i, ±e_i±e_j, (±1)⁴ | weights 10 (2e₁), 9 (none), 8 ((1,1,1,±1)) → 1,0,2 | agrees |

## Not verifiable

- The 16 declared contracts and the conditional interfaces of §§6.3–6.5 and 7.1–7.6 are hypotheses by design; their truth as theorems was not tested beyond the instances above.
- The classification of the spherical unitary dual (the target of S03) was not re-derived; only its consequences on the listed points were computed.
- The E₇/E₈ profile computations of §8.5 were recomputed in round 1 by script and were not recomputed here; the F₄ and Sp₆ cases were.
- Ownership against open pull requests was checked through the roadmap service's index and the sibling checkouts named in the brief; heads not in that index were not read.
- No Lean was run: the acceptance file declares nothing, so there is no signature to elaborate.

## Source issues

- **Gap** in ch26 at Corollary 6.32(1), p. 25, used in the proof of Theorem 5.4, p. 14: the source says a generic unitary spherical L(s) with half-integral real part on the listed representations is tempered, for every compact part s_c; it should restrict to central s_c or reduce to the centralizer of s_c, since split G₂ with s_c = (−1)^a on aα₁∨+bα₂∨ and ν = ½ω₂ gives coroot values −1,2,−2,2,−2,−4, an irreducible unitary generic adjoint-half-integral spherical representation with ν ≠ 0; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "16d6838", "job": "RT-GlobalShtukasAndFunctionFieldLanglandsPartII~2b", "model": "fable", "worker": "chris-x8"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "16d68386dedc5ba3799b954ed8eec909e9724d84", "job": "RT-GlobalShtukasAndFunctionFieldLanglandsPartII~2b", "model": "fable", "worker": "chris-x8"} -->
