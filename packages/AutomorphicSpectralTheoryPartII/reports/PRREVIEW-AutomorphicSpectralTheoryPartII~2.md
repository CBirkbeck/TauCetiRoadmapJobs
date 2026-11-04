# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at e2ad99a)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since 4d41437 (the new §4.2a, the §5.5 rewording that cites it, and the Layer 4 Dependencies line). Gate at this head: every text scanner passes, `depcheck: 204 roadmaps, 1662 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line, elaboration of `Suggested.lean` with `lake env lean` gives three `sorry` warnings and nothing else. The new §4.2a is correctly sourced (BPLZZ Theorem 1.1, Remark 1.2(4), Theorem 3.6) and its supplier citations resolve; one of its four Checks is false for the non-automorphic π the section explicitly admits (R01). The r1 notes R02–R05 are untouched by this head and are carried.

## R01 (P3) — §4.2a GL₁ Check is false for a non-automorphic π

Location: `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md`, §4.2a, first Check: "two Hecke characters agreeing at almost all places are equal (weak approximation), so the subspace is that line if π=ω and zero otherwise".

Claim: for G=GL₁=Z, L²_cusp([G],ω)_π is the line of ω when π=ω and zero otherwise.

Witness: the section lets π be "an irreducible admissible representation of G(𝔸), not assumed automorphic". Take F=ℚ, ω any unitary Hecke character, χ₂ a nontrivial character of ℚ₂^× and π=ω⊗χ₂ (π_v=ω_v for v≠2, π₂=ω₂χ₂). Then π is nearly equivalent to ω with S′={∞,2}, so by the definition the subspace is the line of ω, nonzero; but π≠ω, and π is not automorphic (ℚ^× is dense in ℚ₂^×, so π is trivial on ℚ^× only if χ₂=1). The Check's "zero otherwise" fails on it. Weak approximation only shows that ω is the unique Hecke character in its near-equivalence class.

Repair: "so the subspace is that line if π_v=ω_v for almost all v and zero otherwise; among Hecke characters only ω itself is nearly equivalent to ω (weak approximation), so for automorphic π the condition reads π=ω." Tested: π=ω⊗χ₂ gives the line (π_v=ω_v for v≠2); a π with π_v≠ω_v at infinitely many v gives zero; an automorphic π is nearly equivalent to ω iff π=ω.

## R02 (P3) — Two gap contracts point at AST sections on a different setting (carried from r1 R02)

Location: README lines 83 and 87: "The section contract is §§4.11–4.14" (gap:refined-langlands-discrete-data) and "The section contract is §§4.7–4.9" (gap:discrete-spectrum-casimir-counting).

Witness, re-resolved at the AutomorphicSpectralTheory head: §4.11 "Discrete spherical spectrum", §4.12 "Discrete pairs, their equivalence and stabilizers", §4.13 "Good representatives of discrete pairs", §4.14 "Moeglin–Waldspurger classification" are the everywhere-unramified function-field GLₙ sections; §4.7 is "Compact quotient discrete spectral specialization", §4.8 "`GL₂` modular spectral expansion", §4.9 "Modular Weyl law and spectral summability". The number-field decomposition by discrete data with residual summands and finite multiplicity is §§4.1–4.5 ("Measurable associate spectral parameters" to "Finite multiplicity in the discrete spectrum").

Repair: write "The section contract is §§4.1–4.5" on both lines; the `needs` sentences need no change.

## R03 (P3) — ALLF anchor `isobaric-construction` does not exist (carried from r1 R03)

Location: README line 11 (Scope) and line 215 (AutomorphicLFunctionsAndLocalFactors contract): "preparatory **GLₙ isobaric sums** (anchor isobaric-construction)".

Witness, re-resolved at the AutomorphicLFunctionsAndLocalFactors head: no occurrence of the string `isobaric-construction`; the section is `### AL.R.4 GLₙ isobaric sums` (its line 274), consumed by `#### AL.3.7.2 Strong multiplicity one for isobaric sums` (line 2193).

Repair: cite "AL.R.4, GLₙ isobaric sums" in both places and drop the anchor; keep AL.3.7.2 for §5.6.

## R04 (P3) — The `module` header exports nothing (carried from r1 R04)

Location: `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean:1–3` (`module`, blank, `import Mathlib`; no `public section`).

Witness, re-run at this head against the module's built olean: a scratch file `import TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested` followed by `#check @TauCetiRoadmap.AutomorphicSpectralTheoryPartII.finite_rank_weierstrass_product` and `#check @…HasRankBound` fails with "Unknown identifier" on both. The acceptance test is invisible to any importing file.

