# Review of PotentialAutomorphyInfrastructure (pull request #1081 at 5b4ff38)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md` (2671 lines), `TauCetiRoadmap/PotentialAutomorphyInfrastructure/Suggested.lean` (36 lines, no declarations), `metadata.toml`. The gate fails on one rule (residue, 154 hits, all `<a id=…>` anchors); every other gate check is 0 and the targeted build passes. The diff outside the roadmap folder is empty. The roadmap sits at position 173 of the merge order, after IgusaVarietiesAndTorsionConcentration (167); the dependency check reports no UPWARD or CYCLE line (output below), also on a scratch copy with every supplier abbreviation (ALS, AS, SR, FF, AC, PH, AG, IHG, LGD, GGD, DP, CS, AGR, PF, ET, AL, RG) spelled out.

Source ids used below (worker cache): `acc` = ACC published Annals text (printed page = PDF page + 896), `kt` = Khare–Thorne arXiv 1409.7007v2 (same manuscript pagination as the Cambridge copy, §5 on pp. 25–27), `geraghty2010` = the March 2010 manuscript, `bcgp`, `bcgnt`, `qian` = arXiv 2104.09761v1 (the journal PDF could not be fetched: par.nsf.gov timed out three times), `chenevier` = arXiv 0809.0415v2, `blggt` (arXiv 1010.2561v4) and `blggt-published` (Annals PDF; printed = PDF + 500), `nt16`, `zelevinsky` (numdam; printed = PDF + 163), `larsen`, `larsenpink`, `era979` (numdam; printed = PDF − 3), `cs-noncompact`, `scholze-torsion`, `scholze-llc`.

## R01 (P2) — `NonabelianGaloisH1` (§2.10) re-plans a carrier that AnabelianGeometryAndNonabelianChabauty owns

Location: README line 993, "Define `NonabelianGaloisH1` for a profinite group `Γ` acting continuously by automorphisms on a discrete group A. Its elements are continuous functions … modulo the equivalence …"; API at line 995; Checks at lines 999–1001; Scope at line 21 ("use a different carrier, specified in Layer 2").

Claim: continuous nonabelian 1-cocycles of a profinite group with discrete coefficients, their gauge classes as a pointed set, functoriality in the coefficients, and the comparison with abelian continuous cohomology are targets of this roadmap.

Witness: AnabelianGeometryAndNonabelianChabauty, which precedes this roadmap in the merge order, owns exactly these objects: its Scope says it owns "continuous nonabelian cocycles and their gauge quotient, compatible-pair maps", and its Layer 0 has §0.1 "Continuous cocycles and H¹" (a topological group acting on a topological group, the cocycle subtype, the trivial cocycle, the gauge-class pointed set, `c(1) = 1`), §0.2 "Comparison with abelian continuous cohomology", §§0.3–0.4 "Coefficient maps on cocycles / on H¹", §0.8–0.9 twisting and inner twists, and §0.18 "Compact sources, discrete coefficients and the finite-quotient colimit". Every API item of `NonabelianGaloisH1` (`cocycle_one`, `class_eq_iff`, `map`, `abelian_agreement`) is the discrete-coefficient instance of one of these.

Repair: delete the definition, its API list and its three Checks (lines 993–1001); add a row for AnabelianGeometryAndNonabelianChabauty §§0.1–0.4, 0.8–0.9 and 0.18 to the supplier table, stating that `H¹(k, H)` is its gauge-class pointed set with `Γ = Gal(k̄/k)` and `A = H(k̄)` discrete; rewrite the Scope sentence at line 21 as a deferral to that roadmap; in `pgl2_product_forms` replace the *Needs:* item `NonabelianGaloisH1` by that section citation (the Platonov–Rapinchuk–Rapinchuk classification of forms then stays a target here, applied to the imported pointed set). The fixed §2.10 then consists of `pgl2_product_forms` only.

## R02 (P3) — gate: 154 anchor tags

Location: README lines 261, 284, 308, … (every `### k.n` target) and the `<a id="source-…">` lines in References; the in-text links `[ACC](#source-acc)` depend on them.

Claim: the residue rule forbids `<a id=` anchors; the gate fails on this rule alone (`residue=154`).

Witness: `gate.md` lists the 154 lines; the board reads `### k.n` headings and the gate flags every anchor.

Repair: delete every anchor line; write source links as plain source keys ("ACC, §4.3, Definition 4.3.5, p. 974") and cross-references by section number. No other gate rule fires after this.

## R03 (P3) — 129 backticked Lean names of the roadmap's own are not declared in `Suggested.lean`

Location: every API bullet and most Checks, e.g. line 344 `IntegralDualWeylModule.free`, line 1342 `ArithmeticOrdinarySummand.operator_bijective`, line 2006 `IotaOrdinary.gl_one`, line 2301 `TaylorWilesSelectedIdeals.rank_two_second`; and line 7, "Lean names in the layer targets specify the intended Tau Ceti library interfaces."

Claim: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; the Lean file declares nothing (correctly, see Verified sound), so all 129 names in `citations.md` are undeclared, and Checks additionally must not name a Lean counterpart.

Witness: `Suggested.lean` lines 32–34 (namespace opened and closed with no declaration); `citations.md` lists the 129 names.

Repair: write the API bullets and Checks as prose (keep the content, drop the backticked names, or keep names only in code spans that are explicitly "intended names", which the house rules do not allow); delete the sentence at line 7 that announces the convention. The README-level content is right; only its form violates the README/Lean agreement rule.

## R04 (P3) — supplier declaration and section names that do not exist where they are cited

Location and witness, one per item:

- line 446, `Spherical.IsGaloisType` "used by ALS.4.12–ALS.4.13": ArithmeticLocallySymmetricSpaces defines `LocallySymmetric.IsGaloisType` (its ALS.4.12, "Define LocallySymmetric.IsGaloisType"); no `Spherical` namespace exists there.
- line 200, `SmoothRep.instIsGrothendieckAbelian`: SmoothRepresentationsOfLocalGroups SR.0d.1 names the declaration `SmoothRep.grothendieck`.
- line 202, `SmoothRep.frobeniusReciprocity`: SR.2.1's target is *frobenius-reciprocity* and names Mathlib's `Rep.indResAdjunction` for the compact-induction half; it declares no `SmoothRep.frobeniusReciprocity`.
- lines 234 and 802, `cht_character_extension` attributed to PotentialModularityAndCompatibleSystems §2.15: that section ("Extending finite local characters") imports `finite_hecke_full_local_prescription` from GL2AutomorphicRepresentationsAndTransfer §R16.1.8 and declares no `cht_character_extension` (the name occurs only in this README and in CrystallineLocalGlobalCompatibilityCM).
- line 208, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`: AG2.4's targets are "HLTT existence over arbitrary CM and totally real fields", "HLTT ordinary boundary geometry", …; no target carries that slug.
- line 2348, "the kernel of its action on cohomology is nilpotent (IHG §2.2)": IntegralHeckeAndGaloisDeterminants §2.2 is "Ghosts and local factors"; the invertible/nilpotent splitting statements are in §2.3 ("Operator localization and ordinary parts"), and §2.1 ("Hecke images in the derived category") carries the derived-image definition.
- line 1246, "a separate large-image argument is required from AbelianSurfacesPotentialModularity": no roadmap of that name exists on main, in the merge order or among the open pull requests; the open folder is AbelianSurfacesModularity.

Repair: use the supplier's actual names and sections (`LocallySymmetric.IsGaloisType`, `SmoothRep.grothendieck`, SR.2.1 *frobenius-reciprocity*, `finite_hecke_full_local_prescription` via CS §2.15, AG2.4 "HLTT existence over arbitrary CM and totally real fields", IHG §2.1/§2.3, AbelianSurfacesModularity), and keep every such name resolvable at the cited head.

## R05 (P3) — Chebotarev is cited from a roadmap in another author's open pull request although the pinned Tau Ceti library proves it

Location: lines 19 ("**Chebotarev** supplies the Dirichlet-density Chebotarev theorem (Layer 10)"), 154 ("Tau Ceti Chebotarev L10: `Chebotarev`, Layer 10"), and the *Needs:* lines of §§2.1, 2.3, 2.14, 5.13.

Claim: the citation presents Chebotarev as a Tau Ceti/main roadmap; it is a folder of kim-em's open pull request #1187 (its Layer 10 "Dirichlet-density Chebotarev" exists), not on main and not in the merge order.

Witness: the pinned library already has it: `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` (Dirichlet density `#C/#G` of the Frobenius fibre of a conjugacy class for a finite Galois extension of number fields) and `NumberField.Chebotarev.infinite_frobeniusPrimeSet` in `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean` at the pin, plus `hasDirichletDensity_splitCompletely`.

Repair: move Chebotarev to the "From Tau Ceti" contract with these declaration names and file, and make the four *Needs:* lines cite them; drop the roadmap citation.

## R06 (P3) — §3.41a locator

Location: line 1923, "applying Geraghty 2019, Lemma 5.4; Geraghty, 2010 manuscript, Lemma 5.1.1, p. 59".

Claim: the semisimplicity of the rational ordinary Hecke algebra is attributed to the 2010 manuscript's Lemma 5.1.1.

Witness: `acc` line 5123 cites Ger19 Lemma 5.4 for the semisimple algebra; in the 2010 manuscript that statement is Lemma 5.1.3(2), "the space `(ι⁻¹π_v)^ord` has dimension at most 1" (`geraghty2010` lines 2653–2656, p. 60); Lemma 5.1.1 (p. 59) is the Jacquet-module surjection used in §3.46. The numbering shift Definition 5.1.2 → 5.3, Definition 5.1.4 → 5.5, Lemma 5.1.5 → 5.6, Lemma 5.1.6 → 5.7, which the README itself records, puts 2010 Lemma 5.1.3 at 2019 Lemma 5.4.

Repair: cite Lemma 5.1.3(2), p. 60.

## R07 (P3) — §2.2a locator

Location: line 872, "Scholze LLC, Theorem 12.1(v), pp. 30–31".

Claim: part (v) of Scholze's Theorem 12.1 gives `σ(Π) = σ(π)|_{W_{F′}}` for the base change of a supercuspidal π along a cyclic prime-degree extension.

Witness: `scholze-llc` lines 1461–1465, p. 30: part (iv) is the base-change statement; part (v) says an unramified `σ(π)` forces an Iwahori-fixed vector.

Repair: cite Theorem 12.1(iv), p. 30.

## R08 (P3) — §0.6 keeps a strict bound the statement does not need

Location: line 373, "`λ₁ − λₙ + n − 1 < p` … Then `V_λ ⊗ k` is simple and `Hom_O(V_λ, O) ≅ V_{λ^∨}`"; Check at line 357, "This endpoint is permitted by the closed-alcove API even though it fails the strict inequality of `dual_weyl_bottom_alcove_duality`."

Claim: the duality needs the open bottom alcove.

