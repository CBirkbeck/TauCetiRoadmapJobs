# GATE-RefinedTraceMethods~7: answers to human review

Four points from one comment by roed-math (2026-11-06), numbered in the order they appear. All four are repaired in commit `b0ad346a` on top of `b713d26`. Only `TauCetiRoadmap/RefinedTraceMethods/README.md` changed; `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean` is byte-identical to `b713d26`.

## H01 (roed-math) — applied

§6.1 now has a new target, **Spherical lifts of perfect δ-rings** (README line 2553). For every prime p and every perfect p-complete δ-ring B it constructs `S_B`: p-complete, connective, E∞, flat over `S_p^∧`, with a marked reduction `S_B⊗_{S_p^∧}Hℤ_p≃B`. Its universal property is `Map_CAlg(S_B,R)≃Hom(B/p,π_0R/p)` for every p-complete connective R, so B ↦ `S_B` is fully faithful and every δ-map lifts uniquely (EC2 Def. 5.2.1, Thm 5.2.5, Ex. 5.2.7, pp. 226–229, ec2 lines 7775–7873; MW ¶3.4, mw line 1304). In §7.6, "`S_C` its connective E∞ spherical lift" now reads "`S_C` its spherical lift … of §6.1 (Spherical lifts of perfect δ-rings)", and the lift `S_C→S_p^∧` of x ↦ p is derived from that universal property (line 3604; the §7.6 *Needs:* line names the new target).

Other changes for this point:
- **Scope.** The scope paragraph now lists this ownership.
- **Downstream consumers.** These now name the consumers of `S_B`: HabiroCohomologyFoundationsPartII §0.1, GeneralAlgebraicKTheoryPartII §6.1a, and StableHomotopyKTheoryPartII §4.8 (which uses the étale case).

## H02 (roed-math) — applied differently

The ten contracts the comment lists are those at GeneralAlgebraicKTheoryPartII head 90bcf29. At its current head 7f6a44d only two remain addressed to this roadmap: gap:tc-mod-p-cyclotomic-colimits and gap:tc-mod-p-ring-sifted-colimits (its README lines 60 and 62). The other eight no longer appear there: it builds linear weakly additive motives itself (its §8.1a), and the TC(ℤ), K(1)-local and cyclic-assembly statements sit in its own Layers 9–10.

Both remaining contracts were right. The henselian-rigidity route in §4.17 used them as unstated inputs ("TC/p commutes with all colimits … (CMM Theorem 2.7 and Corollary 2.15)"). They are now one new §4.17 target, **TC modulo p and colimits** (line 2240), with these clauses:
- (i) TC/p preserves all small colimits on `CycSp_{≥0}`;
- (ii) A ↦ TC(A)/p preserves sifted colimits of connective E₁-rings;
- (iii) the same holds for TC/n (CMM Lemma 2.5–Corollary 2.15, pp. 8–12, cmm lines 338, 497).

The henselian route and its *Needs:* line now cite this target. The target is named by its mathematics rather than by the consumer's gap labels; GeneralAlgebraicKTheoryPartII should replace both contracts with "RefinedTraceMethods §4.17 (TC modulo p and colimits)". No contract is declined.

## H03 (roed-math) — applied

Downstream consumers (line 4141) used to say "ChromaticHomotopyTheory uses the parametrized Tate constructions of §2.4 and the K(1)-local sphere of §6.8". It now says that it uses "the K(1)-localization formula of §6.8 … in its Layer 4, and … §§2.6, 2.9, 2.10, 4.9 and 4.11 in its Part II separation target". This matches ChromaticHomotopyTheory head 5055602, lines 24, 132, 370 and 412. No §2.4 citation exists there.

The same check found two more inaccurate sentences, and both are corrected:
- The scope sentence "later general K-theory and chromatic applications use Layers 1–5" was wrong, because §6.8 is in Layer 6. It now reads "Layers 2, 4 and 5 and §§6.1 and 6.8".
- StableHomotopyKTheoryPartII, which cites §§2.3–2.16, 5.1, 5.3 and 6.1, was missing from Downstream consumers and is now listed.

## H04 (roed-math) — applied

At KTheoryLowDegrees head 4d2f327, Layer 3 has only §§3.1–3.4, and it imports pre-λ/special λ-structures from SchemeKTheoryOperations §§6.2.1–6.2.4. So the citation of "KTheoryLowDegrees §§3.2–3.7" was wrong in two ways: §§3.5–3.7 do not exist, and the owner was misattributed.

Changes:
- **Scope and supplier contract (lines 13 and 61).** These now cite SchemeKTheoryOperations §§6.2.1–6.2.2 (head 393a8f1) for pre-λ/special λ-rings and the Newton Adams operations, including the identity `Σψⁿtⁿ=−t(d/dt)log λ_{−t}`. KTheoryLowDegrees is kept only for its §§13.2–13.4 K₂ and relative-boundary identifications, which match its head.
- **The Newton relation in §6.10.** This is the one place the λ-ring API is actually used: the proof route of "q-divided powers on the diagonal". Its *Needs:* line and the Layer 6 Dependencies now name QWittVectors §2.1a (Λ-rings = special λ-rings) and SchemeKTheoryOperations §6.2.2.

## Build

`lake build TauCetiRoadmap.RefinedTraceMethods.Suggested` (at commit b0ad346a): `Build completed successfully (8976 jobs).`, exit 0.