Repair: delete the `module` line (then `import Mathlib` is the first line, as in most roadmaps on main), or add `public section` after the import.

## R05 (P3) — Four conjuncts of `finite_rank_weierstrass_product` restate the supplier's theorem (carried from r1 R05)

Location: `Suggested.lean:87–96`.

Witness: README §0.2 says convergence, entire holomorphy and the exact simple-zero divisor are supplied by GlobalHolomorphicFunctions Layer 1 (`exists_entire_primary_product_exact` at its head), and only the growth bound `exp(C(1+‖z‖)^(p+1))` is this roadmap's; the theorem's conjuncts 1–4 are the supplier's statement under `HasRankBound`.

Repair: say in the docstring that conjuncts 1–4 are the supplier's and the growth bound is this roadmap's contribution, or state only the growth bound with the zero-set characterization it needs. The statement itself is sound (no conjunct closes by one tactic).

## Previous findings

- R01 — not repaired: Scope still says the transfer-preservation theorem "belongs with the relative comparison"; settled board item F09 (ownership is a maintainer decision outside this folder), not re-raised.
- R02 — not repaired: lines 83 and 87 still read "The section contract is §§4.11–4.14" and "§§4.7–4.9"; carried as R02.
- R03 — not repaired: lines 11 and 215 still read "(anchor isobaric-construction)"; carried as R03.
- R04 — not repaired: `Suggested.lean` still opens with `module` and no `public section`; re-verified, carried as R04.
- R05 — not repaired: `finite_rank_weierstrass_product` and its docstring are unchanged; carried as R05.
- R06 — not repaired: `HasRankBound` still has `Λ.Countable ∧ Summable (…)`; the r1 repair was optional, the Lean matches the README definition, and positivity of the summands does imply countability (`Summable.countable_support_nnreal` at the pin, `Topology/Algebra/InfiniteSum/ENNReal.lean:381`), so this is a remark needing no change and is not carried.

## Verified sound

**Gate and dependency check.** My run of the gate at e2ad99a: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds build=0. Dependency check with `--movable`: `depcheck: 204 roadmaps, 1662 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Outside-folder diff against origin/main: 0 paths. Pins: Mathlib f6090c70, Tau Ceti 358314d4. Elaboration with `lake env lean` of `Suggested.lean`: warnings at lines 87, 100, 110 (`sorry`), nothing else, 13 s. The Lean file is byte-identical to the one reviewed at 4d41437, so the ten elaborated signatures recorded by the worker (none losing a section binder) and the r1 one-tactic probe (all three theorems fail `first | rfl | simp | infer_instance | decide`) stand; no new `#check` pass was needed.