Witness: the route (line 377) uses Jantzen II.5.6, which holds on the closed alcove `≤ p`, then Nakayama; at the endpoint `GL₂`, `λ = (p−1, 0)`, the natural map `Sym^{p−1}(ℤ_p²) → Γ^{p−1}(ℤ_p²)` has determinant `∏_{a=0}^{p−1} a!(p−1−a)!`, a `p`-adic unit, so `Hom_O(V_λ, O) ≅ V_{λ^∨}` holds there too; only `λ = (p, 0)` (determinant divisible by `p` through `0!·p!`) fails. The consumer §1.12 only needs the strict form, so this is a P3 note, not an overclaim.

Repair: state the hypothesis as `λ₁ − λₙ + n − 1 ≤ p` (the closed-alcove API of §0.4) and turn the endpoint into a positive Check, or keep the strict form and say that the endpoint is excluded by choice.

## Verified sound

**Gate and build.** Gate at 5b4ff38: all checks 0 except residue=154 (R02); `lake env lean` on `Suggested.lean` from the worktree exits 0 with no output (2.8 s; the file has no declarations). Dependency check (verbatim): `depcheck: 205 roadmaps, 1442 edges, 0 problem(s)`; the same on the scratch copy with abbreviations expanded. Merge order: PotentialAutomorphyInfrastructure at line 173, every supplier named in a *Needs:* line is on main, earlier in the order, or (Chebotarev) an open-PR folder of another author (R05).

**Headline theorems and `Suggested.lean`.** Headlines read off the README: `fontaine_laffaille_automorphy_lifting` (§5.22), `ordinary_automorphy_lifting` (§5.23), `fontaine_laffaille_local_global` (§1.16), `ordinary_local_global` (§3.43), `ordinary_automorphic_galois_flag` (§3.48), `soluble_base_change_and_descent` (§2.3), `rank_two_large_residual_image` (§2.12), `siegel_coefficient_retract` and `coefficient_satake_descent` (§§0.9–0.10), `hida_weight_independence` (§4.5), `fontaine_laffaille_full_support` (§5.11). None is statable at the pins: they need cuspidal automorphic representations of `GLₙ(𝔸_F)` with `r_ι`, compatible systems, arithmetic locally symmetric spaces with their Hecke actions, smooth representations of `p`-adic groups with ordinary parts, or integral dual Weyl modules. Checked at the pinned Tau Ceti: `grep` for Hecke algebras finds only `KnotTheory/Jimbo`, `KnotTheory/TemperleyLieb` and finite-group files; `RepresentationTheory/ClassicalGroups/WeylModule/*` is over `[CommRing k] [Algebra ℚ k]` (`Basic.lean` lines 122, 421, 485), so supplies no `p`-integral lattice; no automorphic or smooth-representation module exists. The module docstring names each missing carrier per layer. The one-tactic padding probe and the `#check @name` comparison have no declaration to run on; the empty file is the correct form here. The combinatorial lemmas `shifted_partition_recovery` (§1.14) and `simple_galois_composita` (§2.13) are statable in Mathlib but are lemmas of the route, not headlines, so their absence is not a defect.

**Seeded sample, at the locators.**

- 1.1 Kostant representatives: `acc` lines 380–386 (p. 906) define `W^P` as `{w : w(X*(T)⁺) ⊂ X*(T)^{+,P}}`; `w^{-1}` increasing on both blocks is equivalent (take `λ` strictly decreasing). Lengths: `n=1` → 0,1; `n=0` → 0; block exchange → `n²`; `(0 1)` at `n=2` is not a shuffle.
- 1.5 CTG: `acc` lines 3133–3137 (Definition 4.3.5, p. 974): `λ_{w,τ} − λ^∨_{w,τc} ≠ (i₀,…,i₀)` with `λ^∨_{τ,i} = −λ_{τ,n+1−i}`, i.e. entry `i` pairs with `n+1−i`, which is the README's 0-based `(i, n−1−i)`.
- 1.12 Degree reflection: `acc` lines 3534–3556 (pp. 983–984): `n₀ = (2n+1−p)/2`, `𝔪^∨(ε^{−n₀})`, the map `[K^S g K^S] ↦ ε(Art_K(det g))^{−n₀}[K^S g⁻¹ K^S]`, `ρ = (f∘ρ′)^∨ ⊗ ε^{1−2n+(p−1)/2}`, with Propositions 2.2.21 and 2.2.23 and Jantzen II.5.6 as inputs: all as stated.
- 2.6 Fontaine–Laffaille base-change fields: `acc` lines 7108–7151 (pp. 1072–1073): the `E₀` conditions, `E_a` (2 and `p` split), `E_b = ℚ(√−p_b)` with `p_b ≡ 1 mod 4`, `p_b ≡ −1 mod l` on the old set, `E_c = ℚ(√−p_c)` with `p_c ≡ 1 mod 4p_b`, and the six displayed conclusions. The README's extra congruences at the split-test primes implement the source's first bullet, which its "for example" construction leaves implicit.
- 2.24 Rank-two member irreducibility: `bcgp` lines 12129–12133 (Lemma 9.1.10(1), p. 251) and 12147 (proof cites ACC Lemma 7.1.1).
- 3.3 Positive torus monoid: `acc` lines 3906–3931 (pp. 992–993): `T_n(F_p)⁺`, `T_n(O_{F,p})(b)`, the quotients, `u_p = (p^{n−1},…,1)`, `B_n(F_p)⁺`, the functorial map from `O⟦T_n(O_{F,p})⟧[U_{v,i}^{±}]` with `U_{v,i} ↦ diag(ϖ_v,…,ϖ_v,1,…,1)`.
- 3.9 Unipotent invariants acyclicity: `acc` lines 4009–4012 (Lemma 5.2.7(1), p. 995).
- 3.18 Finite ordinary weight control: `acc` lines 4187–4195 (Corollary 5.2.18, p. 1000), identical hypotheses and conclusion.
- 3.22 Unitary ordinary control: `acc` lines 4280–4288 (Proposition 5.2.28, p. 1003), identical.
- 3.33 Ordinary Bruhat piece: `acc` lines 4592–4602 (Proposition 5.3.8, pp. 1010–1011); the twist is `τ_{w^{-1}}`, the shift `−[F⁺:ℚ]n² + l(w)`.
- 3.41a Rational ordinary semisimplicity: `acc` lines 5120–5127 (pp. 1023–1024): torsion-freeness from Theorem 4.3.3, cuspidal computation from Theorem 2.4.11, semisimplicity from Ger19 Lemma 5.4 (= 2010 Lemma 5.1.3(2); R06).
- 3.48 Ordinary Galois filtration: `acc` lines 5299–5337 (Corollary 5.5.2, p. 1028): hypotheses, the characters `ψ_{v,i}` on units and on `ϖ_v`, and the proof by soluble base change splitting `S_p`, Ger19 Lemma 5.7 and Lemma 6.2.11.
- 5.3 Residual Iwahori Hecke algebra: `kt` lines 1136–1237 (pp. 25–27): `q ≡ 1 mod p`, `p > n`, `q^{1/2}` by Hensel, Lemma 5.1 (`H_B ⊗ k ≅ k[X_*(T) ⋊ W]`), Lemma 5.2 (`[K:B]^{-1}[K]` splits), the centre paragraph, Lemmas 5.3–5.4. The README's extra "splits into distinct roots in `k`" in part (5) is needed (Source issues).
- 5.7 Diamond-linear deformation Hecke map: `acc` lines 6873–6907 (Proposition 6.5.11, pp. 1066–1067): `δ`, `J`, `O[Δ_Q]`-linearity through `ψ_{v,i}`, Theorem 3.1.1 and Bellaïche–Chenevier Proposition 1.5.1.
- 5.21 Ordinary lifting descent: `acc` lines 7465–7590 (pp. 1081–1084): the `V₀, V₁, V₂`, `E₀`, `E_a E_b E_c`, auxiliary places, Theorem 6.6.2 over `E`, descent by Proposition 6.5.13 and Ger19 Lemma 5.7, Varma for `v ∤ p`.