The earlier attempt failed before elaboration with `error: already exists (error code: 17, file already exists)` on `.lake/packages`. That was not a defect in the roadmap files. The worktree's `.lake/packages` symlink pointed at the shared package cache for the branch's manifest, which was missing at the time. That cache has since been re-provisioned at exactly the branch's manifest revisions (mathlib 6b7abb3c, TauCeti a91d3aa, and the remaining eight packages likewise), and the build above ran against it. No file in the worktree was changed for the repair. `git status` is clean, and `lake-manifest.json` and `lean-toolchain` are untouched.

The brief's `#check @name` signature comparison does not apply: `Suggested.lean` has no named declarations. The new targets are not statable at the pins, because E∞-rings and cyclotomic spectra are absent, and its docstring already says so.

## Gate

```
gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Depcheck: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

`roadmaps resolve`: no cross-roadmap citations and no Lean names found nowhere.

## Ownership, moves and merge-order notes

- **Moved down.** The spherical lift of a perfect p-complete δ-ring was constructed in HabiroCohomologyFoundationsPartII §0.1 (merge order 318) but already used here in §7.6 (314). It is now owned by §6.1 here. HabiroCohomologyFoundationsPartII §0.1 should import it rather than construct it, and so should GeneralAlgebraicKTheoryPartII (319), which cites that §0.1 for it at lines 16, 229, 1678 and 1693.
- **No earlier owner.** I searched by object for an earlier owner: spherical Witt vectors, perfect δ-ring lifts, EC2 thickenings and "relatively perfect" E∞ statements. Searched on main (EllipticCohomology included) and at all open heads via `roadmaps grep`. None exists.
- **Suppliers added.** PrismaticCohomology §0.65 (55), SchemeKTheoryOperations §§6.2.1–6.2.2 (34) and QWittVectors §2.1a (194). All are earlier in the order, and none cites this roadmap (grep count 0).
- **Ownership against open PRs** was checked through `roadmaps show`/`grep` at the current heads of #1466, #1733, #1742, #1643, #1248, #1229, #1351, #1057 and #1042.
- **No suspicious instructions** were found in the review text.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Spherical lift `S_B`, flatness | B=ℤ_p at p=2, 3 | `S_B=S_p^∧`; π₁=ℤ/2 (η) at 2; π₁=0, π₃=ℤ/3 at 3 | holds | Check |
| Wrong model `S_B=HB` | B=ℤ_2, R=S_2^∧ | Map(Hℤ_2,S_2^∧)=∅ (η would factor through π₁Hℤ_2=0) vs Hom(𝔽_2,𝔽_2)=pt | excluded by universal property | Check |
| Universal property, degenerate B | B=0 | both sides nonempty iff R=0 (derived Nakayama on π₀R) | holds | Check |
| Agreement with étale lift | B=W(𝔽_4)=ℤ_2[ζ_3] | module rank 2; Map(S_B,S_B)=Hom(𝔽_4,𝔽_4)=2 points | holds | Check + API bullet |
| Maps out of `S_C`, C=ℤ_p{x}_∞ | R=S_p^∧; x↦0, x↦p | Map ≅ Hom_δ(ℤ_p{x},ℤ_p)=ℤ_p; δ(p)=1−p^{p−1}: δ(2)=−1, δ(3)=−8≡1, so the two reductions differ | holds | Check |
| Perfectness needed | ℤ_p[x], R=Hℤ_p | maps from a lift = ring maps ℤ_p[x]→ℤ_p ≅ ℤ_p; Hom(𝔽_p[x],𝔽_p) ≅ 𝔽_p; x↦0, x↦p collide | negative control | Check (first draft wrongly called x↦p a δ-map on toric ℤ_p[x]: δ(p)≠0; corrected to ring maps) |
| p-completeness of R needed | R=S | ring map ℤ_p→ℤ impossible (1+p unit ↦ non-unit) so Map=∅ vs pt | negative control | Check |
| §7.6 lift of x↦p | C→ℤ_p | unique by universal property; matches MW 3.4 (mw line 1309) | holds | text |
| TC/p colimits (i), integral failure | Hℚ^triv=colim(Hℤ^triv, ·k) | π₋₂TC(Hℚ^triv)=ℚ (all Hℚ^{tC_ℓ}=0); π₋₂TC(Hℤ^triv)=ker(ℤ→∏ℤ_ℓ, a↦a(c−1), c_ℓ∈ℓℤ_ℓ)=0; mod p both 0 | integral fails, mod p holds | Check; claim narrowed to (i) only |
| (ii) "sifted" needed | S⊔S=S | fold TC(S)/p²→TC(S)/p has fibre TC(S)/p ⊇ retract S/p ≠ 0 | arbitrary colimits fail | Check |
| (iii) and degenerate cases | n=1, 6; empty diagram | S/1=0; S/6≃S/2⊕S/3; TC(0)/p=0 | holds; route uses cofibre sequences only, not p·id_{S/p}=0 (false at p=2) | Check |
| Connectivity bound used in route | X=THH(𝔽_p) | π₋₁TC(𝔽_p)=ℤ_p≠0, so the bound is (−1)-connective, not 0 | consistent with CMM Lemma 2.5 | none |
| Newton series (H04) | line element l; x=2 in binomial ℤ | −t d/dt log(1−lt)=Σlⁿtⁿ; ψ²(2)=4−2λ²(2)=2 | holds; matches §6.10 Check (z²−ψ²z)/2=λ²z | supplier text |
| Downstream sentences (H03) | CHT 5055602, GAKT-II 7f6a44d, SHK-II e8c1239, HCF-II 61e97fe | cited sections read off each head (lines listed above) | old CHT §2.4 claim false; scope "Layers 1–5" false | rewritten |
