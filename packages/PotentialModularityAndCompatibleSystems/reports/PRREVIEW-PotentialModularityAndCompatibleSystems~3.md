# Review of PotentialModularityAndCompatibleSystems (pull request #1075 at d54b60d)

**Verdict:** accepted

The two blocking findings of the previous review (the ClassicalSerreModularity I.0 ownership of Moret-Bailly's theorem and of controlled residual potential modularity, and the Böckle criterion owned by DeformationAndDerivedPatchingAlgebra §3.5) and its five P3 notes are repaired (details below). The push gate passes, the dependency check reports no problem, `Suggested.lean` states the one headline the pins can express, and the seeded source sample and the adversarial pass hold. Five P3 notes remain; none blocks.

## R01 (P3) — §3.5's second *Needs:* line cites §3.5 itself

Location: `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md` line 1016 ("§3.5 (joint prime levels, polarization descent and integral opens)").

Claim: §3.5 has two bold items, "Joint paired moduli" and "Good-reduction neighborhoods"; the second item's *Needs:* line cites the section that contains it, a self-edge. Witness: a scan of the 103 `###` sections and their 197 own-section *Needs:* edges reports exactly one cycle, `3.5 → 3.5`. Repair: write "the joint paired moduli of this section" in that *Needs:* line, or split the second item off as §3.5a.

## R02 (P3) — Two Layer 1 targets need later targets of the same layer

Location: README line 114 ("§1.2 (the KW carrier, before this comparison)") and line 162 ("§1.9 (character families, before the rank-one comparison)").

Claim: §1.1 needs §1.2 and §1.3 needs §1.9, both later in the section order; no cycle results (§1.2 needs no own target and §1.9 needs only §1.1), but the build order of Layer 1 is not its reading order and the parentheticals carry it. Witness: the same scan lists these two as the only forward own-section edges. Repair: reorder (§1.2 before §1.1, §1.9 before §1.3) with the matching renumbering of consumers' citations, or state the build order of Layer 1 in "How to read the build".

## R03 (P3) — The trivial-group Check of §6.2 asserts an equivalence that needs `K ∩ E′ = E`

Location: README line 1350 ("the disjointness of `K′/E′` from `F_avoid E′/E′` is equivalent to that of K/E from `E′F_avoid/E`, since `K′ ⊗_(E′) F_avoid E′ = K ⊗_E F_avoid E′`").

Claim: the displayed identity holds when `K ⊗_E E′` is a field, that is when `K` and `E′` are linearly disjoint over `E`; the section's hypothesis (`K` disjoint from `E′F_avoid` over `E`) gives it, but the Check is stated as a free-standing equivalence. Witness: `K = E′ ≠ E`, `F_avoid = E`: `K′ = E′`, the left side is `E′`, a field, so the `K′/E′` disjointness holds, while `K ⊗_E E′ = E′ ⊗_E E′` is not a field. Repair: begin the Check with "under the standing hypothesis that `K` is linearly disjoint from `E′F_avoid` over `E`".

## R04 (P3) — §§2.3–2.7 over an arithmetic base restate steps of ClassicalSerreModularity's I.0 route

Location: README line 546 ("the theorem over a geometric base is proved here from the reductions of §§2.2–2.7, which are stated for both kinds of base because their proofs do not depend on the kind").

Claim: ClassicalSerreModularity `I.0/moret-bailly-split-points` (its README line 402) owns the number-field proof, including the reduction by hyperplane sections to relative dimension one and the compactness of generalised Jacobians and idèle class groups; the arithmetic-base instances of §§2.3, 2.4, 2.6 and 2.7 are therefore planned twice, while only their geometric instances feed §2.8 here. (§2.5a's number-field form is the Lean headline and GlobalNumberFields Layer 6 on main omits the archimedean places, so it stays.) Witness: ClassicalSerreModularity README line 402 (`roadmaps show ClassicalSerreModularity`); §2.8's *Needs:* at line 719 cites §§2.4, 2.6, 2.7 without restricting the base. Repair: say in the Layer 2 introduction that over an arithmetic base these reductions are the supplier's and are not re-proved here, and write §2.8's *Needs:* as "§§2.4, 2.6, 2.7 over a geometric base".

## R05 (P3) — Bold markers inside a code span

Location: README line 1153 ("`**χ_(v,2)χ_(v,1)⁻¹|I_v=ε̄_l^n**`").

Claim: the asterisks inside the backticks render literally. Repair: delete them.

## Repairs of the previous review

- R01 (P2, Moret-Bailly and controlled residual potential modularity): §2.8 (line 716) now consumes ClassicalSerreModularity `I.0/moret-bailly-split-points` for the number-field case and keeps the geometric base ("R the coordinate ring of a smooth connected affine curve over a finite field", which is Moret-Bailly II 1.1, `moret-bailly-1989-II` line 29) as its own target; §2.9 derives split-field density from the supplier with `L_v = K_v`, `Ω_v = U(K_v) ∩ W_v`; §2.10 is a comparison with Checks; §2.13 consumes the linear-disjointness refinement; §2.16 names `I.0/soluble-totally-real-base-change` for the totally real form; §4.13 consumes `I.0/controlled-residual-potential-modularity` with its four controls and §4.14 keeps only the ordinary refinement (which the supplier does not state; Khare–Wintenberger Annals Theorem 2.1 (i)–(ii), `kw-annals-2009` lines 216–229, carries it); §6.1 exports the supplier's controls; the Scope table (line 21) and the Lean docstring name the supplier; `maximalSplitExtension` and `splitField_points_dense` are gone (`grep -c` of both names in `Suggested.lean` is 0). The three slugs exist at the head of ClassicalSerreModularity (README lines 390, 402, 413) and its *Needs:* lines (415, 1279) cite no section of this roadmap, so the consumption creates no cycle; `depcheck` is clean. Repaired.
- R02 (P2, Böckle's criterion): §10.2 (line 1635) consumes DeformationAndDerivedPatchingAlgebra §3.5 (its README line 656 at the head of #1034: `A` complete local CM, `B = A[[X]]/(f)` nonzero, `dim B ≤ dim A + r − t` ⇒ equality and regularity, flat when `dim(B/m_A B) ≤ r − t`) with the specialization spelled out; I recomputed it: `dim R ≤ 1 ≤ 1 + n − m` gives `dim R = 1 + n − m`, hence `m = n`; the closed fibre is nonzero (Nakayama, `R` finite over `O`) and finite over `k`, so `dim R/πR = 0 = n − m` gives flatness; the second application over `k` makes `(π, f)` regular; a nonzero flat `O`-module is torsion-free so `R[1/π] ≠ 0`. ClassicalSerreModularity I.2 is cited for Böckle's form. `Presentations.finite_presentation_complete_intersection` is gone. Repaired.
- R03 (P3): §13.1's *Needs:* (line 1931) now cites "AlgebraicModularFormsAndSerreWeights §4.12 (Fontaine–Laffaille weights)" and "§4.2 (the tame weight table)"; those headings are at lines 1153 and 967 of that README at the head of #928, and its line 18 declares R15.4 as the alias of Layer 4, so the resolver's "no R15.4" lead is false. Repaired.
- R04 (P3): line 595 adds "Remarque 1.9, p. 184". Repaired.
- R05 (P3): line 1963 drops EllipticCurveModularityPartIIGL2TypeAbelianVarieties and names CrystallineLocalGlobalCompatibilityCM §§2.12–2.16, PeriodsAndSpecialValues §§1.6–1.7 and 1.15, EllipticCurveModularityImaginaryQuadratic Layer 1 and §§2.12–2.16; `roadmaps grep` confirms each (CrystallineLocalGlobalCompatibilityCM README lines 27, 137, 1753; PeriodsAndSpecialValues line 146; EllipticCurveModularityImaginaryQuadratic lines 144, 385). Repaired.
- R06 (P3): §6.2 (line 1348) now concludes "`L′/E′` linearly disjoint from `F_avoid E′/E′`" with the route (Weil restriction of the `G`-cover base, complete splitting at places of `E′` whose Frobenius classes generate the Galois closure of `F_avoid E′/E′`). This is a variant of the requested form and is correct: linear disjointness of `L/E` from `E′F_avoid/E` (what Calegari's Proposition 3.2 gives) implies it, since `L ⊗_E E′F_avoid` a field makes `L ⊗_E E′` a domain, hence the field `L′`, and `L′ ⊗_{E′} E′F_avoid = L ⊗_E E′F_avoid`; and the stated splitting condition gives `L′ ∩ N = E′` for the Galois closure `N`, hence the disjointness. The source's statement (2) is still a misprint (below). Repaired.
- R07 (P3): §8.4 (line 1471) states that on the finite-level range with `l` split and trivial Iwahori characters the construction in (2) is ClassicalSerreModularity `R33.1/global-arithmetic-action` (its README lines 1273–1278: `ρ_𝔪 : G_F → GL₂(𝕋_𝔪)` on the definite unitary group in two variables with its `𝒢₂`-prolongation), the Scope row and the *Needs:* cite it, and (3) stays here. Repaired.

The rest of the 176-line change is the Summary and Scope wording, the Layer 2 and Layer 4 introductions, the Conditional-inputs sentence on §4.14, the §4.13/§4.14 Checks, and the Lean docstring; I read every changed line.

## Verified sound

**Gate and dependency check.** The worker's gate at d54b60d passes every check (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … build=0 OK`). I re-ran the dependency check:

```
depcheck: 205 roadmaps, 1452 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge order lists DeformationAndDerivedPatchingAlgebra at 58, ClassicalSerreModularity at 150, GL2ModularityLifting at 155 and this roadmap at 156. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. Pins: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`. My own scan of the README's own-section *Needs:* edges (103 sections, 197 edges): every cited own section exists; the one self-edge and two forward edges are R01 and R02.

**Lean.** `lake env lean` on a scratch copy of `Suggested.lean` with `#check @additiveStrongApproximationAwayFromPlace` appended: `sorry` is the only warning for the file; the elaborated type carries `[Field K] [NumberField K]`, `w : TauCeti.GlobalNumberFields.Place K` (a `Sum` of `HeightOneSpectrum (𝓞 K)` and `InfinitePlace K`, as the `Sum.inl`/`Sum.inr` hypotheses show), the finsets `S`, `T`, `harch`, the opens and their nonemptiness, exactly as README §2.5a states them; no section binder is lost. One-tactic probes on copies of the theorem: `simp` leaves the goal unsolved, `aesop` fails after exhaustive search, `exact?` finds only the theorem itself. No padding. Single `import Mathlib` plus one existing `TauCeti.*` module, no `set_option`, no sorried data, no `lemma`. The worker's `signatures.md` lists a declaration "over" at line 15 with a parse error at line 65: that is its scanner matching the docstring words "theorem over number fields" at line 15; the file itself elaborates cleanly, and the targeted build passed in the gate.

**Headline coverage.** The README's headlines are the geometric integral-point theorem (§2.8), additive strong approximation away from one place (§2.5a), the Layer 1 monodromy and density-one theorems (§§1.17–1.21), Taylor's and Snowden's residual theorems and given-lift potential modularity (§§4.7, 4.8, 4.12, 4.15, 4.16, 5.1), global-ring finiteness (§§8.2, 8.7), prescribed lifts (§10.4), families through lifts (§§12.4–12.5) and linked-system transfer (§13.3). §2.5a is statable and stated. The docstring names each unstatable headline and its missing carrier (Skolem data and the local analytic topology on scheme points; the finite-flat-boundary relative Picard sheaf; compatible-system data, Weil–Deligne parameters and labelled Hodge conditions; Hilbert moduli, automorphic Galois realizations, Hecke algebras and deformation problems), none of which exists in Mathlib `6b7abb3c` or Tau Ceti `a91d3aaf`, and names the suppliers of the consumed headlines. No statable headline is absent and none is forced through a stand-in.

**Ownership.** `roadmaps grep -i skolem` over the 433 open pull requests and main hits only Skolem–Noether (AbelianSchemesAndArithmeticModuli, SemisimpleAlgebras) outside this roadmap and ClassicalSerreModularity; no roadmap other than ClassicalSerreModularity plans Moret-Bailly's theorem, and none plans it over a global function field, so §2.8's geometric case and §§2.21–2.23 are owned here (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower cites §§2.23 and 4.15 as a consumer). ClassicalSerreModularity line 78 names this roadmap's Layer 2 as a consumer of `I.0/moret-bailly-split-points`, line 80 lists the I.2–I.3 consumptions. The ordinary refinement of §4.14 (both Hilbert witnesses ordinary above `p` when `ρ̄` is) is in Khare–Wintenberger Annals Theorem 2.1 but not in ClassicalSerreModularity's I.0 statement, so it is correctly kept here.

**Cross-roadmap citations resolved this round** (each at the cited roadmap's current head): ClassicalSerreModularity `I.0/soluble-totally-real-base-change` (390, with `E_v = K_v` on `S ∩ S′` as §2.16 says), `I.0/moret-bailly-split-points` (402: separated geometrically irreducible `X` of finite type, Galois-stable opens of smooth points, the Galois refinement when all `L_v = K_v`, the totally real refinement, the linear-disjointness refinement with Lang–Weil and Hensel for the added places, exactly as §§2.8–2.10, 2.13 restate them), `I.0/controlled-residual-potential-modularity` (413: the hypotheses, (i)–(iii) and the Annals form as §4.13 restates them), I.2 (503), `R33.1/global-arithmetic-action` (1273–1278); DeformationAndDerivedPatchingAlgebra §3.5 (656); AlgebraicModularFormsAndSerreWeights line 18 (R15.4 alias), §4.2 (967), §4.12 (1153); AutomorphicGaloisRepresentationsPartII AG2.0 `AlgHeckeChar.galoisChar`, `hodgeTate_galoisChar` (752–754, so the resolver's leads are false); consumers CrystallineLocalGlobalCompatibilityCM, PeriodsAndSpecialValues, EllipticCurveModularityImaginaryQuadratic as above. Tau Ceti at the pin: `TauCeti/FieldTheory/FunctionField/Consequences/StrongApproximation.lean` line 88 (`exists_forall_mem_valuation_sub_le_and_forall_mem_integers`, so README line 653's module path is right and the resolver's lead is false), `HeckeCharacter/Purity.lean` lines 112 and 136, `Global/Places/Basic.lean` (`Place`).

**Seeded source sample.** Cache texts are cited as `<source id> line N`.

| Target | Source and locator | Result |
| --- | --- | --- |
| 1.16 | BLGGT v1 §5.4 (1)–(9), pp. 61–63 (`blggt-2014` 2785–2878) | ring, `tr_σ`, `dim`, pairing with `Σn_i²` and the `dim ≥ 0 ∧ (A,A) = 1` criterion, product along a Zariski-dense map, `conj`, `res`, `ind` with (a)–(f), `L^S` with `L^S(ind A) = L^{S′}(A)`: match item by item |
| 2.4 | MB II Lemme 2.2, Lemme 2.3 and 2.4, pp. 185–186 (`moret-bailly-1989-II` 196–239) | one-dimensional `T` quasi-finite surjective meeting each `Ω_v`; `T_K` finite; geometrically irreducible hypersurface through `T_K` regular there by Jouanolou; smooth-point opens; completeness unchanged; induction to relative dimension one: matches |
| 2.18 | BLGHT Prop. 6.2, pp. 40–41 (`blght` 1442–1480) | `S = S₁ ⊔ S₂ ⊔ S₃`, `M` split at `S₁` unramified at `S₂`, `T/M` smooth geometrically connected, `L/F` Galois disjoint from `M`; `F′ ⊇ M` Galois disjoint from `L` with the local conditions: matches (source misprint below) |
| 2.22 | BHKT Prop. 9.2 (`bhkt` arXiv v2 2346–2364) | Galois `K′/K` disjoint from `L`, `K′ ∩ F̄_q = F_q` (two places of coprime residue degree), `𝔽_q`-embedding `β`, `β*ψ` `H`-conjugate to `φ|Γ_{K′}`: matches; published page not checked (below) |
| 3.1 | Taylor FM Lemma 1.1, printed pp. 7–9 (`taylor-2002-fontaine-mazur` OCR 250–301); Taylor Artin II Lemma 2.1 (`taylor-artin-II` 374–387) | hypotheses and conclusion as stated; the congruence step is Chevalley's lemma (`K_S^× ∩ U ⊂ (K^×)^n`): matches |
| 3.2 | Taylor FM standing hypotheses and choice of `p`, printed pp. 6–7 (217–249); Corrections first bullet, p. 776 (`taylor-2006-meromorphic-continuation` 2164–2165) | insoluble image, local shape, oddness; `p` odd `≠ l`, unramified with distinct Frobenius eigenvalues, split in the Hilbert class field of `N₀`, prime to `β_v − β_v^c`; `det ρ̄ = ε̄` from the correction; the extra conditions (`p > 3`, the determinant field, `p ∤ q_v − 1`) are the roadmap's own, stated as such: matches |
| 4.1 | Taylor FM Lemma 1.5, printed pp. 14–15 (454–491) | `v` unramified, `χ_v²|I = ε̄^n`, `0 ≤ n < l−1`, `n ≠ 1` if semisimple; ordinary shape with tamely ramified lift; the `ω^{−1}` subquotient argument: matches |
| 4.2 | Taylor 2006 Lemma 1.3, pp. 740–741 (569–610); `ρ_𝔪`, p. 742 (655–670) | `k_σ ≥ 2`, `w = k_σ − 1 + 2w_σ` constant, `ψ = Na^{1−w}` on an open subgroup; parts 1–4 (reduced-norm functions and characters `χ² = ψ` at weight 2); `ρ_𝔪` with `tr = T_x`, `det = ε(ψ∘Art⁻¹)`, generation by `U_{ϖ_x}` and `T_x`: matches |
| 4.8 | Taylor 2006 Prop. 4.1, pp. 755–756 (1254–1266); `p₁, p₂` (1285–1297); Lemmas 4.4–4.5 and end of proof, pp. 761–763 (1494–1575) | hypotheses, `F` even degree with `l` split, weight two, WD inertia `ω₂^{k−(l+1)} ⊕ ω₂^{lk−(l+1)}`; `B/F` with `B[λ] ≅ ρ̄`, unramified at `p₁`, ordinary `T_{℘₁}B`: matches; `p₁ > 3` is the roadmap's addition for §4.5 |
| 4.9 | Taylor 2006 Lemma 5.1, Cor. 5.2, pp. 765–767 (1706–1808) | injection `κ_x` equivariant for `T_y, S_y, U_{ϖ_x}` with composite `V_{ϖ_x}`; surjection to weight `i+2`; nonvanishing when `V_{ϖ_x}` lies in every maximal ideal above `𝔪`, sufficient condition on the residual shape: matches |
| 4.12 | Taylor 2006 Thm 5.7, pp. 770–771 (1922–1942); Khare level one §2.1, p. 10 (`khare-level-one` 417–426); DDT Lemma 4.11 (`ddt` 4422–4432) | `l > 3`, irreducible odd with irreducible `ρ̄|G_l`; `F` even degree with `l` split, weight `k_ρ̄`, unramified at every finite place; the `l = 3` auxiliary prime via DDT 4.11 (`d = 2` clause): matches |
| 4.13 | KW II Thm 6.1, pp. 53–54 (`kw-serre-modularity-II` 2463–2496) | hypotheses; `F` even degree unramified at `p`, split if `ρ̄|D_p` irreducible, image preserved, cyclotomic irreducibility; (i) when `k = 2` if `p = 2`; (ii); controls (iii) a–d; dihedral split-prime condition: matches ClassicalSerreModularity 413 and §4.13 |
| 4.14 | KW Annals Thm 2.1, p. 234 (`kw-annals-2009` 216–229) | odd `p`, `k ≠ p`; witness (i) unramified at all finite places of weight `k`, (ii) weight two with conductor dividing `v`; both ordinary above `p` when `ρ̄` is ordinary: matches |
| 8.5 | Thorne 2012 "Another patching argument", Thm 8.6, Cor. 8.7, pp. 48–53 (`thorne` 2049–2093, 2265–2268); Cor. 6.9 (1754); Geraghty Thm 4.3.1 (`geraghty-ordinary` 2294–2300) | `T = R ∪ S_l ∪ {v₁}`, assumptions (i)–(iv), Iwahori at `R ∪ {v₁}`, no `l`-torsion, Ihara-avoidance, Geraghty ordinary and unipotent rings; conclusion and `Λ`-finiteness; `μ_m ≡ n mod 2`: matches (source misprint below) |
| 10.9 | KW I Thm 5.1(4) and remarks, pp. 9–10 (`kw-serre-modularity-I` 398–429); KW II §10.3.1 (4234–4242) | `p ∣ q+1`, level-two `p`-power characters, dyadic parity `i + j` even, `r = 1` exclusion at `p = 2`, Diamond's list: matches |
| 13.2 | KW I §5, p. 8 (288–326); DP Paso 5, p. 14 (`dieulefait-pacetti` 637–655) | almost-strict: (ii)b only away from `l`, at `l` the residual-irreducible geometric clause and the `l ≠ 2` unramified crystalline clause; DP: a reducible residual member at the good-dihedral prime leaves only de Rham: matches |

Also read: Moret-Bailly II 1.1–1.3 (`moret-bailly-1989-II` 26–60: the geometric case is a smooth connected affine curve over a finite field, as §2.8 says); BCGP Prop. 9.1.12 and proof (`bcgp-published` 11986–12007) for §6.2.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.5a Lean headline | `K = ℚ, w = ∞, S = T = ∅`; `w = 2, S = ∅, T = {∞}, V = (1/4, 3/4)`; no omitted place | `x = 0`; `x = 1/2 ∈ ℤ[1/2]`; `ℤ ∩ (1/4, 3/4) = ∅` | true as stated; `harch` needed | none |
| §1.16 pairing criterion | `A = 0`; `A = −[V]`; `2[V₁] − [V₂]`; `3·1 − ε` on `C₂` | `(0,0) = 0`; `(A,A) = 1` with `dim < 0`, excluded; `(A,A) = 5`; `dim 2`, `(A,A) = 10` | `dim > 0` here ⇔ BLGGT's `dim ≥ 0` given `(A,A) = 1` | none |
| §1.16 induction | `[F′:F] = d`, `A = [1]` | `dim ind[1] = d`; `(ind 1, 1) = (1, res 1) = 1` | (8b), (8d) | none |
| §2.4 Jouanolou | `dim X_K = 0, 1, ≥ 2` with `T_K` finite | isomorphism; no hypersurface step; `codim T_K ≥ 2` | matches MB 2.3–2.4 | none |
| §2.18 Weil restriction | `M = K`; `[M:K] = 2`, `v` split, two different opens | recovers §2.17; `(Res T) ⊗ K̄ = T^{σ₁} × T^{σ₂}`, `(Res T)(K_v) = T(M_{w₁}) × T(M_{w₂})` | Checks correct | none |
| §2.22 constant field | split places of residue degrees 2 and 3; only even degrees | `gcd(2,3) = 1` kills the constant extension; `𝔽_{q²}K` would survive | matches BHKT 2358 | none |
| §3.1 determinant | `ψ = 1`, `n = 0` | `det Ind 1 = δ_{L/K}`, `= −1` at `c` since `L` is totally imaginary | consistent with `φ` odd | none |
| §3.2 constants | `l = 5` | `ζ` of order 4; `a² − a + 5 = 0`, `a a^c = 5`, `a ≡ 1 ⇒ a^c ≡ 0 mod λ₀`; `X² + X + 1`, disc `−3 ≡ 2` a nonresidue mod 5, `M³ = 1` | Checks correct | none |
| §4.1 exclusion | `l = 5`, semisimple | `n ∈ {0, 2, 3}`; `n = 1` gives the `ω^{−1}` ambiguity | matches Lemma 1.5 | none |
| §4.2 weights | parallel 2; parallel 3 | `w = 1`, `ψ` finite order on an open subgroup; `w = 2`, `ψ = Na^{−1}`; reduced-norm functions are `D_∞^×`-invariant so vanish for `k > 2` | matches Lemma 1.3 | none |
| §4.8 WD inertia | `k = 2`; `k = l` | `{ω₂^{1−l}, ω₂^{l−1}}`; `{ω₂^{−1}, ω₂^{−l}}` using `l(k−l−1) ≡ lk−l−1 mod l²−1` | Frobenius-conjugate pair | none |
| §4.9 filtration | dimensions | `(i+1) + (l−i) = l+1 = [GL₂(𝔽_l) : B]` | consistent | none |
| §4.12 `l = 3` | `χ = ε̄₃`, `g ∉ ker χ` | `(1 + χ(g))²/χ(g) = 0`, DDT 4.11 `d = 2` clause | Check correct | none |
| §4.13 vs KW II 6.1 | `p = 2, k = 4`; controls a–d | (i) not asserted; four controls match (iii) a–d | matches ClassicalSerreModularity 413 | none |
| §4.14 refinement | `ρ̄` supersingular at `p` | refinement empty; KW-Annals 2.1 (i)–(ii) carry the ordinary clause, the supplier does not | owned here | none |
| §8.5 counts | `n = 2` | `g = q − [L⁺:ℚ] − [L⁺:ℚ](1 − (−1)^{μ_m})`; `l^N > 2`; `μ_m ≡ n ≡ 0 mod 2` | matches Thorne 8.6, Cor. 6.9 | none |
| §8.5 adequacy | `l = 3`, `PSL₂(𝔽₃) ≅ A₄`; `l = 5`, `PSL₂(𝔽₅) ≅ A₅` | `3 ∣ 12`, `5 ∣ 60` | not adequate, Checks correct | none |
| §10.9 | `p = 2, q = 7, (6, 0)`; `p = 2, q = 5` | `ord ω_{7,2}^6 = 48/6 = 8`, `6·7 = 42 ≢ 6 (48)`; `v₂(6) = 1 ⇒` none | matches KW I remarks | none |
| §10.2 specialization | `n = m = 0`; `m < n` | `R ≅ O`; `dim R ≤ 1 < 1 + n − m` contradicts the supplier's equality, so no such finite nonzero `R` | consistent | none |
| §13.2 | KW I clauses | residual-irreducible ⇒ (ii)b; `l ≠ 2` and `r_q` unramified ⇒ crystalline; otherwise only de Rham (DP Paso 5 (1)) | matches | none |
| §2.10 | `X = Spec K`; conic `x² + y² + z² = 0` over `ℚ`, `S = {∞}`; compositum | dense; `X(ℝ) = ∅`; `K_v ⊗ E₁E₂` a quotient of `K_v^{n₁n₂}` | Checks correct | none |
| §6.2 conclusion | `L/E` disjoint from `E′F/E` | `L ⊗_E E′F` field ⇒ `L ⊗_E E′ = L′` field ⇒ `L′ ⊗_{E′} E′F = L ⊗_E E′F` field | stated conclusion follows from the proof | none |
| §6.2 trivial-`G` Check | `K = E′ ≠ E`, `F_avoid = E` | left side `E′` a field; `E′ ⊗_E E′` not a field | equivalence needs `K ∩ E′ = E` | R03 |

## Not verifiable

- Thorne 2017 (Math. Z. 285; §7, Propositions 7.1–7.2 and Corollary 7.3, cited in §8.5): not in the cache (the Cambridge repository answered HTTP 500 in the previous round). The rank-two adequacy clauses were checked against Thorne 2012 Corollary 6.9 and Theorem 8.6 instead.
- BHKT published pagination (§2.22 "published p. 78"): the cached published copy is the four-page abstract; the statement was verified at arXiv v2 (`bhkt` 2346–2364), the page was not.
- Larsen 1995, Sen 1973 (§§1.12–1.13, 1.17, 1.20), Skinner–Wiles Duke 107 (§§4.4, 4.6), Savitt's corrigendum (§12.4): paywalled or unreachable, as in the previous rounds; not in this round's sample.
- Geraghty §2.7 and §3.1 (§8.4), Snowden Proposition 5.3.1 (§3.5): in the cache but not re-read this round (not sampled).

## Source issues

- **Misprint** in blght at Proposition 6.2, printed p. 40: the hypothesis on the places of `S₂` says they are unramified "in `S₂`"; it should say unramified in `M`; affects nothing.
- **Misprint** in thorne at the proof of Theorem 8.6, printed p. 49: the generator count `g = q − q₀` is displayed with a plus sign before the second summand of `q₀`; it should be a minus; affects nothing (the proof uses `q₀`).
- **Misprint** in bcgp-published at Proposition 9.1.12(2), printed p. 458: the source says `L′/E` is linearly disjoint from `E′F(avoid)/E`, impossible when `L′ ⊇ E′ ≠ E`; it should say `L/E` (equivalently `L′/E′` from `E′F(avoid)/E′`); affects nothing (Lemma 9.2.7 uses only `K`).