**Other locators and hypotheses compared with the text** (statement read, hypotheses matched): ACC §1.2 (2.2.2) p. 918 (unitary row = `−reverse(λ_{τc})` then `λ_τ`); Lemma 4.2.2(1),(2) pp. 970–971 (`p ≥ 2n−1`); Lemma 4.2.3 p. 971 (`p > n²`, the `p = n²+1` collision); Theorem 4.2.1 p. 968; Theorem 4.3.3 p. 973; Proposition 4.3.4 p. 973; Lemma 4.3.6 and (4.3.7) p. 975; §4.1 pp. 965–966 (`ψ_a`, `M(a)`, `G^a`, `FL_τ`, interval `[a_τ, a_τ+p−2]`); Proposition 4.4.1 pp. 975–976; Proposition 4.4.6 pp. 979–980 (conclusion (c) multiset); Corollary 4.4.8 p. 981; Theorem 4.5.1 (1)–(8) pp. 967, 985; Lemma 4.5.2 p. 989; §5.1 pp. 989–991 (`K(b,c)`, `T^{S,ord}`, `U_v = U_{v,1}⋯U_{v,n−1}`, `χ_{λ,v,i}`); Theorem 5.5.1 p. 991; §5.2.1 Lemma 5.2.4 p. 992; Lemma 5.2.6 p. 995; Proposition 5.2.17 p. 1000; §5.3 pp. 1003–1004; Lemma 5.4.8 pp. 1015–1017 (`M > 16n`, rows, `X_i`, the `a_i` interval and `M/8 mod M/2`); Proposition 5.4.13 p. 1017; Lemmas 5.4.15–5.4.16 pp. 1019–1021; Proposition 5.4.18 p. 1022; Theorem 6.1.1 p. 1029 and the §6.5.1 hypotheses (1)–(17) pp. 1062–1063; §6.6.1 hypotheses (1)–(15) pp. 1074–1075; Theorem 6.6.2 p. 1075; Lemma 6.2.11 p. 1036; Proposition 6.3.8 and Corollary 6.3.9 p. 1052; Proposition 6.4.17 p. 1060; Lemma 6.5.2 p. 1062; Proposition 6.5.3, Theorem 6.5.4, Corollary 6.5.5 p. 1063; Lemmas 6.5.8–6.5.9 pp. 1065–1066; Proposition 6.5.13 pp. 1070–1071; Lemma 6.6.5, Corollary 6.6.6 p. 1077; Propositions 6.6.7, 6.6.9, Lemma 6.6.8 pp. 1078–1079; proof of Theorem 6.6.2 pp. 1080–1081 (`g = qn − n²[F⁺:ℚ]` at p. 1080); Lemmas 7.1.1–7.1.3 pp. 1086–1089 (`SL₂(𝔽_l)` on `G_{F̃}`), 7.1.4 p. 1089, 7.1.6 (`l > 2m+3`, part (3)) pp. 1090–1091, 7.1.7 p. 1091; Theorems 2.3.8 p. 939, 2.4.4 p. 945, 2.4.8 p. 946, 2.4.10 p. 948, 2.4.11 p. 951 (statements located by page; proofs not re-read). BCGNT: Definition 6.1.2(3) pp. 57–58, Lemma 6.1.4 p. 59 (hypotheses and proof via Varma as in §2.19), Lemma 6.1.5 p. 59, Remark 6.2.2 p. 60. Geraghty 2010: Lemma 5.1.1 p. 59, Definitions 5.1.2 and 5.1.4, Lemmas 5.1.3, 5.1.5 p. 60, Lemma 5.1.6 pp. 60–61. Qian arXiv v1: Definition 1.2 (ordinary of regular weight) pp. 1–2, Definition 1.3 and the remark after it p. 2, Theorem 1.4 p. 2 and its proof p. 26 (`F′ = L′LF^suff(ζ_N)`), Lemma 4.3 (`l > 2n+5`, part (4) = §2.15) p. 25, Lemma 2.4 (crystalline ordinarity criterion) pp. 9–10. Chenevier: §1.17 and Lemma 1.18 PDF p. 16, Theorem 2.12 p. 28, Theorem 2.22 p. 34, Example 2.32 p. 37. Newton–Thorne: §2.2.7 pp. 12–13, Proposition 2.10 p. 13, Corollary 2.11 p. 14, Theorem 4.2, Theorem 5.7. Larsen: Definitions 3.9–3.10 p. 22, Theorem 3.17 p. 25. Larsen–Pink: Definition 6.5 p. 14, Proposition 6.14 and (6.15) p. 15, Proposition 8.9 and Theorem 9.1 p. 18. ERA 979: Théorème 5.5 (Henniart's rational abelian classification) printed p. 48. Zelevinsky: Theorem 4.2 printed p. 184. BLGGT published: ι-ordinary p. 537, Lemmas A.2.1–A.2.2 p. 600, Corollary A.2.3 p. 601. Caraiani–Scholze: Theorem 1.1 p. 5, Remarks 1.4–1.5 pp. 5–6, Lemma 2.1.1, §2.8 pp. 33–35, Theorem 4.6.1. Scholze torsion: Theorems IV.1.1, IV.3.1, V.4.1, Corollary V.4.3 (arXiv numbering as cited). KT: §5 pp. 25–27.

**Supplier sections resolved at the open heads or on main** (every cited section exists, with the drifts of R04 excepted): ArithmeticLocallySymmetricSpaces ALS.0.11 (`LocallySymmetric.isNeat_of_two_proUnipotent`), ALS.1, 2.3, 2.4, 3, 4, 4.12, 4.13, 5a, 5a.1, 5b, 5b.4 (`FrankeInput`), 5b.7 (`GaloisInput`), 5b.8, 5b.9, `LocallySymmetric.ResidualUnitaryGaloisInput`; AutomorphicSpectralTheory 5.10 `franke_comparison`, 5.12 `franke_schwermer_support`, 5.14 `franke_input`, 7.0b, 7.1; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.1.4 (ACC Lemmas 2.1.12–2.1.13 as cited), SR.1.5, SR.2.1, SR.2.2, SR.3.1, SR.3.4, SR.4.3, SR.5.2, SR.6.5 (`StableOperator`); IntegralHeckeAndGaloisDeterminants §0.3, §§1.2–1.3, Layer 2, §2.3, Layer 3b, Layer 4, §6.4; ReductiveGroups Layers 1, 7, 9; ReductiveGroupsPartII RG2.0a, RG2.3 (`LevelSubgroups.iwahori`, `proPIwahori`), RG2.4; GeometricTopology Layer 11 and "The smoothing-and-triangulation comparison" item 1 (on main); ClassFieldTheory Layers 5 (`tateDualityPairing_perfect_mixed`), 11, 12 (on main); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3; LocalGaloisDeformationRings §§0.3, 1.6, 1.7, 1.12, 1.13, 2.15, 3.7, 6.24, 7.1–7.6, F.2, F.3; AutomorphicGaloisRepresentations §1.5a; PadicHodgeTheory §§3.2–3.6, 6.1; AutomorphicGaloisRepresentationsPartII Layers AG2.0–AG2.7; GlobalGaloisDeformations G7, G8; DeformationAndDerivedPatchingAlgebra Layers 7–9, §§9.1, 9.4; PotentialModularityAndCompatibleSystems §§1.1–1.20, 2.12–2.16 (`cht_soluble_prescribed_completions` imported there from GL2ModularityLifting §1.7); ArithmeticGaloisRepresentations §§4.3–4.7, 5.1–5.3 (`GaloisRep.iso_of_frobenius_charpoly_eq`, arithmetic-Frobenius convention confirmed at its line 14), 7.6, 7.7, 7.10–7.12; PadicFamilies Layer 0a; EndoscopicTransferAndUnitaryTraceComparison §§6.12, 6.24, 10.20, 10.30; AutomorphicLFunctionsAndLocalFactors "Representation prerequisites", AL.R.2 "Archimedean `GLₙ` parameters", AL.3; HodgeTateAndCanonicalSubgroups §§2.1 (`ShimuraTower.pLevel`), 2.3 (`infiniteLevel`), 2.8–2.13 (`TauCeti.HodgeTate.openTowerHodgeTateMap`), 3.4 (`canonicalSubgroup`), 3.5–3.8 (`quotientHasseRadius`), 4.1–4.3; PerfectoidShimuraVarieties §§1.2, 1.28–1.30, 2.1 (`HodgeTower.imageCompactification`, `minToImage`), 2.2, 2.3, 2.5, 2.8, 3.6–3.9; TorsionCohomologyInfrastructure §§1.2, 2.1 (`perfectoidComparison`), 2.4 (`completedCohomology_vanishing`), 2.6, 2.7 (`heckeContinuity`), 2.8 (`finiteLevelDescent`), 3b.1, 3b.1a (`unitarySimilitudeBoundaryAdapter`), 3b.2 (`classicalAmbientDeterminant`), 4.3 (`finiteTorsionDeterminant`), 4.4–4.6 (`residualRepresentation`); IgusaVarietiesAndTorsionConcentration IG.0.3–0.6 (`UnitarySimilitudeDatum`, `heckeRestrict`), IG.2, IG.3.21–3.25, IG.4.7–4.10, IG.5.1, IG.6.6a (`boundaryGLResidualRepresentation`, `coefficientCover`, `compactDual`), IG.6.6b (`unitaryTorsionResidual` with `.frobenius`, `.coefficientChange`, `.removeAuxiliaryPrime`), IG.6.7, IG.7.1–7.8; CompletedCohomologyPartII §§1.1, 2.1, 8.6; Chebotarev (open PR #1187) Layer 10. Downstream names CrystallineLocalGlobalCompatibilityCM and ModularityAndLanglandsExtensions are open folders; WeightZeroCrystallineAutomorphyLifting is named by PotentialModularityAndCompatibleSystems.

**Library declarations opened at the pins.** Mathlib: `CategoryTheory.Retract`, `Retract.refl` (`CategoryTheory/Retract.lean:76`), `DerivedCategory.Q` (`Algebra/Homology/DerivedCategory/Basic.lean:95`), `Module.support`, `Matrix.charpoly`, `Subgroup.goursat_surjective` (`GroupTheory/Goursat.lean:104`), `finAddFlip` (`Logic/Equiv/Fin/Basic.lean:305`), `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` (`LinearAlgebra/Projectivization/PSL/PSL2.lean:135`, hypothesis `4 ≤ Nat.card F`), `Matrix.reverse_charpoly` and `Matrix.charpoly_inv` (`LinearAlgebra/Matrix/Charpoly/Coeff.lean:292, 313`, the latter needs `IsUnit A`), `CategoryTheory.PresheafOfGroups.H1` (`Sites/NonabelianCohomology/H1.lean:197`, a `Quot` of Čech cocycles as the README says). Tau Ceti: `TauCeti.LocalFieldsRamification.isSolvable_algEquiv` (`NumberTheory/LocalField/Solvable.lean:52`), `TauCeti.ContCohomology.explicitH1AddEquivContinuousCohomology` (used in `FieldTheory/GaloisCohomology/Kummer.lean:501`), `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` (`NumberTheory/Chebotarev/Density/Chebotarev.lean:51`), `TauCeti.rationalWeylRep` / `weylModuleOfShape` (ℚ-algebras only).

**Duplication audit by object.** Integral dual Weyl modules, Kostant shuffles for the Siegel Levi, positive-monoid Hecke algebras, smooth monoid modules, ordinary parts, the Hida dual and twist, Taylor–Wiles arithmetic levels and the residual Iwahori Hecke algebra: searched in the pinned libraries (no `p`-adic smooth representations, no integral Weyl modules, no affine Hecke algebras), on main and across the open roadmap pull requests (`roadmaps grep` for "dual Weyl", "Kostant", "ι-ordinary", "soluble base change", "Khare", "Lemma 7.1.3", "Lemma 9.1.10", "decomposed generic", "CTG", "Goursat", "nonabelian cohomology"); only nonabelian H¹ is owned elsewhere (R01). ArithmeticLocallySymmetricSpaces ALS.4.5 uses Kostant's `W^P` as a set inside a theorem statement without a definition target, so §1.1's concrete model is not a duplicate. PotentialModularityAndCompatibleSystems §§8.3–8.4 define ι-ordinarity only for rank-two definite unitary groups; §3.44's `GLₙ` notion is distinct. Ownership against open pull requests was checked through `roadmaps grep` (433 open pull requests) and the heads listed in the brief.

**Adversarial table** (statement; instances; values on each side; result; change).

| § | Instances | Values computed | Result |
|---|---|---|---|
| 0.3 unitary row | `λ_τ=(2), λ_{τc}=(−3)`; `(2,1),(−3,−4)`; `n=1`, both `(1)` | `(3,2)`; `(4,3,2,1)`; `(−1,1)`; dominance iff `−λ_{τc,1} ≥ λ_{τ,1}`: `3 ≥ 2` yes, `−1 ≥ 1` no; agrees with ACC (2.2.2) | holds |
| 0.4 lattices | `GL₂`, `λ=(p,0)`; `(p−2,0)`; `(0,1)` | `Sym^p ⊗ 𝔽_p ⊃ ⟨x^p,y^p⟩` (reducible); `Sym^{p−2} → Γ^{p−2}` determinant `∏a!(p−2−a)!` unit; `ind_{B⁻}(0,1) = 0` | holds |
| 0.6 duality bound | `λ=(p−1,0)` (endpoint) | `Sym^{p−1} → Γ^{p−1}` determinant `∏_{a≤p−1} a!(p−1−a)!` unit, so duality holds at the endpoint; `λ=(p,0)`: factor `0!p!` divisible by `p` | holds without strictness (R08) |
| 0.7a exponent | general `a, j`; `a=2` | `j(1−2a+j)/2 + j(a−1) = (j²−j)/2`; `a=2`: `j(j−3)/2 + j = j(j−1)/2` | holds |
| 0.7b polynomials | `m=1, q_v=3, T=2`; `m=2, q_v=2, T₁=3, T₂=5` | `reverse(Y−2)(3X) = 1−6X`; `reverse(Y²−3Y+10)(2X) = 1−6X+40X²`, substitution `X↦X/2` gives `1−3X+10X²` | holds |
| 1.1 shuffles | `n=0,1,2` | lengths `{0}`, `{0,1}`, block exchange `n²` (`n=2`: 4 inversions); `(0 1)`: `w^{-1}` not increasing on `{0,1}` | holds |
| 1.2 ramified check | `K=ℚ_p(√p)` | `O_K ⊗ O` mod `ϖ` is `k[x]/(x²)`, nilpotent `x` | holds |
| 1.5 CTG | zero table, `n>0`, `W≠∅`; `W=∅`; `n=1` table `(0,0,1,0)` | all sums `0 = i₀` → not CTG; vacuous; conjugate sums `0,1` → CTG | holds |
| 1.6 sign of (4.3.7) | `n=1`, `τ: (0,0)`, `τ₀: (1,−1)` | sums `0,0` (CTG fails at `i₀=0`) while printed differences `0 ≠ 2` satisfy the minus version; plus version follows from `Σ_i(λ_{w,τ,i}+λ_{w,τc,i}) = n i₀` | README's correction right |
| 1.9a | `n=2, p=7, λ_τ=(0,0), λ_{τc}=(0,−2)` | row `(2,0,0,0)`, multiset `{5,2,1,0}`; `0 ≥ 0`, `2 ≤ 2`; `⊂ [0,5]`, `⊄ [0,4]` | holds |
| 1.12 | `n=2, p=5, d=8`, `F=ℚ(i,√6)` | `n₀=0`; degrees `0,1,2,3 ↦ 7,6,5,4`; 5 splits in `ℚ(i)`, unramified in `F` | holds |
| 1.14 | `m=1` | `{a,b}={c,d}`, `{a+1,b}={c+1,d}`, `c>d`: `a=d` forces `d+1=c+1`, contradiction; so `A=C` | holds |
| 2.6 congruences | `p_b=5, p_c=41` | `41 ≡ 1 mod 20`; `(−41/5)=(4/5)=1`; `(−5/41)=(−1/41)(41/5)=1`; `p_c ≥ 21 > 6` | holds |
| 2.8 rationality check | `a ∈ ℤ₅` with `11^a` transcendental | `a ↦ 11^a` has uncountable image; value at geometric `Frob₁₁` is `11^{−a}` | holds |
| 2.12 norm polynomial | `M=ℚ(√2)`, `Q_v = X²−√2X+1` | product with conjugate `= X⁴+1`, degree 4 at split and inert `ℓ` | holds |
| 2.16 inversion | `𝔽₇`, `A=diag(2,3)` | `P_A = X²+2X+6`; `A⁻¹=diag(4,5)`, `P = X²+5X+6`; `6·(1+2X+6X²) = X²+5X+6` | holds |
| 2.21 symmetric square | roots `2,3`; `m=0,n=3` | `{4,6,9}`, product `216=6³`; `{0,0,0}` not regular | holds |
| 3.3 cone | `u_p`; rows `(1,0)`, `(0,1)` | `tNt⁻¹` entries scaled by `p^{j−i}`, `i<j`; `(1,0)` integral, `(0,1)` gives `p^{-1}` | holds |
| 3.6 characters | product of `χ_i(Art ϖ_v)`; `λ=(2,0)` | `ε^{Σ(1−i)}U_{v,n} = ε^{n(1−n)/2}U_{v,n}`; `w₀λ=(0,2)`: unit factors `1`, `u^{−2}` | holds |
| 3.31 orientation | scalars `u∈ℤ_p^×`, `p`, `−1` at `p=2` | `u^{-1}`; `p^{-1}/p^{-1}=1`; `−1` | holds |
| 3.36 weights | `n=2, i=1`: `x=1, r=1`; `i=0` | interval `[2M, 5M/2]`, `a=17M/8`; (5.4.9)–(5.4.12) give `a ≥ 1.5M, ≤ 2.5M, ≥ 2M, ≤ 3M`; `X₁={2,4}` length 3; `X₀={3,4}` length 4 | holds; CTG test must be on differences (Source issues) |
| 3.44 | `a_l(E)=0`; `n=1, F=ℚ, l=5, b=1` | `X²+l` slopes `1/2`; uniformizer `5→10` multiplies by `χ(2)` of order 4 = exponent of `(ℤ/5)^×` | holds |
| 3.46 | `GL₂(ℚ₅)`, `ψ(5)=1`; `ψ(5)=25`, `c=2` | `δ_B=1/5`, `U=5·(1/5)=1`; `U₁=25, U₂=625`, normalized `1,1`; reversed sign `625, 390625` | holds |
| 3.47 | unramified quadratic; ramified quadratic over `ℚ₅` | slopes `a,b ↦ 2a,2b`; `e=2`: two embeddings at `1/2` each, totals unchanged | holds |
| 4.4 twist order | `Λ₁=O[C_p]`, `κ(t)=ζ_p` | `B`: `t ↦ ζ_p`; other order: `ζ_p²` | holds |
| 4.8/5.10/5.18 dimensions | FL and ordinary | `dim S∞ = n²|S|+qn`; `dim R∞ = 1+g+n²|S|+n(n−1)[F⁺:ℚ] = dim S∞ − (n[F⁺:ℚ]−1)` with `g=qn−n²[F⁺:ℚ]`; ordinary local rings `1+n²|S|+n(n+1)[F⁺:ℚ]` match `dim Λ = 1+2n[F⁺:ℚ]` | holds (ACC p. 1081 misprint) |
| 5.1 index | `q ≡ 1 mod p`; `n=2` | `∏_{i≤n}(q^i−1)/(q−1) ≡ n!`; `2` | holds |
| 5.2 generator | `n=2, i=2, q=3`, roots `2,5` | `q^{−1}α₁α₂ = 10/3` | holds |
| 5.3 Hecke | `n=2`: `[K:B]`, `T_s²`; `q^{1/2}≡−1`; `q=11,p=5` | `q+1≡2`; `q+(q−1)T_s → 1`; `e₁=−T₁`, roots `−1,−2`; `2a` vs `2`, `22` | holds |
| 5.3(5) splitting | `M=𝔽₂₅`, `γ²=2`, `s`=Frobenius | `k[S₂]⊗M_𝔪` dim 4 vs `M` dim 2; `[K]M=𝔽₅` dim 1 | KT needs splitting (Source issues) |
| 5.17 ranks | `n=2`, one auxiliary place | `q_v+1` orbits per cell | holds |
| Conventions | `n=2, f=2` | `d=8, q_GL=2, ℓ₀=3`, dual range `[3,6]`, `2q_GL+ℓ₀=7=d−1` | holds |

Changes required by the table: none to the mathematics; R08 is a hypothesis note.

## Not verifiable

- Qian, journal pagination and journal-only items: "Lemma 2.6(2), p. 1251", "Remark after Definition 1.3, p. 1241", "proof of Theorem 1.4, p. 1274", "proof of Lemma 4.3, p. 1273" and "Remark 4.4": par.nsf.gov timed out on three attempts and the Springer DOI is paywalled. The arXiv v1 (2104.09761) has the same Definition 1.3, Theorem 1.4 and the avoidance lemma as its Lemma 4.3(4) (verified), but no twisted-Steinberg lemma and no "Remark 4.4"; the journal numbering cannot be confirmed from here.
- Jantzen, Part II, 5.5–5.6 and the remark after Corollary II.5.6 (book, no legal copy found).
- Platonov–Rapinchuk–Rapinchuk, 2nd edition §1.3.2 and Theorem 2.15 (book).
- Harris–Taylor Lemma VII.2.6; Arthur–Clozel Chapter 3 Theorems 4.2 and 5.1 (books).
- Emerton, ordinary parts II, Proposition 2.1.11 and Lemma 3.2.1; Clozel 1990 Lemma 4.9; Chevalley 1951 Theorem 1; Bellaïche–Chenevier Proposition 1.5.1; Taylor 2008 Definition 2.1; Clozel–Harris–Taylor Lemma 2.1.10; Borel–Tits Corollary 5.20; Hauseux Proposition 3.1.8; Carayol 1994: cited as the primary sources cite them; not opened.
- ACC Propositions 2.2.21, 2.2.23, Theorems 2.3.7, 2.4.2, 2.4.10, 2.4.11, 3.1.1 and the Theorem 6.5.4 proof pp. 1067–1070: located on the cited pages; their proofs were not re-read line by line.

## Source issues

- **Error** in ACC at (4.3.7), §4.3, printed p. 975: the sufficient condition for CTG subtracts the `τc` row sums; it should add them, since CTG failure forces `Σ_i(λ_{w,τ,i}+λ_{w,τc,i}) = n·i₀` at every `τ` (the `n=1` instance `(0,0)`,`(1,−1)` satisfies the printed condition yet fails CTG); affects the proof (the lemma's conclusion survives, as the README's §1.6 route shows).
- **Error** in ACC at the proof of Lemma 5.4.8, §5.4, printed p. 1017: it verifies CTG by showing the sums of entries `j` and `2n+1−j` of `w(λ̃_i+ρ)` vary with `j`, which under (2.2.2) controls `λ_{w,τ,i} − λ_{w,τc,i}`; Definition 4.3.5 needs `λ_{w,τ,i} + λ_{w,τc,n+1−i}` non-constant, i.e. the second block not an entrywise translate of the first; the same multiset argument on pairwise differences proves it (README §3.36); affects the proof.
- **Misprint** in ACC at Definition 4.3.5, printed p. 974: the weight is written in `(ℤ^{2n}_+)^{Hom(F,E)}`; it should be `Hom(F⁺,E)` as in Lemma 4.3.6; affects nothing.
- **Misprint** in ACC at the proof of Theorem 6.6.2, printed p. 1081: "g = qn − n[F⁺:ℚ]"; it should be `qn − n²[F⁺:ℚ]`, as defined on p. 1080 and as the dimension count `dim R∞ = dim S∞ − ℓ₀` requires; affects nothing.
- **Misprint** in ACC at Theorem 5.5.1, printed p. 991: `λ ∈ (ℤⁿ)^{Hom(F,E)}`; it should be dominant, `(ℤⁿ₊)^{Hom(F,E)}`, as `V_λ` requires; affects nothing.
- **Gap** in KT at Lemma 5.4, §5, manuscript p. 27: the two isomorphisms `k[W] ⊗ M_𝔪 → M` and `M_𝔪 → [K]M` are asserted under a unique central maximal ideal with distinct roots; they need the roots in `k` (the proof enlarges `k`); `M = 𝔽₂₅` over `k = 𝔽₅` with `t₁ ↦ γ`, `t₂ ↦ −γ`, `γ² = 2`, the transposition acting by Frobenius, has central polynomial `X² − 2` and both maps fail; affects a stated result.
- **Misprint** in KT at the paragraph between Lemmas 5.2 and 5.3, manuscript p. 26: the isomorphism `O[X_*(T)]^W ≅ H_K` is said to send `e_i` to `q^{i(n−i)/2}T_i`; with the stated Bernstein normalization the Satake transform sends `T_i` to `q^{i(n−i)/2}e_i`, so `e_i ↦ q^{−i(n−i)/2}T_i`; affects nothing (both factors are `1` in `k` when `q^{1/2} ≡ 1`).
- **Error** in BCGP at Lemma 9.1.10(3), §9.1, printed p. 252: the image of `r_λ` is said to contain `SL₂(O_M/λ)` for a density-one set of `l`; the cited ACC Lemma 7.1.3 gives a conjugate of `SL₂(𝔽_l)` on `G_{F̃}`, and a newform with a nontrivial inner twist and `l` inert in `M` has image not containing `SL₂(𝔽_{l²})`; affects a stated result (README §2.26 already restricts the conclusion).