**The changed passages.** §4.2a (README lines 1297–1323), §5.5 (lines 1565–1569), Layer 4 Dependencies (line 1473). Every section they cite exists: §4.1 (line 1243), §4.2 (line 1271), §5.4 (line 1552); AutomorphicSpectralTheory at its head §0.50 "Restricted tensor factorization" (Flath adapter to AFRG §§3.4–3.5, with the `GL₁` Hecke-character Check), §1.9 "Cuspidal-data generated subspaces" (Check: for χ=(G,σ), `L²_χ` is the σ-isotypic cuspidal summand; association transports σ and P), §4.5 "Finite multiplicity in the discrete spectrum" (fixed central character, number-field quotient; cuspidal part through ArithmeticLocallySymmetricSpaces ALS.F.6); AutomorphicFormsOnReductiveGroups at its head §3.4 (restricted tensors, finite corners), §3.5 (`finrank_spherical_le_one` at hyperspecial level, `flath`, `unramifiedAlmostEverywhere`), §4.1 (constant terms), §4.2 (cuspidal occurrences at a unitary central character, finite multiplicity `m_cusp(π)`, semisimplicity); SmoothRepresentationsOfLocalGroups at its head SR.4.1 (Satake isomorphism) and SR.4.2 (a spherical Hecke character determines a semisimple unramified parameter; spherical line). These are the inputs the §4.2a proof route names (local components, spherical classification, Hilbert-sum decomposition with finite multiplicity, orthogonality of isotypic components). All three suppliers precede this roadmap in the merge order; the §4.2a `*Needs:*` line and the Layer 4 Dependencies line list exactly them. The Dependencies lines of this README are summaries throughout (Layer 5's reads "Layer 4 and the earlier symbol and Schwartz-action layers; …"), so the Layer 4 line's omission of §4.1's AST Layer 4 is in style.

**Source locators of the changed passages** (bplzz printed page = PDF page).

| Target | Source, locator | What I read | Result |
|---|---|---|---|
| 4.2a definition | bplzz line 53–63 (Thm 1.1, p.2) | π irreducible admissible with unitary automorphic central character; hypothesis: no proper (P,σ) with π_v a constituent of Ind(σ_v) at all but finitely many v; conclusion (1): range in the π-nearly isotypic subspace, "the direct sum of K-invariants of irreducible subrepresentations π̃ with π̃_v≃π_v for all but finitely many v"; (2) π(μ⋆f)=π(f) | matches the README definition (closure of the sum over subspaces, K-fixed part a Hilbert sum of the π̃^K) |
| 4.2a, Check 3 | bplzz line 81–84 (Rem 1.2(4), p.2) | π need not be cuspidal automorphic; π^K≠0 with zero nearly isotypic subspace is possible | matches |
| 4.2a, anisotropic case | bplzz line 72–78 (Rem 1.2(2)) | for G anisotropic modulo centre, L²=L²_cusp is the Hilbert sum of the L²_cusp(…)_π′ over near-equivalence classes | matches the API bullet "their Hilbert sum is L²_cusp" |
| 4.2a, T-character of π | bplzz line 1080–1087 (§3.1, p.22) | χ_π^T defined when π_v^{K_{0,v}}≠0 for every v∉T | matches "T⊇S containing the places where π is ramified" |
| 4.2 CAP (cited by 4.2a) | bplzz line 1091–1095 (Def 3.4, p.22) | (G′,T)-CAP: proper P′ and cuspidal σ with the spherical representation of χ_v a constituent of I(σ_v) at all but finitely many v∉T with G_v≃G′_v; π is CAP iff χ_π^T is | matches; "depends only on the near-equivalence class" follows since CAP is an almost-everywhere condition |
| 5.5 | bplzz line 1120–1125 (Thm 3.6, p.23) | non-CAP χ gives a T-multiplier with range in L²_cusp(…/K,ω)[χ] and μ(χ)=1; "Theorem 1.1 follows by taking T=S and χ=χ_π^T" | matches the README's route (eigenpart as intermediate inclusion, T=S) |

**Adversarial table, changed statements** (values on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.2a near equivalence is an equivalence relation | π̃₁~π̃₂ with S′₁, π̃₂~π̃₃ with S′₂ | outside S′₁∪S′₂ (finite) all three agree; reflexive with S′=archimedean places; symmetric | true | none |
| 4.2a spherical criterion | GL₂/ℚ, π_p unramified with Satake parameters (2,3) and π′_p with (3,2): same Hecke character (symmetric functions), isomorphic; (2,3) vs (2,5): Hecke eigenvalue 5 vs 7 at T_p, not isomorphic | criterion separates exactly the isomorphism classes of spherical representations | true | none |
| 4.2a, Check 1 (GL₁) | ω Hecke character; π=ω: nearly equivalent, subspace = line; π=ω⊗χ₂, χ₂≠1 on ℚ₂^×: π_v=ω_v for v≠2, nearly equivalent, subspace = line, π≠ω, π not automorphic; π with π_p≠ω_p at every p: zero; weak approximation: a Hecke character trivial at almost all places is trivial on a dense subgroup of ∏_{v∈S′}F_v^×, hence trivial | "zero otherwise" fails on ω⊗χ₂ | false for non-automorphic π | R01 |
| 4.2a, Check 2 (π∞ replaced) | GL₂/ℚ, π∞ weight 2 vs weight 4 discrete series at the same finite data | nearly isotypic subspace unchanged (archimedean place lies in S′); the two χ^T-eigenparts are sums of summands with distinct infinitesimal characters (Harish-Chandra parameters 1/2 and 3/2), hence over disjoint sets of isotypic components, orthogonal | true (the second eigenpart may be zero, still orthogonal) | none |
| 4.2a, Check 3 | GL₂/ℚ, level K=GL₂(Ẑ), π_p unramified with parameter pairs not among the (countably many) Hecke eigenvalue systems of level-1 forms, π∞ arbitrary | π^K is a line, no summand is nearly equivalent, subspace 0 | true | none |
| 4.2a, Check 4 (non-isotypic class) | GLₙ: strong multiplicity one makes every class a single isomorphism class, multiplicity 1; SL₂: a global L-packet contains non-isomorphic nearly equivalent cuspidal members differing at finitely many places | subspace isotypic for GLₙ, not for SL₂ | "may" is right | none |
| 4.2a level-K part | Hilbert sum ⊕̂π̃ and the averaging projector e_K (continuous, commutes with the sum) | (⊕̂π̃)^K = ⊕̂ π̃^K | true | none |
| 4.2a eigenpart containment | summand π̃ meeting the χ_π^T-eigenpart at level K: π̃_v spherical for v∉S (hyperspecial K_v, nonzero K-fixed vector) with Hecke character χ_{π,v} for v∉T, so π̃_v≅π_v for v∉T by the criterion | π̃ nearly equivalent to π with S′=T∪{∞}; converse fails when infinitesimal characters differ (Check 2) | containment, proper in general | none |
| 4.2a orthogonal decomposition | L²_cusp = ⊕̂_σ L²_{(G,σ)} grouped by the partition of isomorphism classes into near-equivalence classes | each class's subspace is a Hilbert sum of whole isotypic components; distinct classes use disjoint sets | true | none |
| 4.2a degenerate | G=1: L²_cusp=ℂ, π trivial, subspace ℂ; G anisotropic mod centre: L²=L²_cusp, Rem 1.2(2); π with π^K=0: level-K part of its class may still be nonzero (another member π̃ with π̃^K≠0 at a place in S′) | consistent with "only components outside a finite set enter" | true | none |
| 5.5 hypothesis vs Thm 1.1 | "not nearly equivalent to a constituent of induction from a proper cuspidal datum" vs "no (P,σ) with π_v a constituent of Ind(σ_v) at almost all v" | ⇒: a nearly equivalent constituent agrees with π at almost all v; ⇐: given local constituents at almost all v, the restricted tensor with any constituent elsewhere is an irreducible admissible representation (π_v unramified a.e.) | equivalent | none |
| 5.5 range | π^K=0: both sides of π(μ⋆f)=π(f) are 0 for bi-K f; nearly isotypic subspace 0: operator 0, Rem 1.2(4) | consistent | true | none |

**Adversarial table, statements the diff leaves untouched** (carried from the r1 review, which computed them; the Lean file and these README sections are unchanged).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `finite_rank_weierstrass_product`, growth bound (r1) | p=0 with Λ={n²}, p=1 with Λ=ℤ, Λ=∅, Λ={0} | `log|E_p(w)|≤|w|^{p+1}` for `|w|≤1`, `≤(p+1)|w|^{p+1}` for `|w|≥1`; `log|Ψ(z)|≤C(1+|z|)^{p+1}`; Λ=∅ gives Ψ≡1 | true |
| same, zero set (r1) | z=0∈Λ, z∈Λ∖{0}, z∉Λ | `Ψ′(0)=1`; simple zero of `E_p(z/λ)` at λ; `Σ|E_p(z/λ)−1|<∞` locally uniformly | true |
| `HasRankBound` (r1) | Λ=ℤ: p=0 diverges, p=1 converges; Λ={1/(n+1)}: diverges ∀p | least ranks 1, ∞ | true |
| `polynomial_zero_fiber_interpolation` (r1) | n=0, ψ≡0, deg q=0 | damping `exp(Σz_j^{2q₀})`, `2q₀>d·deg q` | true |
| `affine_lattice_interpolation` (r1) | n=0,k=0; k=0,n≥1; k=1, a=1/2, b=1, A={0}; repeated generators | `sin(π(z−1/2))exp(z²)`: 0 on the lattice, −1≠0 at 0 | true under complex independence |
| `HasRapidVerticalDecay` (r1) | `exp(z²)` on `|x|≤M`: `exp(M²−y²)`; `exp(−z²)`: `exp(y²−x²)` | decays / grows | matches §0.3 |
| §0.5–0.9 symbols, sharpness, translation (r1) | Θ={−1}, Y=ℤ, μ=exp, z², sin(πz); `(t_wP)(α)=P(w^{−1}α)` | `e^n/(1+n)^d→∞`; `n²/(1+n)²→1`; seminorms not separating; `t_λt_η=t_{λ+η}` | all Checks true |
| §1.2, §1.4, §1.6, §1.7 (r1) | additive line `e^{itx}`; torus weight λ; max over θ∪{1}; μ=1, SU(2) | factors i, 2i; `t_{−λ}` not `t_λ` (source misprint); RHS larger; containment not equality | true |
| §2.2, §2.3, §2.6, §2.8, §2.12, §2.13, §2.16 (r1) | `G_m` `|t|=2`; GL₃ `diag(t²,t,1)`; p=2; circle `e_n/n^m`; `δ_x−δ_y`; cusp `y`, `exp(iy²)`; mass-1 quotient | 2, 4; `t` vs `t⁴`; 2 vs √2; `(1+n²)^{−1}` summable; 2, `|c|/w(y)`; degree 2k; 1=1, scaled 2≠1 | true |
| §3.1, §3.2, §3.5, §3.6, §3.8, §3.10 (r1) | 1-dim type; `I(λ,x)=e^{λx}`, `g=1_[0,1]`; GL₂ χ⊠χ; `δ_P=4`; circle kernels `e_n(x)conj e_n(y)`; `Y=iD−1` | a, 4a; adjoint `e−1` vs source `1−e^{−1}`; stabilizer order 2; `4^{1/2}`, `4^{−1/2}`; sign detected; `0≤0` vs `2≤0` | true, source error recorded in r1 |
| §4.1, §4.2, §4.5, §4.6–4.7, §5.1, §5.2, §5.6, §5.7 (r1) | S₃ standard rep K=⟨(12)⟩; torus; `G_m/ℚ`; compact abelian lattice; M=G; `(1−2T)(1−3T)` vs `(1−2T)²`; PGL₂ `q(λ)=λ²−1/4` | `(−1/2,−1/2,1)` K-fixed; no proper parabolic; differential 1 not typical; ℂ-independent generators; `1−5T+6T²` vs `1−4T+4T²`; `−t²−1/4` vs 0 | true |
| Layer 0 Examples, §0.2 Checks (r1) | `exp(z²)sin(πz)/(πz)` at it; `E_p(2)`, `E_p′(1)`; Λ={0,1,2}, p=0, z=3 | `exp(−t²)sinh(πt)/(πt)`; −1, −e², −e⁴; −1, −e, −e^{3/2}; 3 vs −6 | true; `E₀(2)=−1` elaborated |

**Headline theorems.** Unchanged since r1: the README endpoints (BPLZZ Thms 2.13, 3.6–3.7, 3.19, 1.1/1.3, Rem 3.20; BPCZ §2.5, §§2.9–2.10) are not statable at the pins (no reductive-group Schwartz algebra, adelic quotient, cuspidal datum or automorphic L² carrier in Mathlib f6090c70 or Tau Ceti 358314d4) and the module docstring names each with its missing carrier; the three statable Layer 0 results are stated. §4.2a adds no headline (it is a definition with its API) and nothing of it is statable at the pins, so the Lean file is rightly unchanged.

**Duplication and ownership.** `roadmaps grep` over main and the open heads for the new object: "nearly isotypic" occurs only in this roadmap (its lines 1297, 1299, 1565, 1567); every hit of "nearly equivalent" outside this roadmap (32, e.g. AbundanceStatement line 190, JacobianChallengePartII line 471) is the substring of "linearly equivalent", so no roadmap on main or at an open head defines near equivalence of automorphic representations or the π-nearly isotypic cuspidal subspace. AutomorphicSpectralTheory §1.9 owns the isotypic components, which §4.2a cites rather than restates; the subspace is a grouping of those components by near-equivalence class and is correctly owned here as the range object of BPLZZ Theorem 1.1. Ownership against open pull requests whose files this brief does not give was checked only through that grep index.

**Policy and shape of the new text.** No process words, pull-request numbers, LaTeX delimiters or paths in the 36 changed lines; the new target has a locator, an API list of four bullets, a proof route, a `*Needs:*` line and four Checks; the section id `4.2a` follows the suffix convention the gate accepts (`layer-ids=0 target-ids=0`). The backticked `S(G(𝔸))_K` is the §4.1 notation, not a Lean name claim (`readme-ids-missing=0`).

## Not verifiable

- `bernstein` (Bernstein 1988): settled as uncertified; not touched by this change.
- Kostant, Delorme, Donnelly and Müller inputs: cited only through BPLZZ, as in r1; not touched by this change.
- The r1 one-tactic probe and `#check` pass on `Suggested.lean` were not re-run; the file is byte-identical to the one they were run on at the same pins (`git diff 4d41437 e2ad99a -- Suggested.lean` is empty).

## Source issues

- none new in the lines read for this change (bplzz lines 53–98, 1080–1132); the seven items of the r1 report stand.
